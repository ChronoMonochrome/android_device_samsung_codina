# Device Tree for GT-I8160 (codina)

## Step 1: Local Manifests & Sync

repo init -u https://github.com/ChronoMonochrome/android -b slim-lp5.1

## Step 2: Preparation

Some repositories must be patched before building. There is a script to do that.

```bash
cd device/samsung/codina/patches
./apply.sh
```

## Step 3: Compile

```bash
export USE_CCACHE=1
export CCACHE_DIR=~/slim_ccache
./prebuilts/misc/linux-x86/ccache/ccache -M 25G
./build/envsetup.sh
brunch codina
```
