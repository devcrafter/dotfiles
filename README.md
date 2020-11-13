# dotfiles

# GDB
On some OSes, you can lock the OS scheduler and thus allow only a single thread to run.

set scheduler-locking mode
Set the scheduler locking mode. If it is off, then there is no locking and any thread may run at any time. If on, then only the current thread may run when the inferior is resumed. The step mode optimizes for single-stepping. It stops other threads from "seizing the prompt" by preempting the current thread while you are stepping. Other threads will only rarely (or never) get a chance to run when you step. They are more likely to run when you `next' over a function call, and they are completely free to run when you use commands like `continue', `until', or `finish'. However, unless another thread hits a breakpoint during its timeslice, they will never steal the GDB prompt away from the thread that you are debugging.
show scheduler-locking
Display the current scheduler locking mode.
