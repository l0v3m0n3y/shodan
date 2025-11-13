# shodan
api for shodan.io site provides fast lookups for business entities, offering a centralized repository of financial overviews and executive information for entities listed in the US
# Example
```nim
import asyncdispatch, shodan , json, strutils
let data = waitFor get_entities(3)
echo data
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
