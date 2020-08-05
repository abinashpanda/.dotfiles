
# Based on
# https://gist.github.com/bergmannjg/461958db03c6ae41a66d264ae6504ade

function connect_adb
  set WSL_HOST (tail -1 /etc/resolv.conf | cut -d' ' -f2)
  set ADB_SERVER_SOCKET tcp:$WSL_HOST:5037
  socat -d -d TCP-LISTEN:5037,reuseaddr,fork TCP:(cat /etc/resolv.conf | tail -n1 | cut -d " " -f 2):5037
end
