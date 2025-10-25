const std = @import("std");
var stdout_buffer:[1024]u8 =undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;

fn print_pascal(n:u8) !void {
    for (1..n+1) |row| {
        std.debug.print("row: {d}\n", .{row});
    }
}

pub fn main() !void {
    try print_pascal(10);
}
