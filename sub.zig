export fn sub(a: i32, b: i32) i32 {
    const message = "boo boo woe woe";
    consoleLog(message, message.len);
    return a - b;
}
extern fn consoleLog(message: [*]const u8, length: u8) void;