require 'mkmf'

CONFIG[CC] << ' -std=gnu89 '
create_makefile 'pbkdf256_n'

