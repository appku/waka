#! "netcoreapp3.1"
#r "nuget: Microsoft.SqlServer.DacFx, 162.0.52"
/*
 * Created 8/5/2020: Christopher Eaton @ AppKu
 * v1
 */
using System;
using System.IO;
using Microsoft.SqlServer.Dac;
using Microsoft.SqlServer.Dac.Compare;

bool needsDeploy = false;
//ensure SQL Compare file is loaded ok.
string scmpFilePath = null;
if (Args.Count == 0) {
    Console.WriteLine("A SQL Compare file name argument must be specified.");
    return 1;
} else {
    //validate
    scmpFilePath = Path.GetFullPath(Args[0]);
    if (File.Exists(scmpFilePath) == false) {
        Console.WriteLine($"Invalid SQL Compare file name, the file \"{scmpFilePath}\" does not exist or is inaccessible.");
        return 1;
    }
    //run from the location of the scmp file.
    //Directory.SetCurrentDirectory(Path.GetDirectoryName(scmpFilePath));
}
//load comparison
SchemaComparison comparison = new SchemaComparison(scmpFilePath);
Console.WriteLine($"Running comparison (\"{Path.GetFileName(scmpFilePath)}\")...");
SchemaComparisonResult comparisonResult = comparison.Compare();
if (comparisonResult != null) {
    if (comparisonResult.IsValid && comparisonResult.IsEqual) {
        Console.WriteLine("\u2714 No differences detected.");
    } else if (comparisonResult.IsValid) {
        Console.WriteLine("Differences detected: ");
        foreach (var diff in comparisonResult.Differences) {
            if (diff.SourceObject != null && diff.TargetObject != null) {
                Console.WriteLine($" \u2699 {diff.UpdateAction}: ({diff.SourceObject.ObjectType.Name}) {diff.SourceObject.Name} ➔ ({diff.TargetObject.ObjectType.Name}) {diff.TargetObject.Name}");
            } else if (diff.TargetObject != null) {
                Console.WriteLine($" \u2699 {diff.UpdateAction}: ({diff.TargetObject.ObjectType.Name}) {diff.TargetObject.Name}");
            } else {
                Console.WriteLine($" \u2699 {diff.UpdateAction}: ({diff.SourceObject.ObjectType.Name}) {diff.SourceObject.Name}");
            }
            comparisonResult.Include(diff);
        }
        needsDeploy = true;
    } else {
        var errors = comparisonResult.GetErrors();
        Console.WriteLine("Errors detected: ");
        foreach (var error in errors) {
            Console.WriteLine($" \u2717 {error.Message}");
        }
        return 1;
    }
    //perform deploy
    if (needsDeploy) {
        Console.WriteLine("Running deployment...");
        SchemaComparePublishResult publishResult = comparisonResult.PublishChangesToDatabase();
        Console.WriteLine(publishResult.Success ? "\u2714 Publish succeeded." : "\u2717 Publish failed.");
        if (publishResult.Success == false) {
            foreach (var error in publishResult.Errors) {
                Console.WriteLine($" \u2717 {error.Message}");
            }
            return 1;
        }
    }
} else {
    Console.WriteLine("Unable to make comparison. The comparison failed (possbily a connection issue).");
    return 1;
}