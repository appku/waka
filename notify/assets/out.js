#!/usr/bin/env node

const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
    terminal: false
});

rl.on('line', (line) => {
    console.error(line);
});

rl.once('close', () => {
    // end of input
});

console.log('{ "version": {}, "metadata": [] }')