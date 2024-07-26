SHELL := /bin/bash
SRC_DIR := src/
BUILD_DIR := target/

PANDOC_EXE := ./pandoc
PANDOC_FLAGS := --mathjax -s --toc --template=template/base.html --include-after-body=template/help-us.html --metadata=lang:es-ES

HTML := $(BUILD_DIR)index.html $(foreach n,1 2 3 4,$(BUILD_DIR)$n_curso/index.html) $(foreach n,1 2 3 4,$(foreach c,1 2,$(BUILD_DIR)$n_curso/$c_cuatri/index.html)) $(foreach asignatura,progi calculo empresas teco fisica,$(BUILD_DIR)1_curso/1_cuatri/$(asignatura)/index.html) $(foreach asignatura,eco redesi progii               sistemas_info algebra,$(BUILD_DIR)1_curso/2_cuatri/$(asignatura)/index.html) $(foreach asignatura,ssoo logica eda isoi orco,$(BUILD_DIR)2_curso/1_cuatri/$(asignatura)/index.html) $(foreach asignatura,pctr estadistica redesii metodologia bbdd,$(BUILD_DIR)2_curso/2_cuatri/$(asignatura)/index.html) $(foreach asignatura,arco distribuidos inteligentes isoii ipoi,$(BUILD_DIR)3_curso/1_cuatri/$(asignatura)/index.html)

all: dirs $(HTML)

dirs:
	mkdir -p $(BUILD_DIR){1..4}_curso/{1,2}_cuatri
	mkdir -p $(BUILD_DIR)1_curso/1_cuatri/{progi,calculo,empresas,teco,fisica}
	mkdir -p $(BUILD_DIR)1_curso/2_cuatri/{eco,redesi,progii,sistemas_info,algebra}
	mkdir -p $(BUILD_DIR)2_curso/1_cuatri/{ssoo,logica,eda,isoi,orco}
	mkdir -p $(BUILD_DIR)2_curso/2_cuatri/{pctr,estadistica,redesii,metodologia,bbdd}
	mkdir -p $(BUILD_DIR)3_curso/1_cuatri/{arco,distribuidos,inteligentes,isoii,ipoi}
	mkdir -p $(BUILD_DIR)3_curso/2_cuatri/{api,computacion,computadores,iso,ti}
	mkdir -p $(BUILD_DIR)3_curso/2_cuatri/computacion/{declarativa,basados,algoritmos,automatas}
	mkdir -p $(BUILD_DIR)3_curso/2_cuatri/computadores/
	mkdir -p $(BUILD_DIR)3_curso/2_cuatri/iso/
	mkdir -p $(BUILD_DIR)3_curso/2_cuatri/ti/
	mkdir -p $(BUILD_DIR)4_curso/1_cuatri/computacion/
	mkdir -p $(BUILD_DIR)4_curso/1_cuatri/computadores/
	mkdir -p $(BUILD_DIR)4_curso/1_cuatri/iso/
	mkdir -p $(BUILD_DIR)4_curso/1_cuatri/ti/
	mkdir -p $(BUILD_DIR)4_curso/1_cuatri/optativas/
	mkdir -p $(BUILD_DIR)4_curso/2_cuatri/optativas/

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
