#![allow(non_snake_case)]
use clarabel::algebra::*;
use clarabel::solver::*;

// This code implements the example in the Clarabel
// "Getting Started" documentation

fn main() {
    let P = CscMatrix::new(
        3,                             // m
        3,                             // n
        vec![0, 1, 3, 6],              // colptr
        vec![0, 0, 1, 0, 1, 2],        // rowval
        vec![3., 1., 4., -1., 2., 5.], // nzval
    );

    let q = vec![1., 2., -3.];

    let Aeq = CscMatrix::new(
        1,                 // m
        3,                 // n
        vec![0, 1, 2, 3],  // colptr
        vec![0, 0, 0],     // rowval
        vec![1., 1., -1.], // nzval
    );

    let Aineq = CscMatrix::new(
        2,                // m
        3,                // n
        vec![0, 0, 1, 2], // colptr
        vec![0, 1],       // rowval
        vec![1., 1.],     // nzval
    );

    let mut Asoc = CscMatrix::identity(3);
    Asoc.negate();

    let A = CscMatrix::vcat(&Aeq, &Aineq);
    let A = CscMatrix::vcat(&A, &Asoc);

    let b = vec![1., 2., 2., 0., 0., 0.];

    let cones = [ZeroConeT(1), NonnegativeConeT(2), SecondOrderConeT(3)];

    let settings = DefaultSettingsBuilder::default()
        .max_iter(15)
        .verbose(true)
        .build()
        .unwrap();

    let mut solver = DefaultSolver::new(&P, &q, &A, &b, &cones, settings);

    solver.solve();
}
