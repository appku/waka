FROM appku/waka:node

#install puppeteer required libs
RUN microdnf install -y --nodocs alsa-lib atk cups-libs gtk3 urw-base35-gothic-fonts libXcomposite \
    libXcursor libXdamage libXext libXi libXrandr libXScrnSaver libXtst mesa-libgbm nss pango xorg-x11-fonts-100dpi \
    xorg-x11-fonts-75dpi xorg-x11-fonts-cyrillic xorg-x11-fonts-misc xorg-x11-fonts-Type1 xorg-x11-utils
#install puppeteer
RUN npm install -g puppeteer@24.7.2
RUN mkdir -p /app/.cache/puppeteer
RUN cat <<EOF > /app/.puppeteerrc.cjs
const path = require('path');
module.exports = {
    cacheDirectory: path.join(__dirname, '.cache/.puppeteer')
};
EOF
RUN cd /app && node "$(npm get prefix)/lib/node_modules/puppeteer/install.mjs"

CMD ["node-ops"]