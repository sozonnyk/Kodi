import httplib, base64, sys

if len(sys.argv) > 1:
    httpServ = httplib.HTTPConnection("127.0.0.1", 80)
    httpServ.connect()
    hdmi = "hdmi:CARD=NVidia,DEV=0" if sys.argv[1] == 'h' else "@"
    text = '{"jsonrpc":"2.0","method":"Settings.SetSettingValue", "params":{"setting":"audiooutput.audiodevice","value":"ALSA:%s"},"id":1}' % hdmi
    headers = {"Content-type": "application/json", "Authorization": "Basic %s" % base64.b64encode("xbmc:xbmc")}
    #print(text)
    httpServ.request('POST', '/jsonrpc', text, headers)
    r1 = httpServ.getresponse()
    #print r1.status, r1.reason, r1.read()