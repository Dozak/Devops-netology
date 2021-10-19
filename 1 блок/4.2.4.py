#!/usr/bin/env python3

import time
import socket
import datetime


i = 1
dom = {'drive.google.com':'0.0.0.0', 'mail.google.com':'0.0.0.0', 'google.com':'0.0.0.0'}

while 1 == 1:
  for host in dom:
    ip = socket.gethostbyname(host)
    if ip != dom[host]:
        print(str(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")) +' [ERROR] ' + str(host) +' IP mistmatch: '+dom[host]+' '+ip)
        dom[host] = ip

  i+=1
  time.sleep(10)