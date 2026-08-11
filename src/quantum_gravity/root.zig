//! Quantum Gravity Module
//!
//! - E8 LQG bridge
//! - Loop Quantum Gravity

pub const e8LQGBridge = @import("e8_lqg_bridge.zig");

// --- reachability: see comment below ---
// Zig analyses a top-level declaration only when something references it.
// Every `pub const X = @import("x.zig")` above was unreferenced, so x.zig was
// never part of the compilation and its `test` blocks did not exist. The
// suite reported "All 0 tests passed" while 640 test blocks sat in the tree.
// This block references them, which is the whole mechanism.
test {
    _ = e8LQGBridge;
}
