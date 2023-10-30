# thksy
Kaitai struct files for Touhou Project replay files

## How to use Kaitai Struct
Refer to the [official Kaitai Struct documentation](https://doc.kaitai.io/)

## How to generate
In order to use these files to generate the replay structure in your desired language, you first need to install the compiler, which can be found [here](https://kaitai.io/#download). Once installed, open a terminal in this folder and run `kaitai-struct-compiler -t <language> -d build src/*`. The generated files will be in the build folder. For a list of supported programming languages, run the compiler without arguments and refer to the `-t, --target` flag.

## Note
The original source files are cloned from the [thscoreboard](https://github.com/n-rook/thscoreboard) repository with a few modifications. In the original repository, replay structures from th06 to th09 (except th08_userdata) have a bug where the index for `file_header.stage_offsets` is sought before it's defined in the following for loop. These files have been modified to address and fix the bug.