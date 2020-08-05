# Start the adb server
# https://gist.github.com/bergmannjg/461958db03c6ae41a66d264ae6504ade#start-adb-server-in-windows

adb kill-server
adb -a nodaemon server start
