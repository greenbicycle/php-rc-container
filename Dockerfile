FROM php:rc

VOLUME /root/code

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'e5325b19b381bfd88ce90a5ddb7823406b2a38cff6bb704b0acc289a09c8128d4a8ce2bbafcd1fcbdc38666422fe2806') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"

#RUN chmod u+x /root/code/bin/composer-install
#RUN chmod u+x /root/code/bin/composer.phar
#RUN ln -s /root/code/bin/composer.phar /usr/local/sbin/composer
