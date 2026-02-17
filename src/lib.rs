// When running tests, Rust automatically enables std.
// When used in kernel, std disappears.
#![allow(dead_code)]
#![allow(unused_variables)]
#![cfg_attr(not(feature = "std"), no_std)]
pub mod frames;
pub mod raw;
pub mod region;
pub mod tests;

// Your code goes here.
// Don’t depend on Vec in the core parsing path unless you have alloc in the kernel.
// Prefer: read_one(&[u8]), iter over &[u8], sanitize, usable frames iterator.

extern crate alloc;
#[cfg(test)]
extern crate std; // allows tests to use Vec, etc.
