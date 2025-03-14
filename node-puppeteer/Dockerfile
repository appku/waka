FROM appku/waka:node

#install puppeteer required libs
RUN microdnf install -y --nodocs alsa-lib atk cups-libs gtk3 urw-base35-gothic-fonts libXcomposite \
    libXcursor libXdamage libXext libXi libXrandr libXScrnSaver libXtst mesa-libgbm nss pango xorg-x11-fonts-100dpi \
    xorg-x11-fonts-75dpi xorg-x11-fonts-cyrillic xorg-x11-fonts-misc xorg-x11-fonts-Type1 xorg-x11-utils

#install commonly used dev/build packages to speed up builds.
RUN npm install -g puppeteer

RUN mkdir -p /app/.cache/puppeteer && cd /app && npx puppeteer install --puppeteer_cache_dir=/app/.cache/puppeteer
RUN cat <<EOF > /app/.puppeteerrc.cjs
const path = require('path');
module.exports = {
    cacheDirectory: path.join(__dirname, '.cache/.puppeteer')
};
EOF

CMD ["node-ops"]