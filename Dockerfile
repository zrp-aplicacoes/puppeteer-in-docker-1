FROM node:13.2.0-alpine

# Installs the latest alpine Chromium (78) package
RUN apk update && apk upgrade && \
      echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
      echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
      apk add --no-cache \
      libstdc++@edge \
      chromium@edge=~78.0.3904.108 \
      nss@edge \
      freetype@edge \
      freetype-dev@edge \
      harfbuzz@edge \
      ttf-freefont@edge

# Tell Puppeteer to skip installing Chrome. We'll be using the installed package.
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

# Puppeteer v1.20.0 works with Chromium 78.
RUN yarn add puppeteer@1.20.0