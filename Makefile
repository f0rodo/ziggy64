
sub.o:
	zig build-obj sub.zig -target wasm64-freestanding -dynamic -OReleaseSafe


main.o:
	zig build-obj main.zig -target wasm64-freestanding -dynamic -OReleaseSafe

main.wasm: main.o sub.o
	wasm-ld main.o sub.o --export-table --export-all --no-entry -O2  -mwasm64 --allow-undefined  -o main.wasm

run: main.wasm
	node --experimental-wasm-memory64 run.js main.wasm

clean:
	rm -rf main.o sub.o main.wasm