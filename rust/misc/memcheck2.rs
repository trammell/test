/*
It may not seem like much, but by adding the to_string() method call,
we have violated Rust’s memory checker. This is because we have turned a
string literal into a heap-allocated string. The stack is where short-term
variables associated with the current function are allocated so they can
easily be cleaned up when they go out of lexical scope (i.e. at the end of the
function). Heap-allocated memory is allocated until it no longer needs to be.
In C and C++, you must generally manage this process yourself as a
programmer. In Java and JavaScript environments, the run-time garbage
collector does this for you.
*/

fn main() {
  let s = "Hello, world.".to_string();
  let t = s;
  println!("s: {}", s);
  println!("t: {}", t);
}
