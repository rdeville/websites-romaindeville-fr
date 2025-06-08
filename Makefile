BUILD_DIR := ./dist

all: build

build:
	cd resume/fr_FR && lualatex main.tex
