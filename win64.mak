CC=cl
CFLAGS=/O2 /c
DFLAGS=-m64 -O -release -inline -noboundscheck
DC=dmd

build:
	@echo "Compiling deps\http-parser"
	git submodule update --init deps\http-parser
    $(CC) $(CFLAGS) deps\http-parser\http_parser.c
    $(CC) $(CFLAGS) /I deps\http-parser src\http_parser.d.c
    $(DC) -c lib\http\parser\core.d lib\http\parser\c.d $(DFLAGS)
    mkdir out
    del out\http-parser.lib
    lib /OUT:out\http-parser.lib c.obj core.obj http_parser.obj http_parser.d.obj
