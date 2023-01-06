FROM debian:stable

# provided by the user
ARG tag

# Install prequesites
RUN apt-get update && \
    apt-get install --yes build-essential \
                          sudo \
                          git \
                          wget \
                          unzip \
                          subversion \
                          bzip2 \
                          python3 \
                          libx11-dev \
                          libgtk2.0-dev \
                          libgdk-pixbuf2.0-dev \
                          libcairo2-dev \
                          libpango1.0-dev \
                          libqt5pas-dev \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt

COPY . /install

# Install fpc and lazarus
RUN /install/install_fpcup.sh \
 && cd /install/$tag \
 && ./build.sh \
 && cd / \
 && rm -rf /install

RUN groupadd -g 531 lazarus \
 && chown -R :lazarus /fpclaz \
 && chmod -R g+w /fpclaz

# Install lpm
RUN git clone --depth 1 https://github.com/Warfley/LazarusPackageManager.git /opt/lpm \
 && ln -s /opt/lpm/lpm /usr/bin/lpm

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV UID=1000
ENV GID=1000

ENTRYPOINT [ "/entrypoint.sh" ]
CMD "bash"