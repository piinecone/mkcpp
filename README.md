mkcpp
=====

`mkcpp` makes .h and .cpp header files in the appropriate directories for your project
with a single command

Dependencies
------------

* ruby 2.x

Installation
------------

### OS X ###

* `git clone https://github.com/piinecone/mkcpp.git ~/cool/mkcpp/path/`
* add /cool/mkcpp/path/bin to your $PATH; e.g.:

   `echo 'export PATH=$PATH:/cool/mkcpp/path/bin' >> ~/.bash_profile`

* ensure `which mkcpp` returns something
* ensure /cool/mkcpp/path/bin/mkcpp is executable (chmod +x mkcpp)

### Windows ###

** completely untested **

* install ruby (http://rubyinstaller.org/) (allow it to add ruby to your $PATH)
* install [git bash for windows](http://git-scm.com/downloads)
* run git bash
* `git clone https://github.com/piinecone/mkcpp.git ~/cool/mkcpp/path/`
* add ~/cool/mkcpp/path/bin to your $PATH; e.g.:

   `echo 'export PATH=$PATH:~/cool/mkcpp/path/bin' >> ~/.bash_profile`

* ensure `which mkcpp` returns something
* ensure ~/cool/mkcpp/path/bin/mkcpp is executable (chmod +x mkcpp)

Usage
-----

* cd ~/cpp/codebase/with/public/private/dirs
* create .mkcpp in your project directory and make it look like this:

```
h=source/public
cpp=source/private
```

* run `mkcpp path/to/classname`
* `mkcpp` will create:

```
source/public/path/to/classname.h
source/private/path/to/classname.cpp
```
