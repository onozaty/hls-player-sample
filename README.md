# hls-player-sample

HLS(HTTP Live Streaming)で動画を再生するサンプルです。

hls.jsを使用しています。

- [video\-dev/hls\.js: HLS\.js is a JavaScript library that plays HLS in browsers with support for MSE\.](https://github.com/video-dev/hls.js)

`viewer.html`にクエリパラメータで、動画ファイルのパスと画面タイトルを指定します。

- `src` : 動画ファイルのパス (必須)
    - 例: `src=sample-movie/BigBuckBunny_320x180.m3u8`
- `title` : 画面タイトル (任意)
    - 例: `title=サンプル動画`

## 動作確認方法

DevContainerで動作確認できるようにしています。  
下記の手順で確認できます。

`create-sample.sh`でサンプル動画([Big Buck Bunny » Download](https://peach.blender.org/download/))のダウンロード＋HLS変換を行います。

```bash
sh create-sample-movie.sh
```

下記URLでアクセスすると、サンプル動画を再生するための画面が表示されます。

- http://localhost:8080/viewer.html?src=sample-movie/BigBuckBunny_320x180.m3u8&title=Big%20Buck%20Bunny

## mp4 -> HLS 変換

DevContanerにはffmpegがインストールされているので、下記コマンドでmp4ファイルをHLS形式に変換できます。

```bash
ffmpeg -i BigBuckBunny_320x180.mp4 -codec: copy -start_number 0 -hls_time 10 -hls_list_size 0 -f hls BigBuckBunny_320x180.m3u8
``` 
