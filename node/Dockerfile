FROM appku/waka

#install node
ENV NVM_DIR /usr/local/nvm
ENV NVM_NO_PROGRESS 1
ENV NODE_VERSION 18.10.0
ENV NODE_PORT 8080
RUN mkdir -p $NVM_DIR && curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

#update npm to latest
RUN microdnf install -y --nodocs git make g++ \
    && npm install -g npm

#install commonly used dev/build packages to speed up builds.
RUN npm i -g \
    @types/jest \
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
    eslint-plugin-vue \
    jest \
    jest-circus \
    jest-resolve \
    jsdoc \
    jsdoc-plugin-intersection \
    react \
    react-dev-utils \
    react-dom \
    react-refresh \
    react-router-dom \
    sass \
    vue \
    vue-cli-plugin-style-resources-loader \
    vue-router \
    vue-template-compiler

#ready workspace
ARG APPKU_WAKA_VERSION=1.0.0
ENV APPKU_WAKA_VERSION=${APPKU_WAKA_VERSION}
ENV PATH="${PATH}:/waka"
ENV HOME="/waka"
WORKDIR /waka

#set default shell to bash
SHELL ["/bin/bash", "-c"]