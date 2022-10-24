export fn add(a: i32, b: i32) i32 {
    const message = "happy happy joy joy";
    consoleLog(message, message.len);
    return a + b;
}
extern fn consoleLog(message: [*]const u8, length: u8) void;