use libiouring;
use fmt;
export fn main() void  = {
 let probe = libiouring::get_probe();
 fmt::println("last op: ", probe.last_op, ",", probe.ops_len)!;
 for(let idx = 0u; idx < libiouring::op::LAST; idx += 1) {
    if (libiouring::opcode_supported(probe, idx)) {
       fmt::println(idx, "supported")!;
    };
 };
};