FILES=erd.svg erd.png class_diagram.svg class_diagram.png
all: install $(FILES)

install: ./node_modules/.bin/mmdc

./node_modules/.bin/mmdc:
	npm install @mermaid-js/mermaid-cli
	./node_modules/.bin/mmdc -h

%.svg: %.mmd
	./node_modules/.bin/mmdc -i $< -o $@

%.png: %.mmd
	./node_modules/.bin/mmdc  -H 3000 -w 3000 -i $< -o $@

clean: $(FILES)
	-rm $(FILES)
