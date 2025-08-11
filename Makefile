BUILD_DIR := ./dist
STATIC := static/files/resume
STATIC_FR := $(STATIC)/fr_FR
STATIC_EN := $(STATIC)/en_US

all: build

.PHONY: build
build: build-latex build-hugo

build-latex: build-latex-fr build-latex-en

build-latex-fr:
	if ! [[ -d $(STATIC_FR) ]]; then mkdir -p $(STATIC_FR); fi
	cd resume/fr_FR && lualatex main.tex && cd ../../
	pdftk resume/fr_FR/main.pdf cat 1-r2 output $(STATIC_FR)/rdeville-devops-cloud-fr.pdf
	cd resume/fr_FR && lualatex main-bw.tex && cd ../../
	pdftk resume/fr_FR/main-bw.pdf cat 1-r2 output $(STATIC_FR)/rdeville-devops-cloud-fr-bw.pdf
	cd resume/fr_FR && lualatex main_ats.tex && cd ../../
	cp resume/fr_FR/main_ats.pdf $(STATIC_FR)/rdeville-devops-cloud-ats-fr.pdf

build-latex-en:
	if ! [[ -d $(STATIC_EN) ]]; then mkdir -p $(STATIC_EN); fi
	cd resume/en_US && lualatex main.tex && cd ../../
	pdftk resume/en_US/main.pdf cat 1-r2 output $(STATIC_EN)/rdeville-devops-cloud-en.pdf
	cd resume/en_US && lualatex main-bw.tex && cd ../../
	pdftk resume/en_US/main-bw.pdf cat 1-r2 output $(STATIC_EN)/rdeville-devops-cloud-en-bw.pdf
	cd resume/en_US && lualatex main_ats.tex && cd ../../
	cp resume/en_US/main_ats.pdf $(STATIC_EN)/rdeville-devops-cloud-ats-en.pdf


build-hugo:
	hugo build

serve:
	hugo serve -w
