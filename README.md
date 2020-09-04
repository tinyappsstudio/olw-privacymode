# olw-privacymode

Simple API to open web browsers in Private mode.

How to use:

Launch the app once to register the url schemes on your system. (The app will automatically close)

To Open a link in a private window of the web browser use :

x-olw-privatemode-**\<web-browser-bundleidentifier>**://**\<url>**

As of current version are supported :

Firefox : x-olw-privatemode-org.mozilla.firefox://\<url> 
Chrome : x-olw-privatemode-com.google.Chrome://\<url> 
Opera : x-olw-privatemode-com.operasoftware.Opera://\<url> 
Chrome Canary : x-olw-privatemode-com.google.Chrome.canary://\<url>  


NB: Safari is not supported, as no easy streamlined way to open a Safari window in Private mode.
