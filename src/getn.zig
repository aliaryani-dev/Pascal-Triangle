const std = @import("std");
var stdin_buffer:[1024]u8 = undefined;
var stdin_writer = std.fs.File.stdin().reader(&stdin_buffer);
const stdin = &stdin_writer.interface;

pub fn get_n() !u16 {
    const input = stdin.takeDelimiterExclusive('\n') catch |err| {
        std.debug.print("Error: {any}\n", .{err});
        return err;
    };
    const n = std.fmt.parseInt(u16, input, 10);
    return n;
}
