# How to

rtmp://172.16.0.108/vod/1280.flv

ffmpeg -f v4l2 -i /dev/video1 -preset ultrafast -vcodec libx264 -f flv rtmp://localhost/live/stream - ideal
ffmpeg -f v4l2 -i /dev/video1 -preset ultrafast -vf "drawtext=fontfile=verdana.ttf:fontcolor=white@1:fontsize=24:box=1:boxcolor=blue@0.5:text=%{localtime}" -vcodec libx264 -f flv rtmp://localhost/live/stream

ffmpeg -f v4l2 -i /dev/video1 -preset ultrafast -vcodec libx264 -tune zerolatency -b 900k -f flv rtmp://localhost/live/stream

ffmpeg -i rtsp://admin:secret@192.168.0.4:554/live1.sdp -с copy -f flv -an rtmp://localhost:1935/camera2/stream 2>>/var/log/nginx/ffmpeg.log;