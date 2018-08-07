# Heterogeneous List in Coq

This is a practice to create and use list who can save different types of data in Coq.

This feature is fairly common in many dynamic or weak typed language, like Python, Perl Ruby. But for strong typed language (almost all functional programming languages), people may think this is impossible, since create a list needs to specify the type within first. However, with the expressiveness of type language calculus of inductive constructions (which in my opition is similar and an enhancement to intuitionistic type theory), this data type can be created within several lines of code (without the help of upcasting or generic types, which is much worse in a lot of aspects).

The code itself is mainly a copy from Adam's website http://adam.chlipala.net/cpdt/html/DataStruct.html, where other several cool examples are presented. The code here simplied some implementations.

# Some Thoughts
## Coq can help you building functions
The commented out function "hget0" in the file is a demonstration that how Coq proof assistant can help you building a function thanks to the CH isomorphism. Even though the resulting function may have fairly poor performance (since proof irrelavance), but it can help you and give you ideas when you are stucked at difficult recursive functions (especially functions on several layers of types).

## Comparison of Coq and Haskell based on the difficulty of building HList

