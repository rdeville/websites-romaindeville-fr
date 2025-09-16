BUILD := public/
STATIC := static/files/resume
RESUME := resume
FR := fr_FR
EN := en_US

TEX_CMD := xelatex
SRCS = main-clr.tex main-bw.tex main-ats.tex

all: pdf html deploy

.ONESHELL:
deploy:
	rsync -avz public ${USER}@romaindeville.fr:/home/${USER}/

pdf: pdf-fr pdf-en

pdf-fr: latex-fr
	./scripts/compress_pdf.sh $(RESUME)/$(FR)/main-clr.pdf $(STATIC)/$(FR)/rdeville-devops-cloud-fr-clr.pdf
	./scripts/compress_pdf.sh $(RESUME)/$(FR)/main-bw.pdf $(STATIC)/$(FR)/rdeville-devops-cloud-fr-bw.pdf
	cp $(RESUME)/$(FR)/main-ats.pdf $(STATIC)/$(FR)/rdeville-devops-cloud-fr-ats.pdf

.ONESHELL:
latex-fr:
	@cd $(RESUME)/$(FR)
	$(TEX_CMD) main-clr.tex
	$(TEX_CMD) main-bw.tex
	$(TEX_CMD) main-ats.tex

pdf-en: latex-en
	./scripts/compress_pdf.sh $(RESUME)/$(EN)/main-clr.pdf $(STATIC)/$(EN)/rdeville-devops-cloud-en-clr.pdf
	./scripts/compress_pdf.sh $(RESUME)/$(EN)/main-bw.pdf $(STATIC)/$(EN)/rdeville-devops-cloud-en-bw.pdf
	cp $(RESUME)/$(EN)/main-ats.pdf $(STATIC)/$(EN)/rdeville-devops-cloud-en-ats.pdf

.ONESHELL:
latex-en:
	@cd $(RESUME)/$(EN)
	$(TEX_CMD) main-clr.tex
	$(TEX_CMD) main-bw.tex
	$(TEX_CMD) main-ats.tex

html:
	hugo build

serve:
	hugo serve -w

clean: pdf-clean html-clean

pdf-clean: pdf-clean-en pdf-clean-fr

pdf-clean-fr:
	cd $(RESUME)/$(FR)
	rm -f *.log *.aux *.out

pdf-clean-en:
	cd $(RESUME)/$(EN)
	rm -f *.log *.aux *.out

html-clean:
	rm -rf $(BUILD)
