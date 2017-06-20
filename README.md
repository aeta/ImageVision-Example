#  Image Vision & VoiceOver

Created by Alan Chu [@ualch9](https://github.com/ualch9)

**This project requires Xcode 9 & iOS 11** - [More about CoreML and Vision on IOS](https://developer.apple.com/machine-learning/)

Last tested on iOS 11 beta 1

## Project Structure
`ImageVision.framework` - A standard wrapper framework for using ImageVision as well as VoiceOver string builders
Framework is located in [this repo](https://github.com/aeta/ImageVision)

`Vision+VoiceOver-iOS` - Example iOS app for interacting with `ImageVision`

**This project is not localized! It only supports English (US).**

## How to use framework
1. Import `ImageVision.framework` or `ImageVision.xcodeproj` to your existing *Xcode 9* project
* If using `framework`, ensure `ImageVision.framework` is attached to your build target
* If using `xcodeproj`, ensure a build scheme was created for `ImageVision.xcodeproj` as a `framework`

2. Import the framework to your source file using `import ImageVision`

These methods are compatible with using `Grand Central Dispatch`

**Accessing Files**: Accessing iCloud files may require you to add the iCloud Document entitlement to your target. Not doing so may cause this app to output an App Sandbox failure.

## Licenses
### `ImageVision.framework` & iOS app
MIT License

Copyright (c) 2017 Alan Chu

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

### VGG16 model
Project Page
<http://www.robots.ox.ac.uk/~vgg/research/very_deep/>

Authors
Original Paper: Karen Simonyan & Andrew Zisserman
Keras Implementation: François Chollet

Citations
Karen Simonyan, Andrew Zisserman. "Very Deep Convolutional Networks for Large-Scale Image Recognition." Paper <https://arxiv.org/abs/1409.1556>

MIT License
Copyright (c) 2016 François Chollet
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE
https://github.com/fchollet/keras/blob/master/LICENSE

Converted to CoreML format by Apple Inc.

### GoogLeNetPlaces
Project Page
<http://places.csail.mit.edu> <http://places.csail.mit.edu/>

Authors
B. Zhou, A. Lapedriza, J. Xiao, A. Torralba, and A. Oliva

Citation
B. Zhou, A. Lapedriza, J. Xiao, A. Torralba, and A. Oliva. "Learning Deep Features for Scene Recognition using Places Database." Advances in Neural Information Processing Systems 27 (NIPS), 2014. PDF <http://places.csail.mit.edu/places_NIPS14.pdf>
Supplementary Materials <http://places.csail.mit.edu/supp.pdf>

Scene attribute prediction used in the demo are trained from the data of SUN attribute database. This work is partly supported by the National Science Foundation under Grant No. 1016862, and by the McGovern Institute Neurotechnology Program (MINT) to A.O, ONR MURI N000141010933 to A.T, as well as MIT Big Data Initiative at CSAIL, Google, Xerox and Amazon Awards, and a hardware donation from NVIDIA Corporation, to A.O and A.T., and Intel and Google awards to J.X. Any opinions, findings, and conclusions or recommendations expressed in this material are those of the author(s) and do not necessarily reflect the views of the National Science Foundation and other funding agencies. The annotation can be used under the Creative Common License (Attribution CC BY). The copyright of all the images belongs to the image owners.

Converted to CoreML format by Apple Inc.
