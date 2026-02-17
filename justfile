# Default recipe
default:
    @just --list

# -------- Basic Testing --------

# run all tests (deterministic, prints output)
test:
    cargo test -- --nocapture --test-threads=1

# run a specific test:  just t read_one
t name:
    cargo test {{name}} -- --nocapture --test-threads=1

# continuous testing (auto reruns on save)
watch:
    cargo watch -c -x "test -- --nocapture --test-threads=1"

# watch a specific test
watch-test name:
    cargo watch -c -x "test {{name}} -- --nocapture --test-threads=1"


# -------- Faster Runner --------

# nextest full suite
nextest:
    cargo nextest run

# nextest filtered
nextest-test name:
    cargo nextest run {{name}}


# -------- Static Analysis --------

# clippy lint pass
clippy:
    cargo clippy -- -W clippy::all

# formatting
fmt:
    cargo fmt

# check only (fast compile)
check:
    cargo check


# -------- Deep Debugging --------

# run miri interpreter (finds UB, aliasing, bad memory)
miri:
    cargo miri test

# expand macros
expand:
    cargo expand

# show assembly for a function
# usage: just asm read_one
asm fn:
    cargo asm {{fn}}

# -------- Bacon (live development dashboard) --------

# open bacon test dashboard
bacon:
    bacon

# live unit tests (default mode)
bacon-test:
    bacon --job test

# live specific test
# usage: just bacon-t truncated_header
bacon-t name:
    bacon --job "test {{name}}"

# live clippy (great after tests pass)
bacon-clippy:
    bacon --job clippy

# live compile checking (very fast)
bacon-check:
    bacon --job check

# -------- Clean --------

clean:
    cargo clean

