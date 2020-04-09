FROM debian:stable

# provided by the user
ARG tag

# Install prequesites
RUN apt-get update && apt-get install --yes build-essential git wget unzip subversion bzip2 python3 libx11-dev libgtk2.0-dev libgdk-pixbuf2.0-dev libcairo2-dev libpango1.0-dev

# Install fpcup
COPY . /install
RUN /install/install_fpcup.sh

# Install lazarus and fpc
RUN /install/$tag/build.sh

# Clean up the stuff we don't need anymore
RUN rm -rf /install

# Install lpm
RUN git clone --depth 1 https://github.com/Warfley/LazarusPackageManager.git /opt/lpm && ln -s /opt/lpm/lpm /usr/bin/lpm

# Configure lpm
RUN lpm lazarus add stable /root/development/lazarus
