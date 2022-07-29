````@eval
using Markdown, Documenter
root   = Documenter.Utilities.repo_root(".")
source = joinpath(root,"examples/py/example_QP.py")
Markdown.parse("""
```python
$(read(source,String))
```
"""
)
````
