const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    _ = b.addModule("zig-physics", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    // These nine were previously declared inside an `inline for` that first
    // asked whether the file existed and silently skipped it when it did not.
    // All nine exist, so the guard protected nothing — it only meant that a
    // module which went missing would stop being exported without anybody
    // being told. A package that quietly exports nothing still builds green.
    //
    // Declared directly instead: if one of these disappears, the build fails
    // and says which.
    const modules = [_]struct { name: []const u8, path: []const u8 }{
        .{ .name = "quantum", .path = "src/quantum/root.zig" },
        .{ .name = "gravity", .path = "src/gravity/root.zig" },
        .{ .name = "qcd", .path = "src/qcd/root.zig" },
        .{ .name = "dark_matter", .path = "src/dark_matter/root.zig" },
        .{ .name = "particle_physics", .path = "src/particle_physics/root.zig" },
        .{ .name = "plasma", .path = "src/plasma/root.zig" },
        .{ .name = "baryogenesis", .path = "src/baryogenesis/root.zig" },
        .{ .name = "monopoles", .path = "src/monopoles/root.zig" },
        .{ .name = "quantum_gravity", .path = "src/quantum_gravity/root.zig" },
    };

    inline for (modules) |m| {
        _ = b.addModule(m.name, .{
            .root_source_file = b.path(m.path),
            .target = target,
            .optimize = optimize,
        });
    }

    // addTest takes a root_module rather than a root_source_file since 0.15.
    const test_mod = b.createModule(.{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });
    const tests = b.addTest(.{ .root_module = test_mod });

    const test_step = b.step("test", "Run tests");
    test_step.dependOn(&b.addRunArtifact(tests).step);
}
