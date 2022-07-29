Complete Cargo projects for all Rust examples can be found in [examples/rs](https://github.com/oxfordcontrol/ClarabelDocs/tree/main/examples/rs).

````@eval
using Markdown, Documenter
root   = Documenter.Utilities.repo_root(".")
source = joinpath(root,"examples/rs/example_QP/src/main.rs")
Markdown.parse("""
```python
$(read(source,String))
```
"""
)
````
