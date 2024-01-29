#!/bin/sh

# GPS 입력 장치
gps_device="/dev/ttyUSB0"

# 출력 시리얼 포트
output_device="/dev/ttyS1"

# 시리얼 포트 설정 (115200 bps, 8 데이터 비트, 1 스톱 비트, No parity)
stty -F "$gps_device" 115200 cs8 -cstopb -parenb

# GPS 데이터 읽어들이고 출력 시리얼 포트로 전송
cat "$gps_device" > "$output_device"

