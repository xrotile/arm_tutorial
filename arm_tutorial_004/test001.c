static unsigned long arch_local_irq_save(void) {
	unsigned long flag;
	asm volatile(
	"mrs %0, daif\n"
	"msr daifset, #2\n"
	: "=r" (flag)
	:
	: "memory"
	);
	return flag;
}

int main(void) {
	unsigned long flag = arch_local_irq_save();
	return 0;
}
