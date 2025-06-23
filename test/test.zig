const std = @import("std");

pub fn main() void {
    const hello = "Hello, world!";
    std.debug.print("{s}\n", .{hello});
}
