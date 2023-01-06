INSTALL_PATH=${INSTALL_PATH:-/fpclaz}

if [[ -z "$FPC" || -z "$LAZ" ]]; then
    echo "FPC or Lazarus version not set"
    exit 1
fi

function build() {
    fpcup --installdir=$INSTALL_PATH --noconfirm --fpcURL=$FPC --lazURL=$LAZ $@
}

function buildCross() {
    cpu="$1"
    shift
    os="$1"
    shift
    build --only=FPCBuildOnly --cputarget=$cpu --ostarget=$os $@
}

function buildCleanup() {
    echo "Cleaning up FPC build"
    cd $INSTALL_PATH
    mv fpc/bin _fpc_bin
    mv fpc/lib/fpc/3.2.2/units/ _fpc_units
    rm -rf fpc
    mkdir fpc
    mv _fpc_bin fpc/bin
    mv _fpc_units fpc/units

    echo "Cleaning up Lazarus build"
    find lazarus -type d -name units -exec rm -rf {} \;
    find lazarus -type d -name lib -exec rm -rf {} \;
    rm -rf lazarus/.git

    echo "Cleaning up Bootstrap FPC"
    rm -rf fpcbootstrap/
}