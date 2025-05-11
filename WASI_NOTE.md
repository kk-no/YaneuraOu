# WASI Note

# Dependencies

- WASI-SDK v25
- WASM Runtime (Wasmtime/Wasmer)
- Node

# USI

```
usi
setoption name USI_Hash value 1024
setoption name Threads value 1

isready
bench 1024 4
go movetime 30000
```

# Memo

## bench
`bench 1024 4`

C++ Binary
```
===========================
Total time (ms) : 60006
Nodes searched  : 169317599
Nodes_searched/second    : 2821677
Nodes searched       (main thread) : 42138478
Nodes searched/second(main thread) : 702237
===========================
```

2025-05-11
```
===========================
Total time (ms) : 60007
Nodes searched  : 31596724
Nodes_searched/second    : 526550
Nodes searched       (main thread) : 7883944
Nodes searched/second(main thread) : 131383
===========================
```
