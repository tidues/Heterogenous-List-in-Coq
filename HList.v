Require Import ZArith.
Require Import Arith.
Require Import List.


(* Define Heterogenous List by Inductive Types *)
Section hlist.
  (* Define HList *)
  Inductive hlist : (list Set) -> Type :=
  | HNil : hlist nil
  | HCons : forall (x:Set) (ls:list Set), x -> hlist ls -> hlist (x::ls).

(* Define Elements Access Function *)
(* build the function with the help of coq proof assistant
  Fixpoint hget0 (ls:list Set) (hls:hlist ls) (n:nat){struct n} : option (nth n ls Empty_set).
    inversion hls.
    exact None.
    induction n.
    simpl.
    exact (Some H).
    apply (hget0 ls0 X n).
  Defined.  

  Print hget0.
*)

(* Build the function manually *)
  Fixpoint hget (ls:list Set) (hls:hlist ls) (n:nat){struct n} : option (nth n ls Empty_set) :=  
    match hls in (hlist l) return option (nth n l Empty_set) with
    | HNil => None
    | HCons _ nil _ _ => None
    | HCons _ ys x xs => 
        match n with
        | 0 => Some x
        | S p => hget ys xs p
        end
    end.
 
End hlist.

Arguments HCons [x ls].
Arguments hget [ls].

(* Example of using HList *)
Definition someValues := HCons 3%Z (HCons 2%nat (HCons (3::5::4::nil) HNil)).
Check someValues.
Print someValues.

Eval simpl in (hget someValues 0).
Eval simpl in (hget someValues 1).
Eval simpl in (hget someValues 2).

(* Extract the code for Haskell or OCaml *)
Require Import Extraction.
(* Extraction Language Haskell. *)
(* Extraction Language OCaml. *)
Recursive Extraction hget.