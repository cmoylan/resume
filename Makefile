TEMP_FILES = *.aux *.bak *.dvi *.log *.out
OUT_FILES = *pdf *.ps

RESUME = resume


# Default target
package: clean ps pdf

symlink:
	ln -s res/res.cls res.cls

sanitize: 
	rm -rf $(TEMP_FILES)

clean: sanitize
	rm -rf $(OUT_FILES)

compile:
	latex -halt-on-error $(RESUME).tex

dvi: compile
	xdvi $(RESUME).dvi &

ps: compile
	dvips -t letter -Pcmz $(RESUME).dvi -o $(RESUME).ps

pdf: compile
	dvipdf $(RESUME).dvi

spell:
	ispell -t *.tex
