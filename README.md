# ali_tts_plugin

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## 发布pub

修改对应版本号,并打tag标签
执行flutter packages pub publish --server=https:\/\/pub.dartlang.org

* FIX: 上传后无法立即使用,需要等待pub.dev分析包,输出文档之后再过2分钟才能pub get得到,否则会出现由于找不到版本数据而报错