#![allow(non_snake_case)]
use clarabel::algebra::*;
use clarabel::solver::*;

fn main() {

    // QP Example (32 bit)

    // let P = CscMatrix::<f32>::identity(2);    // For P = I
    // let P = CscMatrix::<f32>::spalloc(2,2,0); // For P = 0

    let P = CscMatrix::<f32>::new(
        2,             // m
        2,             // n
        vec![0, 1, 2], // colptr
        vec![0, 1],    // rowval
        vec![6., 4.],  // nzval
    );

    let q = vec![-1., -4.];

    let A = CscMatrix::<f32>::new(
        5,                               // m
        2,                               // n
        vec![0, 3, 6],                   // colptr
        vec![0, 1, 3, 0, 2, 4],          // rowval
        vec![1., 1., -1., -2., 1., -1.], // nzval
    );

    let b = vec![0., 1., 1., 1., 1.];

    let cones = [ZeroConeT(1), NonnegativeConeT(4)];

    let settings = DefaultSettings::<f32>::default();

    let mut solver = DefaultSolver::<f32>::new(&P, &q, &A, &b, &cones, settings);

    solver.solve();

    println!("Solution = {:?}", solver.solution.x);
}
