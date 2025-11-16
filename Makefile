FILES=erd.mmd class_diagram.mmd
PNG=$(patsubst %.mmd,images/%.png,$(FILES))
SVG=$(patsubst %.mmd,images/%.svg,$(FILES))

all: install $(PNG) $(SVG)

install: ./node_modules/.bin/mmdc

./node_modules/.bin/mmdc:
	npm install @mermaid-js/mermaid-cli
	./node_modules/.bin/mmdc -h

images/%.svg: %.mmd
	./node_modules/.bin/mmdc -i $< -o $@

images/%.png: %.mmd
	./node_modules/.bin/mmdc  -H 5000 -w 5000 -i $< -o $@

clean:
	-rm images/*
