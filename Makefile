all: pwd cat head wc

pwd:
	fasm src/pwd.asm build/pwd

cat:
	fasm src/cat.asm build/cat

head:
	fasm src/head.asm build/head

wc:
	fasm src/wc.asm build/wc

clean:
	rm -r build/*
