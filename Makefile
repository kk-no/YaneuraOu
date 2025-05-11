.PHONY: build build-eval

build:
	@./script/wasi_build.sh

build-eval:
	@node source/eval/nnue/embedded_nnue.js nn.bin > source/eval/nnue/embedded_nnue.cpp

.PHONY: run run-wasmtime

run: run-wasmtime

run-wasmtime:
	@wasmtime --wasm threads --wasi threads build/wasi/yaneuraou.wasm

run-wasmer:
	@wasmer run build/wasi/yaneuraou.wasm --dir=. --enable-simd --enable-bulk-memory
