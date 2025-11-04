# wget-static-musl

This is a static version of wget build in musl with a very simple workflow.
I just did because it's a very hard task to staticaly link this tool, if you give an ./wget --version you gonna see it's almost identical to the the version shipped by ubuntu or debian distros, it's a prove of concept.
Just nitice statically link in a software gainst musl is easier than use glibc.
also notice depending the nunber of dependecies statically link a software can become impossible, the less dependencies it has more easier is to statically link.
