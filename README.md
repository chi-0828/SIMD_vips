# SIMD_vips
## Rewrite CON_INT function in "libvips\libvips\convolution\im_conv"to build SIMD-version convolution
## Vserion: libvips 7.42
### Usage
> #### cd SIMD_vips/libvips
> ### ./configure --prefix=(your install path) CFLAGS="-O2 -mavx2 -g -mfma"
> #### make -j 8
> ### make install
> #### cd (your install path)
> #### ./vips im_conv ../testin.jpg ../testedge.jpg ../mask
> Output example :
> ![image](https://user-images.githubusercontent.com/73067915/148349452-8d31c379-066a-4955-9976-2be20735f3b3.png)

### Function Analysis
> #### CPU Time
> ![image](https://user-images.githubusercontent.com/73067915/148349821-a0af0065-683b-48b7-b128-ce16a36640bd.png)
> #### Instruction Retired
> ![image](https://user-images.githubusercontent.com/73067915/148349881-3d530113-62f9-4612-9885-e7c159f6eb3c.png)
### Execution Time Analysis (more chunks in loop)
> ![image](https://user-images.githubusercontent.com/73067915/148350117-e29c74c6-025b-4237-a3cf-760cf4555fb4.png)


