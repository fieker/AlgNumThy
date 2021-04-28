all: alg_num.pdf  alg_num_c1c.pdf

alg_num.dvi: alg_num_1.tex alg_num_main.tex alg_num_2.tex alg_num_3.tex
	latex alg_num
	touch alg_num_main.tex

alg_num.pdf: alg_num.dvi
	dvipdfm alg_num

alg_num_c1c.dvi: alg_num_1.tex alg_num_main.tex alg_num_2.tex alg_num_3.tex
	latex alg_num_c1c
	touch alg_num_main.tex

alg_num_c1c.pdf: alg_num_c1c.dvi
	dvipdfm alg_num_c1c

install: alg_num.pdf alg_num_c1c.pdf
	cp alg_num.pdf alg_num_$(shell date +%F).pdf
	cp alg_num_c1c.pdf alg_num_c1c_$(shell date +%F).pdf
	scp alg_num.pdf alg_num_c1c.pdf alg_num_$(shell date +%F).pdf alg_num_c1c_$(shell date +%F).pdf sun.mathematik.uni-kl.de:~thofmann/WWW/alg_num
	rm alg_num_$(shell date +%F).pdf
	rm alg_num_c1c_$(shell date +%F).pdf
