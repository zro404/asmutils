all: pwd cat head

pwd:
	fasm src/pwd.asm build/pwd

cat:
	fasm src/cat.asm build/cat

head:
	fasm src/head.asm build/head

clean:
	rm -r build/*
