//! zig-physics — Physics Simulation Library for Zig
//!
//! **Modules:**
//! - quantum: Quantum mechanics, wave functions, operators
//! - quantum_gravity: Quantum gravity theories
//! - qcd: Quantum Chromodynamics (strong force)
//! - gravity: General relativity, spacetime metrics
//! - dark_matter: Dark matter models and simulations
//! - particle_physics: Standard Model, particles, interactions
//! - plasma: Plasma physics, magnetohydrodynamics
//! - baryogenesis: Early universe baryogenesis
//! - monopoles: Magnetic monopole theory

const std = @import("std");

// ═══════════════════════════════════════════════════════════════
// PUBLIC API — RE-EXPORTS
// ═══════════════════════════════════════════════════════════════

/// Quantum mechanics
pub const quantum = struct {
    pub const root = @import("quantum/root.zig");
};

/// Gravity and general relativity
pub const gravity = struct {
    pub const root = @import("gravity/root.zig");
    pub const sacred = @import("gravity/sacred/sacred_types.zig");
};

/// Quantum Chromodynamics
pub const qcd = struct {
    pub const root = @import("qcd/root.zig");
};

/// Dark matter
pub const dark_matter = struct {
    pub const root = @import("dark_matter/root.zig");
};

/// Particle physics
pub const particle_physics = struct {
    pub const root = @import("particle_physics/root.zig");
};

/// Plasma physics — NOT EXPORTED. See issue #2.
///
/// `plasma/root.zig` exports exactly one declaration, `testValues`, which
/// imports `plasma/formulas.zig`. That file does not exist. Every other
/// domain here has a `formulas.zig`; plasma is the only one that does not,
/// so the module has no implementation to export — only the values that an
/// implementation would have been checked against.
///
/// The import is removed rather than the file invented. `test_values.zig`
/// lists the answers, so writing `formulas.zig` from it would produce a
/// model that agrees with its own test by construction and establishes
/// nothing. Whoever knows the physics should write it; until then this
/// re-export is the difference between eight usable domains and zero.
// pub const plasma = struct {
//     pub const root = @import("plasma/root.zig");
// };

/// Baryogenesis
pub const baryogenesis = struct {
    pub const root = @import("baryogenesis/root.zig");
};

/// Magnetic monopoles
pub const monopoles = struct {
    pub const root = @import("monopoles/root.zig");
};

/// Quantum gravity
pub const quantum_gravity = struct {
    pub const root = @import("quantum_gravity/root.zig");
};

// --- reachability: see comment below ---
// The domains are nested one struct deep, so referencing the domain does not
// reach the @import inside it. Each member is named here explicitly.
test {
    _ = quantum.root;
    _ = gravity.root;
    _ = gravity.sacred;
    _ = qcd.root;
    _ = dark_matter.root;
    _ = particle_physics.root;
    _ = baryogenesis.root;
    _ = monopoles.root;
    _ = quantum_gravity.root;
}
