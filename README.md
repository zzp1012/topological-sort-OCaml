# Topological Sort

This proj aims to implement topological sorting with `OCaml`. 

## Requirement

- OCaml = 4.13.1
- Opam

If you don't have `OCaml` on your PC or remote server, I recommand your this [post](https://ocaml.org/learn/tutorials/up_and_running.html) first.

## Usage

To run the program you can
```bash
ocaml toposort.ml
```

or, you can

```bash
ocamlopt -o toposort str.cmxa toposort.ml
./toposort
```

### Input
The first line contains the number of vertices.
The second line contains the number of edges.
The following lines are all the edges in the DAG. Each line contains one edge (u,v), with direction from vertex u to v.

### Output
Output the result of topological sort in one line. There might be many possible solutions for the DAG, only output one possible answer.

### Example

**Input**
```
6
7
0 2
1 5
5 4
5 2
3 2
0 5
1 3
```

**Output**
```
0 1 3 5 2 4
```

## Honor Code

This is actually one lab assignment of cource VE477 (Intro. to Algo.) Of UM-SJTU JI. Therefore, if there is same questions or labs in the future, it is the responsibility of JI students not to copy or modify these codes, or TeX files because it is against the Honor Code. The owner of this repository dosen't take any commitment for other's faults.

According to the student handbook (2015 version),

>It is a violation of the Honor Code for students to submit, as their own, work that is not the result of their own labor and thoughts. This applies, in particular, to ideas, expressions or work obtained from other students as well as from books, the internet, and other sources. The failure to properly credit ideas, expressions or work from others is considered plagiarism.

-----------------------

Plz drop me an [email](mailto::zzp1012@sjtu.edu.cn) if you have any question.