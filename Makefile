main.o:
	zig build-obj main.zig -target wasm64-freestanding -dynamic -OReleaseSafe

main.wasm: main.o
	wasm-ld main.o --export-table --export-all --no-entry -O2  -mwasm64 --allow-undefined  -o main.wasm

run: main.wasm
	node --experimental-wasm-memory64 run.js main.wasm

clean:
	rm -rf main.o main.wasm