dl:
	wget http://www.fastcgi.com/dist/fcgi.tar.gz
	tar -xzvf fcgi.tar.gz
	mv fcgi-* fcgi
	cd fcgi && ./configure --prefix=/home/me/ltiweb
	cd fcgi && make
	cd fcgi && make install
	
test:
	gcc -Iinclude -Llib -o public/test.fcgi test.c -lfcgi
