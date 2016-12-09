#!/usr/bin/python
#coding=UTF-8
import os,sys
import pexpect
import struct
import fcntl
import termios
import signal
fmt = '\033[0;3{}m{}\033[0m'.format  
class color:  
	BLACK  = 0#黑  
	RED	= 1#红  
	GREEN  = 2#绿  
	YELLOW = 3#棕  
	BLUE   = 4#蓝  
	PURPLE = 5#紫  
	CYAN   = 6#青  
	GRAY   = 7#灰
reload(sys)
sys.setdefaultencoding('utf8')
def sigwinch_passthrough (sig, data):
	winsize = getwinsize()
	ssh.setwinsize(winsize[0],winsize[1])
def getwinsize():
	if 'TIOCGWINSZ' in dir(termios):
		TIOCGWINSZ = termios.TIOCGWINSZ
	else:
		TIOCGWINSZ = 1074295912L # Assume
	s = struct.pack('HHHH', 0, 0, 0, 0)
	x = fcntl.ioctl(sys.stdout.fileno(), TIOCGWINSZ, s)
	return struct.unpack('HHHH', x)[0:2]

ip_dic = {}
cmd_dic = {}
ip_file = '/Users/xuwuqiang/Documents/shell/jumper/ip.md'

def initDict(id,user,host,port,cmd):
        ip_dic[id] = 'ssh -o ServerAliveInterval=60 -o StrictHostKeyChecking=no ' +user + '@%s -p %s'  %(host,port)
        cmd_dic[id]=cmd
			   
def printDist():
        print "{:25}".format(fmt(color.GREEN,"ID")),"{:30}".format(fmt(color.GREEN,"IP")),"{:35}".format(fmt(color.GREEN,"mark")),"{:20}".format(fmt(color.GREEN,"shell"))
        print fmt(color.PURPLE,"--------------|-------------------|---------------------|--------------------------------------") 
	with open(ip_file) as f_line:
		for line in f_line:
                        if line.startswith("#"):
                            continue
			l = line.strip().split('|')
			if len(l) < 5:
                            continue
			id = l[0]
			host = l[1]
			port = l[2]
			user = l[3]
			mark = l[4]
			cmd = l[5]
			print "{:25}".format(fmt(color.RED,id)),"{:30}".format(fmt(color.GREEN,host)),"{:35}".format(fmt(color.GRAY,mark)),"{:20}".format(fmt(color.GREEN,cmd))
                        initDict(id,user,host,port,cmd)

if __name__=="__main__":
        option = None;
        if len(sys.argv) > 1:
            option = sys.argv[1]
	while(True):
                    printDist()
                    if(option is None):
                        option = raw_input("请选择:\n")
                    if option in ip_dic.keys():
                            ssh = pexpect.spawn(ip_dic[option])
                            ssh.expect("$")
                            ssh.sendline(cmd_dic[option])
                            signal.signal(signal.SIGWINCH, sigwinch_passthrough)
                            size = getwinsize()
                            ssh.setwinsize(size[0], size[1])
                            ssh.interact()
                            break
                    else:
                            if option == 'q':
                                break
                    print "您输入的服务器标识不存在！"
                    option = None

