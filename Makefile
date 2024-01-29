EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN -DCONFIG_MINIMAL_MEMORY_USAGE
ARCH ?= mips
CROSS_COMPILE ?= /home/kkk/mips-gcc472-glibc216-64bit/bin/mips-linux-gnu-
KSRC ?= /home/kkk/Main/kernel


#CONFIG_USB_NET_CDCETHER= m
#CONFIG_USB_NET_CDC_NCM=m
#CONFIG_USB_NET_CDC_EEM=m
CONFIG_USB_SERIAL_FTDI_SIO=m

obj-$(CONFIG_USB_NET_CDCETHER)	+= cdc_ether.o usbnet.o
obj-$(CONFIG_USB_NET_CDC_EEM)	+= cdc_eem.o
obj-$(CONFIG_USB_NET_CDC_NCM)	+= cdc_ncm.o
obj-$(CONFIG_USB_SERIAL_FTDI_GPIO) += ftdi_gpio.o
obj-$(CONFIG_USB_SERIAL_FTDI_SIO) += ftdi_sio.o


all: modules

modules:
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KSRC) M=$(shell pwd)  modules

.PHONY: modules clean

clean:
	$(MAKE) -C $(KSRC) M=$(shell pwd) clean

