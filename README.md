# Heterogeneous List in Coq

This is a practice in Coq to create and use list (not tuple) who can save different types of data.

This feature is fairly common in many dynamic or weak typed language, like Python, Perl Ruby. But for strong typed language, it seems this is impossible, since create a list needs to specify the type within first. However, with the expressiveness of calculus of inductive constructions (https://en.wikipedia.org/wiki/Calculus_of_constructions) (which in my opition is similar and an enhancement to the intuitionistic type theory https://en.wikipedia.org/wiki/Intuitionistic_type_theory), this data type can be created within several lines of code (without the help of upcasting or generic types, which is much worse in a lot of aspects).

The code itself is mainly a copy from Adam's website http://adam.chlipala.net/cpdt/html/DataStruct.html, where other several cool examples are presented. The code here simplied some implementations though.

# Some Thoughts

## Coq can help you building functions

The commented out function "hget0" in the file is a demonstration that how Coq proof assistant can help you building a function thanks to the CH isomorphism. Even though the resulting function may have fairly poor performance (since proof irrelavance, so don't relay on this to give you the most efficient code), but it can help and give you ideas when you are stucked at difficult recursive functions (especially functions on several layers of types).

## Comparison of Coq and Haskell based on the difficulty of Creating HList

I tried this on both awesome languages. The most apparent difference to me is that the creation process is much more natural and smooth in Coq. The main reason is that coq fully support dependent type language while Haskell is not. That is, in Coq there are no barriers between types in different layer of the hierarchy, which means you can build functions from small types to universe (layered) with no problem, also means many operators can be used on different layers of objects. In this file, the list operator was used on constructing list of types, which was further used as a small type to create HList elements.

On the contrary, in Haskell we have values which belong to types, and types belong to kinds, but all three are treated very differently. We cannot build functions from types to kinds, and cannot directly apply operator on values to types or kinds. Based on the same reason, it's very different and nontrivial to build functions on types and kinds. You cannot use coding features and syntax at value level, like guards, case of or maps. The way for Haskell to overcome all of these are the several language extentions called DataKinds, GADTs etc., in which some valid data type we created can be lifted also into the kinds layer, so that we can treated types as values, and kinds as types (this technique is called type level programming, see http://www.parsonsmatt.org/2017/04/26/basic_type_level_programming_in_haskell.html), so that it is much like how types are organized in Coq. But still we need to lift operators, and use special functions called data families to define functions on types, which is much more cumbersome compared how can we achieve all these fairly easily in Coq.
 

