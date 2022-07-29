# Installation

The Clarabel Python interface supports version 3.7 or newer.   To install directly, use:

```python
pip install clarabel
```


### Installing from source

You can also download and build the repository directly from Github.   You will need to have a working Rust installation to compile the Python interface.

To obtain the source:   

```
git clone https://github.com/oxfordcontrol/Clarabel.rs
cd Clarabel.rs
```

The Python interface to the Rust solver is implemented using [PyO3](https://pyo3.rs/) and can be built with [Maturin](https://maturin.rs/).   First create and activate a python virtual environment for your build:

```
python3 -m venv .env
source .env/bin/activate
```

Install `maturin` in your virtual environment:

```
pip install maturin
```

Then compile the Rust source with PyO3 bindings enabled:

```
maturin develop --release --features python
```

To check that Clarabel works within the virtual environment, you can then run
```
python examples/python/example_qp.py
```

To compile and install the solver *outside* of the virtual environment, at the last step you can instead run
```
maturin build -i python --release --features python
```
inside the virtual environment to produce a `.whl`.   Then outside the virtual environment run
```
python3 -m pip install <.whl-file-you-just-built>
```
