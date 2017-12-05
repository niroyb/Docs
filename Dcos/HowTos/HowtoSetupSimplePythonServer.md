# How to setup a simple Python server for testing

   [information](https://docs.python.org/3/library/http.server.html)

- Get Python container image 

        Get the python docker image

        C:\>docker images
        REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
        msitest/test                  pythonwindow1709    61a085212caa        29 hours ago        5.74GB

- Instantiate a container instance 

      C:\>docker run -p 8080:8080 -it msitest/test:pythonwindow1709 python -m http.server 8080

          // inside the container

          Serving HTTP on 0.0.0.0 port 8080 (http://0.0.0.0:8080/) ...
          131.107.174.205 - - [02/Dec/2017 02:08:09] "GET / HTTP/1.1" 200 -
          51.143.16.246 - - [02/Dec/2017 02:08:39] "GET / HTTP/1.1" 200 -
          51.143.16.246 - - [02/Dec/2017 02:09:04] "GET / HTTP/1.1" 200 -

   With above command, the server is running
 
- Contact the running server from the Client

              PS C:\Users\azureuser> wget http://51.141.164.178:8080 -UsebasicParsing


              StatusCode        : 200
              StatusDescription : OK
              Content           : <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
                                  <html>
                                  <head>
                                  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
                                  <title>Directory listing fo...
              RawContent        : HTTP/1.0 200 OK
                                  Content-Length: 924
                                  Content-Type: text/html; charset=utf-8
                                  Date: Sat, 02 Dec 2017 02:09:04 GMT
                                  Server: SimpleHTTP/0.6 Python/3.7.0a2

                                  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01...
              Forms             :
              Headers           : {[Content-Length, 924], [Content-Type, text/html; charset=utf-8], [Date, Sat, 02 Dec 2017 02:09:04 GMT], [Server, SimpleHTTP/0.6
                                  Python/3.7.0a2]}
              Images            : {}
              InputFields       : {}
              Links             : {@{outerHTML=<a href="Boot/">Boot/</a>; tagName=A; href=Boot/}, @{outerHTML=<a href="bootmgr">bootmgr</a>; tagName=A;
                                  href=bootmgr}, @{outerHTML=<a href="BOOTNXT">BOOTNXT</a>; tagName=A; href=BOOTNXT}, @{outerHTML=<a
                                  href="Documents%20and%20Settings/">Documents and Settings/</a>; tagName=A; href=Documents%20and%20Settings/}...}
              ParsedHtml        :
              RawContentLength  : 924
  
