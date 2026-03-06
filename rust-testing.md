To use log::debug!, you need the log crate plus a logging implementation.

Rust logging works in two parts:
	1.	log → defines the logging macros (debug!, info!, etc.)
	2.	logger implementation → actually prints the logs (env_logger, tracing, etc.)

⸻

1. Add the basic logging crates

In your Cargo.toml:

[dependencies]
log = "0.4"
env_logger = "0.11"


⸻

2. Initialize the logger

You must initialize it once, usually at program start.

Example:

use log::debug;

fn main() {
    env_logger::init();

    debug!("hello debug log");
}


⸻

3. Run with the log level enabled

Logging is controlled with an environment variable:

RUST_LOG=debug cargo run

Output:

[DEBUG your_crate] hello debug log


⸻

4. Logging inside tests

For tests you need a slightly different init so it doesn’t panic when called multiple times.

use log::debug;

#[test]
fn test_bitset() {
    let _ = env_logger::builder().is_test(true).try_init();

    debug!("testing bitset");

    assert!(true);
}

Run:

RUST_LOG=debug cargo test -- --nocapture


⸻

5. Available log levels

log::error!()
log::warn!()
log::info!()
log::debug!()
log::trace!()

Typical usage:
	•	error! → something broke
	•	warn! → unexpected but recoverable
	•	info! → normal system events
	•	debug! → debugging details
	•	trace! → extremely detailed

⸻

6. Why this is nice for systems work

Instead of writing tons of prints:

println!("bit={}, word={}, mask={}", bit, word, mask);

You can do:

debug!("bit={} word={} mask={}", bit, word, mask);

Then turn logging on or off without touching code.

⸻

Small pro tip (many Rust engineers do this)

Use this while debugging:

RUST_LOG=debug cargo test -- --nocapture

Then once things work:

cargo test

No logs, clean output.

⸻

If you want, I can also show you a really nice logging setup Rust systems programmers use (tracing) that becomes extremely useful once you start doing distributed systems or networking.