# video-streaming-over-http

## Description
  This is a demonstration of video streaming from your webcam to a server, we first encode the input from webcam using [FFmpeg](https://github.com/FFmpeg/FFmpeg) with multiple bitrates for adaptive streaming then transfer encoded streams to our EC2 instance with RTMP. NGINX server's endpoint on server awaits for the stream then serves it accordingly. Project also contains a HTML file for the demo to enhance viewing experience with a player, hls.js in our case.

  Project uses NGINX and to store and serve the video from an AWS EC2 instance. [NGINX RTMP Module](https://github.com/arut/nginx-rtmp-module) is used on the server to configure NGINX. 

  I had a hard time while working on this, so here is a tutorial for you:

  ## Tutorial
  1. If you want to store the video on a server and make it accessible to Internet, get an instance from any provider you want, make sure required ports (80, 1935) are not blocked by the firewall.

  2. Set the NGINX up by either copy and pasting the commands in **config.sh** or using the running the config script I have provided on your server.

  Restart the nginx server

  `sudo /usr/local/nginx/sbin/nginx -s stop`
  `sudo /usr/local/nginx/sbin/nginx`

  3. Open a folder under /mnt called /hls and replace the NGINX configuration file with my **nginx.conf** file. You can use the defaults or change the stream parameters as you wish. After this step, your server is ready to go, video segments will be stored under **/mnt/hls** and your HTTP document root is: **home/ubuntu/public/public_html** and NGINX serves from port **80**

  4. Encode the video using FFmpeg. Set the parameters (IP and ffmpeg path) in the script and run the **encodeAndTransfer.sh** script on your laptop, make sure input device numbers match if you get an input/output error. You can see device numbers with ffmpeg --list-devices command. 

  5. Your segments are being stored in mnt/hls/ and you can request your playlist from any browser with **/hls/stream.m3u8** endpoint.

  6. Optionally you can have an index.html file with a video player for a better experience, I used [hls.js](https://github.com/video-dev/hls.js/), you can use my index.html by changing the **hls.loadSource('http://your_ip/hls/stream.m3u8');** line with your IP address and putting the file in **home/ubuntu/public/public_html**.

  7. ENJOY YOUR STREAM!
