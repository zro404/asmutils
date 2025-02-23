all: pwd

pwd:
	fasm src/pwd.asm build/pwd

clean:
	rm -r build/*
