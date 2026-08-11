//! Quantum Mechanics Module
//!
//! - E8 Lie group and root systems
//! - Golden ratio quantum gates
//! - Alpha-gamma bridge theory

pub const e8RootSystem = @import("e8_root_system.zig");
pub const e8Integration = @import("e8_integration.zig");
pub const e8GammaDeformation = @import("e8_gamma_deformation.zig");
pub const goldenGates = @import("golden_gates.zig");
pub const alphaGammaBridge = @import("alpha_gamma_bridge.zig");

// --- reachability: see comment below ---
// Zig analyses a top-level declaration only when something references it.
// Every `pub const X = @import("x.zig")` above was unreferenced, so x.zig was
// never part of the compilation and its `test` blocks did not exist. The
// suite reported "All 0 tests passed" while 640 test blocks sat in the tree.
// This block references them, which is the whole mechanism.
test {
    _ = e8RootSystem;
    _ = e8Integration;
    _ = e8GammaDeformation;
    _ = goldenGates;
    _ = alphaGammaBridge;
}
