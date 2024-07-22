SRC_DIR := src/
BUILD_DIR := target/

PANDOC_EXE := ./pandoc
PANDOC_FLAGS := --mathjax -s --toc --template=template/base.html

HTML := $(BUILD_DIR)index.html $(foreach n,1 2 3 4,$(BUILD_DIR)$n_curso/index.html) $(foreach n,1 2 3 4,$(foreach c,1 2,$(BUILD_DIR)$n_curso/$c_cuatri/index.html))

all: dirs $(HTML)

dirs:
	mkdir -p $(BUILD_DIR){1..4}_curso/{1,2}_cuatri

pandoc:
	wget https://github.com/jgm/pandoc/releases/download/3.1.11.1/pandoc-3.1.11.1-linux-amd64.tar.gz
	tar -xvf pandoc-3.1.11.1-linux-amd64.tar.gz
	mv pandoc-3.1.11.1/bin/pandoc .
	rm pandoc-3.1.11.1-linux-amd64.tar.gz
	rm -rf pandoc-3.1.11.1/

# all index.html are created from readme.md
$(BUILD_DIR)index.html: $(SRC_DIR)readme.md
	$(PANDOC_EXE) $^ -o $@ $(PANDOC_FLAGS)
$(BUILD_DIR)%index.html: $(SRC_DIR)%readme.md
	$(PANDOC_EXE) $^ -o $@ $(PANDOC_FLAGS)

# default rule to create a html file
$(BUILD_DIR)%.html: $(SRC_DIR)%.md
	$(PANDOC_EXE) $^ -o $@ $(PANDOC_FLAGS)

clean:
	rm -rf *~ $(BUILD_DIR) $(SRC_DIR)*~ pandoc

.PHONY: clean pandoc dirs all
