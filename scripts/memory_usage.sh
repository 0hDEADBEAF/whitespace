#!/bin/sh

memory_info=$(free -h | awk '/^Mem:/ {print $3 "B"}')
echo "{\"text\": \"$memory_info\"}"
