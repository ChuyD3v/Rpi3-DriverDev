obj-m += Driver.o 

all: create_dirs
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
	@echo "Archivos generados:"
	@ls -1 *.o *.ko *.mod.* .*.cmd *.symvers *.order || true
	@mv -v *.o *.mod.* .*.cmd *.symvers *.order *.mod Temps/ 2>/dev/null || true
	@mv -v *.ko Kernel/ 2>/dev/null || true


clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
	rm -rf Temps/*
	rm -rf Kernel/*


create_dirs:
	mkdir -p Temps
	mkdir -p Kernel