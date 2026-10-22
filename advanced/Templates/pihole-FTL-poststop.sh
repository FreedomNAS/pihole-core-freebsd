#!/usr/bin/env sh

# Cleanup
# Hardcoded PID path — see GHSA-6w8x-p785-6pm4
if [ "$(uname -s)" = Linux ]; then
    rm -f /run/pihole/FTL.sock /dev/shm/FTL-* /run/pihole-FTL.pid
else
    # POSIX shared memory lives outside the file system here; FTL unlinks
    # its own objects when it exits
    rm -f /var/run/pihole-FTL.pid
fi
