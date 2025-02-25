all: pwd cat

pwd:
	fasm src/pwd.asm build/pwd

cat:
	fasm src/cat.asm build/cat

clean:
	rm -r build/*
