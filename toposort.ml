exception Foo of string

(*map function*)
let rec map f l = match l with
    | [] -> []
    | h::t -> f h :: map f t;;

(*print sorted vertices*)
let rec print l = match l with 
    | [] -> Printf.printf ""
    | h::[] -> Printf.printf "%d" h
    | h::t -> Printf.printf "%d " h; print t;;

(*compute in degree for each vertices*)
let rec inDegrees edges d_in = 
  match edges with
  | [] -> d_in
  | (h :: t) -> 
    match h with 
      | [u; v] -> 
        d_in.(v) <- d_in.(v) + 1;
        inDegrees t d_in
      | _ -> raise (Foo "Wrong type of edge");;

(*find all vertices whose have edges come from source vertex*)
let rec findNeighbor edges src neighbors = 
  match edges with
  | [] -> neighbors
  | (h :: t) -> 
    match h with 
      | [u; v] -> 
        if u = src then 
          findNeighbor t src (v :: neighbors)
        else 
          findNeighbor t src neighbors
      | _ -> raise (Foo "Wrong type of edge");;

(*decrement element in array by index list*)
let rec decrementArray arr idx_lst = 
  match idx_lst with
  | [] -> arr
  | (h :: t) -> 
    arr.(h) <- arr.(h) - 1;
    decrementArray arr t;;

  
(*find the index of the first element equal to zero in array*)
let rec findZero arr idx =
  if idx = Array.length arr then
    None
  else
    match arr.(idx) with
    | 0 -> Some idx
    | _ -> findZero arr (idx + 1);;
  
(*perform the topological sort*)
let rec topoSort edges d_in sorted = 
  match findZero d_in 0 with
  | None -> sorted
  | Some idx -> 
    d_in.(idx) <- d_in.(idx) - 1;
    let neighbors = findNeighbor edges idx [] in 
    let d_in_new = decrementArray d_in neighbors in
    topoSort edges d_in_new (sorted @ [idx]);;

(*main function*)
let v = int_of_string (read_line ());;
let e = int_of_string (read_line ());;
let readEdges e =
  let edges = ref [] in
    for row = 1 to e do
      let line = read_line () in 
      let arr = map int_of_string (map String.trim (String.split_on_char ' ' line)) in
      edges := (arr :: !edges)
    done;
    !edges;;

let edges = readEdges e;;
let d_in = inDegrees edges (Array.make v 0);;
let sorted = topoSort edges d_in [];;
let () = print sorted;;