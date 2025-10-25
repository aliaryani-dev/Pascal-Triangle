const std = @import("std");
var stdout_buffer:[1024]u8 =undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;

fn print_pascal(n:u8) !void {
    var align_space = n;
    for (1..n+1) |row| {
        for (0..align_space) |_| {
            try stdout.print(" ", .{});
        }
        align_space -= 1;
        var c:u64 = 1;
        for (1..row+1) |i| {
            try stdout.print("{d} ", .{c});
            c = c * ( row - i ) / i;
        }
        try stdout.print("\n", .{});
    }
    try stdout.flush();
}

pub fn main() !void {
    try print_pascal(5);
}
