//! Gravity and General Relativity Module
//!
//! - Black hole physics
//! - Spacetime metrics
//! - Sacred mathematics in gravity

pub const blackHoleCLI = @import("black_hole_cli.zig");
pub const blackHoleInformation = @import("black_hole_information.zig");
pub const colors = @import("colors.zig");
pub const deltaP2Simple = @import("delta_001_p2_simple.zig");
pub const deltaP2Numerical = @import("delta_001_phase2_numerical.zig");

// --- reachability: see comment below ---
// Zig analyses a top-level declaration only when something references it.
// Every `pub const X = @import("x.zig")` above was unreferenced, so x.zig was
// never part of the compilation and its `test` blocks did not exist. The
// suite reported "All 0 tests passed" while 640 test blocks sat in the tree.
// This block references them, which is the whole mechanism.
test {
    _ = blackHoleCLI;
    _ = blackHoleInformation;
    _ = colors;
    _ = deltaP2Simple;
    _ = deltaP2Numerical;
}
