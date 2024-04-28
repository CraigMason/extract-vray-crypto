About
=====

Docker image with OpenImageIO + Python Bindings, and a script to extract VRay Cryptomatte channels from a multipart EXR 2.0 file into a multilayered EXR 1.0 file.

Background
==========

EXR 2.0 introduced multipart images, which allows for non-interleaved read access to multiple 'sub images' within a single multipart file.
This is in contrast to EXR 1.0, which supports multiple channels, but the whole file must be read just to access a single set of RGBA channels.

Most popular rendering engines support Cryptomatte passes, which are fully supported in Nuke in either EXR or EXR2.0 multipart files.  
Davinci Resolve (both embedded and standalone) supports Cryptomatte via a fuse, but sadly does not support the use of Cryptomattes within
multipart files.

Rendering to multipart files does have significant workflow and management benefits, particularly within Chaos Group's VRay ecosystem. 
For example, intra-frame denoising can utilise multipart EXR files to generate denoised passes with better results. VRay also supports
a setting to 'Render Cryptomattes separately' (at least in 3DSM render settings) but sometimes we will still end up with our Cryptomatte
passes embedded within a multipart EXR, making them unusable in Resolve.

The included script will parse a multipart EXR, or sequence, and extract the metadata and channels relevant to Cryptomatte. Note: The original
file is untouched, but a separate EXR 1.0 Cryptomatte file is generated.

The script can probably be adapted for other render engine's output.

Build
=====

```bash
docker build . --tag oiio
```

Usage
=======

```bash
docker run \
-it --rm --name oiio \
-v /mnt/m:/mnt/m  \
oiio
```

Extract vray-rendered cryptomattes from a multipart EXR file

```bash
extract-vray-crypto input.exr output.exr
```