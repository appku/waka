FROM appku/waka:node

ENV PUPPETEER_VERSION=24.8.2
#install puppeteer required libs
RUN microdnf install -y --nodocs alsa-lib atk cups-libs gtk3 urw-base35-gothic-fonts libXcomposite \
    libXcursor libXdamage libXext libXi libXrandr libXScrnSaver libXtst mesa-libgbm nss pango xorg-x11-fonts-100dpi \
    xorg-x11-fonts-75dpi xorg-x11-fonts-cyrillic xorg-x11-fonts-misc xorg-x11-fonts-Type1 xorg-x11-utils
#install puppeteer
RUN npm install -g puppeteer@$PUPPETEER_VERSION
RUN mkdir -p /app/.cache/puppeteer
RUN cat <<EOF > /app/.puppeteerrc.cjs
const path = require('path');
module.exports = {
    cacheDirectory: path.join(__dirname, '.cache/.puppeteer')
};
EOF
RUN cd /app && node "$(npm get prefix)/lib/node_modules/puppeteer/install.mjs"
COPY node-puppeteer-ops /waka/
CMD ["node-puppeteer-ops"]