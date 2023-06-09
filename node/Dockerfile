FROM appku/waka

#install node
ENV NVM_DIR /usr/local/nvm
ENV NVM_NO_PROGRESS 1
ENV NODE_VERSION 18.16.0
ENV NODE_PORT 8080
RUN mkdir -p $NVM_DIR && curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

#update npm to latest
RUN microdnf install -y --nodocs git make g++ \
    && npm install -g npm

#install commonly used dev/build packages to speed up builds.
RUN npm i -g \
    @types/jest \
    @types/react \
    @types/react-dom \
    @vitejs/plugin-react \
    @vue/eslint-config-standard \
    babel-eslint \
    babel-jest \
    babel-loader \
    nodemon \
    husky \
    eslint \
    eslint-plugin-jest \
    eslint-plugin-import \
    eslint-plugin-node \
    eslint-plugin-promise \
    eslint-plugin-react-hooks \
    eslint-plugin-react-refresh \
    eslint-plugin-vue \
    jest \
    jsdoc \
    jsdoc-plugin-intersection \
    react \
    react-dev-utils \
    react-dom \
    react-refresh \
    react-router-dom \
    sass \
    vite \
    vue \
    vue-cli-plugin-style-resources-loader \
    vue-router \
    vue-template-compiler

CMD ["npm", "install", "--no-fund", "--no-audit", "--skip-installed", "--prefer-offline"]