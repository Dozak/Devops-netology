import socket
import datetime
import json
import yaml
import time


i = 1
dom = {'drive.google.com':'0.0.0.0', 'mail.google.com':'0.0.0.0', 'google.com':'0.0.0.0'}
while 1 == 1:
  for host in dom:
    ip = socket.gethostbyname(host)
    if ip != dom[host]:
        print(str(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")) +' [ERROR] ' + str(host) +' IP mistmatch: '+dom[host]+' '+ip)
        dom[host] = ip

    with open("C:/Users/Lidron/Desktop/devops-netology/ser_" + host + ".json", 'w') as js:
        json_data = json.dumps([{host: ip}])
        js.write(json_data)
    with open("C:/Users/Lidron/Desktop/devops-netology/ser_" + host + ".yml", 'w') as ym:
        yml_data = yaml.dump([{host: ip}])
        ym.write(yml_data)
  i += 1
  time.sleep(10)
