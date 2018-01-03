#!/usr/bin/python3
# -*- coding: utf-8 -*-
import socket
import threading
import time

threads = []
semaphore = threading.BoundedSemaphore(100)

def scanner(host, port):
    semaphore.acquire()
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        ret = s.connect_ex((host,port))
        if (ret == 0):
            print('[+] %d open' % port)
    except:
        pass
    finally:
        semaphore.release()
        s.close()

def main():
    # start = time.clock()
    host = '192.168.10.140'
    socket.setdefaulttimeout(1)
    print('Scanning the host:%s......' % (host))
    for p in range(1,1024):
        t = threading.Thread(target=scanner,args=(host,p))
        threads.append(t)
        t.start()

    for t in threads:
        t.join()

    # elapsed = (time.clock() - start)
    # print('time : ', elapsed)

if __name__ == '__main__':
    main()