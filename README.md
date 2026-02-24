

# Rust Userland Systems Sandbox

**Purpose:**
Learn ownership, memory, and invariants in userland *before* writing a kernel.
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

# Wiki
Where most of the rust thoughts go
[Wiki](https://github.com/lucassimpson0213/sys-userland-kernel-rust/wiki)
----------------------------------------------------------------------------
----------------------------------------------------------------------------


## What I Do

Follow Brown Rust Book:
[https://rust-book.cs.brown.edu/ch04-02-references-and-borrowing.html](https://rust-book.cs.brown.edu/ch04-02-references-and-borrowing.html)

Rust for rustasceans:
[rust for rustasceans](https://github.com/rustaccato/road-to-being-master-rustacean/blob/main/Rust%20for%20Rustaceans.pdf)

For each concept:

**read → implement → test → fix → repeat**

Also play *Turing Complete* for hardware intuition.

---

## Projects (Order Matters)

1. Memory map iterator
2. ELF header parser
3. Page table entry (bitflags)
4. Bump allocator
5. Slab allocator
6. Packet parser (Ethernet/IP)
7. Virtual file table (inode style)

If I can write these confidently → I’m ready for kernel subsystems.

---

## Testing Rule (Most Important Part)

Testing is the real skill I’m learning.

Kernel developers debug with **invariants**, not print statements.

Always keep a watcher running:

```
cargo install cargo-watch
cargo watch -x test
```

Workflow:

**save file → tests run → fix immediately**

Never continue while tests are red.

Run a single test:

```
cargo watch -x "test <name>"
```

---

## Commands I’ll Forget

Run all tests:

```
just test
```

Run one:

```
just t read_one
```

Auto-test on save:

```
just watch
```

Fast checks:

```
just check
just clippy
```

Deep debugging:

```
just miri
```

---

## What This Actually Teaches

* memory layout
* aliasing
* lifetimes
* binary parsing
* allocators
* resource tracking

# Systems Learning Plan (Short)

## Goal
Build the mental model needed to eventually write an operating system — without getting stuck at the hardware layer too early.

---

## The Learning Order

1. Rust (Brown Book) — Local Correctness
   - Learn ownership, lifetimes, and concurrency.
   - Focus: why a single program behaves predictably.

2. OSTEP — System Behavior
   - Learn processes, scheduling, virtual memory, and synchronization.
   - Focus: why multiple programs interact correctly.

3. Userland Simulations in Rust — Experience
   - Implement tiny simulations that recreate OS behavior.
   - Focus: feel the problems an OS solves.

   Recommended simulations:
   - Scheduler (fairness & starvation)
   - Memory allocator (fragmentation)
   - Virtual memory illusion (isolation)
   - Synchronization (race conditions)
   - Toy filesystem (persistence)

4. Return to Blog-OS — Hardware Reality
   - Now learn interrupts, paging, and faults.
   - Focus: how the CPU enforces the behaviors you already understand.

---

## Core Principle
Do not rush features.  
Each stage answers a different question:

- Rust → “Why does my code work?”
- OSTEP → “Why do programs coexist?”
- Simulations → “What problems must the OS solve?”
- Blog-OS → “How does the machine make it possible?”

---

## Success Check
You’re progressing when system behavior becomes explainable before debugging — not when you add more code.
