
# Indexing strategy
Without an index, you may be limited to sequentially scanning your tables to find data. With an index, you have choices. Indexing everything, though, is costly. You have to balance the costs and benefits when deciding what to index and how to index it, since there is more than one index access method available. The following applies specifically to PostgreSQL although similar concepts apply to other RDBMS. For the most part, the following is content from the PostgreSQL manual for version 10 unless otherwise noted.

## Index creation
Let bla be a table created by

```sql
create table bla (
  id integer,
  content varchar
);
```

and suppose there are many queries of the form

```sql
select content from bla where id = somenumber;
```

then creating the following index (by default a B-tree index) will speed up queries.

```
create index bla_id_index on bla (id);
```

This speedup occurs because the system must only traverse a few entries in a B-tree (by default) to find any given id, instead of sequentially scanning the table.

Index creation is one of only two operations required, the other being, for instance,

```sql
drop index bla_id_index;
```

The index is automatically updated as the table changes with no further intervention.

## Consistency
The acronym ACID stands for atomicity, consistency, isolation, and durability, four qualities a transaction must possess. Indexing can support consistency by enforcing properties like uniqueness. Indexing can help to prevent the insertion of duplicate data as a primary key for example.

## Indexing purposes
Indexes can support constraints, including the unique constraint, the primary key constraint, and the exclusion constraint. Indexes can support queries, in which indexes improve performance.

## Constraints
You can declare constraints that automatically create indexes used for error checking. You never have to explicitly create an index for error checking.

## Queries
Queries include reading, inserting, and deleting and indexes can improve the performance of all three operations. Indexes can be used in joins so they can improve the performance of queries with joins.

Indexes only affect performance, never material results. No query requires an index to return correct results. No query's material results are altered by using an index, only performance.

## Indexing costs
Building an index can occur concurrently with reading but writing is blocked by default during an index building process.

Automatically updating the index to keep it synchronized with the table is costly. Indexes should never be built for or should be dropped from columns not named in queries.

## Index access methods
B-tree, Hash, GIST, SP-GIST, GIN, and BRIN are index access methods available.

### B-tree
The ubiquitous B-tree (stands for balanced tree, not binary tree!) has been the preferred indexing choice in databases throughout the decades since its invention in 1971. PostgreSQL is not an exception, recommending the B-tree for indexing all scalar data and implementing it as the default index. The PostgreSQL manual points out that B-trees are not useful for non-scalar data, so several other index types are offered, including GIST, SP-GIST, and GIN indexes. The B-tree is selected by the query planner whenever <, >, <=, >=, or = comparisons occur, or equivalent constructs or combinations of these operators.

Knuth says that a B-tree of order *m* is defined by five properties:

1. Every node has at most *m* children
2. Every node except root and leaves has at least *m/2* children
3. The root has at least 2 children unless it is a leaf
4. All leaves appear at the same level
5. A nonleaf node with *k* children has *k-1* keys

The PostgreSQL manual offers the following limitation concerning multicolumn B-tree indexes.

\begin{quotation}
A multicolumn B-tree index can be used with query conditions that involve any subset of the index's columns, but the index is most efficient when there are constraints on the leading (leftmost) columns. The exact rule is that equality constraints on leading columns, plus any inequality constraints on the first column that does not have an equality constraint, will be used to limit the portion of the index that is scanned.
\end{quotation}

Using a B-tree index often allows the `order by` clause to proceed without an extra sorting step since the B-tree index and only the B-tree among index access methods, can return sorted results. B-trees indexes are stored in ascending order with nulls last by default, so a forward scan of the index is equivalent to an `order by` clause.

Wikipedia claims the following six advantages for using B-trees in databases.

- keeps keys in sorted order for sequential traversing
- uses a hierarchical index to minimize the number of disk reads
- uses partially full blocks to speed insertions and deletions
- keeps the index balanced with a recursive algorithm
- In addition, a B-tree minimizes waste by making sure the interior nodes are at least half full.
- A B-tree can handle an arbitrary number of insertions and deletions.

### GIST
The GIST infrastructure allows geometric indexing, with operators meaning things like

- above
- below
- to the right of
- to the left of
- parallel
- perpendicular

and many more.

### GIN
These indexes are inverted and can be used, for instance, to index array entries.

### BRIN
These indexes store summaries about the values stored in consecutive physical block ranges of a table. They may be used, for instance, to index bitmaps.

## Indexing decisions
The query planner can take into account whether data is stored on solid state media or rotational media. You can alter certain parameters to anticipate the relative performance of these two media types, not explicitly, but implicitly, depending on your knowledge of the underlying hardware.

Running the `analyze` command manually will update statistics about how much and when indexes have conferred a performance improvement. These statistics are used by the query planner.

## Removing indexes
The PostgreSQL manual offers the following advice about removing indexes when creating a new table or bulk adding large amounts of data to an existing table.

\begin{quotation}
If you are loading a freshly created table, the fastest method is to create the table, bulk load the table's data using COPY, then create any indexes needed for the table. Creating an index on pre-existing data is quicker than updating it incrementally as each row is loaded.

If you are adding large amounts of data to an existing table, it might be a win to drop the indexes, load the table, and then recreate the indexes. Of course, the database performance for other users might suffer during the time the indexes are missing. One should also think twice before dropping a unique index, since the error checking afforded by the unique constraint will be lost while the index is missing.
\end{quotation}


