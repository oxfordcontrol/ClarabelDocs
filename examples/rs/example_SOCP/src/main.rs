#![allow(non_snake_case)]
use clarabel::algebra::*;
use clarabel::solver::*;

fn main() {
    let P = CscMatrix::new(
        2,             // m
        2,             // n
        vec![0, 0, 1], // colptr
        vec![1],       // rowval
        vec![2.],      // nzval
    );

    let q = vec![0., 0.];

    let A = CscMatrix::new(
        3,              // m
        2,              // n
        vec![0, 1, 2],  // colptr
        vec![1, 2],     // rowval
        vec![-2., -1.], // nzval
    );

    let b = vec![1., -2., -2.];

    let cones = [SecondOrderConeT(3)];

    let settings = DefaultSettingsBuilder::default()
        .max_iter(15)
        .verbose(true)
        .build()
        .unwrap();

    let mut solver = DefaultSolver::new(&P, &q, &A, &b, &cones, settings);

    solver.solve();
}
