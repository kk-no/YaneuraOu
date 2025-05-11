#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
WASI_SDK_PATH=/usr/local/wasi-sdk-25
CORES=$(sysctl -n hw.ncpu)
WASI_CLANG="${WASI_SDK_PATH}/bin/clang++"

mkdir -p "$REPO_ROOT/build/wasi"
cd "$REPO_ROOT/source"

make clean
make -j$CORES tournament \
  COMPILER="${WASI_CLANG}" \
  TARGET_CPU=WASM \
  YANEURAOU_EDITION=YANEURAOU_ENGINE_NNUE \
  TARGET=../build/wasi/yaneuraou.wasm \
  CPPFLAGS="--target=wasm32-wasi-threads -pthread -matomics -mbulk-memory -O3 -msimd128 -flto -ffast-math -fno-signed-zeros -fno-trapping-math -ffinite-math-only -ftls-model=local-exec -fno-exceptions -fno-rtti -DUSE_WASI -D__wasm32__ -DYANEURAOU_ENGINE_NNUE -DNO_EXCEPTIONS -DEVAL_EMBEDDING" \
  LDFLAGS="-Wl,--export-memory -Wl,--shared-memory -Wl,--initial-memory=2147483648 -Wl,--max-memory=4294967296 -Wl,-z,stack-size=16777216 -Wl,--stack-first -Wl,--export-dynamic -Wl,--export=__heap_base -Wl,--export=__data_end -Wl,--export=wasi_thread_start -Wl,--export-table -Wl,--growable-table -Wl,--import-memory=false"