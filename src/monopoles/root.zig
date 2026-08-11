//! Magnetic Monopoles Module
//!
//! - Dirac monopoles
//! - 't Hooft-Polyakov monopoles

pub const sacredMonopoles = @import("sacred_monopoles.zig");

// --- reachability: see comment below ---
// Zig analyses a top-level declaration only when something references it.
// Every `pub const X = @import("x.zig")` above was unreferenced, so x.zig was
// never part of the compilation and its `test` blocks did not exist. The
// suite reported "All 0 tests passed" while 640 test blocks sat in the tree.
// This block references them, which is the whole mechanism.
test {
    _ = sacredMonopoles;
}
