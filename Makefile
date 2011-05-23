TEMP_FILES = *.aux *.dvi *.log *.out
OUT_FILES = *pdf *.ps

RESUME = resume


# Default target
package: clean ps pdf

sanitize: 
	rm -rf $(TEMP_FILES)

clean: sanitize
	rm -rf $(OUT_FILES)

compile:
	latex -halt-on-error $(RESUME).tex

dvi: compile
	xdvi $(RESUME).dvi &

ps: compile
	dvips -Pcmz $(RESUME).dvi -o $(RESUME).ps

pdf: compile
	dvipdf $(RESUME).dvi
