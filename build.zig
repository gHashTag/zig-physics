const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Library module
    const physics_mod = b.addModule("zig-physics", .{
        .root_source_file = b.path("src/root.zig"),
    });

    // Export individual modules
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
        if (std.fs.path.join(b.allocator, &.{b.build_root_path.path, m.path})) |full_path| {
            defer b.allocator.free(full_path);
            if (std.fs.accessAbsolute(full_path, .{})) |_| {
                const mod = b.addModule(m.name, .{
                    .root_source_file = b.path(m.path),
                });
            } else |_| {}
        } else |_| {}
    }

    // Tests
    const tests = b.addTest(.{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(tests);

    const test_step = b.step("test", "Run tests");
    test_step.dependOn(&b.addRunArtifact(tests).step);
}
