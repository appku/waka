FROM appku/waka

#install node
ENV NVM_DIR=/usr/local/nvm
ENV NVM_NO_PROGRESS=1
ENV NODE_VERSION=22.14.0
ENV NODE_PORT=8080
RUN mkdir -p $NVM_DIR && curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
ENV NODE_PATH=$NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH=$NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

#update npm to latest
RUN microdnf install -y --nodocs git make g++
RUN npm install -g npm

#install commonly used dev/build packages to speed up builds.
RUN npm install -g \
    nodemon \
    husky \
    eslint \
    eslint-plugin-jest \
    eslint-plugin-import \
    eslint-plugin-node \
    eslint-plugin-promise \
    eslint-plugin-react-hooks \
    eslint-plugin-react-refresh \
    jsdoc \
    jsdoc-plugin-intersection \
    react \
    react-dev-utils \
    react-dom \
    react-refresh \
    react-router-dom \
    sass \
    vite

COPY node-ops /waka/

CMD ["node-ops"]