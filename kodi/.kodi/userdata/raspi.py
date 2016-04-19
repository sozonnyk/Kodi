import httplib, base64, sys

if len(sys.argv) > 1:
    httpServ = httplib.HTTPConnection("raspi2", 8080)
    httpServ.connect()
    req = "/" + sys.argv[1]
    #print req
    httpServ.request('GET', req)
    r1 = httpServ.getresponse()
    #print r1.status, r1.reason, r1.read()