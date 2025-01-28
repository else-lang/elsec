.POSIX:

all:

include configs/linux.mk

all: $(BINOUT)/else

C_DEFINES = \
	-DVERSION='"'"$(VERSION)"'"' \
	-DDEFAULT_TARGET='"$(DEFAULT_TARGET)"'

sources = $(wildcard src/*.c)
headers = src/include/*.h

$(BINOUT)/else: $(objects)
	@mkdir -p -- $(BINOUT)
	@printf 'CCLD\t%s\n' '$@'
	@$(CC) $(LDFLAGS) -o $@ $(objects) $(LIBS)

.SUFFIXES:
.SUFFIXES: .c .o .s

.PRECIOUS: %.s %.o

$(CACHE)/%.o: %.c $(headers)
	@mkdir -p -- $(dir $@)
	@printf 'CC\t%-16s --> ${CACHE}/%s\n' '$<' $(notdir $@)
	@$(CC) -c $(CFLAGS) $(C_DEFINES) -o $@ $(patsubst $(CACHE)/%.o,%.c,$@)

.s.o:
	@$(AS) $(ASFLAGS) -o $@ $<

install: $(BINOUT)/else
	@install -dm755 $(DESTDIR)$(BINDIR)
	install -m755 $(BINOUT)/else $(DESTDIR)$(BINDIR)/else

uninstall:
	rm -rf -- '$(DESTDIR)$(BINDIR)/else'

clean:
	@rm -rf -- $(CACHE) $(BINOUT) $(objects)

.PHONY: install uninstall clean