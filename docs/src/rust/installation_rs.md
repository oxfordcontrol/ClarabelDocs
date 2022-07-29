# Installation

### Using Cargo

Clarabel.rs is available through the Rust registry at [crates.io](https://crates.io/) and can be imported directly as a dependency in your project.   Just add

```rust
[dependencies]
clarabel = "0"  
```

in your project's `Cargo.toml` file to obtain the latest version.


### Direct from source

You can also download and build the repository directly from Github:   

```
git clone https://github.com/oxfordcontrol/Clarabel.rs
cd Clarabel.rs
cargo build --release
```

To check that your installation worked, you can run
```
cargo run --example qp
```
