#![allow(non_snake_case)]
use clarabel::algebra::*;
use clarabel::solver::*;

fn main() {
    let P = CscMatrix::zeros((6, 6));
    let q = vec![0., 0., -1., 0., 0., -1.];

    let A = CscMatrix::from(&[
        [-1., 0., 0., 0., 0., 0.],
        [0., -1., 0., 0., 0., 0.],
        [0., 0., -1., 0., 0., 0.],
        [0., 0., 0., -1., 0., 0.],
        [0., 0., 0., 0., -1., 0.],
        [0., 0., 0., 0., 0., -1.],
        [1., 2., 0., 3., 0., 0.],
        [0., 0., 0., 0., 1., 0.],
    ]);

    let b = vec![0., 0., 0., 0., 0., 0., 3., 1.];

    let cones = [PowerConeT(0.6), PowerConeT(0.1), ZeroConeT(2)];

    let settings = DefaultSettings {
        verbose: true,
        max_iter: 100,
        ..DefaultSettings::default()
    };
    let mut solver = DefaultSolver::new(&P, &q, &A, &b, &cones, settings);
    solver.solve();
}
