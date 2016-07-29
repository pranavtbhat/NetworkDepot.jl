# NetworkDepot

NetworkDepot makes it easy to fetch, and process large graph datasets using [ParallelGraphs](https://github.com/pranavtbhat/ParallelGraphs.jl).

## Requirements
- Gzip

## Usage

```
using NetworkDepot
using ParallelGraphs

path = download(Epinions)

g = loadgraph(path)
```

## Datasets and their sources:

### [Standford Network Analysis Platform](http://snap.stanford.edu/)
- [Epinions](http://snap.stanford.edu/data/soc-Epinions1.html)
- [LiveJournal](http://snap.stanford.edu/data/soc-LiveJournal1.html)
