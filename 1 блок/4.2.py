#!/usr/bin/env python3

import os
import sys

#Проверка входящего параметра, отрицательно - проверяем текущую папку
a = os.getcwd()
if len(sys.argv)>=2:
    a = sys.argv[1]
bash_command = ["cd "+a, "git status 2>&1"]
result_os = os.popen(' && '.join(bash_command)).read()
for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = result.replace('\tmodified: ', '')
        separator='/'
        output=a+prepare_result
        print(output)