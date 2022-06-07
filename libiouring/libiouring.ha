use fmt;

export type probe_op = struct {
    op: u8,
    resv: u8,
    flags: u16,
    resv2: u32,
};

export type probe = struct {
    last_op: u8,
    ops_len: u8,
    resv: u16,
    resv2: [3]u32,
    ops: [*]probe_op,
};

export type op = enum uint {
	NOP,
	READV,
	WRITEV,
	FSYNC,
	READ_FIXED,
	WRITE_FIXED,
	POLL_ADD,
	POLL_REMOVE,
	SYNC_FILE_RANGE,
	SENDMSG,
	RECVMSG,
	TIMEOUT,
	TIMEOUT_REMOVE,
	ACCEPT,
	ASYNC_CANCEL,
	LINK_TIMEOUT,
	CONNECT,
	FALLOCATE,
	OPENAT,
	CLOSE,
	FILES_UPDATE,
	STATX,
	READ,
	WRITE,
	FADVISE,
	MADVISE,
	SEND,
	RECV,
	OPENAT2,
	EPOLL_CTL,
	SPLICE,
	PROVIDE_BUFFERS,
	REMOVE_BUFFERS,
	TEE,
	SHUTDOWN,
	RENAMEAT,
	UNLINKAT,
	MKDIRAT,
	SYMLINKAT,
	LINKAT,
	MSG_RING,
	FSETXATTR,
	SETXATTR,
	FGETXATTR,
	GETXATTR,
	SOCKET,
	URING_CMD,

	LAST,
};


@symbol("io_uring_get_probe") fn _io_uring_get_probe() *probe;
export fn get_probe() *probe = {
    return _io_uring_get_probe();
};

const OP_SUPPORTED: uint = 1u << 0;
export fn opcode_supported(p: *probe, op: uint) bool = {
    if (op > p.last_op) {
        return false;
    };
    fmt::println("flags: ", p.ops[op].flags)!;
    return (p.ops[op].flags & OP_SUPPORTED) != 0;
};

