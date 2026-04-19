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

/// Plasma physics
pub const plasma = struct {
    pub const root = @import("plasma/root.zig");
};

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
