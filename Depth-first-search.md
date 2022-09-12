## Depth-First-Search
- Algorithm traversing through tree / graph structures to explore as far as possible along each branch
- O(V + E) where V is # of vertices, E is # of edges. essentially, it is n where n is the # of nodes
For the following graph:
          A
      B   C   E
  D   F   G

A DFS will visit A -> B -> D -> F -> C -> G -> E