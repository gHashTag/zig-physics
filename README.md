# zig-physics

**Physics Simulation Library for Zig** — Quantum mechanics, QCD, gravity, dark matter, and beyond.

## Overview

A comprehensive physics simulation library covering:

| Module | Description |
|--------|-------------|
| `quantum/` | Quantum mechanics, wave functions, operators |
| `quantum_gravity/` | Quantum gravity theories |
| `qcd/` | Quantum Chromodynamics (strong force) |
| `gravity/` | General relativity, spacetime metrics |
| `dark_matter/` | Dark matter models and simulations |
| `particle_physics/` | Standard Model, particles, interactions |
| `plasma/` | Plasma physics, magnetohydrodynamics |
| `baryogenesis/` | Early universe baryogenesis |
| `monopoles/` | Magnetic monopole theory |

## Usage

```zig
const physics = @import("zig-physics");

// Quantum mechanics
const psi = try physics.quantum.WaveFunction.init(allocator, 100);

// Gravity
const metric = physics.gravity.SchwarzschildMetric{ .mass = 1.989e30 };

// Dark matter
const halo = try physics.dark_matter.NFWHalo.init(allocator, params);
```

## Scientific Context

This library is designed for:
- DARPA CLARA grant applications
- Trinity AI physics simulations
- Academic research publications

## License

MIT — Copyright (c) 2026 Trinity Project
