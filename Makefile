all: create_build_dir exec

exec: pwd cat head wc

pwd:
	fasm src/pwd.asm build/pwd

cat:
	fasm src/cat.asm build/cat

head:
	fasm src/head.asm build/head

wc:
	fasm src/wc.asm build/wc

nl:
	fasm src/nl.asm build/nl

create_build_dir:
	mkdir -p build

clean:
	rm -r build/*
