
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
void kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

void
kern_init(void){
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 80 fd 10 00       	mov    $0x10fd80,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 ea 10 00 	movl   $0x10ea16,(%esp)
  100027:	e8 62 2d 00 00       	call   102d8e <memset>

    cons_init();                // init the console
  10002c:	e8 44 15 00 00       	call   101575 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 a0 35 10 00 	movl   $0x1035a0,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 bc 35 10 00 	movl   $0x1035bc,(%esp)
  100046:	e8 21 02 00 00       	call   10026c <cprintf>

    print_kerninfo();
  10004b:	e8 c2 08 00 00       	call   100912 <print_kerninfo>

    grade_backtrace();
  100050:	e8 8b 00 00 00       	call   1000e0 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 fb 29 00 00       	call   102a55 <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 4d 16 00 00       	call   1016ac <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 d1 17 00 00       	call   101835 <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 ff 0c 00 00       	call   100d68 <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 79 17 00 00       	call   1017e7 <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    lab1_switch_test();
  10006e:	e8 6d 01 00 00       	call   1001e0 <lab1_switch_test>

    /* do nothing */
    while (1);
  100073:	eb fe                	jmp    100073 <kern_init+0x73>

00100075 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100075:	55                   	push   %ebp
  100076:	89 e5                	mov    %esp,%ebp
  100078:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  10007b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100082:	00 
  100083:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10008a:	00 
  10008b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100092:	e8 bf 0c 00 00       	call   100d56 <mon_backtrace>
}
  100097:	c9                   	leave  
  100098:	c3                   	ret    

00100099 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100099:	55                   	push   %ebp
  10009a:	89 e5                	mov    %esp,%ebp
  10009c:	53                   	push   %ebx
  10009d:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000a0:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  1000a3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1000a6:	8d 55 08             	lea    0x8(%ebp),%edx
  1000a9:	8b 45 08             	mov    0x8(%ebp),%eax
  1000ac:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  1000b0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  1000b4:	89 54 24 04          	mov    %edx,0x4(%esp)
  1000b8:	89 04 24             	mov    %eax,(%esp)
  1000bb:	e8 b5 ff ff ff       	call   100075 <grade_backtrace2>
}
  1000c0:	83 c4 14             	add    $0x14,%esp
  1000c3:	5b                   	pop    %ebx
  1000c4:	5d                   	pop    %ebp
  1000c5:	c3                   	ret    

001000c6 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c6:	55                   	push   %ebp
  1000c7:	89 e5                	mov    %esp,%ebp
  1000c9:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000cc:	8b 45 10             	mov    0x10(%ebp),%eax
  1000cf:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d6:	89 04 24             	mov    %eax,(%esp)
  1000d9:	e8 bb ff ff ff       	call   100099 <grade_backtrace1>
}
  1000de:	c9                   	leave  
  1000df:	c3                   	ret    

001000e0 <grade_backtrace>:

void
grade_backtrace(void) {
  1000e0:	55                   	push   %ebp
  1000e1:	89 e5                	mov    %esp,%ebp
  1000e3:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e6:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000eb:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000f2:	ff 
  1000f3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000f7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1000fe:	e8 c3 ff ff ff       	call   1000c6 <grade_backtrace0>
}
  100103:	c9                   	leave  
  100104:	c3                   	ret    

00100105 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100105:	55                   	push   %ebp
  100106:	89 e5                	mov    %esp,%ebp
  100108:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  10010b:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  10010e:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100111:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100114:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100117:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10011b:	0f b7 c0             	movzwl %ax,%eax
  10011e:	83 e0 03             	and    $0x3,%eax
  100121:	89 c2                	mov    %eax,%edx
  100123:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100128:	89 54 24 08          	mov    %edx,0x8(%esp)
  10012c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100130:	c7 04 24 c1 35 10 00 	movl   $0x1035c1,(%esp)
  100137:	e8 30 01 00 00       	call   10026c <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  10013c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100140:	0f b7 d0             	movzwl %ax,%edx
  100143:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100148:	89 54 24 08          	mov    %edx,0x8(%esp)
  10014c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100150:	c7 04 24 cf 35 10 00 	movl   $0x1035cf,(%esp)
  100157:	e8 10 01 00 00       	call   10026c <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  10015c:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100160:	0f b7 d0             	movzwl %ax,%edx
  100163:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100168:	89 54 24 08          	mov    %edx,0x8(%esp)
  10016c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100170:	c7 04 24 dd 35 10 00 	movl   $0x1035dd,(%esp)
  100177:	e8 f0 00 00 00       	call   10026c <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  10017c:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100180:	0f b7 d0             	movzwl %ax,%edx
  100183:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100188:	89 54 24 08          	mov    %edx,0x8(%esp)
  10018c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100190:	c7 04 24 eb 35 10 00 	movl   $0x1035eb,(%esp)
  100197:	e8 d0 00 00 00       	call   10026c <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  10019c:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1001a0:	0f b7 d0             	movzwl %ax,%edx
  1001a3:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001a8:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001ac:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001b0:	c7 04 24 f9 35 10 00 	movl   $0x1035f9,(%esp)
  1001b7:	e8 b0 00 00 00       	call   10026c <cprintf>
    round ++;
  1001bc:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001c1:	83 c0 01             	add    $0x1,%eax
  1001c4:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001c9:	c9                   	leave  
  1001ca:	c3                   	ret    

001001cb <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001cb:	55                   	push   %ebp
  1001cc:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
	asm volatile (
  1001ce:	83 ec 08             	sub    $0x8,%esp
  1001d1:	cd 78                	int    $0x78
  1001d3:	89 ec                	mov    %ebp,%esp
	    "int %0 \n"
	    "movl %%ebp, %%esp"
	    : 
	    : "i"(T_SWITCH_TOU)
	);
}
  1001d5:	5d                   	pop    %ebp
  1001d6:	c3                   	ret    

001001d7 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001d7:	55                   	push   %ebp
  1001d8:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
	asm volatile (
  1001da:	cd 79                	int    $0x79
  1001dc:	89 ec                	mov    %ebp,%esp
	    "int %0 \n"
	    "movl %%ebp, %%esp \n"
	    : 
	    : "i"(T_SWITCH_TOK)
	);
}
  1001de:	5d                   	pop    %ebp
  1001df:	c3                   	ret    

001001e0 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001e0:	55                   	push   %ebp
  1001e1:	89 e5                	mov    %esp,%ebp
  1001e3:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001e6:	e8 1a ff ff ff       	call   100105 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001eb:	c7 04 24 08 36 10 00 	movl   $0x103608,(%esp)
  1001f2:	e8 75 00 00 00       	call   10026c <cprintf>
    lab1_switch_to_user();
  1001f7:	e8 cf ff ff ff       	call   1001cb <lab1_switch_to_user>
    lab1_print_cur_status();
  1001fc:	e8 04 ff ff ff       	call   100105 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  100201:	c7 04 24 28 36 10 00 	movl   $0x103628,(%esp)
  100208:	e8 5f 00 00 00       	call   10026c <cprintf>
    lab1_switch_to_kernel();
  10020d:	e8 c5 ff ff ff       	call   1001d7 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100212:	e8 ee fe ff ff       	call   100105 <lab1_print_cur_status>
}
  100217:	c9                   	leave  
  100218:	c3                   	ret    

00100219 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  100219:	55                   	push   %ebp
  10021a:	89 e5                	mov    %esp,%ebp
  10021c:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  10021f:	8b 45 08             	mov    0x8(%ebp),%eax
  100222:	89 04 24             	mov    %eax,(%esp)
  100225:	e8 77 13 00 00       	call   1015a1 <cons_putc>
    (*cnt) ++;
  10022a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10022d:	8b 00                	mov    (%eax),%eax
  10022f:	8d 50 01             	lea    0x1(%eax),%edx
  100232:	8b 45 0c             	mov    0xc(%ebp),%eax
  100235:	89 10                	mov    %edx,(%eax)
}
  100237:	c9                   	leave  
  100238:	c3                   	ret    

00100239 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  100239:	55                   	push   %ebp
  10023a:	89 e5                	mov    %esp,%ebp
  10023c:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  10023f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  100246:	8b 45 0c             	mov    0xc(%ebp),%eax
  100249:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10024d:	8b 45 08             	mov    0x8(%ebp),%eax
  100250:	89 44 24 08          	mov    %eax,0x8(%esp)
  100254:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100257:	89 44 24 04          	mov    %eax,0x4(%esp)
  10025b:	c7 04 24 19 02 10 00 	movl   $0x100219,(%esp)
  100262:	e8 79 2e 00 00       	call   1030e0 <vprintfmt>
    return cnt;
  100267:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10026a:	c9                   	leave  
  10026b:	c3                   	ret    

0010026c <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  10026c:	55                   	push   %ebp
  10026d:	89 e5                	mov    %esp,%ebp
  10026f:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100272:	8d 45 0c             	lea    0xc(%ebp),%eax
  100275:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100278:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10027b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10027f:	8b 45 08             	mov    0x8(%ebp),%eax
  100282:	89 04 24             	mov    %eax,(%esp)
  100285:	e8 af ff ff ff       	call   100239 <vcprintf>
  10028a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10028d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100290:	c9                   	leave  
  100291:	c3                   	ret    

00100292 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100292:	55                   	push   %ebp
  100293:	89 e5                	mov    %esp,%ebp
  100295:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100298:	8b 45 08             	mov    0x8(%ebp),%eax
  10029b:	89 04 24             	mov    %eax,(%esp)
  10029e:	e8 fe 12 00 00       	call   1015a1 <cons_putc>
}
  1002a3:	c9                   	leave  
  1002a4:	c3                   	ret    

001002a5 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  1002a5:	55                   	push   %ebp
  1002a6:	89 e5                	mov    %esp,%ebp
  1002a8:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002ab:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  1002b2:	eb 13                	jmp    1002c7 <cputs+0x22>
        cputch(c, &cnt);
  1002b4:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  1002b8:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1002bb:	89 54 24 04          	mov    %edx,0x4(%esp)
  1002bf:	89 04 24             	mov    %eax,(%esp)
  1002c2:	e8 52 ff ff ff       	call   100219 <cputch>
    while ((c = *str ++) != '\0') {
  1002c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1002ca:	8d 50 01             	lea    0x1(%eax),%edx
  1002cd:	89 55 08             	mov    %edx,0x8(%ebp)
  1002d0:	0f b6 00             	movzbl (%eax),%eax
  1002d3:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002d6:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002da:	75 d8                	jne    1002b4 <cputs+0xf>
    }
    cputch('\n', &cnt);
  1002dc:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1002df:	89 44 24 04          	mov    %eax,0x4(%esp)
  1002e3:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  1002ea:	e8 2a ff ff ff       	call   100219 <cputch>
    return cnt;
  1002ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1002f2:	c9                   	leave  
  1002f3:	c3                   	ret    

001002f4 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1002f4:	55                   	push   %ebp
  1002f5:	89 e5                	mov    %esp,%ebp
  1002f7:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1002fa:	e8 cb 12 00 00       	call   1015ca <cons_getc>
  1002ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100302:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100306:	74 f2                	je     1002fa <getchar+0x6>
        /* do nothing */;
    return c;
  100308:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10030b:	c9                   	leave  
  10030c:	c3                   	ret    

0010030d <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  10030d:	55                   	push   %ebp
  10030e:	89 e5                	mov    %esp,%ebp
  100310:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100313:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100317:	74 13                	je     10032c <readline+0x1f>
        cprintf("%s", prompt);
  100319:	8b 45 08             	mov    0x8(%ebp),%eax
  10031c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100320:	c7 04 24 47 36 10 00 	movl   $0x103647,(%esp)
  100327:	e8 40 ff ff ff       	call   10026c <cprintf>
    }
    int i = 0, c;
  10032c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100333:	e8 bc ff ff ff       	call   1002f4 <getchar>
  100338:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  10033b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10033f:	79 07                	jns    100348 <readline+0x3b>
            return NULL;
  100341:	b8 00 00 00 00       	mov    $0x0,%eax
  100346:	eb 79                	jmp    1003c1 <readline+0xb4>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100348:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10034c:	7e 28                	jle    100376 <readline+0x69>
  10034e:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100355:	7f 1f                	jg     100376 <readline+0x69>
            cputchar(c);
  100357:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10035a:	89 04 24             	mov    %eax,(%esp)
  10035d:	e8 30 ff ff ff       	call   100292 <cputchar>
            buf[i ++] = c;
  100362:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100365:	8d 50 01             	lea    0x1(%eax),%edx
  100368:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10036b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10036e:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  100374:	eb 46                	jmp    1003bc <readline+0xaf>
        }
        else if (c == '\b' && i > 0) {
  100376:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  10037a:	75 17                	jne    100393 <readline+0x86>
  10037c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100380:	7e 11                	jle    100393 <readline+0x86>
            cputchar(c);
  100382:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100385:	89 04 24             	mov    %eax,(%esp)
  100388:	e8 05 ff ff ff       	call   100292 <cputchar>
            i --;
  10038d:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  100391:	eb 29                	jmp    1003bc <readline+0xaf>
        }
        else if (c == '\n' || c == '\r') {
  100393:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100397:	74 06                	je     10039f <readline+0x92>
  100399:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  10039d:	75 1d                	jne    1003bc <readline+0xaf>
            cputchar(c);
  10039f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003a2:	89 04 24             	mov    %eax,(%esp)
  1003a5:	e8 e8 fe ff ff       	call   100292 <cputchar>
            buf[i] = '\0';
  1003aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003ad:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1003b2:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1003b5:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1003ba:	eb 05                	jmp    1003c1 <readline+0xb4>
        }
    }
  1003bc:	e9 72 ff ff ff       	jmp    100333 <readline+0x26>
}
  1003c1:	c9                   	leave  
  1003c2:	c3                   	ret    

001003c3 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003c3:	55                   	push   %ebp
  1003c4:	89 e5                	mov    %esp,%ebp
  1003c6:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  1003c9:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  1003ce:	85 c0                	test   %eax,%eax
  1003d0:	74 02                	je     1003d4 <__panic+0x11>
        goto panic_dead;
  1003d2:	eb 48                	jmp    10041c <__panic+0x59>
    }
    is_panic = 1;
  1003d4:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  1003db:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  1003de:	8d 45 14             	lea    0x14(%ebp),%eax
  1003e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  1003e4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003e7:	89 44 24 08          	mov    %eax,0x8(%esp)
  1003eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1003ee:	89 44 24 04          	mov    %eax,0x4(%esp)
  1003f2:	c7 04 24 4a 36 10 00 	movl   $0x10364a,(%esp)
  1003f9:	e8 6e fe ff ff       	call   10026c <cprintf>
    vcprintf(fmt, ap);
  1003fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100401:	89 44 24 04          	mov    %eax,0x4(%esp)
  100405:	8b 45 10             	mov    0x10(%ebp),%eax
  100408:	89 04 24             	mov    %eax,(%esp)
  10040b:	e8 29 fe ff ff       	call   100239 <vcprintf>
    cprintf("\n");
  100410:	c7 04 24 66 36 10 00 	movl   $0x103666,(%esp)
  100417:	e8 50 fe ff ff       	call   10026c <cprintf>
    va_end(ap);

panic_dead:
    intr_disable();
  10041c:	e8 cc 13 00 00       	call   1017ed <intr_disable>
    while (1) {
        kmonitor(NULL);
  100421:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100428:	e8 5a 08 00 00       	call   100c87 <kmonitor>
    }
  10042d:	eb f2                	jmp    100421 <__panic+0x5e>

0010042f <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  10042f:	55                   	push   %ebp
  100430:	89 e5                	mov    %esp,%ebp
  100432:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100435:	8d 45 14             	lea    0x14(%ebp),%eax
  100438:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  10043b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10043e:	89 44 24 08          	mov    %eax,0x8(%esp)
  100442:	8b 45 08             	mov    0x8(%ebp),%eax
  100445:	89 44 24 04          	mov    %eax,0x4(%esp)
  100449:	c7 04 24 68 36 10 00 	movl   $0x103668,(%esp)
  100450:	e8 17 fe ff ff       	call   10026c <cprintf>
    vcprintf(fmt, ap);
  100455:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100458:	89 44 24 04          	mov    %eax,0x4(%esp)
  10045c:	8b 45 10             	mov    0x10(%ebp),%eax
  10045f:	89 04 24             	mov    %eax,(%esp)
  100462:	e8 d2 fd ff ff       	call   100239 <vcprintf>
    cprintf("\n");
  100467:	c7 04 24 66 36 10 00 	movl   $0x103666,(%esp)
  10046e:	e8 f9 fd ff ff       	call   10026c <cprintf>
    va_end(ap);
}
  100473:	c9                   	leave  
  100474:	c3                   	ret    

00100475 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100475:	55                   	push   %ebp
  100476:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100478:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  10047d:	5d                   	pop    %ebp
  10047e:	c3                   	ret    

0010047f <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  10047f:	55                   	push   %ebp
  100480:	89 e5                	mov    %esp,%ebp
  100482:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  100485:	8b 45 0c             	mov    0xc(%ebp),%eax
  100488:	8b 00                	mov    (%eax),%eax
  10048a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10048d:	8b 45 10             	mov    0x10(%ebp),%eax
  100490:	8b 00                	mov    (%eax),%eax
  100492:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100495:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  10049c:	e9 d2 00 00 00       	jmp    100573 <stab_binsearch+0xf4>
        int true_m = (l + r) / 2, m = true_m;
  1004a1:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1004a4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004a7:	01 d0                	add    %edx,%eax
  1004a9:	89 c2                	mov    %eax,%edx
  1004ab:	c1 ea 1f             	shr    $0x1f,%edx
  1004ae:	01 d0                	add    %edx,%eax
  1004b0:	d1 f8                	sar    %eax
  1004b2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1004b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004b8:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1004bb:	eb 04                	jmp    1004c1 <stab_binsearch+0x42>
            m --;
  1004bd:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  1004c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004c4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004c7:	7c 1f                	jl     1004e8 <stab_binsearch+0x69>
  1004c9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004cc:	89 d0                	mov    %edx,%eax
  1004ce:	01 c0                	add    %eax,%eax
  1004d0:	01 d0                	add    %edx,%eax
  1004d2:	c1 e0 02             	shl    $0x2,%eax
  1004d5:	89 c2                	mov    %eax,%edx
  1004d7:	8b 45 08             	mov    0x8(%ebp),%eax
  1004da:	01 d0                	add    %edx,%eax
  1004dc:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004e0:	0f b6 c0             	movzbl %al,%eax
  1004e3:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004e6:	75 d5                	jne    1004bd <stab_binsearch+0x3e>
        }
        if (m < l) {    // no match in [l, m]
  1004e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004eb:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004ee:	7d 0b                	jge    1004fb <stab_binsearch+0x7c>
            l = true_m + 1;
  1004f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004f3:	83 c0 01             	add    $0x1,%eax
  1004f6:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  1004f9:	eb 78                	jmp    100573 <stab_binsearch+0xf4>
        }

        // actual binary search
        any_matches = 1;
  1004fb:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100502:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100505:	89 d0                	mov    %edx,%eax
  100507:	01 c0                	add    %eax,%eax
  100509:	01 d0                	add    %edx,%eax
  10050b:	c1 e0 02             	shl    $0x2,%eax
  10050e:	89 c2                	mov    %eax,%edx
  100510:	8b 45 08             	mov    0x8(%ebp),%eax
  100513:	01 d0                	add    %edx,%eax
  100515:	8b 40 08             	mov    0x8(%eax),%eax
  100518:	3b 45 18             	cmp    0x18(%ebp),%eax
  10051b:	73 13                	jae    100530 <stab_binsearch+0xb1>
            *region_left = m;
  10051d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100520:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100523:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100525:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100528:	83 c0 01             	add    $0x1,%eax
  10052b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10052e:	eb 43                	jmp    100573 <stab_binsearch+0xf4>
        } else if (stabs[m].n_value > addr) {
  100530:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100533:	89 d0                	mov    %edx,%eax
  100535:	01 c0                	add    %eax,%eax
  100537:	01 d0                	add    %edx,%eax
  100539:	c1 e0 02             	shl    $0x2,%eax
  10053c:	89 c2                	mov    %eax,%edx
  10053e:	8b 45 08             	mov    0x8(%ebp),%eax
  100541:	01 d0                	add    %edx,%eax
  100543:	8b 40 08             	mov    0x8(%eax),%eax
  100546:	3b 45 18             	cmp    0x18(%ebp),%eax
  100549:	76 16                	jbe    100561 <stab_binsearch+0xe2>
            *region_right = m - 1;
  10054b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10054e:	8d 50 ff             	lea    -0x1(%eax),%edx
  100551:	8b 45 10             	mov    0x10(%ebp),%eax
  100554:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  100556:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100559:	83 e8 01             	sub    $0x1,%eax
  10055c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10055f:	eb 12                	jmp    100573 <stab_binsearch+0xf4>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  100561:	8b 45 0c             	mov    0xc(%ebp),%eax
  100564:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100567:	89 10                	mov    %edx,(%eax)
            l = m;
  100569:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10056c:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  10056f:	83 45 18 01          	addl   $0x1,0x18(%ebp)
    while (l <= r) {
  100573:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100576:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100579:	0f 8e 22 ff ff ff    	jle    1004a1 <stab_binsearch+0x22>
        }
    }

    if (!any_matches) {
  10057f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100583:	75 0f                	jne    100594 <stab_binsearch+0x115>
        *region_right = *region_left - 1;
  100585:	8b 45 0c             	mov    0xc(%ebp),%eax
  100588:	8b 00                	mov    (%eax),%eax
  10058a:	8d 50 ff             	lea    -0x1(%eax),%edx
  10058d:	8b 45 10             	mov    0x10(%ebp),%eax
  100590:	89 10                	mov    %edx,(%eax)
  100592:	eb 3f                	jmp    1005d3 <stab_binsearch+0x154>
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  100594:	8b 45 10             	mov    0x10(%ebp),%eax
  100597:	8b 00                	mov    (%eax),%eax
  100599:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  10059c:	eb 04                	jmp    1005a2 <stab_binsearch+0x123>
  10059e:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1005a2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005a5:	8b 00                	mov    (%eax),%eax
  1005a7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1005aa:	7d 1f                	jge    1005cb <stab_binsearch+0x14c>
  1005ac:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005af:	89 d0                	mov    %edx,%eax
  1005b1:	01 c0                	add    %eax,%eax
  1005b3:	01 d0                	add    %edx,%eax
  1005b5:	c1 e0 02             	shl    $0x2,%eax
  1005b8:	89 c2                	mov    %eax,%edx
  1005ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1005bd:	01 d0                	add    %edx,%eax
  1005bf:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1005c3:	0f b6 c0             	movzbl %al,%eax
  1005c6:	3b 45 14             	cmp    0x14(%ebp),%eax
  1005c9:	75 d3                	jne    10059e <stab_binsearch+0x11f>
            /* do nothing */;
        *region_left = l;
  1005cb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ce:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005d1:	89 10                	mov    %edx,(%eax)
    }
}
  1005d3:	c9                   	leave  
  1005d4:	c3                   	ret    

001005d5 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  1005d5:	55                   	push   %ebp
  1005d6:	89 e5                	mov    %esp,%ebp
  1005d8:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  1005db:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005de:	c7 00 88 36 10 00    	movl   $0x103688,(%eax)
    info->eip_line = 0;
  1005e4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005e7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  1005ee:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005f1:	c7 40 08 88 36 10 00 	movl   $0x103688,0x8(%eax)
    info->eip_fn_namelen = 9;
  1005f8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005fb:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  100602:	8b 45 0c             	mov    0xc(%ebp),%eax
  100605:	8b 55 08             	mov    0x8(%ebp),%edx
  100608:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  10060b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10060e:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100615:	c7 45 f4 cc 3e 10 00 	movl   $0x103ecc,-0xc(%ebp)
    stab_end = __STAB_END__;
  10061c:	c7 45 f0 e4 b6 10 00 	movl   $0x10b6e4,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100623:	c7 45 ec e5 b6 10 00 	movl   $0x10b6e5,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  10062a:	c7 45 e8 f4 d6 10 00 	movl   $0x10d6f4,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100631:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100634:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100637:	76 0d                	jbe    100646 <debuginfo_eip+0x71>
  100639:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10063c:	83 e8 01             	sub    $0x1,%eax
  10063f:	0f b6 00             	movzbl (%eax),%eax
  100642:	84 c0                	test   %al,%al
  100644:	74 0a                	je     100650 <debuginfo_eip+0x7b>
        return -1;
  100646:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10064b:	e9 c0 02 00 00       	jmp    100910 <debuginfo_eip+0x33b>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100650:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100657:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10065a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10065d:	29 c2                	sub    %eax,%edx
  10065f:	89 d0                	mov    %edx,%eax
  100661:	c1 f8 02             	sar    $0x2,%eax
  100664:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  10066a:	83 e8 01             	sub    $0x1,%eax
  10066d:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  100670:	8b 45 08             	mov    0x8(%ebp),%eax
  100673:	89 44 24 10          	mov    %eax,0x10(%esp)
  100677:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  10067e:	00 
  10067f:	8d 45 e0             	lea    -0x20(%ebp),%eax
  100682:	89 44 24 08          	mov    %eax,0x8(%esp)
  100686:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  100689:	89 44 24 04          	mov    %eax,0x4(%esp)
  10068d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100690:	89 04 24             	mov    %eax,(%esp)
  100693:	e8 e7 fd ff ff       	call   10047f <stab_binsearch>
    if (lfile == 0)
  100698:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10069b:	85 c0                	test   %eax,%eax
  10069d:	75 0a                	jne    1006a9 <debuginfo_eip+0xd4>
        return -1;
  10069f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006a4:	e9 67 02 00 00       	jmp    100910 <debuginfo_eip+0x33b>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1006a9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006ac:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1006af:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006b2:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1006b5:	8b 45 08             	mov    0x8(%ebp),%eax
  1006b8:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006bc:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1006c3:	00 
  1006c4:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1006c7:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006cb:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1006ce:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006d5:	89 04 24             	mov    %eax,(%esp)
  1006d8:	e8 a2 fd ff ff       	call   10047f <stab_binsearch>

    if (lfun <= rfun) {
  1006dd:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1006e0:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1006e3:	39 c2                	cmp    %eax,%edx
  1006e5:	7f 7c                	jg     100763 <debuginfo_eip+0x18e>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  1006e7:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006ea:	89 c2                	mov    %eax,%edx
  1006ec:	89 d0                	mov    %edx,%eax
  1006ee:	01 c0                	add    %eax,%eax
  1006f0:	01 d0                	add    %edx,%eax
  1006f2:	c1 e0 02             	shl    $0x2,%eax
  1006f5:	89 c2                	mov    %eax,%edx
  1006f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006fa:	01 d0                	add    %edx,%eax
  1006fc:	8b 10                	mov    (%eax),%edx
  1006fe:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100701:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100704:	29 c1                	sub    %eax,%ecx
  100706:	89 c8                	mov    %ecx,%eax
  100708:	39 c2                	cmp    %eax,%edx
  10070a:	73 22                	jae    10072e <debuginfo_eip+0x159>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  10070c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10070f:	89 c2                	mov    %eax,%edx
  100711:	89 d0                	mov    %edx,%eax
  100713:	01 c0                	add    %eax,%eax
  100715:	01 d0                	add    %edx,%eax
  100717:	c1 e0 02             	shl    $0x2,%eax
  10071a:	89 c2                	mov    %eax,%edx
  10071c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10071f:	01 d0                	add    %edx,%eax
  100721:	8b 10                	mov    (%eax),%edx
  100723:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100726:	01 c2                	add    %eax,%edx
  100728:	8b 45 0c             	mov    0xc(%ebp),%eax
  10072b:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  10072e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100731:	89 c2                	mov    %eax,%edx
  100733:	89 d0                	mov    %edx,%eax
  100735:	01 c0                	add    %eax,%eax
  100737:	01 d0                	add    %edx,%eax
  100739:	c1 e0 02             	shl    $0x2,%eax
  10073c:	89 c2                	mov    %eax,%edx
  10073e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100741:	01 d0                	add    %edx,%eax
  100743:	8b 50 08             	mov    0x8(%eax),%edx
  100746:	8b 45 0c             	mov    0xc(%ebp),%eax
  100749:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  10074c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10074f:	8b 40 10             	mov    0x10(%eax),%eax
  100752:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100755:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100758:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10075b:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10075e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100761:	eb 15                	jmp    100778 <debuginfo_eip+0x1a3>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100763:	8b 45 0c             	mov    0xc(%ebp),%eax
  100766:	8b 55 08             	mov    0x8(%ebp),%edx
  100769:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  10076c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10076f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  100772:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100775:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  100778:	8b 45 0c             	mov    0xc(%ebp),%eax
  10077b:	8b 40 08             	mov    0x8(%eax),%eax
  10077e:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  100785:	00 
  100786:	89 04 24             	mov    %eax,(%esp)
  100789:	e8 74 24 00 00       	call   102c02 <strfind>
  10078e:	89 c2                	mov    %eax,%edx
  100790:	8b 45 0c             	mov    0xc(%ebp),%eax
  100793:	8b 40 08             	mov    0x8(%eax),%eax
  100796:	29 c2                	sub    %eax,%edx
  100798:	8b 45 0c             	mov    0xc(%ebp),%eax
  10079b:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  10079e:	8b 45 08             	mov    0x8(%ebp),%eax
  1007a1:	89 44 24 10          	mov    %eax,0x10(%esp)
  1007a5:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1007ac:	00 
  1007ad:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1007b0:	89 44 24 08          	mov    %eax,0x8(%esp)
  1007b4:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1007b7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1007bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007be:	89 04 24             	mov    %eax,(%esp)
  1007c1:	e8 b9 fc ff ff       	call   10047f <stab_binsearch>
    if (lline <= rline) {
  1007c6:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007c9:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007cc:	39 c2                	cmp    %eax,%edx
  1007ce:	7f 24                	jg     1007f4 <debuginfo_eip+0x21f>
        info->eip_line = stabs[rline].n_desc;
  1007d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007d3:	89 c2                	mov    %eax,%edx
  1007d5:	89 d0                	mov    %edx,%eax
  1007d7:	01 c0                	add    %eax,%eax
  1007d9:	01 d0                	add    %edx,%eax
  1007db:	c1 e0 02             	shl    $0x2,%eax
  1007de:	89 c2                	mov    %eax,%edx
  1007e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007e3:	01 d0                	add    %edx,%eax
  1007e5:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  1007e9:	0f b7 d0             	movzwl %ax,%edx
  1007ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007ef:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007f2:	eb 13                	jmp    100807 <debuginfo_eip+0x232>
        return -1;
  1007f4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007f9:	e9 12 01 00 00       	jmp    100910 <debuginfo_eip+0x33b>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  1007fe:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100801:	83 e8 01             	sub    $0x1,%eax
  100804:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  100807:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10080a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10080d:	39 c2                	cmp    %eax,%edx
  10080f:	7c 56                	jl     100867 <debuginfo_eip+0x292>
           && stabs[lline].n_type != N_SOL
  100811:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100814:	89 c2                	mov    %eax,%edx
  100816:	89 d0                	mov    %edx,%eax
  100818:	01 c0                	add    %eax,%eax
  10081a:	01 d0                	add    %edx,%eax
  10081c:	c1 e0 02             	shl    $0x2,%eax
  10081f:	89 c2                	mov    %eax,%edx
  100821:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100824:	01 d0                	add    %edx,%eax
  100826:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10082a:	3c 84                	cmp    $0x84,%al
  10082c:	74 39                	je     100867 <debuginfo_eip+0x292>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  10082e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100831:	89 c2                	mov    %eax,%edx
  100833:	89 d0                	mov    %edx,%eax
  100835:	01 c0                	add    %eax,%eax
  100837:	01 d0                	add    %edx,%eax
  100839:	c1 e0 02             	shl    $0x2,%eax
  10083c:	89 c2                	mov    %eax,%edx
  10083e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100841:	01 d0                	add    %edx,%eax
  100843:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100847:	3c 64                	cmp    $0x64,%al
  100849:	75 b3                	jne    1007fe <debuginfo_eip+0x229>
  10084b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10084e:	89 c2                	mov    %eax,%edx
  100850:	89 d0                	mov    %edx,%eax
  100852:	01 c0                	add    %eax,%eax
  100854:	01 d0                	add    %edx,%eax
  100856:	c1 e0 02             	shl    $0x2,%eax
  100859:	89 c2                	mov    %eax,%edx
  10085b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10085e:	01 d0                	add    %edx,%eax
  100860:	8b 40 08             	mov    0x8(%eax),%eax
  100863:	85 c0                	test   %eax,%eax
  100865:	74 97                	je     1007fe <debuginfo_eip+0x229>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  100867:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10086a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10086d:	39 c2                	cmp    %eax,%edx
  10086f:	7c 46                	jl     1008b7 <debuginfo_eip+0x2e2>
  100871:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100874:	89 c2                	mov    %eax,%edx
  100876:	89 d0                	mov    %edx,%eax
  100878:	01 c0                	add    %eax,%eax
  10087a:	01 d0                	add    %edx,%eax
  10087c:	c1 e0 02             	shl    $0x2,%eax
  10087f:	89 c2                	mov    %eax,%edx
  100881:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100884:	01 d0                	add    %edx,%eax
  100886:	8b 10                	mov    (%eax),%edx
  100888:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  10088b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10088e:	29 c1                	sub    %eax,%ecx
  100890:	89 c8                	mov    %ecx,%eax
  100892:	39 c2                	cmp    %eax,%edx
  100894:	73 21                	jae    1008b7 <debuginfo_eip+0x2e2>
        info->eip_file = stabstr + stabs[lline].n_strx;
  100896:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100899:	89 c2                	mov    %eax,%edx
  10089b:	89 d0                	mov    %edx,%eax
  10089d:	01 c0                	add    %eax,%eax
  10089f:	01 d0                	add    %edx,%eax
  1008a1:	c1 e0 02             	shl    $0x2,%eax
  1008a4:	89 c2                	mov    %eax,%edx
  1008a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008a9:	01 d0                	add    %edx,%eax
  1008ab:	8b 10                	mov    (%eax),%edx
  1008ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1008b0:	01 c2                	add    %eax,%edx
  1008b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008b5:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1008b7:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1008ba:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1008bd:	39 c2                	cmp    %eax,%edx
  1008bf:	7d 4a                	jge    10090b <debuginfo_eip+0x336>
        for (lline = lfun + 1;
  1008c1:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1008c4:	83 c0 01             	add    $0x1,%eax
  1008c7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1008ca:	eb 18                	jmp    1008e4 <debuginfo_eip+0x30f>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1008cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008cf:	8b 40 14             	mov    0x14(%eax),%eax
  1008d2:	8d 50 01             	lea    0x1(%eax),%edx
  1008d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008d8:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  1008db:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008de:	83 c0 01             	add    $0x1,%eax
  1008e1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008e4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008e7:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  1008ea:	39 c2                	cmp    %eax,%edx
  1008ec:	7d 1d                	jge    10090b <debuginfo_eip+0x336>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008ee:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008f1:	89 c2                	mov    %eax,%edx
  1008f3:	89 d0                	mov    %edx,%eax
  1008f5:	01 c0                	add    %eax,%eax
  1008f7:	01 d0                	add    %edx,%eax
  1008f9:	c1 e0 02             	shl    $0x2,%eax
  1008fc:	89 c2                	mov    %eax,%edx
  1008fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100901:	01 d0                	add    %edx,%eax
  100903:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100907:	3c a0                	cmp    $0xa0,%al
  100909:	74 c1                	je     1008cc <debuginfo_eip+0x2f7>
        }
    }
    return 0;
  10090b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100910:	c9                   	leave  
  100911:	c3                   	ret    

00100912 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100912:	55                   	push   %ebp
  100913:	89 e5                	mov    %esp,%ebp
  100915:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100918:	c7 04 24 92 36 10 00 	movl   $0x103692,(%esp)
  10091f:	e8 48 f9 ff ff       	call   10026c <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100924:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10092b:	00 
  10092c:	c7 04 24 ab 36 10 00 	movl   $0x1036ab,(%esp)
  100933:	e8 34 f9 ff ff       	call   10026c <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100938:	c7 44 24 04 98 35 10 	movl   $0x103598,0x4(%esp)
  10093f:	00 
  100940:	c7 04 24 c3 36 10 00 	movl   $0x1036c3,(%esp)
  100947:	e8 20 f9 ff ff       	call   10026c <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  10094c:	c7 44 24 04 16 ea 10 	movl   $0x10ea16,0x4(%esp)
  100953:	00 
  100954:	c7 04 24 db 36 10 00 	movl   $0x1036db,(%esp)
  10095b:	e8 0c f9 ff ff       	call   10026c <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100960:	c7 44 24 04 80 fd 10 	movl   $0x10fd80,0x4(%esp)
  100967:	00 
  100968:	c7 04 24 f3 36 10 00 	movl   $0x1036f3,(%esp)
  10096f:	e8 f8 f8 ff ff       	call   10026c <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100974:	b8 80 fd 10 00       	mov    $0x10fd80,%eax
  100979:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10097f:	b8 00 00 10 00       	mov    $0x100000,%eax
  100984:	29 c2                	sub    %eax,%edx
  100986:	89 d0                	mov    %edx,%eax
  100988:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10098e:	85 c0                	test   %eax,%eax
  100990:	0f 48 c2             	cmovs  %edx,%eax
  100993:	c1 f8 0a             	sar    $0xa,%eax
  100996:	89 44 24 04          	mov    %eax,0x4(%esp)
  10099a:	c7 04 24 0c 37 10 00 	movl   $0x10370c,(%esp)
  1009a1:	e8 c6 f8 ff ff       	call   10026c <cprintf>
}
  1009a6:	c9                   	leave  
  1009a7:	c3                   	ret    

001009a8 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1009a8:	55                   	push   %ebp
  1009a9:	89 e5                	mov    %esp,%ebp
  1009ab:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1009b1:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1009b4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1009bb:	89 04 24             	mov    %eax,(%esp)
  1009be:	e8 12 fc ff ff       	call   1005d5 <debuginfo_eip>
  1009c3:	85 c0                	test   %eax,%eax
  1009c5:	74 15                	je     1009dc <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1009c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1009ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009ce:	c7 04 24 36 37 10 00 	movl   $0x103736,(%esp)
  1009d5:	e8 92 f8 ff ff       	call   10026c <cprintf>
  1009da:	eb 6d                	jmp    100a49 <print_debuginfo+0xa1>
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009dc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1009e3:	eb 1c                	jmp    100a01 <print_debuginfo+0x59>
            fnname[j] = info.eip_fn_name[j];
  1009e5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1009e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009eb:	01 d0                	add    %edx,%eax
  1009ed:	0f b6 00             	movzbl (%eax),%eax
  1009f0:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009f6:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1009f9:	01 ca                	add    %ecx,%edx
  1009fb:	88 02                	mov    %al,(%edx)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009fd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100a01:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a04:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  100a07:	7f dc                	jg     1009e5 <print_debuginfo+0x3d>
        }
        fnname[j] = '\0';
  100a09:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100a0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a12:	01 d0                	add    %edx,%eax
  100a14:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  100a17:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100a1a:	8b 55 08             	mov    0x8(%ebp),%edx
  100a1d:	89 d1                	mov    %edx,%ecx
  100a1f:	29 c1                	sub    %eax,%ecx
  100a21:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100a24:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a27:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100a2b:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a31:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100a35:	89 54 24 08          	mov    %edx,0x8(%esp)
  100a39:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a3d:	c7 04 24 52 37 10 00 	movl   $0x103752,(%esp)
  100a44:	e8 23 f8 ff ff       	call   10026c <cprintf>
    }
}
  100a49:	c9                   	leave  
  100a4a:	c3                   	ret    

00100a4b <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a4b:	55                   	push   %ebp
  100a4c:	89 e5                	mov    %esp,%ebp
  100a4e:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a51:	8b 45 04             	mov    0x4(%ebp),%eax
  100a54:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a57:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a5a:	c9                   	leave  
  100a5b:	c3                   	ret    

00100a5c <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a5c:	55                   	push   %ebp
  100a5d:	89 e5                	mov    %esp,%ebp
  100a5f:	83 ec 38             	sub    $0x38,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100a62:	89 e8                	mov    %ebp,%eax
  100a64:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  100a67:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
    uint32_t ebp = read_ebp(), eip = read_eip();
  100a6a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100a6d:	e8 d9 ff ff ff       	call   100a4b <read_eip>
  100a72:	89 45 f0             	mov    %eax,-0x10(%ebp)

    int i, j;
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {
  100a75:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100a7c:	e9 88 00 00 00       	jmp    100b09 <print_stackframe+0xad>
        cprintf("ebp:0x%08x eip:0x%08x args:", ebp, eip);
  100a81:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a84:	89 44 24 08          	mov    %eax,0x8(%esp)
  100a88:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a8b:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a8f:	c7 04 24 64 37 10 00 	movl   $0x103764,(%esp)
  100a96:	e8 d1 f7 ff ff       	call   10026c <cprintf>
        uint32_t *args = (uint32_t *)ebp + 2;
  100a9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a9e:	83 c0 08             	add    $0x8,%eax
  100aa1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        for (j = 0; j < 4; j ++) {
  100aa4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100aab:	eb 25                	jmp    100ad2 <print_stackframe+0x76>
            cprintf("0x%08x ", args[j]);
  100aad:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100ab0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100ab7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100aba:	01 d0                	add    %edx,%eax
  100abc:	8b 00                	mov    (%eax),%eax
  100abe:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ac2:	c7 04 24 80 37 10 00 	movl   $0x103780,(%esp)
  100ac9:	e8 9e f7 ff ff       	call   10026c <cprintf>
        for (j = 0; j < 4; j ++) {
  100ace:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  100ad2:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100ad6:	7e d5                	jle    100aad <print_stackframe+0x51>
        }
        cprintf("\n");
  100ad8:	c7 04 24 88 37 10 00 	movl   $0x103788,(%esp)
  100adf:	e8 88 f7 ff ff       	call   10026c <cprintf>
        print_debuginfo(eip - 1);
  100ae4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ae7:	83 e8 01             	sub    $0x1,%eax
  100aea:	89 04 24             	mov    %eax,(%esp)
  100aed:	e8 b6 fe ff ff       	call   1009a8 <print_debuginfo>
        eip = ((uint32_t *)ebp)[1];
  100af2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100af5:	83 c0 04             	add    $0x4,%eax
  100af8:	8b 00                	mov    (%eax),%eax
  100afa:	89 45 f0             	mov    %eax,-0x10(%ebp)
        ebp = ((uint32_t *)ebp)[0];
  100afd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b00:	8b 00                	mov    (%eax),%eax
  100b02:	89 45 f4             	mov    %eax,-0xc(%ebp)
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {
  100b05:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  100b09:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100b0d:	74 0a                	je     100b19 <print_stackframe+0xbd>
  100b0f:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100b13:	0f 8e 68 ff ff ff    	jle    100a81 <print_stackframe+0x25>
    }
}
  100b19:	c9                   	leave  
  100b1a:	c3                   	ret    

00100b1b <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100b1b:	55                   	push   %ebp
  100b1c:	89 e5                	mov    %esp,%ebp
  100b1e:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100b21:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b28:	eb 0c                	jmp    100b36 <parse+0x1b>
            *buf ++ = '\0';
  100b2a:	8b 45 08             	mov    0x8(%ebp),%eax
  100b2d:	8d 50 01             	lea    0x1(%eax),%edx
  100b30:	89 55 08             	mov    %edx,0x8(%ebp)
  100b33:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b36:	8b 45 08             	mov    0x8(%ebp),%eax
  100b39:	0f b6 00             	movzbl (%eax),%eax
  100b3c:	84 c0                	test   %al,%al
  100b3e:	74 1d                	je     100b5d <parse+0x42>
  100b40:	8b 45 08             	mov    0x8(%ebp),%eax
  100b43:	0f b6 00             	movzbl (%eax),%eax
  100b46:	0f be c0             	movsbl %al,%eax
  100b49:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b4d:	c7 04 24 0c 38 10 00 	movl   $0x10380c,(%esp)
  100b54:	e8 76 20 00 00       	call   102bcf <strchr>
  100b59:	85 c0                	test   %eax,%eax
  100b5b:	75 cd                	jne    100b2a <parse+0xf>
        }
        if (*buf == '\0') {
  100b5d:	8b 45 08             	mov    0x8(%ebp),%eax
  100b60:	0f b6 00             	movzbl (%eax),%eax
  100b63:	84 c0                	test   %al,%al
  100b65:	75 02                	jne    100b69 <parse+0x4e>
            break;
  100b67:	eb 67                	jmp    100bd0 <parse+0xb5>
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100b69:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100b6d:	75 14                	jne    100b83 <parse+0x68>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100b6f:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100b76:	00 
  100b77:	c7 04 24 11 38 10 00 	movl   $0x103811,(%esp)
  100b7e:	e8 e9 f6 ff ff       	call   10026c <cprintf>
        }
        argv[argc ++] = buf;
  100b83:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b86:	8d 50 01             	lea    0x1(%eax),%edx
  100b89:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100b8c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100b93:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b96:	01 c2                	add    %eax,%edx
  100b98:	8b 45 08             	mov    0x8(%ebp),%eax
  100b9b:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b9d:	eb 04                	jmp    100ba3 <parse+0x88>
            buf ++;
  100b9f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ba3:	8b 45 08             	mov    0x8(%ebp),%eax
  100ba6:	0f b6 00             	movzbl (%eax),%eax
  100ba9:	84 c0                	test   %al,%al
  100bab:	74 1d                	je     100bca <parse+0xaf>
  100bad:	8b 45 08             	mov    0x8(%ebp),%eax
  100bb0:	0f b6 00             	movzbl (%eax),%eax
  100bb3:	0f be c0             	movsbl %al,%eax
  100bb6:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bba:	c7 04 24 0c 38 10 00 	movl   $0x10380c,(%esp)
  100bc1:	e8 09 20 00 00       	call   102bcf <strchr>
  100bc6:	85 c0                	test   %eax,%eax
  100bc8:	74 d5                	je     100b9f <parse+0x84>
        }
    }
  100bca:	90                   	nop
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100bcb:	e9 66 ff ff ff       	jmp    100b36 <parse+0x1b>
    return argc;
  100bd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100bd3:	c9                   	leave  
  100bd4:	c3                   	ret    

00100bd5 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100bd5:	55                   	push   %ebp
  100bd6:	89 e5                	mov    %esp,%ebp
  100bd8:	83 ec 68             	sub    $0x68,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100bdb:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100bde:	89 44 24 04          	mov    %eax,0x4(%esp)
  100be2:	8b 45 08             	mov    0x8(%ebp),%eax
  100be5:	89 04 24             	mov    %eax,(%esp)
  100be8:	e8 2e ff ff ff       	call   100b1b <parse>
  100bed:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100bf0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100bf4:	75 0a                	jne    100c00 <runcmd+0x2b>
        return 0;
  100bf6:	b8 00 00 00 00       	mov    $0x0,%eax
  100bfb:	e9 85 00 00 00       	jmp    100c85 <runcmd+0xb0>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c00:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c07:	eb 5c                	jmp    100c65 <runcmd+0x90>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100c09:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100c0c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c0f:	89 d0                	mov    %edx,%eax
  100c11:	01 c0                	add    %eax,%eax
  100c13:	01 d0                	add    %edx,%eax
  100c15:	c1 e0 02             	shl    $0x2,%eax
  100c18:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c1d:	8b 00                	mov    (%eax),%eax
  100c1f:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100c23:	89 04 24             	mov    %eax,(%esp)
  100c26:	e8 05 1f 00 00       	call   102b30 <strcmp>
  100c2b:	85 c0                	test   %eax,%eax
  100c2d:	75 32                	jne    100c61 <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100c2f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c32:	89 d0                	mov    %edx,%eax
  100c34:	01 c0                	add    %eax,%eax
  100c36:	01 d0                	add    %edx,%eax
  100c38:	c1 e0 02             	shl    $0x2,%eax
  100c3b:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c40:	8b 40 08             	mov    0x8(%eax),%eax
  100c43:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100c46:	8d 4a ff             	lea    -0x1(%edx),%ecx
  100c49:	8b 55 0c             	mov    0xc(%ebp),%edx
  100c4c:	89 54 24 08          	mov    %edx,0x8(%esp)
  100c50:	8d 55 b0             	lea    -0x50(%ebp),%edx
  100c53:	83 c2 04             	add    $0x4,%edx
  100c56:	89 54 24 04          	mov    %edx,0x4(%esp)
  100c5a:	89 0c 24             	mov    %ecx,(%esp)
  100c5d:	ff d0                	call   *%eax
  100c5f:	eb 24                	jmp    100c85 <runcmd+0xb0>
    for (i = 0; i < NCOMMANDS; i ++) {
  100c61:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c65:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c68:	83 f8 02             	cmp    $0x2,%eax
  100c6b:	76 9c                	jbe    100c09 <runcmd+0x34>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100c6d:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100c70:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c74:	c7 04 24 2f 38 10 00 	movl   $0x10382f,(%esp)
  100c7b:	e8 ec f5 ff ff       	call   10026c <cprintf>
    return 0;
  100c80:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c85:	c9                   	leave  
  100c86:	c3                   	ret    

00100c87 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100c87:	55                   	push   %ebp
  100c88:	89 e5                	mov    %esp,%ebp
  100c8a:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100c8d:	c7 04 24 48 38 10 00 	movl   $0x103848,(%esp)
  100c94:	e8 d3 f5 ff ff       	call   10026c <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100c99:	c7 04 24 70 38 10 00 	movl   $0x103870,(%esp)
  100ca0:	e8 c7 f5 ff ff       	call   10026c <cprintf>

    if (tf != NULL) {
  100ca5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100ca9:	74 0b                	je     100cb6 <kmonitor+0x2f>
        print_trapframe(tf);
  100cab:	8b 45 08             	mov    0x8(%ebp),%eax
  100cae:	89 04 24             	mov    %eax,(%esp)
  100cb1:	e8 37 0d 00 00       	call   1019ed <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100cb6:	c7 04 24 95 38 10 00 	movl   $0x103895,(%esp)
  100cbd:	e8 4b f6 ff ff       	call   10030d <readline>
  100cc2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100cc5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100cc9:	74 18                	je     100ce3 <kmonitor+0x5c>
            if (runcmd(buf, tf) < 0) {
  100ccb:	8b 45 08             	mov    0x8(%ebp),%eax
  100cce:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cd5:	89 04 24             	mov    %eax,(%esp)
  100cd8:	e8 f8 fe ff ff       	call   100bd5 <runcmd>
  100cdd:	85 c0                	test   %eax,%eax
  100cdf:	79 02                	jns    100ce3 <kmonitor+0x5c>
                break;
  100ce1:	eb 02                	jmp    100ce5 <kmonitor+0x5e>
            }
        }
    }
  100ce3:	eb d1                	jmp    100cb6 <kmonitor+0x2f>
}
  100ce5:	c9                   	leave  
  100ce6:	c3                   	ret    

00100ce7 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100ce7:	55                   	push   %ebp
  100ce8:	89 e5                	mov    %esp,%ebp
  100cea:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100ced:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100cf4:	eb 3f                	jmp    100d35 <mon_help+0x4e>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100cf6:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100cf9:	89 d0                	mov    %edx,%eax
  100cfb:	01 c0                	add    %eax,%eax
  100cfd:	01 d0                	add    %edx,%eax
  100cff:	c1 e0 02             	shl    $0x2,%eax
  100d02:	05 00 e0 10 00       	add    $0x10e000,%eax
  100d07:	8b 48 04             	mov    0x4(%eax),%ecx
  100d0a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d0d:	89 d0                	mov    %edx,%eax
  100d0f:	01 c0                	add    %eax,%eax
  100d11:	01 d0                	add    %edx,%eax
  100d13:	c1 e0 02             	shl    $0x2,%eax
  100d16:	05 00 e0 10 00       	add    $0x10e000,%eax
  100d1b:	8b 00                	mov    (%eax),%eax
  100d1d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100d21:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d25:	c7 04 24 99 38 10 00 	movl   $0x103899,(%esp)
  100d2c:	e8 3b f5 ff ff       	call   10026c <cprintf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100d31:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100d35:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d38:	83 f8 02             	cmp    $0x2,%eax
  100d3b:	76 b9                	jbe    100cf6 <mon_help+0xf>
    }
    return 0;
  100d3d:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d42:	c9                   	leave  
  100d43:	c3                   	ret    

00100d44 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100d44:	55                   	push   %ebp
  100d45:	89 e5                	mov    %esp,%ebp
  100d47:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100d4a:	e8 c3 fb ff ff       	call   100912 <print_kerninfo>
    return 0;
  100d4f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d54:	c9                   	leave  
  100d55:	c3                   	ret    

00100d56 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100d56:	55                   	push   %ebp
  100d57:	89 e5                	mov    %esp,%ebp
  100d59:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100d5c:	e8 fb fc ff ff       	call   100a5c <print_stackframe>
    return 0;
  100d61:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d66:	c9                   	leave  
  100d67:	c3                   	ret    

00100d68 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d68:	55                   	push   %ebp
  100d69:	89 e5                	mov    %esp,%ebp
  100d6b:	83 ec 28             	sub    $0x28,%esp
  100d6e:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d74:	c6 45 f5 34          	movb   $0x34,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d78:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100d7c:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d80:	ee                   	out    %al,(%dx)
  100d81:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d87:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100d8b:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d8f:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d93:	ee                   	out    %al,(%dx)
  100d94:	66 c7 45 ee 40 00    	movw   $0x40,-0x12(%ebp)
  100d9a:	c6 45 ed 2e          	movb   $0x2e,-0x13(%ebp)
  100d9e:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100da2:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100da6:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100da7:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100dae:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100db1:	c7 04 24 a2 38 10 00 	movl   $0x1038a2,(%esp)
  100db8:	e8 af f4 ff ff       	call   10026c <cprintf>
    pic_enable(IRQ_TIMER);
  100dbd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100dc4:	e8 b5 08 00 00       	call   10167e <pic_enable>
}
  100dc9:	c9                   	leave  
  100dca:	c3                   	ret    

00100dcb <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100dcb:	55                   	push   %ebp
  100dcc:	89 e5                	mov    %esp,%ebp
  100dce:	83 ec 10             	sub    $0x10,%esp
  100dd1:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dd7:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100ddb:	89 c2                	mov    %eax,%edx
  100ddd:	ec                   	in     (%dx),%al
  100dde:	88 45 fd             	mov    %al,-0x3(%ebp)
  100de1:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100de7:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100deb:	89 c2                	mov    %eax,%edx
  100ded:	ec                   	in     (%dx),%al
  100dee:	88 45 f9             	mov    %al,-0x7(%ebp)
  100df1:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100df7:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100dfb:	89 c2                	mov    %eax,%edx
  100dfd:	ec                   	in     (%dx),%al
  100dfe:	88 45 f5             	mov    %al,-0xb(%ebp)
  100e01:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
  100e07:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e0b:	89 c2                	mov    %eax,%edx
  100e0d:	ec                   	in     (%dx),%al
  100e0e:	88 45 f1             	mov    %al,-0xf(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e11:	c9                   	leave  
  100e12:	c3                   	ret    

00100e13 <cga_init>:
static uint16_t addr_6845;

/* TEXT-mode CGA/VGA display output */

static void
cga_init(void) {
  100e13:	55                   	push   %ebp
  100e14:	89 e5                	mov    %esp,%ebp
  100e16:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;
  100e19:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;
  100e20:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e23:	0f b7 00             	movzwl (%eax),%eax
  100e26:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;
  100e2a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e2d:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {
  100e32:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e35:	0f b7 00             	movzwl (%eax),%eax
  100e38:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100e3c:	74 12                	je     100e50 <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;
  100e3e:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;
  100e45:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e4c:	b4 03 
  100e4e:	eb 13                	jmp    100e63 <cga_init+0x50>
    } else {
        *cp = was;
  100e50:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e53:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e57:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;
  100e5a:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e61:	d4 03 
    }

    // Extract cursor location
    uint32_t pos;
    outb(addr_6845, 14);
  100e63:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e6a:	0f b7 c0             	movzwl %ax,%eax
  100e6d:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  100e71:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e75:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100e79:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100e7d:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;
  100e7e:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e85:	83 c0 01             	add    $0x1,%eax
  100e88:	0f b7 c0             	movzwl %ax,%eax
  100e8b:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e8f:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100e93:	89 c2                	mov    %eax,%edx
  100e95:	ec                   	in     (%dx),%al
  100e96:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100e99:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100e9d:	0f b6 c0             	movzbl %al,%eax
  100ea0:	c1 e0 08             	shl    $0x8,%eax
  100ea3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100ea6:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ead:	0f b7 c0             	movzwl %ax,%eax
  100eb0:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  100eb4:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100eb8:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100ebc:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100ec0:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);
  100ec1:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ec8:	83 c0 01             	add    $0x1,%eax
  100ecb:	0f b7 c0             	movzwl %ax,%eax
  100ece:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ed2:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100ed6:	89 c2                	mov    %eax,%edx
  100ed8:	ec                   	in     (%dx),%al
  100ed9:	88 45 e5             	mov    %al,-0x1b(%ebp)
    return data;
  100edc:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100ee0:	0f b6 c0             	movzbl %al,%eax
  100ee3:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;
  100ee6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ee9:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;
  100eee:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ef1:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100ef7:	c9                   	leave  
  100ef8:	c3                   	ret    

00100ef9 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100ef9:	55                   	push   %ebp
  100efa:	89 e5                	mov    %esp,%ebp
  100efc:	83 ec 48             	sub    $0x48,%esp
  100eff:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100f05:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f09:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100f0d:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100f11:	ee                   	out    %al,(%dx)
  100f12:	66 c7 45 f2 fb 03    	movw   $0x3fb,-0xe(%ebp)
  100f18:	c6 45 f1 80          	movb   $0x80,-0xf(%ebp)
  100f1c:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f20:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f24:	ee                   	out    %al,(%dx)
  100f25:	66 c7 45 ee f8 03    	movw   $0x3f8,-0x12(%ebp)
  100f2b:	c6 45 ed 0c          	movb   $0xc,-0x13(%ebp)
  100f2f:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f33:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f37:	ee                   	out    %al,(%dx)
  100f38:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f3e:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
  100f42:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f46:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f4a:	ee                   	out    %al,(%dx)
  100f4b:	66 c7 45 e6 fb 03    	movw   $0x3fb,-0x1a(%ebp)
  100f51:	c6 45 e5 03          	movb   $0x3,-0x1b(%ebp)
  100f55:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f59:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f5d:	ee                   	out    %al,(%dx)
  100f5e:	66 c7 45 e2 fc 03    	movw   $0x3fc,-0x1e(%ebp)
  100f64:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
  100f68:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f6c:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f70:	ee                   	out    %al,(%dx)
  100f71:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f77:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
  100f7b:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f7f:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f83:	ee                   	out    %al,(%dx)
  100f84:	66 c7 45 da fd 03    	movw   $0x3fd,-0x26(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f8a:	0f b7 45 da          	movzwl -0x26(%ebp),%eax
  100f8e:	89 c2                	mov    %eax,%edx
  100f90:	ec                   	in     (%dx),%al
  100f91:	88 45 d9             	mov    %al,-0x27(%ebp)
    return data;
  100f94:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f98:	3c ff                	cmp    $0xff,%al
  100f9a:	0f 95 c0             	setne  %al
  100f9d:	0f b6 c0             	movzbl %al,%eax
  100fa0:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100fa5:	66 c7 45 d6 fa 03    	movw   $0x3fa,-0x2a(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fab:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
  100faf:	89 c2                	mov    %eax,%edx
  100fb1:	ec                   	in     (%dx),%al
  100fb2:	88 45 d5             	mov    %al,-0x2b(%ebp)
  100fb5:	66 c7 45 d2 f8 03    	movw   $0x3f8,-0x2e(%ebp)
  100fbb:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
  100fbf:	89 c2                	mov    %eax,%edx
  100fc1:	ec                   	in     (%dx),%al
  100fc2:	88 45 d1             	mov    %al,-0x2f(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100fc5:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100fca:	85 c0                	test   %eax,%eax
  100fcc:	74 0c                	je     100fda <serial_init+0xe1>
        pic_enable(IRQ_COM1);
  100fce:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100fd5:	e8 a4 06 00 00       	call   10167e <pic_enable>
    }
}
  100fda:	c9                   	leave  
  100fdb:	c3                   	ret    

00100fdc <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fdc:	55                   	push   %ebp
  100fdd:	89 e5                	mov    %esp,%ebp
  100fdf:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fe2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fe9:	eb 09                	jmp    100ff4 <lpt_putc_sub+0x18>
        delay();
  100feb:	e8 db fd ff ff       	call   100dcb <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100ff0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100ff4:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100ffa:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100ffe:	89 c2                	mov    %eax,%edx
  101000:	ec                   	in     (%dx),%al
  101001:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101004:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101008:	84 c0                	test   %al,%al
  10100a:	78 09                	js     101015 <lpt_putc_sub+0x39>
  10100c:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101013:	7e d6                	jle    100feb <lpt_putc_sub+0xf>
    }
    outb(LPTPORT + 0, c);
  101015:	8b 45 08             	mov    0x8(%ebp),%eax
  101018:	0f b6 c0             	movzbl %al,%eax
  10101b:	66 c7 45 f6 78 03    	movw   $0x378,-0xa(%ebp)
  101021:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101024:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101028:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10102c:	ee                   	out    %al,(%dx)
  10102d:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  101033:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  101037:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10103b:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10103f:	ee                   	out    %al,(%dx)
  101040:	66 c7 45 ee 7a 03    	movw   $0x37a,-0x12(%ebp)
  101046:	c6 45 ed 08          	movb   $0x8,-0x13(%ebp)
  10104a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10104e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101052:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101053:	c9                   	leave  
  101054:	c3                   	ret    

00101055 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  101055:	55                   	push   %ebp
  101056:	89 e5                	mov    %esp,%ebp
  101058:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  10105b:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10105f:	74 0d                	je     10106e <lpt_putc+0x19>
        lpt_putc_sub(c);
  101061:	8b 45 08             	mov    0x8(%ebp),%eax
  101064:	89 04 24             	mov    %eax,(%esp)
  101067:	e8 70 ff ff ff       	call   100fdc <lpt_putc_sub>
  10106c:	eb 24                	jmp    101092 <lpt_putc+0x3d>
    }
    else {
        lpt_putc_sub('\b');
  10106e:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101075:	e8 62 ff ff ff       	call   100fdc <lpt_putc_sub>
        lpt_putc_sub(' ');
  10107a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101081:	e8 56 ff ff ff       	call   100fdc <lpt_putc_sub>
        lpt_putc_sub('\b');
  101086:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10108d:	e8 4a ff ff ff       	call   100fdc <lpt_putc_sub>
    }
}
  101092:	c9                   	leave  
  101093:	c3                   	ret    

00101094 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  101094:	55                   	push   %ebp
  101095:	89 e5                	mov    %esp,%ebp
  101097:	53                   	push   %ebx
  101098:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  10109b:	8b 45 08             	mov    0x8(%ebp),%eax
  10109e:	b0 00                	mov    $0x0,%al
  1010a0:	85 c0                	test   %eax,%eax
  1010a2:	75 07                	jne    1010ab <cga_putc+0x17>
        c |= 0x0700;
  1010a4:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  1010ab:	8b 45 08             	mov    0x8(%ebp),%eax
  1010ae:	0f b6 c0             	movzbl %al,%eax
  1010b1:	83 f8 0a             	cmp    $0xa,%eax
  1010b4:	74 4c                	je     101102 <cga_putc+0x6e>
  1010b6:	83 f8 0d             	cmp    $0xd,%eax
  1010b9:	74 57                	je     101112 <cga_putc+0x7e>
  1010bb:	83 f8 08             	cmp    $0x8,%eax
  1010be:	0f 85 88 00 00 00    	jne    10114c <cga_putc+0xb8>
    case '\b':
        if (crt_pos > 0) {
  1010c4:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010cb:	66 85 c0             	test   %ax,%ax
  1010ce:	74 30                	je     101100 <cga_putc+0x6c>
            crt_pos --;
  1010d0:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010d7:	83 e8 01             	sub    $0x1,%eax
  1010da:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010e0:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010e5:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  1010ec:	0f b7 d2             	movzwl %dx,%edx
  1010ef:	01 d2                	add    %edx,%edx
  1010f1:	01 c2                	add    %eax,%edx
  1010f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1010f6:	b0 00                	mov    $0x0,%al
  1010f8:	83 c8 20             	or     $0x20,%eax
  1010fb:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  1010fe:	eb 72                	jmp    101172 <cga_putc+0xde>
  101100:	eb 70                	jmp    101172 <cga_putc+0xde>
    case '\n':
        crt_pos += CRT_COLS;
  101102:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101109:	83 c0 50             	add    $0x50,%eax
  10110c:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  101112:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  101119:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  101120:	0f b7 c1             	movzwl %cx,%eax
  101123:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  101129:	c1 e8 10             	shr    $0x10,%eax
  10112c:	89 c2                	mov    %eax,%edx
  10112e:	66 c1 ea 06          	shr    $0x6,%dx
  101132:	89 d0                	mov    %edx,%eax
  101134:	c1 e0 02             	shl    $0x2,%eax
  101137:	01 d0                	add    %edx,%eax
  101139:	c1 e0 04             	shl    $0x4,%eax
  10113c:	29 c1                	sub    %eax,%ecx
  10113e:	89 ca                	mov    %ecx,%edx
  101140:	89 d8                	mov    %ebx,%eax
  101142:	29 d0                	sub    %edx,%eax
  101144:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  10114a:	eb 26                	jmp    101172 <cga_putc+0xde>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  10114c:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  101152:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101159:	8d 50 01             	lea    0x1(%eax),%edx
  10115c:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  101163:	0f b7 c0             	movzwl %ax,%eax
  101166:	01 c0                	add    %eax,%eax
  101168:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  10116b:	8b 45 08             	mov    0x8(%ebp),%eax
  10116e:	66 89 02             	mov    %ax,(%edx)
        break;
  101171:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101172:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101179:	66 3d cf 07          	cmp    $0x7cf,%ax
  10117d:	76 5b                	jbe    1011da <cga_putc+0x146>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  10117f:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101184:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  10118a:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10118f:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  101196:	00 
  101197:	89 54 24 04          	mov    %edx,0x4(%esp)
  10119b:	89 04 24             	mov    %eax,(%esp)
  10119e:	e8 2a 1c 00 00       	call   102dcd <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011a3:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1011aa:	eb 15                	jmp    1011c1 <cga_putc+0x12d>
            crt_buf[i] = 0x0700 | ' ';
  1011ac:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011b1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1011b4:	01 d2                	add    %edx,%edx
  1011b6:	01 d0                	add    %edx,%eax
  1011b8:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011bd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1011c1:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1011c8:	7e e2                	jle    1011ac <cga_putc+0x118>
        }
        crt_pos -= CRT_COLS;
  1011ca:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011d1:	83 e8 50             	sub    $0x50,%eax
  1011d4:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011da:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011e1:	0f b7 c0             	movzwl %ax,%eax
  1011e4:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  1011e8:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
  1011ec:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1011f0:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1011f4:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  1011f5:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011fc:	66 c1 e8 08          	shr    $0x8,%ax
  101200:	0f b6 c0             	movzbl %al,%eax
  101203:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  10120a:	83 c2 01             	add    $0x1,%edx
  10120d:	0f b7 d2             	movzwl %dx,%edx
  101210:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
  101214:	88 45 ed             	mov    %al,-0x13(%ebp)
  101217:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10121b:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10121f:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  101220:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  101227:	0f b7 c0             	movzwl %ax,%eax
  10122a:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  10122e:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
  101232:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101236:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10123a:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  10123b:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101242:	0f b6 c0             	movzbl %al,%eax
  101245:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  10124c:	83 c2 01             	add    $0x1,%edx
  10124f:	0f b7 d2             	movzwl %dx,%edx
  101252:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
  101256:	88 45 e5             	mov    %al,-0x1b(%ebp)
  101259:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10125d:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101261:	ee                   	out    %al,(%dx)
}
  101262:	83 c4 34             	add    $0x34,%esp
  101265:	5b                   	pop    %ebx
  101266:	5d                   	pop    %ebp
  101267:	c3                   	ret    

00101268 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101268:	55                   	push   %ebp
  101269:	89 e5                	mov    %esp,%ebp
  10126b:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10126e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101275:	eb 09                	jmp    101280 <serial_putc_sub+0x18>
        delay();
  101277:	e8 4f fb ff ff       	call   100dcb <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10127c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101280:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101286:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10128a:	89 c2                	mov    %eax,%edx
  10128c:	ec                   	in     (%dx),%al
  10128d:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101290:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101294:	0f b6 c0             	movzbl %al,%eax
  101297:	83 e0 20             	and    $0x20,%eax
  10129a:	85 c0                	test   %eax,%eax
  10129c:	75 09                	jne    1012a7 <serial_putc_sub+0x3f>
  10129e:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  1012a5:	7e d0                	jle    101277 <serial_putc_sub+0xf>
    }
    outb(COM1 + COM_TX, c);
  1012a7:	8b 45 08             	mov    0x8(%ebp),%eax
  1012aa:	0f b6 c0             	movzbl %al,%eax
  1012ad:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  1012b3:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012b6:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1012ba:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1012be:	ee                   	out    %al,(%dx)
}
  1012bf:	c9                   	leave  
  1012c0:	c3                   	ret    

001012c1 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1012c1:	55                   	push   %ebp
  1012c2:	89 e5                	mov    %esp,%ebp
  1012c4:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1012c7:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1012cb:	74 0d                	je     1012da <serial_putc+0x19>
        serial_putc_sub(c);
  1012cd:	8b 45 08             	mov    0x8(%ebp),%eax
  1012d0:	89 04 24             	mov    %eax,(%esp)
  1012d3:	e8 90 ff ff ff       	call   101268 <serial_putc_sub>
  1012d8:	eb 24                	jmp    1012fe <serial_putc+0x3d>
    }
    else {
        serial_putc_sub('\b');
  1012da:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012e1:	e8 82 ff ff ff       	call   101268 <serial_putc_sub>
        serial_putc_sub(' ');
  1012e6:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1012ed:	e8 76 ff ff ff       	call   101268 <serial_putc_sub>
        serial_putc_sub('\b');
  1012f2:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012f9:	e8 6a ff ff ff       	call   101268 <serial_putc_sub>
    }
}
  1012fe:	c9                   	leave  
  1012ff:	c3                   	ret    

00101300 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  101300:	55                   	push   %ebp
  101301:	89 e5                	mov    %esp,%ebp
  101303:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  101306:	eb 33                	jmp    10133b <cons_intr+0x3b>
        if (c != 0) {
  101308:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10130c:	74 2d                	je     10133b <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  10130e:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101313:	8d 50 01             	lea    0x1(%eax),%edx
  101316:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  10131c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10131f:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  101325:	a1 84 f0 10 00       	mov    0x10f084,%eax
  10132a:	3d 00 02 00 00       	cmp    $0x200,%eax
  10132f:	75 0a                	jne    10133b <cons_intr+0x3b>
                cons.wpos = 0;
  101331:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  101338:	00 00 00 
    while ((c = (*proc)()) != -1) {
  10133b:	8b 45 08             	mov    0x8(%ebp),%eax
  10133e:	ff d0                	call   *%eax
  101340:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101343:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101347:	75 bf                	jne    101308 <cons_intr+0x8>
            }
        }
    }
}
  101349:	c9                   	leave  
  10134a:	c3                   	ret    

0010134b <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  10134b:	55                   	push   %ebp
  10134c:	89 e5                	mov    %esp,%ebp
  10134e:	83 ec 10             	sub    $0x10,%esp
  101351:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101357:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10135b:	89 c2                	mov    %eax,%edx
  10135d:	ec                   	in     (%dx),%al
  10135e:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101361:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101365:	0f b6 c0             	movzbl %al,%eax
  101368:	83 e0 01             	and    $0x1,%eax
  10136b:	85 c0                	test   %eax,%eax
  10136d:	75 07                	jne    101376 <serial_proc_data+0x2b>
        return -1;
  10136f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101374:	eb 2a                	jmp    1013a0 <serial_proc_data+0x55>
  101376:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10137c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101380:	89 c2                	mov    %eax,%edx
  101382:	ec                   	in     (%dx),%al
  101383:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101386:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  10138a:	0f b6 c0             	movzbl %al,%eax
  10138d:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101390:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101394:	75 07                	jne    10139d <serial_proc_data+0x52>
        c = '\b';
  101396:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  10139d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1013a0:	c9                   	leave  
  1013a1:	c3                   	ret    

001013a2 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  1013a2:	55                   	push   %ebp
  1013a3:	89 e5                	mov    %esp,%ebp
  1013a5:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  1013a8:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1013ad:	85 c0                	test   %eax,%eax
  1013af:	74 0c                	je     1013bd <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  1013b1:	c7 04 24 4b 13 10 00 	movl   $0x10134b,(%esp)
  1013b8:	e8 43 ff ff ff       	call   101300 <cons_intr>
    }
}
  1013bd:	c9                   	leave  
  1013be:	c3                   	ret    

001013bf <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1013bf:	55                   	push   %ebp
  1013c0:	89 e5                	mov    %esp,%ebp
  1013c2:	83 ec 38             	sub    $0x38,%esp
  1013c5:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013cb:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1013cf:	89 c2                	mov    %eax,%edx
  1013d1:	ec                   	in     (%dx),%al
  1013d2:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  1013d5:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013d9:	0f b6 c0             	movzbl %al,%eax
  1013dc:	83 e0 01             	and    $0x1,%eax
  1013df:	85 c0                	test   %eax,%eax
  1013e1:	75 0a                	jne    1013ed <kbd_proc_data+0x2e>
        return -1;
  1013e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013e8:	e9 59 01 00 00       	jmp    101546 <kbd_proc_data+0x187>
  1013ed:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013f3:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1013f7:	89 c2                	mov    %eax,%edx
  1013f9:	ec                   	in     (%dx),%al
  1013fa:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1013fd:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  101401:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  101404:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  101408:	75 17                	jne    101421 <kbd_proc_data+0x62>
        // E0 escape character
        shift |= E0ESC;
  10140a:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10140f:	83 c8 40             	or     $0x40,%eax
  101412:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101417:	b8 00 00 00 00       	mov    $0x0,%eax
  10141c:	e9 25 01 00 00       	jmp    101546 <kbd_proc_data+0x187>
    } else if (data & 0x80) {
  101421:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101425:	84 c0                	test   %al,%al
  101427:	79 47                	jns    101470 <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  101429:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10142e:	83 e0 40             	and    $0x40,%eax
  101431:	85 c0                	test   %eax,%eax
  101433:	75 09                	jne    10143e <kbd_proc_data+0x7f>
  101435:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101439:	83 e0 7f             	and    $0x7f,%eax
  10143c:	eb 04                	jmp    101442 <kbd_proc_data+0x83>
  10143e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101442:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  101445:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101449:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101450:	83 c8 40             	or     $0x40,%eax
  101453:	0f b6 c0             	movzbl %al,%eax
  101456:	f7 d0                	not    %eax
  101458:	89 c2                	mov    %eax,%edx
  10145a:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10145f:	21 d0                	and    %edx,%eax
  101461:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101466:	b8 00 00 00 00       	mov    $0x0,%eax
  10146b:	e9 d6 00 00 00       	jmp    101546 <kbd_proc_data+0x187>
    } else if (shift & E0ESC) {
  101470:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101475:	83 e0 40             	and    $0x40,%eax
  101478:	85 c0                	test   %eax,%eax
  10147a:	74 11                	je     10148d <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  10147c:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101480:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101485:	83 e0 bf             	and    $0xffffffbf,%eax
  101488:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  10148d:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101491:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101498:	0f b6 d0             	movzbl %al,%edx
  10149b:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014a0:	09 d0                	or     %edx,%eax
  1014a2:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  1014a7:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014ab:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  1014b2:	0f b6 d0             	movzbl %al,%edx
  1014b5:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014ba:	31 d0                	xor    %edx,%eax
  1014bc:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  1014c1:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014c6:	83 e0 03             	and    $0x3,%eax
  1014c9:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  1014d0:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014d4:	01 d0                	add    %edx,%eax
  1014d6:	0f b6 00             	movzbl (%eax),%eax
  1014d9:	0f b6 c0             	movzbl %al,%eax
  1014dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014df:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014e4:	83 e0 08             	and    $0x8,%eax
  1014e7:	85 c0                	test   %eax,%eax
  1014e9:	74 22                	je     10150d <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1014eb:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014ef:	7e 0c                	jle    1014fd <kbd_proc_data+0x13e>
  1014f1:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014f5:	7f 06                	jg     1014fd <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1014f7:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1014fb:	eb 10                	jmp    10150d <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1014fd:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  101501:	7e 0a                	jle    10150d <kbd_proc_data+0x14e>
  101503:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  101507:	7f 04                	jg     10150d <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  101509:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  10150d:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101512:	f7 d0                	not    %eax
  101514:	83 e0 06             	and    $0x6,%eax
  101517:	85 c0                	test   %eax,%eax
  101519:	75 28                	jne    101543 <kbd_proc_data+0x184>
  10151b:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  101522:	75 1f                	jne    101543 <kbd_proc_data+0x184>
        cprintf("Rebooting!\n");
  101524:	c7 04 24 bd 38 10 00 	movl   $0x1038bd,(%esp)
  10152b:	e8 3c ed ff ff       	call   10026c <cprintf>
  101530:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  101536:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10153a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  10153e:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  101542:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101543:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101546:	c9                   	leave  
  101547:	c3                   	ret    

00101548 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101548:	55                   	push   %ebp
  101549:	89 e5                	mov    %esp,%ebp
  10154b:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  10154e:	c7 04 24 bf 13 10 00 	movl   $0x1013bf,(%esp)
  101555:	e8 a6 fd ff ff       	call   101300 <cons_intr>
}
  10155a:	c9                   	leave  
  10155b:	c3                   	ret    

0010155c <kbd_init>:

static void
kbd_init(void) {
  10155c:	55                   	push   %ebp
  10155d:	89 e5                	mov    %esp,%ebp
  10155f:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  101562:	e8 e1 ff ff ff       	call   101548 <kbd_intr>
    pic_enable(IRQ_KBD);
  101567:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  10156e:	e8 0b 01 00 00       	call   10167e <pic_enable>
}
  101573:	c9                   	leave  
  101574:	c3                   	ret    

00101575 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101575:	55                   	push   %ebp
  101576:	89 e5                	mov    %esp,%ebp
  101578:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  10157b:	e8 93 f8 ff ff       	call   100e13 <cga_init>
    serial_init();
  101580:	e8 74 f9 ff ff       	call   100ef9 <serial_init>
    kbd_init();
  101585:	e8 d2 ff ff ff       	call   10155c <kbd_init>
    if (!serial_exists) {
  10158a:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  10158f:	85 c0                	test   %eax,%eax
  101591:	75 0c                	jne    10159f <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  101593:	c7 04 24 c9 38 10 00 	movl   $0x1038c9,(%esp)
  10159a:	e8 cd ec ff ff       	call   10026c <cprintf>
    }
}
  10159f:	c9                   	leave  
  1015a0:	c3                   	ret    

001015a1 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  1015a1:	55                   	push   %ebp
  1015a2:	89 e5                	mov    %esp,%ebp
  1015a4:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  1015a7:	8b 45 08             	mov    0x8(%ebp),%eax
  1015aa:	89 04 24             	mov    %eax,(%esp)
  1015ad:	e8 a3 fa ff ff       	call   101055 <lpt_putc>
    cga_putc(c);
  1015b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1015b5:	89 04 24             	mov    %eax,(%esp)
  1015b8:	e8 d7 fa ff ff       	call   101094 <cga_putc>
    serial_putc(c);
  1015bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1015c0:	89 04 24             	mov    %eax,(%esp)
  1015c3:	e8 f9 fc ff ff       	call   1012c1 <serial_putc>
}
  1015c8:	c9                   	leave  
  1015c9:	c3                   	ret    

001015ca <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015ca:	55                   	push   %ebp
  1015cb:	89 e5                	mov    %esp,%ebp
  1015cd:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015d0:	e8 cd fd ff ff       	call   1013a2 <serial_intr>
    kbd_intr();
  1015d5:	e8 6e ff ff ff       	call   101548 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015da:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  1015e0:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1015e5:	39 c2                	cmp    %eax,%edx
  1015e7:	74 36                	je     10161f <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015e9:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015ee:	8d 50 01             	lea    0x1(%eax),%edx
  1015f1:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  1015f7:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  1015fe:	0f b6 c0             	movzbl %al,%eax
  101601:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  101604:	a1 80 f0 10 00       	mov    0x10f080,%eax
  101609:	3d 00 02 00 00       	cmp    $0x200,%eax
  10160e:	75 0a                	jne    10161a <cons_getc+0x50>
            cons.rpos = 0;
  101610:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  101617:	00 00 00 
        }
        return c;
  10161a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10161d:	eb 05                	jmp    101624 <cons_getc+0x5a>
    }
    return 0;
  10161f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101624:	c9                   	leave  
  101625:	c3                   	ret    

00101626 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101626:	55                   	push   %ebp
  101627:	89 e5                	mov    %esp,%ebp
  101629:	83 ec 14             	sub    $0x14,%esp
  10162c:	8b 45 08             	mov    0x8(%ebp),%eax
  10162f:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101633:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101637:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  10163d:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  101642:	85 c0                	test   %eax,%eax
  101644:	74 36                	je     10167c <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  101646:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10164a:	0f b6 c0             	movzbl %al,%eax
  10164d:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101653:	88 45 fd             	mov    %al,-0x3(%ebp)
  101656:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  10165a:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10165e:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  10165f:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101663:	66 c1 e8 08          	shr    $0x8,%ax
  101667:	0f b6 c0             	movzbl %al,%eax
  10166a:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  101670:	88 45 f9             	mov    %al,-0x7(%ebp)
  101673:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101677:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10167b:	ee                   	out    %al,(%dx)
    }
}
  10167c:	c9                   	leave  
  10167d:	c3                   	ret    

0010167e <pic_enable>:

void
pic_enable(unsigned int irq) {
  10167e:	55                   	push   %ebp
  10167f:	89 e5                	mov    %esp,%ebp
  101681:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  101684:	8b 45 08             	mov    0x8(%ebp),%eax
  101687:	ba 01 00 00 00       	mov    $0x1,%edx
  10168c:	89 c1                	mov    %eax,%ecx
  10168e:	d3 e2                	shl    %cl,%edx
  101690:	89 d0                	mov    %edx,%eax
  101692:	f7 d0                	not    %eax
  101694:	89 c2                	mov    %eax,%edx
  101696:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  10169d:	21 d0                	and    %edx,%eax
  10169f:	0f b7 c0             	movzwl %ax,%eax
  1016a2:	89 04 24             	mov    %eax,(%esp)
  1016a5:	e8 7c ff ff ff       	call   101626 <pic_setmask>
}
  1016aa:	c9                   	leave  
  1016ab:	c3                   	ret    

001016ac <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1016ac:	55                   	push   %ebp
  1016ad:	89 e5                	mov    %esp,%ebp
  1016af:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  1016b2:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  1016b9:	00 00 00 
  1016bc:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1016c2:	c6 45 fd ff          	movb   $0xff,-0x3(%ebp)
  1016c6:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1016ca:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016ce:	ee                   	out    %al,(%dx)
  1016cf:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  1016d5:	c6 45 f9 ff          	movb   $0xff,-0x7(%ebp)
  1016d9:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1016dd:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016e1:	ee                   	out    %al,(%dx)
  1016e2:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  1016e8:	c6 45 f5 11          	movb   $0x11,-0xb(%ebp)
  1016ec:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1016f0:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1016f4:	ee                   	out    %al,(%dx)
  1016f5:	66 c7 45 f2 21 00    	movw   $0x21,-0xe(%ebp)
  1016fb:	c6 45 f1 20          	movb   $0x20,-0xf(%ebp)
  1016ff:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101703:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101707:	ee                   	out    %al,(%dx)
  101708:	66 c7 45 ee 21 00    	movw   $0x21,-0x12(%ebp)
  10170e:	c6 45 ed 04          	movb   $0x4,-0x13(%ebp)
  101712:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101716:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10171a:	ee                   	out    %al,(%dx)
  10171b:	66 c7 45 ea 21 00    	movw   $0x21,-0x16(%ebp)
  101721:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
  101725:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101729:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10172d:	ee                   	out    %al,(%dx)
  10172e:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  101734:	c6 45 e5 11          	movb   $0x11,-0x1b(%ebp)
  101738:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10173c:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101740:	ee                   	out    %al,(%dx)
  101741:	66 c7 45 e2 a1 00    	movw   $0xa1,-0x1e(%ebp)
  101747:	c6 45 e1 28          	movb   $0x28,-0x1f(%ebp)
  10174b:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  10174f:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101753:	ee                   	out    %al,(%dx)
  101754:	66 c7 45 de a1 00    	movw   $0xa1,-0x22(%ebp)
  10175a:	c6 45 dd 02          	movb   $0x2,-0x23(%ebp)
  10175e:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101762:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101766:	ee                   	out    %al,(%dx)
  101767:	66 c7 45 da a1 00    	movw   $0xa1,-0x26(%ebp)
  10176d:	c6 45 d9 03          	movb   $0x3,-0x27(%ebp)
  101771:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101775:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101779:	ee                   	out    %al,(%dx)
  10177a:	66 c7 45 d6 20 00    	movw   $0x20,-0x2a(%ebp)
  101780:	c6 45 d5 68          	movb   $0x68,-0x2b(%ebp)
  101784:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  101788:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  10178c:	ee                   	out    %al,(%dx)
  10178d:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101793:	c6 45 d1 0a          	movb   $0xa,-0x2f(%ebp)
  101797:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  10179b:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  10179f:	ee                   	out    %al,(%dx)
  1017a0:	66 c7 45 ce a0 00    	movw   $0xa0,-0x32(%ebp)
  1017a6:	c6 45 cd 68          	movb   $0x68,-0x33(%ebp)
  1017aa:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1017ae:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1017b2:	ee                   	out    %al,(%dx)
  1017b3:	66 c7 45 ca a0 00    	movw   $0xa0,-0x36(%ebp)
  1017b9:	c6 45 c9 0a          	movb   $0xa,-0x37(%ebp)
  1017bd:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1017c1:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1017c5:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017c6:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017cd:	66 83 f8 ff          	cmp    $0xffff,%ax
  1017d1:	74 12                	je     1017e5 <pic_init+0x139>
        pic_setmask(irq_mask);
  1017d3:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017da:	0f b7 c0             	movzwl %ax,%eax
  1017dd:	89 04 24             	mov    %eax,(%esp)
  1017e0:	e8 41 fe ff ff       	call   101626 <pic_setmask>
    }
}
  1017e5:	c9                   	leave  
  1017e6:	c3                   	ret    

001017e7 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1017e7:	55                   	push   %ebp
  1017e8:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1017ea:	fb                   	sti    
    sti();
}
  1017eb:	5d                   	pop    %ebp
  1017ec:	c3                   	ret    

001017ed <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1017ed:	55                   	push   %ebp
  1017ee:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  1017f0:	fa                   	cli    
    cli();
}
  1017f1:	5d                   	pop    %ebp
  1017f2:	c3                   	ret    

001017f3 <print_ticks>:
#include <console.h>
#include <kdebug.h>
#include <string.h>
#define TICK_NUM 100

static void print_ticks() {
  1017f3:	55                   	push   %ebp
  1017f4:	89 e5                	mov    %esp,%ebp
  1017f6:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1017f9:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  101800:	00 
  101801:	c7 04 24 00 39 10 00 	movl   $0x103900,(%esp)
  101808:	e8 5f ea ff ff       	call   10026c <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
  10180d:	c7 04 24 0a 39 10 00 	movl   $0x10390a,(%esp)
  101814:	e8 53 ea ff ff       	call   10026c <cprintf>
    panic("EOT: kernel seems ok.");
  101819:	c7 44 24 08 18 39 10 	movl   $0x103918,0x8(%esp)
  101820:	00 
  101821:	c7 44 24 04 12 00 00 	movl   $0x12,0x4(%esp)
  101828:	00 
  101829:	c7 04 24 2e 39 10 00 	movl   $0x10392e,(%esp)
  101830:	e8 8e eb ff ff       	call   1003c3 <__panic>

00101835 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101835:	55                   	push   %ebp
  101836:	89 e5                	mov    %esp,%ebp
  101838:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
    extern uintptr_t __vectors[];
    int i;
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  10183b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101842:	e9 c3 00 00 00       	jmp    10190a <idt_init+0xd5>
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  101847:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10184a:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  101851:	89 c2                	mov    %eax,%edx
  101853:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101856:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  10185d:	00 
  10185e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101861:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  101868:	00 08 00 
  10186b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10186e:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101875:	00 
  101876:	83 e2 e0             	and    $0xffffffe0,%edx
  101879:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101880:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101883:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  10188a:	00 
  10188b:	83 e2 1f             	and    $0x1f,%edx
  10188e:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101895:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101898:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10189f:	00 
  1018a0:	83 e2 f0             	and    $0xfffffff0,%edx
  1018a3:	83 ca 0e             	or     $0xe,%edx
  1018a6:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018b0:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018b7:	00 
  1018b8:	83 e2 ef             	and    $0xffffffef,%edx
  1018bb:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018c5:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018cc:	00 
  1018cd:	83 e2 9f             	and    $0xffffff9f,%edx
  1018d0:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018da:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018e1:	00 
  1018e2:	83 ca 80             	or     $0xffffff80,%edx
  1018e5:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018ef:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1018f6:	c1 e8 10             	shr    $0x10,%eax
  1018f9:	89 c2                	mov    %eax,%edx
  1018fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018fe:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  101905:	00 
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  101906:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10190a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10190d:	3d ff 00 00 00       	cmp    $0xff,%eax
  101912:	0f 86 2f ff ff ff    	jbe    101847 <idt_init+0x12>
    }
	// set for switch from user to kernel
    SETGATE(idt[T_SWITCH_TOK], 0, GD_KTEXT, __vectors[T_SWITCH_TOK], DPL_USER);
  101918:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  10191d:	66 a3 68 f4 10 00    	mov    %ax,0x10f468
  101923:	66 c7 05 6a f4 10 00 	movw   $0x8,0x10f46a
  10192a:	08 00 
  10192c:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  101933:	83 e0 e0             	and    $0xffffffe0,%eax
  101936:	a2 6c f4 10 00       	mov    %al,0x10f46c
  10193b:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  101942:	83 e0 1f             	and    $0x1f,%eax
  101945:	a2 6c f4 10 00       	mov    %al,0x10f46c
  10194a:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101951:	83 e0 f0             	and    $0xfffffff0,%eax
  101954:	83 c8 0e             	or     $0xe,%eax
  101957:	a2 6d f4 10 00       	mov    %al,0x10f46d
  10195c:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101963:	83 e0 ef             	and    $0xffffffef,%eax
  101966:	a2 6d f4 10 00       	mov    %al,0x10f46d
  10196b:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101972:	83 c8 60             	or     $0x60,%eax
  101975:	a2 6d f4 10 00       	mov    %al,0x10f46d
  10197a:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101981:	83 c8 80             	or     $0xffffff80,%eax
  101984:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101989:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  10198e:	c1 e8 10             	shr    $0x10,%eax
  101991:	66 a3 6e f4 10 00    	mov    %ax,0x10f46e
  101997:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    asm volatile ("lidt (%0)" :: "r" (pd));
  10199e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1019a1:	0f 01 18             	lidtl  (%eax)
	// load the IDT
    lidt(&idt_pd);
}
  1019a4:	c9                   	leave  
  1019a5:	c3                   	ret    

001019a6 <trapname>:

static const char *
trapname(int trapno) {
  1019a6:	55                   	push   %ebp
  1019a7:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  1019a9:	8b 45 08             	mov    0x8(%ebp),%eax
  1019ac:	83 f8 13             	cmp    $0x13,%eax
  1019af:	77 0c                	ja     1019bd <trapname+0x17>
        return excnames[trapno];
  1019b1:	8b 45 08             	mov    0x8(%ebp),%eax
  1019b4:	8b 04 85 80 3c 10 00 	mov    0x103c80(,%eax,4),%eax
  1019bb:	eb 18                	jmp    1019d5 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  1019bd:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  1019c1:	7e 0d                	jle    1019d0 <trapname+0x2a>
  1019c3:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  1019c7:	7f 07                	jg     1019d0 <trapname+0x2a>
        return "Hardware Interrupt";
  1019c9:	b8 3f 39 10 00       	mov    $0x10393f,%eax
  1019ce:	eb 05                	jmp    1019d5 <trapname+0x2f>
    }
    return "(unknown trap)";
  1019d0:	b8 52 39 10 00       	mov    $0x103952,%eax
}
  1019d5:	5d                   	pop    %ebp
  1019d6:	c3                   	ret    

001019d7 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  1019d7:	55                   	push   %ebp
  1019d8:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  1019da:	8b 45 08             	mov    0x8(%ebp),%eax
  1019dd:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  1019e1:	66 83 f8 08          	cmp    $0x8,%ax
  1019e5:	0f 94 c0             	sete   %al
  1019e8:	0f b6 c0             	movzbl %al,%eax
}
  1019eb:	5d                   	pop    %ebp
  1019ec:	c3                   	ret    

001019ed <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  1019ed:	55                   	push   %ebp
  1019ee:	89 e5                	mov    %esp,%ebp
  1019f0:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  1019f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1019f6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019fa:	c7 04 24 93 39 10 00 	movl   $0x103993,(%esp)
  101a01:	e8 66 e8 ff ff       	call   10026c <cprintf>
    print_regs(&tf->tf_regs);
  101a06:	8b 45 08             	mov    0x8(%ebp),%eax
  101a09:	89 04 24             	mov    %eax,(%esp)
  101a0c:	e8 a1 01 00 00       	call   101bb2 <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101a11:	8b 45 08             	mov    0x8(%ebp),%eax
  101a14:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101a18:	0f b7 c0             	movzwl %ax,%eax
  101a1b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a1f:	c7 04 24 a4 39 10 00 	movl   $0x1039a4,(%esp)
  101a26:	e8 41 e8 ff ff       	call   10026c <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101a2b:	8b 45 08             	mov    0x8(%ebp),%eax
  101a2e:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101a32:	0f b7 c0             	movzwl %ax,%eax
  101a35:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a39:	c7 04 24 b7 39 10 00 	movl   $0x1039b7,(%esp)
  101a40:	e8 27 e8 ff ff       	call   10026c <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101a45:	8b 45 08             	mov    0x8(%ebp),%eax
  101a48:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101a4c:	0f b7 c0             	movzwl %ax,%eax
  101a4f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a53:	c7 04 24 ca 39 10 00 	movl   $0x1039ca,(%esp)
  101a5a:	e8 0d e8 ff ff       	call   10026c <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101a5f:	8b 45 08             	mov    0x8(%ebp),%eax
  101a62:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101a66:	0f b7 c0             	movzwl %ax,%eax
  101a69:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a6d:	c7 04 24 dd 39 10 00 	movl   $0x1039dd,(%esp)
  101a74:	e8 f3 e7 ff ff       	call   10026c <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101a79:	8b 45 08             	mov    0x8(%ebp),%eax
  101a7c:	8b 40 30             	mov    0x30(%eax),%eax
  101a7f:	89 04 24             	mov    %eax,(%esp)
  101a82:	e8 1f ff ff ff       	call   1019a6 <trapname>
  101a87:	8b 55 08             	mov    0x8(%ebp),%edx
  101a8a:	8b 52 30             	mov    0x30(%edx),%edx
  101a8d:	89 44 24 08          	mov    %eax,0x8(%esp)
  101a91:	89 54 24 04          	mov    %edx,0x4(%esp)
  101a95:	c7 04 24 f0 39 10 00 	movl   $0x1039f0,(%esp)
  101a9c:	e8 cb e7 ff ff       	call   10026c <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101aa1:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa4:	8b 40 34             	mov    0x34(%eax),%eax
  101aa7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aab:	c7 04 24 02 3a 10 00 	movl   $0x103a02,(%esp)
  101ab2:	e8 b5 e7 ff ff       	call   10026c <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101ab7:	8b 45 08             	mov    0x8(%ebp),%eax
  101aba:	8b 40 38             	mov    0x38(%eax),%eax
  101abd:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ac1:	c7 04 24 11 3a 10 00 	movl   $0x103a11,(%esp)
  101ac8:	e8 9f e7 ff ff       	call   10026c <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101acd:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad0:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101ad4:	0f b7 c0             	movzwl %ax,%eax
  101ad7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101adb:	c7 04 24 20 3a 10 00 	movl   $0x103a20,(%esp)
  101ae2:	e8 85 e7 ff ff       	call   10026c <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101ae7:	8b 45 08             	mov    0x8(%ebp),%eax
  101aea:	8b 40 40             	mov    0x40(%eax),%eax
  101aed:	89 44 24 04          	mov    %eax,0x4(%esp)
  101af1:	c7 04 24 33 3a 10 00 	movl   $0x103a33,(%esp)
  101af8:	e8 6f e7 ff ff       	call   10026c <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101afd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101b04:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101b0b:	eb 3e                	jmp    101b4b <print_trapframe+0x15e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101b0d:	8b 45 08             	mov    0x8(%ebp),%eax
  101b10:	8b 50 40             	mov    0x40(%eax),%edx
  101b13:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101b16:	21 d0                	and    %edx,%eax
  101b18:	85 c0                	test   %eax,%eax
  101b1a:	74 28                	je     101b44 <print_trapframe+0x157>
  101b1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b1f:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b26:	85 c0                	test   %eax,%eax
  101b28:	74 1a                	je     101b44 <print_trapframe+0x157>
            cprintf("%s,", IA32flags[i]);
  101b2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b2d:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b34:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b38:	c7 04 24 42 3a 10 00 	movl   $0x103a42,(%esp)
  101b3f:	e8 28 e7 ff ff       	call   10026c <cprintf>
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b44:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101b48:	d1 65 f0             	shll   -0x10(%ebp)
  101b4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b4e:	83 f8 17             	cmp    $0x17,%eax
  101b51:	76 ba                	jbe    101b0d <print_trapframe+0x120>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101b53:	8b 45 08             	mov    0x8(%ebp),%eax
  101b56:	8b 40 40             	mov    0x40(%eax),%eax
  101b59:	25 00 30 00 00       	and    $0x3000,%eax
  101b5e:	c1 e8 0c             	shr    $0xc,%eax
  101b61:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b65:	c7 04 24 46 3a 10 00 	movl   $0x103a46,(%esp)
  101b6c:	e8 fb e6 ff ff       	call   10026c <cprintf>

    if (!trap_in_kernel(tf)) {
  101b71:	8b 45 08             	mov    0x8(%ebp),%eax
  101b74:	89 04 24             	mov    %eax,(%esp)
  101b77:	e8 5b fe ff ff       	call   1019d7 <trap_in_kernel>
  101b7c:	85 c0                	test   %eax,%eax
  101b7e:	75 30                	jne    101bb0 <print_trapframe+0x1c3>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101b80:	8b 45 08             	mov    0x8(%ebp),%eax
  101b83:	8b 40 44             	mov    0x44(%eax),%eax
  101b86:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b8a:	c7 04 24 4f 3a 10 00 	movl   $0x103a4f,(%esp)
  101b91:	e8 d6 e6 ff ff       	call   10026c <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101b96:	8b 45 08             	mov    0x8(%ebp),%eax
  101b99:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101b9d:	0f b7 c0             	movzwl %ax,%eax
  101ba0:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ba4:	c7 04 24 5e 3a 10 00 	movl   $0x103a5e,(%esp)
  101bab:	e8 bc e6 ff ff       	call   10026c <cprintf>
    }
}
  101bb0:	c9                   	leave  
  101bb1:	c3                   	ret    

00101bb2 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101bb2:	55                   	push   %ebp
  101bb3:	89 e5                	mov    %esp,%ebp
  101bb5:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101bb8:	8b 45 08             	mov    0x8(%ebp),%eax
  101bbb:	8b 00                	mov    (%eax),%eax
  101bbd:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bc1:	c7 04 24 71 3a 10 00 	movl   $0x103a71,(%esp)
  101bc8:	e8 9f e6 ff ff       	call   10026c <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101bcd:	8b 45 08             	mov    0x8(%ebp),%eax
  101bd0:	8b 40 04             	mov    0x4(%eax),%eax
  101bd3:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bd7:	c7 04 24 80 3a 10 00 	movl   $0x103a80,(%esp)
  101bde:	e8 89 e6 ff ff       	call   10026c <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101be3:	8b 45 08             	mov    0x8(%ebp),%eax
  101be6:	8b 40 08             	mov    0x8(%eax),%eax
  101be9:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bed:	c7 04 24 8f 3a 10 00 	movl   $0x103a8f,(%esp)
  101bf4:	e8 73 e6 ff ff       	call   10026c <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101bf9:	8b 45 08             	mov    0x8(%ebp),%eax
  101bfc:	8b 40 0c             	mov    0xc(%eax),%eax
  101bff:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c03:	c7 04 24 9e 3a 10 00 	movl   $0x103a9e,(%esp)
  101c0a:	e8 5d e6 ff ff       	call   10026c <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101c0f:	8b 45 08             	mov    0x8(%ebp),%eax
  101c12:	8b 40 10             	mov    0x10(%eax),%eax
  101c15:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c19:	c7 04 24 ad 3a 10 00 	movl   $0x103aad,(%esp)
  101c20:	e8 47 e6 ff ff       	call   10026c <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101c25:	8b 45 08             	mov    0x8(%ebp),%eax
  101c28:	8b 40 14             	mov    0x14(%eax),%eax
  101c2b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c2f:	c7 04 24 bc 3a 10 00 	movl   $0x103abc,(%esp)
  101c36:	e8 31 e6 ff ff       	call   10026c <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101c3b:	8b 45 08             	mov    0x8(%ebp),%eax
  101c3e:	8b 40 18             	mov    0x18(%eax),%eax
  101c41:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c45:	c7 04 24 cb 3a 10 00 	movl   $0x103acb,(%esp)
  101c4c:	e8 1b e6 ff ff       	call   10026c <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101c51:	8b 45 08             	mov    0x8(%ebp),%eax
  101c54:	8b 40 1c             	mov    0x1c(%eax),%eax
  101c57:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c5b:	c7 04 24 da 3a 10 00 	movl   $0x103ada,(%esp)
  101c62:	e8 05 e6 ff ff       	call   10026c <cprintf>
}
  101c67:	c9                   	leave  
  101c68:	c3                   	ret    

00101c69 <trap_dispatch>:
/* temporary trapframe or pointer to trapframe */
struct trapframe switchk2u, *switchu2k;

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101c69:	55                   	push   %ebp
  101c6a:	89 e5                	mov    %esp,%ebp
  101c6c:	57                   	push   %edi
  101c6d:	56                   	push   %esi
  101c6e:	53                   	push   %ebx
  101c6f:	83 ec 2c             	sub    $0x2c,%esp
    char c;

    switch (tf->tf_trapno) {
  101c72:	8b 45 08             	mov    0x8(%ebp),%eax
  101c75:	8b 40 30             	mov    0x30(%eax),%eax
  101c78:	83 f8 2f             	cmp    $0x2f,%eax
  101c7b:	77 21                	ja     101c9e <trap_dispatch+0x35>
  101c7d:	83 f8 2e             	cmp    $0x2e,%eax
  101c80:	0f 83 ec 01 00 00    	jae    101e72 <trap_dispatch+0x209>
  101c86:	83 f8 21             	cmp    $0x21,%eax
  101c89:	0f 84 8a 00 00 00    	je     101d19 <trap_dispatch+0xb0>
  101c8f:	83 f8 24             	cmp    $0x24,%eax
  101c92:	74 5c                	je     101cf0 <trap_dispatch+0x87>
  101c94:	83 f8 20             	cmp    $0x20,%eax
  101c97:	74 1c                	je     101cb5 <trap_dispatch+0x4c>
  101c99:	e9 9c 01 00 00       	jmp    101e3a <trap_dispatch+0x1d1>
  101c9e:	83 f8 78             	cmp    $0x78,%eax
  101ca1:	0f 84 9b 00 00 00    	je     101d42 <trap_dispatch+0xd9>
  101ca7:	83 f8 79             	cmp    $0x79,%eax
  101caa:	0f 84 11 01 00 00    	je     101dc1 <trap_dispatch+0x158>
  101cb0:	e9 85 01 00 00       	jmp    101e3a <trap_dispatch+0x1d1>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        ticks ++;
  101cb5:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101cba:	83 c0 01             	add    $0x1,%eax
  101cbd:	a3 08 f9 10 00       	mov    %eax,0x10f908
        if (ticks % TICK_NUM == 0) {
  101cc2:	8b 0d 08 f9 10 00    	mov    0x10f908,%ecx
  101cc8:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101ccd:	89 c8                	mov    %ecx,%eax
  101ccf:	f7 e2                	mul    %edx
  101cd1:	89 d0                	mov    %edx,%eax
  101cd3:	c1 e8 05             	shr    $0x5,%eax
  101cd6:	6b c0 64             	imul   $0x64,%eax,%eax
  101cd9:	29 c1                	sub    %eax,%ecx
  101cdb:	89 c8                	mov    %ecx,%eax
  101cdd:	85 c0                	test   %eax,%eax
  101cdf:	75 0a                	jne    101ceb <trap_dispatch+0x82>
            print_ticks();
  101ce1:	e8 0d fb ff ff       	call   1017f3 <print_ticks>
        }
        break;
  101ce6:	e9 88 01 00 00       	jmp    101e73 <trap_dispatch+0x20a>
  101ceb:	e9 83 01 00 00       	jmp    101e73 <trap_dispatch+0x20a>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101cf0:	e8 d5 f8 ff ff       	call   1015ca <cons_getc>
  101cf5:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101cf8:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101cfc:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101d00:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d04:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d08:	c7 04 24 e9 3a 10 00 	movl   $0x103ae9,(%esp)
  101d0f:	e8 58 e5 ff ff       	call   10026c <cprintf>
        break;
  101d14:	e9 5a 01 00 00       	jmp    101e73 <trap_dispatch+0x20a>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101d19:	e8 ac f8 ff ff       	call   1015ca <cons_getc>
  101d1e:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101d21:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101d25:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101d29:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d2d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d31:	c7 04 24 fb 3a 10 00 	movl   $0x103afb,(%esp)
  101d38:	e8 2f e5 ff ff       	call   10026c <cprintf>
        break;
  101d3d:	e9 31 01 00 00       	jmp    101e73 <trap_dispatch+0x20a>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
        if (tf->tf_cs != USER_CS) {
  101d42:	8b 45 08             	mov    0x8(%ebp),%eax
  101d45:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101d49:	66 83 f8 1b          	cmp    $0x1b,%ax
  101d4d:	74 6d                	je     101dbc <trap_dispatch+0x153>
            switchk2u = *tf;
  101d4f:	8b 45 08             	mov    0x8(%ebp),%eax
  101d52:	ba 20 f9 10 00       	mov    $0x10f920,%edx
  101d57:	89 c3                	mov    %eax,%ebx
  101d59:	b8 13 00 00 00       	mov    $0x13,%eax
  101d5e:	89 d7                	mov    %edx,%edi
  101d60:	89 de                	mov    %ebx,%esi
  101d62:	89 c1                	mov    %eax,%ecx
  101d64:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
            switchk2u.tf_cs = USER_CS;
  101d66:	66 c7 05 5c f9 10 00 	movw   $0x1b,0x10f95c
  101d6d:	1b 00 
            switchk2u.tf_ds = switchk2u.tf_es = switchk2u.tf_ss = USER_DS;
  101d6f:	66 c7 05 68 f9 10 00 	movw   $0x23,0x10f968
  101d76:	23 00 
  101d78:	0f b7 05 68 f9 10 00 	movzwl 0x10f968,%eax
  101d7f:	66 a3 48 f9 10 00    	mov    %ax,0x10f948
  101d85:	0f b7 05 48 f9 10 00 	movzwl 0x10f948,%eax
  101d8c:	66 a3 4c f9 10 00    	mov    %ax,0x10f94c
            switchk2u.tf_esp = (uint32_t)tf + sizeof(struct trapframe) - 8;
  101d92:	8b 45 08             	mov    0x8(%ebp),%eax
  101d95:	83 c0 44             	add    $0x44,%eax
  101d98:	a3 64 f9 10 00       	mov    %eax,0x10f964
		
            // set eflags, make sure ucore can use io under user mode.
            // if CPL > IOPL, then cpu will generate a general protection.
            switchk2u.tf_eflags |= FL_IOPL_MASK;
  101d9d:	a1 60 f9 10 00       	mov    0x10f960,%eax
  101da2:	80 cc 30             	or     $0x30,%ah
  101da5:	a3 60 f9 10 00       	mov    %eax,0x10f960
		
            // set temporary stack
            // then iret will jump to the right stack
            *((uint32_t *)tf - 1) = (uint32_t)&switchk2u;
  101daa:	8b 45 08             	mov    0x8(%ebp),%eax
  101dad:	8d 50 fc             	lea    -0x4(%eax),%edx
  101db0:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  101db5:	89 02                	mov    %eax,(%edx)
        }
        break;
  101db7:	e9 b7 00 00 00       	jmp    101e73 <trap_dispatch+0x20a>
  101dbc:	e9 b2 00 00 00       	jmp    101e73 <trap_dispatch+0x20a>
    case T_SWITCH_TOK:
        if (tf->tf_cs != KERNEL_CS) {
  101dc1:	8b 45 08             	mov    0x8(%ebp),%eax
  101dc4:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101dc8:	66 83 f8 08          	cmp    $0x8,%ax
  101dcc:	74 6a                	je     101e38 <trap_dispatch+0x1cf>
            tf->tf_cs = KERNEL_CS;
  101dce:	8b 45 08             	mov    0x8(%ebp),%eax
  101dd1:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
            tf->tf_ds = tf->tf_es = KERNEL_DS;
  101dd7:	8b 45 08             	mov    0x8(%ebp),%eax
  101dda:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101de0:	8b 45 08             	mov    0x8(%ebp),%eax
  101de3:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101de7:	8b 45 08             	mov    0x8(%ebp),%eax
  101dea:	66 89 50 2c          	mov    %dx,0x2c(%eax)
            tf->tf_eflags &= ~FL_IOPL_MASK;
  101dee:	8b 45 08             	mov    0x8(%ebp),%eax
  101df1:	8b 40 40             	mov    0x40(%eax),%eax
  101df4:	80 e4 cf             	and    $0xcf,%ah
  101df7:	89 c2                	mov    %eax,%edx
  101df9:	8b 45 08             	mov    0x8(%ebp),%eax
  101dfc:	89 50 40             	mov    %edx,0x40(%eax)
            switchu2k = (struct trapframe *)(tf->tf_esp - (sizeof(struct trapframe) - 8));
  101dff:	8b 45 08             	mov    0x8(%ebp),%eax
  101e02:	8b 40 44             	mov    0x44(%eax),%eax
  101e05:	83 e8 44             	sub    $0x44,%eax
  101e08:	a3 6c f9 10 00       	mov    %eax,0x10f96c
            memmove(switchu2k, tf, sizeof(struct trapframe) - 8);
  101e0d:	a1 6c f9 10 00       	mov    0x10f96c,%eax
  101e12:	c7 44 24 08 44 00 00 	movl   $0x44,0x8(%esp)
  101e19:	00 
  101e1a:	8b 55 08             	mov    0x8(%ebp),%edx
  101e1d:	89 54 24 04          	mov    %edx,0x4(%esp)
  101e21:	89 04 24             	mov    %eax,(%esp)
  101e24:	e8 a4 0f 00 00       	call   102dcd <memmove>
            *((uint32_t *)tf - 1) = (uint32_t)switchu2k;
  101e29:	8b 45 08             	mov    0x8(%ebp),%eax
  101e2c:	8d 50 fc             	lea    -0x4(%eax),%edx
  101e2f:	a1 6c f9 10 00       	mov    0x10f96c,%eax
  101e34:	89 02                	mov    %eax,(%edx)
        }
        break;
  101e36:	eb 3b                	jmp    101e73 <trap_dispatch+0x20a>
  101e38:	eb 39                	jmp    101e73 <trap_dispatch+0x20a>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101e3a:	8b 45 08             	mov    0x8(%ebp),%eax
  101e3d:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e41:	0f b7 c0             	movzwl %ax,%eax
  101e44:	83 e0 03             	and    $0x3,%eax
  101e47:	85 c0                	test   %eax,%eax
  101e49:	75 28                	jne    101e73 <trap_dispatch+0x20a>
            print_trapframe(tf);
  101e4b:	8b 45 08             	mov    0x8(%ebp),%eax
  101e4e:	89 04 24             	mov    %eax,(%esp)
  101e51:	e8 97 fb ff ff       	call   1019ed <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101e56:	c7 44 24 08 0a 3b 10 	movl   $0x103b0a,0x8(%esp)
  101e5d:	00 
  101e5e:	c7 44 24 04 d2 00 00 	movl   $0xd2,0x4(%esp)
  101e65:	00 
  101e66:	c7 04 24 2e 39 10 00 	movl   $0x10392e,(%esp)
  101e6d:	e8 51 e5 ff ff       	call   1003c3 <__panic>
        break;
  101e72:	90                   	nop
        }
    }
}
  101e73:	83 c4 2c             	add    $0x2c,%esp
  101e76:	5b                   	pop    %ebx
  101e77:	5e                   	pop    %esi
  101e78:	5f                   	pop    %edi
  101e79:	5d                   	pop    %ebp
  101e7a:	c3                   	ret    

00101e7b <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101e7b:	55                   	push   %ebp
  101e7c:	89 e5                	mov    %esp,%ebp
  101e7e:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101e81:	8b 45 08             	mov    0x8(%ebp),%eax
  101e84:	89 04 24             	mov    %eax,(%esp)
  101e87:	e8 dd fd ff ff       	call   101c69 <trap_dispatch>
}
  101e8c:	c9                   	leave  
  101e8d:	c3                   	ret    

00101e8e <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101e8e:	6a 00                	push   $0x0
  pushl $0
  101e90:	6a 00                	push   $0x0
  jmp __alltraps
  101e92:	e9 67 0a 00 00       	jmp    1028fe <__alltraps>

00101e97 <vector1>:
.globl vector1
vector1:
  pushl $0
  101e97:	6a 00                	push   $0x0
  pushl $1
  101e99:	6a 01                	push   $0x1
  jmp __alltraps
  101e9b:	e9 5e 0a 00 00       	jmp    1028fe <__alltraps>

00101ea0 <vector2>:
.globl vector2
vector2:
  pushl $0
  101ea0:	6a 00                	push   $0x0
  pushl $2
  101ea2:	6a 02                	push   $0x2
  jmp __alltraps
  101ea4:	e9 55 0a 00 00       	jmp    1028fe <__alltraps>

00101ea9 <vector3>:
.globl vector3
vector3:
  pushl $0
  101ea9:	6a 00                	push   $0x0
  pushl $3
  101eab:	6a 03                	push   $0x3
  jmp __alltraps
  101ead:	e9 4c 0a 00 00       	jmp    1028fe <__alltraps>

00101eb2 <vector4>:
.globl vector4
vector4:
  pushl $0
  101eb2:	6a 00                	push   $0x0
  pushl $4
  101eb4:	6a 04                	push   $0x4
  jmp __alltraps
  101eb6:	e9 43 0a 00 00       	jmp    1028fe <__alltraps>

00101ebb <vector5>:
.globl vector5
vector5:
  pushl $0
  101ebb:	6a 00                	push   $0x0
  pushl $5
  101ebd:	6a 05                	push   $0x5
  jmp __alltraps
  101ebf:	e9 3a 0a 00 00       	jmp    1028fe <__alltraps>

00101ec4 <vector6>:
.globl vector6
vector6:
  pushl $0
  101ec4:	6a 00                	push   $0x0
  pushl $6
  101ec6:	6a 06                	push   $0x6
  jmp __alltraps
  101ec8:	e9 31 0a 00 00       	jmp    1028fe <__alltraps>

00101ecd <vector7>:
.globl vector7
vector7:
  pushl $0
  101ecd:	6a 00                	push   $0x0
  pushl $7
  101ecf:	6a 07                	push   $0x7
  jmp __alltraps
  101ed1:	e9 28 0a 00 00       	jmp    1028fe <__alltraps>

00101ed6 <vector8>:
.globl vector8
vector8:
  pushl $8
  101ed6:	6a 08                	push   $0x8
  jmp __alltraps
  101ed8:	e9 21 0a 00 00       	jmp    1028fe <__alltraps>

00101edd <vector9>:
.globl vector9
vector9:
  pushl $9
  101edd:	6a 09                	push   $0x9
  jmp __alltraps
  101edf:	e9 1a 0a 00 00       	jmp    1028fe <__alltraps>

00101ee4 <vector10>:
.globl vector10
vector10:
  pushl $10
  101ee4:	6a 0a                	push   $0xa
  jmp __alltraps
  101ee6:	e9 13 0a 00 00       	jmp    1028fe <__alltraps>

00101eeb <vector11>:
.globl vector11
vector11:
  pushl $11
  101eeb:	6a 0b                	push   $0xb
  jmp __alltraps
  101eed:	e9 0c 0a 00 00       	jmp    1028fe <__alltraps>

00101ef2 <vector12>:
.globl vector12
vector12:
  pushl $12
  101ef2:	6a 0c                	push   $0xc
  jmp __alltraps
  101ef4:	e9 05 0a 00 00       	jmp    1028fe <__alltraps>

00101ef9 <vector13>:
.globl vector13
vector13:
  pushl $13
  101ef9:	6a 0d                	push   $0xd
  jmp __alltraps
  101efb:	e9 fe 09 00 00       	jmp    1028fe <__alltraps>

00101f00 <vector14>:
.globl vector14
vector14:
  pushl $14
  101f00:	6a 0e                	push   $0xe
  jmp __alltraps
  101f02:	e9 f7 09 00 00       	jmp    1028fe <__alltraps>

00101f07 <vector15>:
.globl vector15
vector15:
  pushl $0
  101f07:	6a 00                	push   $0x0
  pushl $15
  101f09:	6a 0f                	push   $0xf
  jmp __alltraps
  101f0b:	e9 ee 09 00 00       	jmp    1028fe <__alltraps>

00101f10 <vector16>:
.globl vector16
vector16:
  pushl $0
  101f10:	6a 00                	push   $0x0
  pushl $16
  101f12:	6a 10                	push   $0x10
  jmp __alltraps
  101f14:	e9 e5 09 00 00       	jmp    1028fe <__alltraps>

00101f19 <vector17>:
.globl vector17
vector17:
  pushl $17
  101f19:	6a 11                	push   $0x11
  jmp __alltraps
  101f1b:	e9 de 09 00 00       	jmp    1028fe <__alltraps>

00101f20 <vector18>:
.globl vector18
vector18:
  pushl $0
  101f20:	6a 00                	push   $0x0
  pushl $18
  101f22:	6a 12                	push   $0x12
  jmp __alltraps
  101f24:	e9 d5 09 00 00       	jmp    1028fe <__alltraps>

00101f29 <vector19>:
.globl vector19
vector19:
  pushl $0
  101f29:	6a 00                	push   $0x0
  pushl $19
  101f2b:	6a 13                	push   $0x13
  jmp __alltraps
  101f2d:	e9 cc 09 00 00       	jmp    1028fe <__alltraps>

00101f32 <vector20>:
.globl vector20
vector20:
  pushl $0
  101f32:	6a 00                	push   $0x0
  pushl $20
  101f34:	6a 14                	push   $0x14
  jmp __alltraps
  101f36:	e9 c3 09 00 00       	jmp    1028fe <__alltraps>

00101f3b <vector21>:
.globl vector21
vector21:
  pushl $0
  101f3b:	6a 00                	push   $0x0
  pushl $21
  101f3d:	6a 15                	push   $0x15
  jmp __alltraps
  101f3f:	e9 ba 09 00 00       	jmp    1028fe <__alltraps>

00101f44 <vector22>:
.globl vector22
vector22:
  pushl $0
  101f44:	6a 00                	push   $0x0
  pushl $22
  101f46:	6a 16                	push   $0x16
  jmp __alltraps
  101f48:	e9 b1 09 00 00       	jmp    1028fe <__alltraps>

00101f4d <vector23>:
.globl vector23
vector23:
  pushl $0
  101f4d:	6a 00                	push   $0x0
  pushl $23
  101f4f:	6a 17                	push   $0x17
  jmp __alltraps
  101f51:	e9 a8 09 00 00       	jmp    1028fe <__alltraps>

00101f56 <vector24>:
.globl vector24
vector24:
  pushl $0
  101f56:	6a 00                	push   $0x0
  pushl $24
  101f58:	6a 18                	push   $0x18
  jmp __alltraps
  101f5a:	e9 9f 09 00 00       	jmp    1028fe <__alltraps>

00101f5f <vector25>:
.globl vector25
vector25:
  pushl $0
  101f5f:	6a 00                	push   $0x0
  pushl $25
  101f61:	6a 19                	push   $0x19
  jmp __alltraps
  101f63:	e9 96 09 00 00       	jmp    1028fe <__alltraps>

00101f68 <vector26>:
.globl vector26
vector26:
  pushl $0
  101f68:	6a 00                	push   $0x0
  pushl $26
  101f6a:	6a 1a                	push   $0x1a
  jmp __alltraps
  101f6c:	e9 8d 09 00 00       	jmp    1028fe <__alltraps>

00101f71 <vector27>:
.globl vector27
vector27:
  pushl $0
  101f71:	6a 00                	push   $0x0
  pushl $27
  101f73:	6a 1b                	push   $0x1b
  jmp __alltraps
  101f75:	e9 84 09 00 00       	jmp    1028fe <__alltraps>

00101f7a <vector28>:
.globl vector28
vector28:
  pushl $0
  101f7a:	6a 00                	push   $0x0
  pushl $28
  101f7c:	6a 1c                	push   $0x1c
  jmp __alltraps
  101f7e:	e9 7b 09 00 00       	jmp    1028fe <__alltraps>

00101f83 <vector29>:
.globl vector29
vector29:
  pushl $0
  101f83:	6a 00                	push   $0x0
  pushl $29
  101f85:	6a 1d                	push   $0x1d
  jmp __alltraps
  101f87:	e9 72 09 00 00       	jmp    1028fe <__alltraps>

00101f8c <vector30>:
.globl vector30
vector30:
  pushl $0
  101f8c:	6a 00                	push   $0x0
  pushl $30
  101f8e:	6a 1e                	push   $0x1e
  jmp __alltraps
  101f90:	e9 69 09 00 00       	jmp    1028fe <__alltraps>

00101f95 <vector31>:
.globl vector31
vector31:
  pushl $0
  101f95:	6a 00                	push   $0x0
  pushl $31
  101f97:	6a 1f                	push   $0x1f
  jmp __alltraps
  101f99:	e9 60 09 00 00       	jmp    1028fe <__alltraps>

00101f9e <vector32>:
.globl vector32
vector32:
  pushl $0
  101f9e:	6a 00                	push   $0x0
  pushl $32
  101fa0:	6a 20                	push   $0x20
  jmp __alltraps
  101fa2:	e9 57 09 00 00       	jmp    1028fe <__alltraps>

00101fa7 <vector33>:
.globl vector33
vector33:
  pushl $0
  101fa7:	6a 00                	push   $0x0
  pushl $33
  101fa9:	6a 21                	push   $0x21
  jmp __alltraps
  101fab:	e9 4e 09 00 00       	jmp    1028fe <__alltraps>

00101fb0 <vector34>:
.globl vector34
vector34:
  pushl $0
  101fb0:	6a 00                	push   $0x0
  pushl $34
  101fb2:	6a 22                	push   $0x22
  jmp __alltraps
  101fb4:	e9 45 09 00 00       	jmp    1028fe <__alltraps>

00101fb9 <vector35>:
.globl vector35
vector35:
  pushl $0
  101fb9:	6a 00                	push   $0x0
  pushl $35
  101fbb:	6a 23                	push   $0x23
  jmp __alltraps
  101fbd:	e9 3c 09 00 00       	jmp    1028fe <__alltraps>

00101fc2 <vector36>:
.globl vector36
vector36:
  pushl $0
  101fc2:	6a 00                	push   $0x0
  pushl $36
  101fc4:	6a 24                	push   $0x24
  jmp __alltraps
  101fc6:	e9 33 09 00 00       	jmp    1028fe <__alltraps>

00101fcb <vector37>:
.globl vector37
vector37:
  pushl $0
  101fcb:	6a 00                	push   $0x0
  pushl $37
  101fcd:	6a 25                	push   $0x25
  jmp __alltraps
  101fcf:	e9 2a 09 00 00       	jmp    1028fe <__alltraps>

00101fd4 <vector38>:
.globl vector38
vector38:
  pushl $0
  101fd4:	6a 00                	push   $0x0
  pushl $38
  101fd6:	6a 26                	push   $0x26
  jmp __alltraps
  101fd8:	e9 21 09 00 00       	jmp    1028fe <__alltraps>

00101fdd <vector39>:
.globl vector39
vector39:
  pushl $0
  101fdd:	6a 00                	push   $0x0
  pushl $39
  101fdf:	6a 27                	push   $0x27
  jmp __alltraps
  101fe1:	e9 18 09 00 00       	jmp    1028fe <__alltraps>

00101fe6 <vector40>:
.globl vector40
vector40:
  pushl $0
  101fe6:	6a 00                	push   $0x0
  pushl $40
  101fe8:	6a 28                	push   $0x28
  jmp __alltraps
  101fea:	e9 0f 09 00 00       	jmp    1028fe <__alltraps>

00101fef <vector41>:
.globl vector41
vector41:
  pushl $0
  101fef:	6a 00                	push   $0x0
  pushl $41
  101ff1:	6a 29                	push   $0x29
  jmp __alltraps
  101ff3:	e9 06 09 00 00       	jmp    1028fe <__alltraps>

00101ff8 <vector42>:
.globl vector42
vector42:
  pushl $0
  101ff8:	6a 00                	push   $0x0
  pushl $42
  101ffa:	6a 2a                	push   $0x2a
  jmp __alltraps
  101ffc:	e9 fd 08 00 00       	jmp    1028fe <__alltraps>

00102001 <vector43>:
.globl vector43
vector43:
  pushl $0
  102001:	6a 00                	push   $0x0
  pushl $43
  102003:	6a 2b                	push   $0x2b
  jmp __alltraps
  102005:	e9 f4 08 00 00       	jmp    1028fe <__alltraps>

0010200a <vector44>:
.globl vector44
vector44:
  pushl $0
  10200a:	6a 00                	push   $0x0
  pushl $44
  10200c:	6a 2c                	push   $0x2c
  jmp __alltraps
  10200e:	e9 eb 08 00 00       	jmp    1028fe <__alltraps>

00102013 <vector45>:
.globl vector45
vector45:
  pushl $0
  102013:	6a 00                	push   $0x0
  pushl $45
  102015:	6a 2d                	push   $0x2d
  jmp __alltraps
  102017:	e9 e2 08 00 00       	jmp    1028fe <__alltraps>

0010201c <vector46>:
.globl vector46
vector46:
  pushl $0
  10201c:	6a 00                	push   $0x0
  pushl $46
  10201e:	6a 2e                	push   $0x2e
  jmp __alltraps
  102020:	e9 d9 08 00 00       	jmp    1028fe <__alltraps>

00102025 <vector47>:
.globl vector47
vector47:
  pushl $0
  102025:	6a 00                	push   $0x0
  pushl $47
  102027:	6a 2f                	push   $0x2f
  jmp __alltraps
  102029:	e9 d0 08 00 00       	jmp    1028fe <__alltraps>

0010202e <vector48>:
.globl vector48
vector48:
  pushl $0
  10202e:	6a 00                	push   $0x0
  pushl $48
  102030:	6a 30                	push   $0x30
  jmp __alltraps
  102032:	e9 c7 08 00 00       	jmp    1028fe <__alltraps>

00102037 <vector49>:
.globl vector49
vector49:
  pushl $0
  102037:	6a 00                	push   $0x0
  pushl $49
  102039:	6a 31                	push   $0x31
  jmp __alltraps
  10203b:	e9 be 08 00 00       	jmp    1028fe <__alltraps>

00102040 <vector50>:
.globl vector50
vector50:
  pushl $0
  102040:	6a 00                	push   $0x0
  pushl $50
  102042:	6a 32                	push   $0x32
  jmp __alltraps
  102044:	e9 b5 08 00 00       	jmp    1028fe <__alltraps>

00102049 <vector51>:
.globl vector51
vector51:
  pushl $0
  102049:	6a 00                	push   $0x0
  pushl $51
  10204b:	6a 33                	push   $0x33
  jmp __alltraps
  10204d:	e9 ac 08 00 00       	jmp    1028fe <__alltraps>

00102052 <vector52>:
.globl vector52
vector52:
  pushl $0
  102052:	6a 00                	push   $0x0
  pushl $52
  102054:	6a 34                	push   $0x34
  jmp __alltraps
  102056:	e9 a3 08 00 00       	jmp    1028fe <__alltraps>

0010205b <vector53>:
.globl vector53
vector53:
  pushl $0
  10205b:	6a 00                	push   $0x0
  pushl $53
  10205d:	6a 35                	push   $0x35
  jmp __alltraps
  10205f:	e9 9a 08 00 00       	jmp    1028fe <__alltraps>

00102064 <vector54>:
.globl vector54
vector54:
  pushl $0
  102064:	6a 00                	push   $0x0
  pushl $54
  102066:	6a 36                	push   $0x36
  jmp __alltraps
  102068:	e9 91 08 00 00       	jmp    1028fe <__alltraps>

0010206d <vector55>:
.globl vector55
vector55:
  pushl $0
  10206d:	6a 00                	push   $0x0
  pushl $55
  10206f:	6a 37                	push   $0x37
  jmp __alltraps
  102071:	e9 88 08 00 00       	jmp    1028fe <__alltraps>

00102076 <vector56>:
.globl vector56
vector56:
  pushl $0
  102076:	6a 00                	push   $0x0
  pushl $56
  102078:	6a 38                	push   $0x38
  jmp __alltraps
  10207a:	e9 7f 08 00 00       	jmp    1028fe <__alltraps>

0010207f <vector57>:
.globl vector57
vector57:
  pushl $0
  10207f:	6a 00                	push   $0x0
  pushl $57
  102081:	6a 39                	push   $0x39
  jmp __alltraps
  102083:	e9 76 08 00 00       	jmp    1028fe <__alltraps>

00102088 <vector58>:
.globl vector58
vector58:
  pushl $0
  102088:	6a 00                	push   $0x0
  pushl $58
  10208a:	6a 3a                	push   $0x3a
  jmp __alltraps
  10208c:	e9 6d 08 00 00       	jmp    1028fe <__alltraps>

00102091 <vector59>:
.globl vector59
vector59:
  pushl $0
  102091:	6a 00                	push   $0x0
  pushl $59
  102093:	6a 3b                	push   $0x3b
  jmp __alltraps
  102095:	e9 64 08 00 00       	jmp    1028fe <__alltraps>

0010209a <vector60>:
.globl vector60
vector60:
  pushl $0
  10209a:	6a 00                	push   $0x0
  pushl $60
  10209c:	6a 3c                	push   $0x3c
  jmp __alltraps
  10209e:	e9 5b 08 00 00       	jmp    1028fe <__alltraps>

001020a3 <vector61>:
.globl vector61
vector61:
  pushl $0
  1020a3:	6a 00                	push   $0x0
  pushl $61
  1020a5:	6a 3d                	push   $0x3d
  jmp __alltraps
  1020a7:	e9 52 08 00 00       	jmp    1028fe <__alltraps>

001020ac <vector62>:
.globl vector62
vector62:
  pushl $0
  1020ac:	6a 00                	push   $0x0
  pushl $62
  1020ae:	6a 3e                	push   $0x3e
  jmp __alltraps
  1020b0:	e9 49 08 00 00       	jmp    1028fe <__alltraps>

001020b5 <vector63>:
.globl vector63
vector63:
  pushl $0
  1020b5:	6a 00                	push   $0x0
  pushl $63
  1020b7:	6a 3f                	push   $0x3f
  jmp __alltraps
  1020b9:	e9 40 08 00 00       	jmp    1028fe <__alltraps>

001020be <vector64>:
.globl vector64
vector64:
  pushl $0
  1020be:	6a 00                	push   $0x0
  pushl $64
  1020c0:	6a 40                	push   $0x40
  jmp __alltraps
  1020c2:	e9 37 08 00 00       	jmp    1028fe <__alltraps>

001020c7 <vector65>:
.globl vector65
vector65:
  pushl $0
  1020c7:	6a 00                	push   $0x0
  pushl $65
  1020c9:	6a 41                	push   $0x41
  jmp __alltraps
  1020cb:	e9 2e 08 00 00       	jmp    1028fe <__alltraps>

001020d0 <vector66>:
.globl vector66
vector66:
  pushl $0
  1020d0:	6a 00                	push   $0x0
  pushl $66
  1020d2:	6a 42                	push   $0x42
  jmp __alltraps
  1020d4:	e9 25 08 00 00       	jmp    1028fe <__alltraps>

001020d9 <vector67>:
.globl vector67
vector67:
  pushl $0
  1020d9:	6a 00                	push   $0x0
  pushl $67
  1020db:	6a 43                	push   $0x43
  jmp __alltraps
  1020dd:	e9 1c 08 00 00       	jmp    1028fe <__alltraps>

001020e2 <vector68>:
.globl vector68
vector68:
  pushl $0
  1020e2:	6a 00                	push   $0x0
  pushl $68
  1020e4:	6a 44                	push   $0x44
  jmp __alltraps
  1020e6:	e9 13 08 00 00       	jmp    1028fe <__alltraps>

001020eb <vector69>:
.globl vector69
vector69:
  pushl $0
  1020eb:	6a 00                	push   $0x0
  pushl $69
  1020ed:	6a 45                	push   $0x45
  jmp __alltraps
  1020ef:	e9 0a 08 00 00       	jmp    1028fe <__alltraps>

001020f4 <vector70>:
.globl vector70
vector70:
  pushl $0
  1020f4:	6a 00                	push   $0x0
  pushl $70
  1020f6:	6a 46                	push   $0x46
  jmp __alltraps
  1020f8:	e9 01 08 00 00       	jmp    1028fe <__alltraps>

001020fd <vector71>:
.globl vector71
vector71:
  pushl $0
  1020fd:	6a 00                	push   $0x0
  pushl $71
  1020ff:	6a 47                	push   $0x47
  jmp __alltraps
  102101:	e9 f8 07 00 00       	jmp    1028fe <__alltraps>

00102106 <vector72>:
.globl vector72
vector72:
  pushl $0
  102106:	6a 00                	push   $0x0
  pushl $72
  102108:	6a 48                	push   $0x48
  jmp __alltraps
  10210a:	e9 ef 07 00 00       	jmp    1028fe <__alltraps>

0010210f <vector73>:
.globl vector73
vector73:
  pushl $0
  10210f:	6a 00                	push   $0x0
  pushl $73
  102111:	6a 49                	push   $0x49
  jmp __alltraps
  102113:	e9 e6 07 00 00       	jmp    1028fe <__alltraps>

00102118 <vector74>:
.globl vector74
vector74:
  pushl $0
  102118:	6a 00                	push   $0x0
  pushl $74
  10211a:	6a 4a                	push   $0x4a
  jmp __alltraps
  10211c:	e9 dd 07 00 00       	jmp    1028fe <__alltraps>

00102121 <vector75>:
.globl vector75
vector75:
  pushl $0
  102121:	6a 00                	push   $0x0
  pushl $75
  102123:	6a 4b                	push   $0x4b
  jmp __alltraps
  102125:	e9 d4 07 00 00       	jmp    1028fe <__alltraps>

0010212a <vector76>:
.globl vector76
vector76:
  pushl $0
  10212a:	6a 00                	push   $0x0
  pushl $76
  10212c:	6a 4c                	push   $0x4c
  jmp __alltraps
  10212e:	e9 cb 07 00 00       	jmp    1028fe <__alltraps>

00102133 <vector77>:
.globl vector77
vector77:
  pushl $0
  102133:	6a 00                	push   $0x0
  pushl $77
  102135:	6a 4d                	push   $0x4d
  jmp __alltraps
  102137:	e9 c2 07 00 00       	jmp    1028fe <__alltraps>

0010213c <vector78>:
.globl vector78
vector78:
  pushl $0
  10213c:	6a 00                	push   $0x0
  pushl $78
  10213e:	6a 4e                	push   $0x4e
  jmp __alltraps
  102140:	e9 b9 07 00 00       	jmp    1028fe <__alltraps>

00102145 <vector79>:
.globl vector79
vector79:
  pushl $0
  102145:	6a 00                	push   $0x0
  pushl $79
  102147:	6a 4f                	push   $0x4f
  jmp __alltraps
  102149:	e9 b0 07 00 00       	jmp    1028fe <__alltraps>

0010214e <vector80>:
.globl vector80
vector80:
  pushl $0
  10214e:	6a 00                	push   $0x0
  pushl $80
  102150:	6a 50                	push   $0x50
  jmp __alltraps
  102152:	e9 a7 07 00 00       	jmp    1028fe <__alltraps>

00102157 <vector81>:
.globl vector81
vector81:
  pushl $0
  102157:	6a 00                	push   $0x0
  pushl $81
  102159:	6a 51                	push   $0x51
  jmp __alltraps
  10215b:	e9 9e 07 00 00       	jmp    1028fe <__alltraps>

00102160 <vector82>:
.globl vector82
vector82:
  pushl $0
  102160:	6a 00                	push   $0x0
  pushl $82
  102162:	6a 52                	push   $0x52
  jmp __alltraps
  102164:	e9 95 07 00 00       	jmp    1028fe <__alltraps>

00102169 <vector83>:
.globl vector83
vector83:
  pushl $0
  102169:	6a 00                	push   $0x0
  pushl $83
  10216b:	6a 53                	push   $0x53
  jmp __alltraps
  10216d:	e9 8c 07 00 00       	jmp    1028fe <__alltraps>

00102172 <vector84>:
.globl vector84
vector84:
  pushl $0
  102172:	6a 00                	push   $0x0
  pushl $84
  102174:	6a 54                	push   $0x54
  jmp __alltraps
  102176:	e9 83 07 00 00       	jmp    1028fe <__alltraps>

0010217b <vector85>:
.globl vector85
vector85:
  pushl $0
  10217b:	6a 00                	push   $0x0
  pushl $85
  10217d:	6a 55                	push   $0x55
  jmp __alltraps
  10217f:	e9 7a 07 00 00       	jmp    1028fe <__alltraps>

00102184 <vector86>:
.globl vector86
vector86:
  pushl $0
  102184:	6a 00                	push   $0x0
  pushl $86
  102186:	6a 56                	push   $0x56
  jmp __alltraps
  102188:	e9 71 07 00 00       	jmp    1028fe <__alltraps>

0010218d <vector87>:
.globl vector87
vector87:
  pushl $0
  10218d:	6a 00                	push   $0x0
  pushl $87
  10218f:	6a 57                	push   $0x57
  jmp __alltraps
  102191:	e9 68 07 00 00       	jmp    1028fe <__alltraps>

00102196 <vector88>:
.globl vector88
vector88:
  pushl $0
  102196:	6a 00                	push   $0x0
  pushl $88
  102198:	6a 58                	push   $0x58
  jmp __alltraps
  10219a:	e9 5f 07 00 00       	jmp    1028fe <__alltraps>

0010219f <vector89>:
.globl vector89
vector89:
  pushl $0
  10219f:	6a 00                	push   $0x0
  pushl $89
  1021a1:	6a 59                	push   $0x59
  jmp __alltraps
  1021a3:	e9 56 07 00 00       	jmp    1028fe <__alltraps>

001021a8 <vector90>:
.globl vector90
vector90:
  pushl $0
  1021a8:	6a 00                	push   $0x0
  pushl $90
  1021aa:	6a 5a                	push   $0x5a
  jmp __alltraps
  1021ac:	e9 4d 07 00 00       	jmp    1028fe <__alltraps>

001021b1 <vector91>:
.globl vector91
vector91:
  pushl $0
  1021b1:	6a 00                	push   $0x0
  pushl $91
  1021b3:	6a 5b                	push   $0x5b
  jmp __alltraps
  1021b5:	e9 44 07 00 00       	jmp    1028fe <__alltraps>

001021ba <vector92>:
.globl vector92
vector92:
  pushl $0
  1021ba:	6a 00                	push   $0x0
  pushl $92
  1021bc:	6a 5c                	push   $0x5c
  jmp __alltraps
  1021be:	e9 3b 07 00 00       	jmp    1028fe <__alltraps>

001021c3 <vector93>:
.globl vector93
vector93:
  pushl $0
  1021c3:	6a 00                	push   $0x0
  pushl $93
  1021c5:	6a 5d                	push   $0x5d
  jmp __alltraps
  1021c7:	e9 32 07 00 00       	jmp    1028fe <__alltraps>

001021cc <vector94>:
.globl vector94
vector94:
  pushl $0
  1021cc:	6a 00                	push   $0x0
  pushl $94
  1021ce:	6a 5e                	push   $0x5e
  jmp __alltraps
  1021d0:	e9 29 07 00 00       	jmp    1028fe <__alltraps>

001021d5 <vector95>:
.globl vector95
vector95:
  pushl $0
  1021d5:	6a 00                	push   $0x0
  pushl $95
  1021d7:	6a 5f                	push   $0x5f
  jmp __alltraps
  1021d9:	e9 20 07 00 00       	jmp    1028fe <__alltraps>

001021de <vector96>:
.globl vector96
vector96:
  pushl $0
  1021de:	6a 00                	push   $0x0
  pushl $96
  1021e0:	6a 60                	push   $0x60
  jmp __alltraps
  1021e2:	e9 17 07 00 00       	jmp    1028fe <__alltraps>

001021e7 <vector97>:
.globl vector97
vector97:
  pushl $0
  1021e7:	6a 00                	push   $0x0
  pushl $97
  1021e9:	6a 61                	push   $0x61
  jmp __alltraps
  1021eb:	e9 0e 07 00 00       	jmp    1028fe <__alltraps>

001021f0 <vector98>:
.globl vector98
vector98:
  pushl $0
  1021f0:	6a 00                	push   $0x0
  pushl $98
  1021f2:	6a 62                	push   $0x62
  jmp __alltraps
  1021f4:	e9 05 07 00 00       	jmp    1028fe <__alltraps>

001021f9 <vector99>:
.globl vector99
vector99:
  pushl $0
  1021f9:	6a 00                	push   $0x0
  pushl $99
  1021fb:	6a 63                	push   $0x63
  jmp __alltraps
  1021fd:	e9 fc 06 00 00       	jmp    1028fe <__alltraps>

00102202 <vector100>:
.globl vector100
vector100:
  pushl $0
  102202:	6a 00                	push   $0x0
  pushl $100
  102204:	6a 64                	push   $0x64
  jmp __alltraps
  102206:	e9 f3 06 00 00       	jmp    1028fe <__alltraps>

0010220b <vector101>:
.globl vector101
vector101:
  pushl $0
  10220b:	6a 00                	push   $0x0
  pushl $101
  10220d:	6a 65                	push   $0x65
  jmp __alltraps
  10220f:	e9 ea 06 00 00       	jmp    1028fe <__alltraps>

00102214 <vector102>:
.globl vector102
vector102:
  pushl $0
  102214:	6a 00                	push   $0x0
  pushl $102
  102216:	6a 66                	push   $0x66
  jmp __alltraps
  102218:	e9 e1 06 00 00       	jmp    1028fe <__alltraps>

0010221d <vector103>:
.globl vector103
vector103:
  pushl $0
  10221d:	6a 00                	push   $0x0
  pushl $103
  10221f:	6a 67                	push   $0x67
  jmp __alltraps
  102221:	e9 d8 06 00 00       	jmp    1028fe <__alltraps>

00102226 <vector104>:
.globl vector104
vector104:
  pushl $0
  102226:	6a 00                	push   $0x0
  pushl $104
  102228:	6a 68                	push   $0x68
  jmp __alltraps
  10222a:	e9 cf 06 00 00       	jmp    1028fe <__alltraps>

0010222f <vector105>:
.globl vector105
vector105:
  pushl $0
  10222f:	6a 00                	push   $0x0
  pushl $105
  102231:	6a 69                	push   $0x69
  jmp __alltraps
  102233:	e9 c6 06 00 00       	jmp    1028fe <__alltraps>

00102238 <vector106>:
.globl vector106
vector106:
  pushl $0
  102238:	6a 00                	push   $0x0
  pushl $106
  10223a:	6a 6a                	push   $0x6a
  jmp __alltraps
  10223c:	e9 bd 06 00 00       	jmp    1028fe <__alltraps>

00102241 <vector107>:
.globl vector107
vector107:
  pushl $0
  102241:	6a 00                	push   $0x0
  pushl $107
  102243:	6a 6b                	push   $0x6b
  jmp __alltraps
  102245:	e9 b4 06 00 00       	jmp    1028fe <__alltraps>

0010224a <vector108>:
.globl vector108
vector108:
  pushl $0
  10224a:	6a 00                	push   $0x0
  pushl $108
  10224c:	6a 6c                	push   $0x6c
  jmp __alltraps
  10224e:	e9 ab 06 00 00       	jmp    1028fe <__alltraps>

00102253 <vector109>:
.globl vector109
vector109:
  pushl $0
  102253:	6a 00                	push   $0x0
  pushl $109
  102255:	6a 6d                	push   $0x6d
  jmp __alltraps
  102257:	e9 a2 06 00 00       	jmp    1028fe <__alltraps>

0010225c <vector110>:
.globl vector110
vector110:
  pushl $0
  10225c:	6a 00                	push   $0x0
  pushl $110
  10225e:	6a 6e                	push   $0x6e
  jmp __alltraps
  102260:	e9 99 06 00 00       	jmp    1028fe <__alltraps>

00102265 <vector111>:
.globl vector111
vector111:
  pushl $0
  102265:	6a 00                	push   $0x0
  pushl $111
  102267:	6a 6f                	push   $0x6f
  jmp __alltraps
  102269:	e9 90 06 00 00       	jmp    1028fe <__alltraps>

0010226e <vector112>:
.globl vector112
vector112:
  pushl $0
  10226e:	6a 00                	push   $0x0
  pushl $112
  102270:	6a 70                	push   $0x70
  jmp __alltraps
  102272:	e9 87 06 00 00       	jmp    1028fe <__alltraps>

00102277 <vector113>:
.globl vector113
vector113:
  pushl $0
  102277:	6a 00                	push   $0x0
  pushl $113
  102279:	6a 71                	push   $0x71
  jmp __alltraps
  10227b:	e9 7e 06 00 00       	jmp    1028fe <__alltraps>

00102280 <vector114>:
.globl vector114
vector114:
  pushl $0
  102280:	6a 00                	push   $0x0
  pushl $114
  102282:	6a 72                	push   $0x72
  jmp __alltraps
  102284:	e9 75 06 00 00       	jmp    1028fe <__alltraps>

00102289 <vector115>:
.globl vector115
vector115:
  pushl $0
  102289:	6a 00                	push   $0x0
  pushl $115
  10228b:	6a 73                	push   $0x73
  jmp __alltraps
  10228d:	e9 6c 06 00 00       	jmp    1028fe <__alltraps>

00102292 <vector116>:
.globl vector116
vector116:
  pushl $0
  102292:	6a 00                	push   $0x0
  pushl $116
  102294:	6a 74                	push   $0x74
  jmp __alltraps
  102296:	e9 63 06 00 00       	jmp    1028fe <__alltraps>

0010229b <vector117>:
.globl vector117
vector117:
  pushl $0
  10229b:	6a 00                	push   $0x0
  pushl $117
  10229d:	6a 75                	push   $0x75
  jmp __alltraps
  10229f:	e9 5a 06 00 00       	jmp    1028fe <__alltraps>

001022a4 <vector118>:
.globl vector118
vector118:
  pushl $0
  1022a4:	6a 00                	push   $0x0
  pushl $118
  1022a6:	6a 76                	push   $0x76
  jmp __alltraps
  1022a8:	e9 51 06 00 00       	jmp    1028fe <__alltraps>

001022ad <vector119>:
.globl vector119
vector119:
  pushl $0
  1022ad:	6a 00                	push   $0x0
  pushl $119
  1022af:	6a 77                	push   $0x77
  jmp __alltraps
  1022b1:	e9 48 06 00 00       	jmp    1028fe <__alltraps>

001022b6 <vector120>:
.globl vector120
vector120:
  pushl $0
  1022b6:	6a 00                	push   $0x0
  pushl $120
  1022b8:	6a 78                	push   $0x78
  jmp __alltraps
  1022ba:	e9 3f 06 00 00       	jmp    1028fe <__alltraps>

001022bf <vector121>:
.globl vector121
vector121:
  pushl $0
  1022bf:	6a 00                	push   $0x0
  pushl $121
  1022c1:	6a 79                	push   $0x79
  jmp __alltraps
  1022c3:	e9 36 06 00 00       	jmp    1028fe <__alltraps>

001022c8 <vector122>:
.globl vector122
vector122:
  pushl $0
  1022c8:	6a 00                	push   $0x0
  pushl $122
  1022ca:	6a 7a                	push   $0x7a
  jmp __alltraps
  1022cc:	e9 2d 06 00 00       	jmp    1028fe <__alltraps>

001022d1 <vector123>:
.globl vector123
vector123:
  pushl $0
  1022d1:	6a 00                	push   $0x0
  pushl $123
  1022d3:	6a 7b                	push   $0x7b
  jmp __alltraps
  1022d5:	e9 24 06 00 00       	jmp    1028fe <__alltraps>

001022da <vector124>:
.globl vector124
vector124:
  pushl $0
  1022da:	6a 00                	push   $0x0
  pushl $124
  1022dc:	6a 7c                	push   $0x7c
  jmp __alltraps
  1022de:	e9 1b 06 00 00       	jmp    1028fe <__alltraps>

001022e3 <vector125>:
.globl vector125
vector125:
  pushl $0
  1022e3:	6a 00                	push   $0x0
  pushl $125
  1022e5:	6a 7d                	push   $0x7d
  jmp __alltraps
  1022e7:	e9 12 06 00 00       	jmp    1028fe <__alltraps>

001022ec <vector126>:
.globl vector126
vector126:
  pushl $0
  1022ec:	6a 00                	push   $0x0
  pushl $126
  1022ee:	6a 7e                	push   $0x7e
  jmp __alltraps
  1022f0:	e9 09 06 00 00       	jmp    1028fe <__alltraps>

001022f5 <vector127>:
.globl vector127
vector127:
  pushl $0
  1022f5:	6a 00                	push   $0x0
  pushl $127
  1022f7:	6a 7f                	push   $0x7f
  jmp __alltraps
  1022f9:	e9 00 06 00 00       	jmp    1028fe <__alltraps>

001022fe <vector128>:
.globl vector128
vector128:
  pushl $0
  1022fe:	6a 00                	push   $0x0
  pushl $128
  102300:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102305:	e9 f4 05 00 00       	jmp    1028fe <__alltraps>

0010230a <vector129>:
.globl vector129
vector129:
  pushl $0
  10230a:	6a 00                	push   $0x0
  pushl $129
  10230c:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  102311:	e9 e8 05 00 00       	jmp    1028fe <__alltraps>

00102316 <vector130>:
.globl vector130
vector130:
  pushl $0
  102316:	6a 00                	push   $0x0
  pushl $130
  102318:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  10231d:	e9 dc 05 00 00       	jmp    1028fe <__alltraps>

00102322 <vector131>:
.globl vector131
vector131:
  pushl $0
  102322:	6a 00                	push   $0x0
  pushl $131
  102324:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102329:	e9 d0 05 00 00       	jmp    1028fe <__alltraps>

0010232e <vector132>:
.globl vector132
vector132:
  pushl $0
  10232e:	6a 00                	push   $0x0
  pushl $132
  102330:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102335:	e9 c4 05 00 00       	jmp    1028fe <__alltraps>

0010233a <vector133>:
.globl vector133
vector133:
  pushl $0
  10233a:	6a 00                	push   $0x0
  pushl $133
  10233c:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102341:	e9 b8 05 00 00       	jmp    1028fe <__alltraps>

00102346 <vector134>:
.globl vector134
vector134:
  pushl $0
  102346:	6a 00                	push   $0x0
  pushl $134
  102348:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  10234d:	e9 ac 05 00 00       	jmp    1028fe <__alltraps>

00102352 <vector135>:
.globl vector135
vector135:
  pushl $0
  102352:	6a 00                	push   $0x0
  pushl $135
  102354:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102359:	e9 a0 05 00 00       	jmp    1028fe <__alltraps>

0010235e <vector136>:
.globl vector136
vector136:
  pushl $0
  10235e:	6a 00                	push   $0x0
  pushl $136
  102360:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  102365:	e9 94 05 00 00       	jmp    1028fe <__alltraps>

0010236a <vector137>:
.globl vector137
vector137:
  pushl $0
  10236a:	6a 00                	push   $0x0
  pushl $137
  10236c:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  102371:	e9 88 05 00 00       	jmp    1028fe <__alltraps>

00102376 <vector138>:
.globl vector138
vector138:
  pushl $0
  102376:	6a 00                	push   $0x0
  pushl $138
  102378:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  10237d:	e9 7c 05 00 00       	jmp    1028fe <__alltraps>

00102382 <vector139>:
.globl vector139
vector139:
  pushl $0
  102382:	6a 00                	push   $0x0
  pushl $139
  102384:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  102389:	e9 70 05 00 00       	jmp    1028fe <__alltraps>

0010238e <vector140>:
.globl vector140
vector140:
  pushl $0
  10238e:	6a 00                	push   $0x0
  pushl $140
  102390:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  102395:	e9 64 05 00 00       	jmp    1028fe <__alltraps>

0010239a <vector141>:
.globl vector141
vector141:
  pushl $0
  10239a:	6a 00                	push   $0x0
  pushl $141
  10239c:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1023a1:	e9 58 05 00 00       	jmp    1028fe <__alltraps>

001023a6 <vector142>:
.globl vector142
vector142:
  pushl $0
  1023a6:	6a 00                	push   $0x0
  pushl $142
  1023a8:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1023ad:	e9 4c 05 00 00       	jmp    1028fe <__alltraps>

001023b2 <vector143>:
.globl vector143
vector143:
  pushl $0
  1023b2:	6a 00                	push   $0x0
  pushl $143
  1023b4:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1023b9:	e9 40 05 00 00       	jmp    1028fe <__alltraps>

001023be <vector144>:
.globl vector144
vector144:
  pushl $0
  1023be:	6a 00                	push   $0x0
  pushl $144
  1023c0:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1023c5:	e9 34 05 00 00       	jmp    1028fe <__alltraps>

001023ca <vector145>:
.globl vector145
vector145:
  pushl $0
  1023ca:	6a 00                	push   $0x0
  pushl $145
  1023cc:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  1023d1:	e9 28 05 00 00       	jmp    1028fe <__alltraps>

001023d6 <vector146>:
.globl vector146
vector146:
  pushl $0
  1023d6:	6a 00                	push   $0x0
  pushl $146
  1023d8:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  1023dd:	e9 1c 05 00 00       	jmp    1028fe <__alltraps>

001023e2 <vector147>:
.globl vector147
vector147:
  pushl $0
  1023e2:	6a 00                	push   $0x0
  pushl $147
  1023e4:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  1023e9:	e9 10 05 00 00       	jmp    1028fe <__alltraps>

001023ee <vector148>:
.globl vector148
vector148:
  pushl $0
  1023ee:	6a 00                	push   $0x0
  pushl $148
  1023f0:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  1023f5:	e9 04 05 00 00       	jmp    1028fe <__alltraps>

001023fa <vector149>:
.globl vector149
vector149:
  pushl $0
  1023fa:	6a 00                	push   $0x0
  pushl $149
  1023fc:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102401:	e9 f8 04 00 00       	jmp    1028fe <__alltraps>

00102406 <vector150>:
.globl vector150
vector150:
  pushl $0
  102406:	6a 00                	push   $0x0
  pushl $150
  102408:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  10240d:	e9 ec 04 00 00       	jmp    1028fe <__alltraps>

00102412 <vector151>:
.globl vector151
vector151:
  pushl $0
  102412:	6a 00                	push   $0x0
  pushl $151
  102414:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102419:	e9 e0 04 00 00       	jmp    1028fe <__alltraps>

0010241e <vector152>:
.globl vector152
vector152:
  pushl $0
  10241e:	6a 00                	push   $0x0
  pushl $152
  102420:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102425:	e9 d4 04 00 00       	jmp    1028fe <__alltraps>

0010242a <vector153>:
.globl vector153
vector153:
  pushl $0
  10242a:	6a 00                	push   $0x0
  pushl $153
  10242c:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102431:	e9 c8 04 00 00       	jmp    1028fe <__alltraps>

00102436 <vector154>:
.globl vector154
vector154:
  pushl $0
  102436:	6a 00                	push   $0x0
  pushl $154
  102438:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  10243d:	e9 bc 04 00 00       	jmp    1028fe <__alltraps>

00102442 <vector155>:
.globl vector155
vector155:
  pushl $0
  102442:	6a 00                	push   $0x0
  pushl $155
  102444:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102449:	e9 b0 04 00 00       	jmp    1028fe <__alltraps>

0010244e <vector156>:
.globl vector156
vector156:
  pushl $0
  10244e:	6a 00                	push   $0x0
  pushl $156
  102450:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  102455:	e9 a4 04 00 00       	jmp    1028fe <__alltraps>

0010245a <vector157>:
.globl vector157
vector157:
  pushl $0
  10245a:	6a 00                	push   $0x0
  pushl $157
  10245c:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102461:	e9 98 04 00 00       	jmp    1028fe <__alltraps>

00102466 <vector158>:
.globl vector158
vector158:
  pushl $0
  102466:	6a 00                	push   $0x0
  pushl $158
  102468:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  10246d:	e9 8c 04 00 00       	jmp    1028fe <__alltraps>

00102472 <vector159>:
.globl vector159
vector159:
  pushl $0
  102472:	6a 00                	push   $0x0
  pushl $159
  102474:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  102479:	e9 80 04 00 00       	jmp    1028fe <__alltraps>

0010247e <vector160>:
.globl vector160
vector160:
  pushl $0
  10247e:	6a 00                	push   $0x0
  pushl $160
  102480:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  102485:	e9 74 04 00 00       	jmp    1028fe <__alltraps>

0010248a <vector161>:
.globl vector161
vector161:
  pushl $0
  10248a:	6a 00                	push   $0x0
  pushl $161
  10248c:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  102491:	e9 68 04 00 00       	jmp    1028fe <__alltraps>

00102496 <vector162>:
.globl vector162
vector162:
  pushl $0
  102496:	6a 00                	push   $0x0
  pushl $162
  102498:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  10249d:	e9 5c 04 00 00       	jmp    1028fe <__alltraps>

001024a2 <vector163>:
.globl vector163
vector163:
  pushl $0
  1024a2:	6a 00                	push   $0x0
  pushl $163
  1024a4:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1024a9:	e9 50 04 00 00       	jmp    1028fe <__alltraps>

001024ae <vector164>:
.globl vector164
vector164:
  pushl $0
  1024ae:	6a 00                	push   $0x0
  pushl $164
  1024b0:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1024b5:	e9 44 04 00 00       	jmp    1028fe <__alltraps>

001024ba <vector165>:
.globl vector165
vector165:
  pushl $0
  1024ba:	6a 00                	push   $0x0
  pushl $165
  1024bc:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1024c1:	e9 38 04 00 00       	jmp    1028fe <__alltraps>

001024c6 <vector166>:
.globl vector166
vector166:
  pushl $0
  1024c6:	6a 00                	push   $0x0
  pushl $166
  1024c8:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  1024cd:	e9 2c 04 00 00       	jmp    1028fe <__alltraps>

001024d2 <vector167>:
.globl vector167
vector167:
  pushl $0
  1024d2:	6a 00                	push   $0x0
  pushl $167
  1024d4:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  1024d9:	e9 20 04 00 00       	jmp    1028fe <__alltraps>

001024de <vector168>:
.globl vector168
vector168:
  pushl $0
  1024de:	6a 00                	push   $0x0
  pushl $168
  1024e0:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  1024e5:	e9 14 04 00 00       	jmp    1028fe <__alltraps>

001024ea <vector169>:
.globl vector169
vector169:
  pushl $0
  1024ea:	6a 00                	push   $0x0
  pushl $169
  1024ec:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  1024f1:	e9 08 04 00 00       	jmp    1028fe <__alltraps>

001024f6 <vector170>:
.globl vector170
vector170:
  pushl $0
  1024f6:	6a 00                	push   $0x0
  pushl $170
  1024f8:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  1024fd:	e9 fc 03 00 00       	jmp    1028fe <__alltraps>

00102502 <vector171>:
.globl vector171
vector171:
  pushl $0
  102502:	6a 00                	push   $0x0
  pushl $171
  102504:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102509:	e9 f0 03 00 00       	jmp    1028fe <__alltraps>

0010250e <vector172>:
.globl vector172
vector172:
  pushl $0
  10250e:	6a 00                	push   $0x0
  pushl $172
  102510:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102515:	e9 e4 03 00 00       	jmp    1028fe <__alltraps>

0010251a <vector173>:
.globl vector173
vector173:
  pushl $0
  10251a:	6a 00                	push   $0x0
  pushl $173
  10251c:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  102521:	e9 d8 03 00 00       	jmp    1028fe <__alltraps>

00102526 <vector174>:
.globl vector174
vector174:
  pushl $0
  102526:	6a 00                	push   $0x0
  pushl $174
  102528:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  10252d:	e9 cc 03 00 00       	jmp    1028fe <__alltraps>

00102532 <vector175>:
.globl vector175
vector175:
  pushl $0
  102532:	6a 00                	push   $0x0
  pushl $175
  102534:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102539:	e9 c0 03 00 00       	jmp    1028fe <__alltraps>

0010253e <vector176>:
.globl vector176
vector176:
  pushl $0
  10253e:	6a 00                	push   $0x0
  pushl $176
  102540:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102545:	e9 b4 03 00 00       	jmp    1028fe <__alltraps>

0010254a <vector177>:
.globl vector177
vector177:
  pushl $0
  10254a:	6a 00                	push   $0x0
  pushl $177
  10254c:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  102551:	e9 a8 03 00 00       	jmp    1028fe <__alltraps>

00102556 <vector178>:
.globl vector178
vector178:
  pushl $0
  102556:	6a 00                	push   $0x0
  pushl $178
  102558:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  10255d:	e9 9c 03 00 00       	jmp    1028fe <__alltraps>

00102562 <vector179>:
.globl vector179
vector179:
  pushl $0
  102562:	6a 00                	push   $0x0
  pushl $179
  102564:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  102569:	e9 90 03 00 00       	jmp    1028fe <__alltraps>

0010256e <vector180>:
.globl vector180
vector180:
  pushl $0
  10256e:	6a 00                	push   $0x0
  pushl $180
  102570:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  102575:	e9 84 03 00 00       	jmp    1028fe <__alltraps>

0010257a <vector181>:
.globl vector181
vector181:
  pushl $0
  10257a:	6a 00                	push   $0x0
  pushl $181
  10257c:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  102581:	e9 78 03 00 00       	jmp    1028fe <__alltraps>

00102586 <vector182>:
.globl vector182
vector182:
  pushl $0
  102586:	6a 00                	push   $0x0
  pushl $182
  102588:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  10258d:	e9 6c 03 00 00       	jmp    1028fe <__alltraps>

00102592 <vector183>:
.globl vector183
vector183:
  pushl $0
  102592:	6a 00                	push   $0x0
  pushl $183
  102594:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  102599:	e9 60 03 00 00       	jmp    1028fe <__alltraps>

0010259e <vector184>:
.globl vector184
vector184:
  pushl $0
  10259e:	6a 00                	push   $0x0
  pushl $184
  1025a0:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1025a5:	e9 54 03 00 00       	jmp    1028fe <__alltraps>

001025aa <vector185>:
.globl vector185
vector185:
  pushl $0
  1025aa:	6a 00                	push   $0x0
  pushl $185
  1025ac:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1025b1:	e9 48 03 00 00       	jmp    1028fe <__alltraps>

001025b6 <vector186>:
.globl vector186
vector186:
  pushl $0
  1025b6:	6a 00                	push   $0x0
  pushl $186
  1025b8:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1025bd:	e9 3c 03 00 00       	jmp    1028fe <__alltraps>

001025c2 <vector187>:
.globl vector187
vector187:
  pushl $0
  1025c2:	6a 00                	push   $0x0
  pushl $187
  1025c4:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1025c9:	e9 30 03 00 00       	jmp    1028fe <__alltraps>

001025ce <vector188>:
.globl vector188
vector188:
  pushl $0
  1025ce:	6a 00                	push   $0x0
  pushl $188
  1025d0:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  1025d5:	e9 24 03 00 00       	jmp    1028fe <__alltraps>

001025da <vector189>:
.globl vector189
vector189:
  pushl $0
  1025da:	6a 00                	push   $0x0
  pushl $189
  1025dc:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  1025e1:	e9 18 03 00 00       	jmp    1028fe <__alltraps>

001025e6 <vector190>:
.globl vector190
vector190:
  pushl $0
  1025e6:	6a 00                	push   $0x0
  pushl $190
  1025e8:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  1025ed:	e9 0c 03 00 00       	jmp    1028fe <__alltraps>

001025f2 <vector191>:
.globl vector191
vector191:
  pushl $0
  1025f2:	6a 00                	push   $0x0
  pushl $191
  1025f4:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  1025f9:	e9 00 03 00 00       	jmp    1028fe <__alltraps>

001025fe <vector192>:
.globl vector192
vector192:
  pushl $0
  1025fe:	6a 00                	push   $0x0
  pushl $192
  102600:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102605:	e9 f4 02 00 00       	jmp    1028fe <__alltraps>

0010260a <vector193>:
.globl vector193
vector193:
  pushl $0
  10260a:	6a 00                	push   $0x0
  pushl $193
  10260c:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  102611:	e9 e8 02 00 00       	jmp    1028fe <__alltraps>

00102616 <vector194>:
.globl vector194
vector194:
  pushl $0
  102616:	6a 00                	push   $0x0
  pushl $194
  102618:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  10261d:	e9 dc 02 00 00       	jmp    1028fe <__alltraps>

00102622 <vector195>:
.globl vector195
vector195:
  pushl $0
  102622:	6a 00                	push   $0x0
  pushl $195
  102624:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102629:	e9 d0 02 00 00       	jmp    1028fe <__alltraps>

0010262e <vector196>:
.globl vector196
vector196:
  pushl $0
  10262e:	6a 00                	push   $0x0
  pushl $196
  102630:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102635:	e9 c4 02 00 00       	jmp    1028fe <__alltraps>

0010263a <vector197>:
.globl vector197
vector197:
  pushl $0
  10263a:	6a 00                	push   $0x0
  pushl $197
  10263c:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102641:	e9 b8 02 00 00       	jmp    1028fe <__alltraps>

00102646 <vector198>:
.globl vector198
vector198:
  pushl $0
  102646:	6a 00                	push   $0x0
  pushl $198
  102648:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  10264d:	e9 ac 02 00 00       	jmp    1028fe <__alltraps>

00102652 <vector199>:
.globl vector199
vector199:
  pushl $0
  102652:	6a 00                	push   $0x0
  pushl $199
  102654:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102659:	e9 a0 02 00 00       	jmp    1028fe <__alltraps>

0010265e <vector200>:
.globl vector200
vector200:
  pushl $0
  10265e:	6a 00                	push   $0x0
  pushl $200
  102660:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  102665:	e9 94 02 00 00       	jmp    1028fe <__alltraps>

0010266a <vector201>:
.globl vector201
vector201:
  pushl $0
  10266a:	6a 00                	push   $0x0
  pushl $201
  10266c:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  102671:	e9 88 02 00 00       	jmp    1028fe <__alltraps>

00102676 <vector202>:
.globl vector202
vector202:
  pushl $0
  102676:	6a 00                	push   $0x0
  pushl $202
  102678:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  10267d:	e9 7c 02 00 00       	jmp    1028fe <__alltraps>

00102682 <vector203>:
.globl vector203
vector203:
  pushl $0
  102682:	6a 00                	push   $0x0
  pushl $203
  102684:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  102689:	e9 70 02 00 00       	jmp    1028fe <__alltraps>

0010268e <vector204>:
.globl vector204
vector204:
  pushl $0
  10268e:	6a 00                	push   $0x0
  pushl $204
  102690:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  102695:	e9 64 02 00 00       	jmp    1028fe <__alltraps>

0010269a <vector205>:
.globl vector205
vector205:
  pushl $0
  10269a:	6a 00                	push   $0x0
  pushl $205
  10269c:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1026a1:	e9 58 02 00 00       	jmp    1028fe <__alltraps>

001026a6 <vector206>:
.globl vector206
vector206:
  pushl $0
  1026a6:	6a 00                	push   $0x0
  pushl $206
  1026a8:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1026ad:	e9 4c 02 00 00       	jmp    1028fe <__alltraps>

001026b2 <vector207>:
.globl vector207
vector207:
  pushl $0
  1026b2:	6a 00                	push   $0x0
  pushl $207
  1026b4:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1026b9:	e9 40 02 00 00       	jmp    1028fe <__alltraps>

001026be <vector208>:
.globl vector208
vector208:
  pushl $0
  1026be:	6a 00                	push   $0x0
  pushl $208
  1026c0:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1026c5:	e9 34 02 00 00       	jmp    1028fe <__alltraps>

001026ca <vector209>:
.globl vector209
vector209:
  pushl $0
  1026ca:	6a 00                	push   $0x0
  pushl $209
  1026cc:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  1026d1:	e9 28 02 00 00       	jmp    1028fe <__alltraps>

001026d6 <vector210>:
.globl vector210
vector210:
  pushl $0
  1026d6:	6a 00                	push   $0x0
  pushl $210
  1026d8:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  1026dd:	e9 1c 02 00 00       	jmp    1028fe <__alltraps>

001026e2 <vector211>:
.globl vector211
vector211:
  pushl $0
  1026e2:	6a 00                	push   $0x0
  pushl $211
  1026e4:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  1026e9:	e9 10 02 00 00       	jmp    1028fe <__alltraps>

001026ee <vector212>:
.globl vector212
vector212:
  pushl $0
  1026ee:	6a 00                	push   $0x0
  pushl $212
  1026f0:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  1026f5:	e9 04 02 00 00       	jmp    1028fe <__alltraps>

001026fa <vector213>:
.globl vector213
vector213:
  pushl $0
  1026fa:	6a 00                	push   $0x0
  pushl $213
  1026fc:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102701:	e9 f8 01 00 00       	jmp    1028fe <__alltraps>

00102706 <vector214>:
.globl vector214
vector214:
  pushl $0
  102706:	6a 00                	push   $0x0
  pushl $214
  102708:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  10270d:	e9 ec 01 00 00       	jmp    1028fe <__alltraps>

00102712 <vector215>:
.globl vector215
vector215:
  pushl $0
  102712:	6a 00                	push   $0x0
  pushl $215
  102714:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102719:	e9 e0 01 00 00       	jmp    1028fe <__alltraps>

0010271e <vector216>:
.globl vector216
vector216:
  pushl $0
  10271e:	6a 00                	push   $0x0
  pushl $216
  102720:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102725:	e9 d4 01 00 00       	jmp    1028fe <__alltraps>

0010272a <vector217>:
.globl vector217
vector217:
  pushl $0
  10272a:	6a 00                	push   $0x0
  pushl $217
  10272c:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102731:	e9 c8 01 00 00       	jmp    1028fe <__alltraps>

00102736 <vector218>:
.globl vector218
vector218:
  pushl $0
  102736:	6a 00                	push   $0x0
  pushl $218
  102738:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  10273d:	e9 bc 01 00 00       	jmp    1028fe <__alltraps>

00102742 <vector219>:
.globl vector219
vector219:
  pushl $0
  102742:	6a 00                	push   $0x0
  pushl $219
  102744:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102749:	e9 b0 01 00 00       	jmp    1028fe <__alltraps>

0010274e <vector220>:
.globl vector220
vector220:
  pushl $0
  10274e:	6a 00                	push   $0x0
  pushl $220
  102750:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  102755:	e9 a4 01 00 00       	jmp    1028fe <__alltraps>

0010275a <vector221>:
.globl vector221
vector221:
  pushl $0
  10275a:	6a 00                	push   $0x0
  pushl $221
  10275c:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102761:	e9 98 01 00 00       	jmp    1028fe <__alltraps>

00102766 <vector222>:
.globl vector222
vector222:
  pushl $0
  102766:	6a 00                	push   $0x0
  pushl $222
  102768:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  10276d:	e9 8c 01 00 00       	jmp    1028fe <__alltraps>

00102772 <vector223>:
.globl vector223
vector223:
  pushl $0
  102772:	6a 00                	push   $0x0
  pushl $223
  102774:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  102779:	e9 80 01 00 00       	jmp    1028fe <__alltraps>

0010277e <vector224>:
.globl vector224
vector224:
  pushl $0
  10277e:	6a 00                	push   $0x0
  pushl $224
  102780:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  102785:	e9 74 01 00 00       	jmp    1028fe <__alltraps>

0010278a <vector225>:
.globl vector225
vector225:
  pushl $0
  10278a:	6a 00                	push   $0x0
  pushl $225
  10278c:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  102791:	e9 68 01 00 00       	jmp    1028fe <__alltraps>

00102796 <vector226>:
.globl vector226
vector226:
  pushl $0
  102796:	6a 00                	push   $0x0
  pushl $226
  102798:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  10279d:	e9 5c 01 00 00       	jmp    1028fe <__alltraps>

001027a2 <vector227>:
.globl vector227
vector227:
  pushl $0
  1027a2:	6a 00                	push   $0x0
  pushl $227
  1027a4:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1027a9:	e9 50 01 00 00       	jmp    1028fe <__alltraps>

001027ae <vector228>:
.globl vector228
vector228:
  pushl $0
  1027ae:	6a 00                	push   $0x0
  pushl $228
  1027b0:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1027b5:	e9 44 01 00 00       	jmp    1028fe <__alltraps>

001027ba <vector229>:
.globl vector229
vector229:
  pushl $0
  1027ba:	6a 00                	push   $0x0
  pushl $229
  1027bc:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1027c1:	e9 38 01 00 00       	jmp    1028fe <__alltraps>

001027c6 <vector230>:
.globl vector230
vector230:
  pushl $0
  1027c6:	6a 00                	push   $0x0
  pushl $230
  1027c8:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  1027cd:	e9 2c 01 00 00       	jmp    1028fe <__alltraps>

001027d2 <vector231>:
.globl vector231
vector231:
  pushl $0
  1027d2:	6a 00                	push   $0x0
  pushl $231
  1027d4:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  1027d9:	e9 20 01 00 00       	jmp    1028fe <__alltraps>

001027de <vector232>:
.globl vector232
vector232:
  pushl $0
  1027de:	6a 00                	push   $0x0
  pushl $232
  1027e0:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  1027e5:	e9 14 01 00 00       	jmp    1028fe <__alltraps>

001027ea <vector233>:
.globl vector233
vector233:
  pushl $0
  1027ea:	6a 00                	push   $0x0
  pushl $233
  1027ec:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  1027f1:	e9 08 01 00 00       	jmp    1028fe <__alltraps>

001027f6 <vector234>:
.globl vector234
vector234:
  pushl $0
  1027f6:	6a 00                	push   $0x0
  pushl $234
  1027f8:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  1027fd:	e9 fc 00 00 00       	jmp    1028fe <__alltraps>

00102802 <vector235>:
.globl vector235
vector235:
  pushl $0
  102802:	6a 00                	push   $0x0
  pushl $235
  102804:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102809:	e9 f0 00 00 00       	jmp    1028fe <__alltraps>

0010280e <vector236>:
.globl vector236
vector236:
  pushl $0
  10280e:	6a 00                	push   $0x0
  pushl $236
  102810:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102815:	e9 e4 00 00 00       	jmp    1028fe <__alltraps>

0010281a <vector237>:
.globl vector237
vector237:
  pushl $0
  10281a:	6a 00                	push   $0x0
  pushl $237
  10281c:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102821:	e9 d8 00 00 00       	jmp    1028fe <__alltraps>

00102826 <vector238>:
.globl vector238
vector238:
  pushl $0
  102826:	6a 00                	push   $0x0
  pushl $238
  102828:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  10282d:	e9 cc 00 00 00       	jmp    1028fe <__alltraps>

00102832 <vector239>:
.globl vector239
vector239:
  pushl $0
  102832:	6a 00                	push   $0x0
  pushl $239
  102834:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102839:	e9 c0 00 00 00       	jmp    1028fe <__alltraps>

0010283e <vector240>:
.globl vector240
vector240:
  pushl $0
  10283e:	6a 00                	push   $0x0
  pushl $240
  102840:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102845:	e9 b4 00 00 00       	jmp    1028fe <__alltraps>

0010284a <vector241>:
.globl vector241
vector241:
  pushl $0
  10284a:	6a 00                	push   $0x0
  pushl $241
  10284c:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102851:	e9 a8 00 00 00       	jmp    1028fe <__alltraps>

00102856 <vector242>:
.globl vector242
vector242:
  pushl $0
  102856:	6a 00                	push   $0x0
  pushl $242
  102858:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  10285d:	e9 9c 00 00 00       	jmp    1028fe <__alltraps>

00102862 <vector243>:
.globl vector243
vector243:
  pushl $0
  102862:	6a 00                	push   $0x0
  pushl $243
  102864:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102869:	e9 90 00 00 00       	jmp    1028fe <__alltraps>

0010286e <vector244>:
.globl vector244
vector244:
  pushl $0
  10286e:	6a 00                	push   $0x0
  pushl $244
  102870:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  102875:	e9 84 00 00 00       	jmp    1028fe <__alltraps>

0010287a <vector245>:
.globl vector245
vector245:
  pushl $0
  10287a:	6a 00                	push   $0x0
  pushl $245
  10287c:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  102881:	e9 78 00 00 00       	jmp    1028fe <__alltraps>

00102886 <vector246>:
.globl vector246
vector246:
  pushl $0
  102886:	6a 00                	push   $0x0
  pushl $246
  102888:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  10288d:	e9 6c 00 00 00       	jmp    1028fe <__alltraps>

00102892 <vector247>:
.globl vector247
vector247:
  pushl $0
  102892:	6a 00                	push   $0x0
  pushl $247
  102894:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102899:	e9 60 00 00 00       	jmp    1028fe <__alltraps>

0010289e <vector248>:
.globl vector248
vector248:
  pushl $0
  10289e:	6a 00                	push   $0x0
  pushl $248
  1028a0:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1028a5:	e9 54 00 00 00       	jmp    1028fe <__alltraps>

001028aa <vector249>:
.globl vector249
vector249:
  pushl $0
  1028aa:	6a 00                	push   $0x0
  pushl $249
  1028ac:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1028b1:	e9 48 00 00 00       	jmp    1028fe <__alltraps>

001028b6 <vector250>:
.globl vector250
vector250:
  pushl $0
  1028b6:	6a 00                	push   $0x0
  pushl $250
  1028b8:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1028bd:	e9 3c 00 00 00       	jmp    1028fe <__alltraps>

001028c2 <vector251>:
.globl vector251
vector251:
  pushl $0
  1028c2:	6a 00                	push   $0x0
  pushl $251
  1028c4:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  1028c9:	e9 30 00 00 00       	jmp    1028fe <__alltraps>

001028ce <vector252>:
.globl vector252
vector252:
  pushl $0
  1028ce:	6a 00                	push   $0x0
  pushl $252
  1028d0:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  1028d5:	e9 24 00 00 00       	jmp    1028fe <__alltraps>

001028da <vector253>:
.globl vector253
vector253:
  pushl $0
  1028da:	6a 00                	push   $0x0
  pushl $253
  1028dc:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  1028e1:	e9 18 00 00 00       	jmp    1028fe <__alltraps>

001028e6 <vector254>:
.globl vector254
vector254:
  pushl $0
  1028e6:	6a 00                	push   $0x0
  pushl $254
  1028e8:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  1028ed:	e9 0c 00 00 00       	jmp    1028fe <__alltraps>

001028f2 <vector255>:
.globl vector255
vector255:
  pushl $0
  1028f2:	6a 00                	push   $0x0
  pushl $255
  1028f4:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  1028f9:	e9 00 00 00 00       	jmp    1028fe <__alltraps>

001028fe <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  1028fe:	1e                   	push   %ds
    pushl %es
  1028ff:	06                   	push   %es
    pushl %fs
  102900:	0f a0                	push   %fs
    pushl %gs
  102902:	0f a8                	push   %gs
    pushal
  102904:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  102905:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  10290a:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  10290c:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  10290e:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  10290f:	e8 67 f5 ff ff       	call   101e7b <trap>

    # pop the pushed stack pointer
    popl %esp
  102914:	5c                   	pop    %esp

00102915 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  102915:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  102916:	0f a9                	pop    %gs
    popl %fs
  102918:	0f a1                	pop    %fs
    popl %es
  10291a:	07                   	pop    %es
    popl %ds
  10291b:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  10291c:	83 c4 08             	add    $0x8,%esp
    iret
  10291f:	cf                   	iret   

00102920 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102920:	55                   	push   %ebp
  102921:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102923:	8b 45 08             	mov    0x8(%ebp),%eax
  102926:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102929:	b8 23 00 00 00       	mov    $0x23,%eax
  10292e:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102930:	b8 23 00 00 00       	mov    $0x23,%eax
  102935:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102937:	b8 10 00 00 00       	mov    $0x10,%eax
  10293c:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  10293e:	b8 10 00 00 00       	mov    $0x10,%eax
  102943:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102945:	b8 10 00 00 00       	mov    $0x10,%eax
  10294a:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  10294c:	ea 53 29 10 00 08 00 	ljmp   $0x8,$0x102953
}
  102953:	5d                   	pop    %ebp
  102954:	c3                   	ret    

00102955 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102955:	55                   	push   %ebp
  102956:	89 e5                	mov    %esp,%ebp
  102958:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  10295b:	b8 80 f9 10 00       	mov    $0x10f980,%eax
  102960:	05 00 04 00 00       	add    $0x400,%eax
  102965:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  10296a:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  102971:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102973:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  10297a:	68 00 
  10297c:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102981:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  102987:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  10298c:	c1 e8 10             	shr    $0x10,%eax
  10298f:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  102994:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10299b:	83 e0 f0             	and    $0xfffffff0,%eax
  10299e:	83 c8 09             	or     $0x9,%eax
  1029a1:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1029a6:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1029ad:	83 c8 10             	or     $0x10,%eax
  1029b0:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1029b5:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1029bc:	83 e0 9f             	and    $0xffffff9f,%eax
  1029bf:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1029c4:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1029cb:	83 c8 80             	or     $0xffffff80,%eax
  1029ce:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1029d3:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1029da:	83 e0 f0             	and    $0xfffffff0,%eax
  1029dd:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1029e2:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1029e9:	83 e0 ef             	and    $0xffffffef,%eax
  1029ec:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1029f1:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1029f8:	83 e0 df             	and    $0xffffffdf,%eax
  1029fb:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a00:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a07:	83 c8 40             	or     $0x40,%eax
  102a0a:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a0f:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a16:	83 e0 7f             	and    $0x7f,%eax
  102a19:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a1e:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102a23:	c1 e8 18             	shr    $0x18,%eax
  102a26:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102a2b:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a32:	83 e0 ef             	and    $0xffffffef,%eax
  102a35:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102a3a:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  102a41:	e8 da fe ff ff       	call   102920 <lgdt>
  102a46:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102a4c:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102a50:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102a53:	c9                   	leave  
  102a54:	c3                   	ret    

00102a55 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102a55:	55                   	push   %ebp
  102a56:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102a58:	e8 f8 fe ff ff       	call   102955 <gdt_init>
}
  102a5d:	5d                   	pop    %ebp
  102a5e:	c3                   	ret    

00102a5f <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102a5f:	55                   	push   %ebp
  102a60:	89 e5                	mov    %esp,%ebp
  102a62:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102a65:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102a6c:	eb 04                	jmp    102a72 <strlen+0x13>
        cnt ++;
  102a6e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    while (*s ++ != '\0') {
  102a72:	8b 45 08             	mov    0x8(%ebp),%eax
  102a75:	8d 50 01             	lea    0x1(%eax),%edx
  102a78:	89 55 08             	mov    %edx,0x8(%ebp)
  102a7b:	0f b6 00             	movzbl (%eax),%eax
  102a7e:	84 c0                	test   %al,%al
  102a80:	75 ec                	jne    102a6e <strlen+0xf>
    }
    return cnt;
  102a82:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102a85:	c9                   	leave  
  102a86:	c3                   	ret    

00102a87 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102a87:	55                   	push   %ebp
  102a88:	89 e5                	mov    %esp,%ebp
  102a8a:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102a8d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102a94:	eb 04                	jmp    102a9a <strnlen+0x13>
        cnt ++;
  102a96:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102a9a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102a9d:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102aa0:	73 10                	jae    102ab2 <strnlen+0x2b>
  102aa2:	8b 45 08             	mov    0x8(%ebp),%eax
  102aa5:	8d 50 01             	lea    0x1(%eax),%edx
  102aa8:	89 55 08             	mov    %edx,0x8(%ebp)
  102aab:	0f b6 00             	movzbl (%eax),%eax
  102aae:	84 c0                	test   %al,%al
  102ab0:	75 e4                	jne    102a96 <strnlen+0xf>
    }
    return cnt;
  102ab2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102ab5:	c9                   	leave  
  102ab6:	c3                   	ret    

00102ab7 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102ab7:	55                   	push   %ebp
  102ab8:	89 e5                	mov    %esp,%ebp
  102aba:	57                   	push   %edi
  102abb:	56                   	push   %esi
  102abc:	83 ec 20             	sub    $0x20,%esp
  102abf:	8b 45 08             	mov    0x8(%ebp),%eax
  102ac2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102ac5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ac8:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102acb:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102ace:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ad1:	89 d1                	mov    %edx,%ecx
  102ad3:	89 c2                	mov    %eax,%edx
  102ad5:	89 ce                	mov    %ecx,%esi
  102ad7:	89 d7                	mov    %edx,%edi
  102ad9:	ac                   	lods   %ds:(%esi),%al
  102ada:	aa                   	stos   %al,%es:(%edi)
  102adb:	84 c0                	test   %al,%al
  102add:	75 fa                	jne    102ad9 <strcpy+0x22>
  102adf:	89 fa                	mov    %edi,%edx
  102ae1:	89 f1                	mov    %esi,%ecx
  102ae3:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102ae6:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102ae9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102aec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102aef:	83 c4 20             	add    $0x20,%esp
  102af2:	5e                   	pop    %esi
  102af3:	5f                   	pop    %edi
  102af4:	5d                   	pop    %ebp
  102af5:	c3                   	ret    

00102af6 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102af6:	55                   	push   %ebp
  102af7:	89 e5                	mov    %esp,%ebp
  102af9:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102afc:	8b 45 08             	mov    0x8(%ebp),%eax
  102aff:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102b02:	eb 21                	jmp    102b25 <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  102b04:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b07:	0f b6 10             	movzbl (%eax),%edx
  102b0a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b0d:	88 10                	mov    %dl,(%eax)
  102b0f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b12:	0f b6 00             	movzbl (%eax),%eax
  102b15:	84 c0                	test   %al,%al
  102b17:	74 04                	je     102b1d <strncpy+0x27>
            src ++;
  102b19:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  102b1d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102b21:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    while (len > 0) {
  102b25:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b29:	75 d9                	jne    102b04 <strncpy+0xe>
    }
    return dst;
  102b2b:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102b2e:	c9                   	leave  
  102b2f:	c3                   	ret    

00102b30 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102b30:	55                   	push   %ebp
  102b31:	89 e5                	mov    %esp,%ebp
  102b33:	57                   	push   %edi
  102b34:	56                   	push   %esi
  102b35:	83 ec 20             	sub    $0x20,%esp
  102b38:	8b 45 08             	mov    0x8(%ebp),%eax
  102b3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b3e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b41:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  102b44:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102b47:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b4a:	89 d1                	mov    %edx,%ecx
  102b4c:	89 c2                	mov    %eax,%edx
  102b4e:	89 ce                	mov    %ecx,%esi
  102b50:	89 d7                	mov    %edx,%edi
  102b52:	ac                   	lods   %ds:(%esi),%al
  102b53:	ae                   	scas   %es:(%edi),%al
  102b54:	75 08                	jne    102b5e <strcmp+0x2e>
  102b56:	84 c0                	test   %al,%al
  102b58:	75 f8                	jne    102b52 <strcmp+0x22>
  102b5a:	31 c0                	xor    %eax,%eax
  102b5c:	eb 04                	jmp    102b62 <strcmp+0x32>
  102b5e:	19 c0                	sbb    %eax,%eax
  102b60:	0c 01                	or     $0x1,%al
  102b62:	89 fa                	mov    %edi,%edx
  102b64:	89 f1                	mov    %esi,%ecx
  102b66:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102b69:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102b6c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  102b6f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102b72:	83 c4 20             	add    $0x20,%esp
  102b75:	5e                   	pop    %esi
  102b76:	5f                   	pop    %edi
  102b77:	5d                   	pop    %ebp
  102b78:	c3                   	ret    

00102b79 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102b79:	55                   	push   %ebp
  102b7a:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102b7c:	eb 0c                	jmp    102b8a <strncmp+0x11>
        n --, s1 ++, s2 ++;
  102b7e:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102b82:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102b86:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102b8a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b8e:	74 1a                	je     102baa <strncmp+0x31>
  102b90:	8b 45 08             	mov    0x8(%ebp),%eax
  102b93:	0f b6 00             	movzbl (%eax),%eax
  102b96:	84 c0                	test   %al,%al
  102b98:	74 10                	je     102baa <strncmp+0x31>
  102b9a:	8b 45 08             	mov    0x8(%ebp),%eax
  102b9d:	0f b6 10             	movzbl (%eax),%edx
  102ba0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ba3:	0f b6 00             	movzbl (%eax),%eax
  102ba6:	38 c2                	cmp    %al,%dl
  102ba8:	74 d4                	je     102b7e <strncmp+0x5>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102baa:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102bae:	74 18                	je     102bc8 <strncmp+0x4f>
  102bb0:	8b 45 08             	mov    0x8(%ebp),%eax
  102bb3:	0f b6 00             	movzbl (%eax),%eax
  102bb6:	0f b6 d0             	movzbl %al,%edx
  102bb9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bbc:	0f b6 00             	movzbl (%eax),%eax
  102bbf:	0f b6 c0             	movzbl %al,%eax
  102bc2:	29 c2                	sub    %eax,%edx
  102bc4:	89 d0                	mov    %edx,%eax
  102bc6:	eb 05                	jmp    102bcd <strncmp+0x54>
  102bc8:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102bcd:	5d                   	pop    %ebp
  102bce:	c3                   	ret    

00102bcf <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102bcf:	55                   	push   %ebp
  102bd0:	89 e5                	mov    %esp,%ebp
  102bd2:	83 ec 04             	sub    $0x4,%esp
  102bd5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bd8:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102bdb:	eb 14                	jmp    102bf1 <strchr+0x22>
        if (*s == c) {
  102bdd:	8b 45 08             	mov    0x8(%ebp),%eax
  102be0:	0f b6 00             	movzbl (%eax),%eax
  102be3:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102be6:	75 05                	jne    102bed <strchr+0x1e>
            return (char *)s;
  102be8:	8b 45 08             	mov    0x8(%ebp),%eax
  102beb:	eb 13                	jmp    102c00 <strchr+0x31>
        }
        s ++;
  102bed:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s != '\0') {
  102bf1:	8b 45 08             	mov    0x8(%ebp),%eax
  102bf4:	0f b6 00             	movzbl (%eax),%eax
  102bf7:	84 c0                	test   %al,%al
  102bf9:	75 e2                	jne    102bdd <strchr+0xe>
    }
    return NULL;
  102bfb:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c00:	c9                   	leave  
  102c01:	c3                   	ret    

00102c02 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102c02:	55                   	push   %ebp
  102c03:	89 e5                	mov    %esp,%ebp
  102c05:	83 ec 04             	sub    $0x4,%esp
  102c08:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c0b:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102c0e:	eb 11                	jmp    102c21 <strfind+0x1f>
        if (*s == c) {
  102c10:	8b 45 08             	mov    0x8(%ebp),%eax
  102c13:	0f b6 00             	movzbl (%eax),%eax
  102c16:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102c19:	75 02                	jne    102c1d <strfind+0x1b>
            break;
  102c1b:	eb 0e                	jmp    102c2b <strfind+0x29>
        }
        s ++;
  102c1d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s != '\0') {
  102c21:	8b 45 08             	mov    0x8(%ebp),%eax
  102c24:	0f b6 00             	movzbl (%eax),%eax
  102c27:	84 c0                	test   %al,%al
  102c29:	75 e5                	jne    102c10 <strfind+0xe>
    }
    return (char *)s;
  102c2b:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102c2e:	c9                   	leave  
  102c2f:	c3                   	ret    

00102c30 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102c30:	55                   	push   %ebp
  102c31:	89 e5                	mov    %esp,%ebp
  102c33:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102c36:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102c3d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102c44:	eb 04                	jmp    102c4a <strtol+0x1a>
        s ++;
  102c46:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  102c4a:	8b 45 08             	mov    0x8(%ebp),%eax
  102c4d:	0f b6 00             	movzbl (%eax),%eax
  102c50:	3c 20                	cmp    $0x20,%al
  102c52:	74 f2                	je     102c46 <strtol+0x16>
  102c54:	8b 45 08             	mov    0x8(%ebp),%eax
  102c57:	0f b6 00             	movzbl (%eax),%eax
  102c5a:	3c 09                	cmp    $0x9,%al
  102c5c:	74 e8                	je     102c46 <strtol+0x16>
    }

    // plus/minus sign
    if (*s == '+') {
  102c5e:	8b 45 08             	mov    0x8(%ebp),%eax
  102c61:	0f b6 00             	movzbl (%eax),%eax
  102c64:	3c 2b                	cmp    $0x2b,%al
  102c66:	75 06                	jne    102c6e <strtol+0x3e>
        s ++;
  102c68:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102c6c:	eb 15                	jmp    102c83 <strtol+0x53>
    }
    else if (*s == '-') {
  102c6e:	8b 45 08             	mov    0x8(%ebp),%eax
  102c71:	0f b6 00             	movzbl (%eax),%eax
  102c74:	3c 2d                	cmp    $0x2d,%al
  102c76:	75 0b                	jne    102c83 <strtol+0x53>
        s ++, neg = 1;
  102c78:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102c7c:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102c83:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102c87:	74 06                	je     102c8f <strtol+0x5f>
  102c89:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102c8d:	75 24                	jne    102cb3 <strtol+0x83>
  102c8f:	8b 45 08             	mov    0x8(%ebp),%eax
  102c92:	0f b6 00             	movzbl (%eax),%eax
  102c95:	3c 30                	cmp    $0x30,%al
  102c97:	75 1a                	jne    102cb3 <strtol+0x83>
  102c99:	8b 45 08             	mov    0x8(%ebp),%eax
  102c9c:	83 c0 01             	add    $0x1,%eax
  102c9f:	0f b6 00             	movzbl (%eax),%eax
  102ca2:	3c 78                	cmp    $0x78,%al
  102ca4:	75 0d                	jne    102cb3 <strtol+0x83>
        s += 2, base = 16;
  102ca6:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102caa:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102cb1:	eb 2a                	jmp    102cdd <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  102cb3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102cb7:	75 17                	jne    102cd0 <strtol+0xa0>
  102cb9:	8b 45 08             	mov    0x8(%ebp),%eax
  102cbc:	0f b6 00             	movzbl (%eax),%eax
  102cbf:	3c 30                	cmp    $0x30,%al
  102cc1:	75 0d                	jne    102cd0 <strtol+0xa0>
        s ++, base = 8;
  102cc3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102cc7:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102cce:	eb 0d                	jmp    102cdd <strtol+0xad>
    }
    else if (base == 0) {
  102cd0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102cd4:	75 07                	jne    102cdd <strtol+0xad>
        base = 10;
  102cd6:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102cdd:	8b 45 08             	mov    0x8(%ebp),%eax
  102ce0:	0f b6 00             	movzbl (%eax),%eax
  102ce3:	3c 2f                	cmp    $0x2f,%al
  102ce5:	7e 1b                	jle    102d02 <strtol+0xd2>
  102ce7:	8b 45 08             	mov    0x8(%ebp),%eax
  102cea:	0f b6 00             	movzbl (%eax),%eax
  102ced:	3c 39                	cmp    $0x39,%al
  102cef:	7f 11                	jg     102d02 <strtol+0xd2>
            dig = *s - '0';
  102cf1:	8b 45 08             	mov    0x8(%ebp),%eax
  102cf4:	0f b6 00             	movzbl (%eax),%eax
  102cf7:	0f be c0             	movsbl %al,%eax
  102cfa:	83 e8 30             	sub    $0x30,%eax
  102cfd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d00:	eb 48                	jmp    102d4a <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102d02:	8b 45 08             	mov    0x8(%ebp),%eax
  102d05:	0f b6 00             	movzbl (%eax),%eax
  102d08:	3c 60                	cmp    $0x60,%al
  102d0a:	7e 1b                	jle    102d27 <strtol+0xf7>
  102d0c:	8b 45 08             	mov    0x8(%ebp),%eax
  102d0f:	0f b6 00             	movzbl (%eax),%eax
  102d12:	3c 7a                	cmp    $0x7a,%al
  102d14:	7f 11                	jg     102d27 <strtol+0xf7>
            dig = *s - 'a' + 10;
  102d16:	8b 45 08             	mov    0x8(%ebp),%eax
  102d19:	0f b6 00             	movzbl (%eax),%eax
  102d1c:	0f be c0             	movsbl %al,%eax
  102d1f:	83 e8 57             	sub    $0x57,%eax
  102d22:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d25:	eb 23                	jmp    102d4a <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102d27:	8b 45 08             	mov    0x8(%ebp),%eax
  102d2a:	0f b6 00             	movzbl (%eax),%eax
  102d2d:	3c 40                	cmp    $0x40,%al
  102d2f:	7e 3d                	jle    102d6e <strtol+0x13e>
  102d31:	8b 45 08             	mov    0x8(%ebp),%eax
  102d34:	0f b6 00             	movzbl (%eax),%eax
  102d37:	3c 5a                	cmp    $0x5a,%al
  102d39:	7f 33                	jg     102d6e <strtol+0x13e>
            dig = *s - 'A' + 10;
  102d3b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d3e:	0f b6 00             	movzbl (%eax),%eax
  102d41:	0f be c0             	movsbl %al,%eax
  102d44:	83 e8 37             	sub    $0x37,%eax
  102d47:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102d4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d4d:	3b 45 10             	cmp    0x10(%ebp),%eax
  102d50:	7c 02                	jl     102d54 <strtol+0x124>
            break;
  102d52:	eb 1a                	jmp    102d6e <strtol+0x13e>
        }
        s ++, val = (val * base) + dig;
  102d54:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102d58:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102d5b:	0f af 45 10          	imul   0x10(%ebp),%eax
  102d5f:	89 c2                	mov    %eax,%edx
  102d61:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d64:	01 d0                	add    %edx,%eax
  102d66:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  102d69:	e9 6f ff ff ff       	jmp    102cdd <strtol+0xad>

    if (endptr) {
  102d6e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102d72:	74 08                	je     102d7c <strtol+0x14c>
        *endptr = (char *) s;
  102d74:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d77:	8b 55 08             	mov    0x8(%ebp),%edx
  102d7a:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102d7c:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102d80:	74 07                	je     102d89 <strtol+0x159>
  102d82:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102d85:	f7 d8                	neg    %eax
  102d87:	eb 03                	jmp    102d8c <strtol+0x15c>
  102d89:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102d8c:	c9                   	leave  
  102d8d:	c3                   	ret    

00102d8e <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102d8e:	55                   	push   %ebp
  102d8f:	89 e5                	mov    %esp,%ebp
  102d91:	57                   	push   %edi
  102d92:	83 ec 24             	sub    $0x24,%esp
  102d95:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d98:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102d9b:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  102d9f:	8b 55 08             	mov    0x8(%ebp),%edx
  102da2:	89 55 f8             	mov    %edx,-0x8(%ebp)
  102da5:	88 45 f7             	mov    %al,-0x9(%ebp)
  102da8:	8b 45 10             	mov    0x10(%ebp),%eax
  102dab:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102dae:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102db1:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102db5:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102db8:	89 d7                	mov    %edx,%edi
  102dba:	f3 aa                	rep stos %al,%es:(%edi)
  102dbc:	89 fa                	mov    %edi,%edx
  102dbe:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102dc1:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102dc4:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102dc7:	83 c4 24             	add    $0x24,%esp
  102dca:	5f                   	pop    %edi
  102dcb:	5d                   	pop    %ebp
  102dcc:	c3                   	ret    

00102dcd <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102dcd:	55                   	push   %ebp
  102dce:	89 e5                	mov    %esp,%ebp
  102dd0:	57                   	push   %edi
  102dd1:	56                   	push   %esi
  102dd2:	53                   	push   %ebx
  102dd3:	83 ec 30             	sub    $0x30,%esp
  102dd6:	8b 45 08             	mov    0x8(%ebp),%eax
  102dd9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ddc:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ddf:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102de2:	8b 45 10             	mov    0x10(%ebp),%eax
  102de5:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102de8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102deb:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102dee:	73 42                	jae    102e32 <memmove+0x65>
  102df0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102df3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102df6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102df9:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102dfc:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102dff:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102e02:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102e05:	c1 e8 02             	shr    $0x2,%eax
  102e08:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102e0a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102e0d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e10:	89 d7                	mov    %edx,%edi
  102e12:	89 c6                	mov    %eax,%esi
  102e14:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102e16:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102e19:	83 e1 03             	and    $0x3,%ecx
  102e1c:	74 02                	je     102e20 <memmove+0x53>
  102e1e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102e20:	89 f0                	mov    %esi,%eax
  102e22:	89 fa                	mov    %edi,%edx
  102e24:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102e27:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102e2a:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  102e2d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102e30:	eb 36                	jmp    102e68 <memmove+0x9b>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102e32:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e35:	8d 50 ff             	lea    -0x1(%eax),%edx
  102e38:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e3b:	01 c2                	add    %eax,%edx
  102e3d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e40:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102e43:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e46:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  102e49:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e4c:	89 c1                	mov    %eax,%ecx
  102e4e:	89 d8                	mov    %ebx,%eax
  102e50:	89 d6                	mov    %edx,%esi
  102e52:	89 c7                	mov    %eax,%edi
  102e54:	fd                   	std    
  102e55:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102e57:	fc                   	cld    
  102e58:	89 f8                	mov    %edi,%eax
  102e5a:	89 f2                	mov    %esi,%edx
  102e5c:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102e5f:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102e62:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  102e65:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102e68:	83 c4 30             	add    $0x30,%esp
  102e6b:	5b                   	pop    %ebx
  102e6c:	5e                   	pop    %esi
  102e6d:	5f                   	pop    %edi
  102e6e:	5d                   	pop    %ebp
  102e6f:	c3                   	ret    

00102e70 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102e70:	55                   	push   %ebp
  102e71:	89 e5                	mov    %esp,%ebp
  102e73:	57                   	push   %edi
  102e74:	56                   	push   %esi
  102e75:	83 ec 20             	sub    $0x20,%esp
  102e78:	8b 45 08             	mov    0x8(%ebp),%eax
  102e7b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e7e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e81:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e84:	8b 45 10             	mov    0x10(%ebp),%eax
  102e87:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102e8a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e8d:	c1 e8 02             	shr    $0x2,%eax
  102e90:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102e92:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102e95:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e98:	89 d7                	mov    %edx,%edi
  102e9a:	89 c6                	mov    %eax,%esi
  102e9c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102e9e:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102ea1:	83 e1 03             	and    $0x3,%ecx
  102ea4:	74 02                	je     102ea8 <memcpy+0x38>
  102ea6:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102ea8:	89 f0                	mov    %esi,%eax
  102eaa:	89 fa                	mov    %edi,%edx
  102eac:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102eaf:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102eb2:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  102eb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102eb8:	83 c4 20             	add    $0x20,%esp
  102ebb:	5e                   	pop    %esi
  102ebc:	5f                   	pop    %edi
  102ebd:	5d                   	pop    %ebp
  102ebe:	c3                   	ret    

00102ebf <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102ebf:	55                   	push   %ebp
  102ec0:	89 e5                	mov    %esp,%ebp
  102ec2:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102ec5:	8b 45 08             	mov    0x8(%ebp),%eax
  102ec8:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102ecb:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ece:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102ed1:	eb 30                	jmp    102f03 <memcmp+0x44>
        if (*s1 != *s2) {
  102ed3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ed6:	0f b6 10             	movzbl (%eax),%edx
  102ed9:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102edc:	0f b6 00             	movzbl (%eax),%eax
  102edf:	38 c2                	cmp    %al,%dl
  102ee1:	74 18                	je     102efb <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102ee3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ee6:	0f b6 00             	movzbl (%eax),%eax
  102ee9:	0f b6 d0             	movzbl %al,%edx
  102eec:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102eef:	0f b6 00             	movzbl (%eax),%eax
  102ef2:	0f b6 c0             	movzbl %al,%eax
  102ef5:	29 c2                	sub    %eax,%edx
  102ef7:	89 d0                	mov    %edx,%eax
  102ef9:	eb 1a                	jmp    102f15 <memcmp+0x56>
        }
        s1 ++, s2 ++;
  102efb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102eff:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    while (n -- > 0) {
  102f03:	8b 45 10             	mov    0x10(%ebp),%eax
  102f06:	8d 50 ff             	lea    -0x1(%eax),%edx
  102f09:	89 55 10             	mov    %edx,0x10(%ebp)
  102f0c:	85 c0                	test   %eax,%eax
  102f0e:	75 c3                	jne    102ed3 <memcmp+0x14>
    }
    return 0;
  102f10:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102f15:	c9                   	leave  
  102f16:	c3                   	ret    

00102f17 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102f17:	55                   	push   %ebp
  102f18:	89 e5                	mov    %esp,%ebp
  102f1a:	83 ec 58             	sub    $0x58,%esp
  102f1d:	8b 45 10             	mov    0x10(%ebp),%eax
  102f20:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102f23:	8b 45 14             	mov    0x14(%ebp),%eax
  102f26:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102f29:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102f2c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102f2f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102f32:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102f35:	8b 45 18             	mov    0x18(%ebp),%eax
  102f38:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102f3b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102f3e:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102f41:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102f44:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102f47:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f4a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102f4d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102f51:	74 1c                	je     102f6f <printnum+0x58>
  102f53:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f56:	ba 00 00 00 00       	mov    $0x0,%edx
  102f5b:	f7 75 e4             	divl   -0x1c(%ebp)
  102f5e:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102f61:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f64:	ba 00 00 00 00       	mov    $0x0,%edx
  102f69:	f7 75 e4             	divl   -0x1c(%ebp)
  102f6c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f6f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102f72:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102f75:	f7 75 e4             	divl   -0x1c(%ebp)
  102f78:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102f7b:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102f7e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102f81:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102f84:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102f87:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102f8a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102f8d:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102f90:	8b 45 18             	mov    0x18(%ebp),%eax
  102f93:	ba 00 00 00 00       	mov    $0x0,%edx
  102f98:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102f9b:	77 56                	ja     102ff3 <printnum+0xdc>
  102f9d:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102fa0:	72 05                	jb     102fa7 <printnum+0x90>
  102fa2:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  102fa5:	77 4c                	ja     102ff3 <printnum+0xdc>
        printnum(putch, putdat, result, base, width - 1, padc);
  102fa7:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102faa:	8d 50 ff             	lea    -0x1(%eax),%edx
  102fad:	8b 45 20             	mov    0x20(%ebp),%eax
  102fb0:	89 44 24 18          	mov    %eax,0x18(%esp)
  102fb4:	89 54 24 14          	mov    %edx,0x14(%esp)
  102fb8:	8b 45 18             	mov    0x18(%ebp),%eax
  102fbb:	89 44 24 10          	mov    %eax,0x10(%esp)
  102fbf:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102fc2:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102fc5:	89 44 24 08          	mov    %eax,0x8(%esp)
  102fc9:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102fcd:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fd0:	89 44 24 04          	mov    %eax,0x4(%esp)
  102fd4:	8b 45 08             	mov    0x8(%ebp),%eax
  102fd7:	89 04 24             	mov    %eax,(%esp)
  102fda:	e8 38 ff ff ff       	call   102f17 <printnum>
  102fdf:	eb 1c                	jmp    102ffd <printnum+0xe6>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102fe1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fe4:	89 44 24 04          	mov    %eax,0x4(%esp)
  102fe8:	8b 45 20             	mov    0x20(%ebp),%eax
  102feb:	89 04 24             	mov    %eax,(%esp)
  102fee:	8b 45 08             	mov    0x8(%ebp),%eax
  102ff1:	ff d0                	call   *%eax
        while (-- width > 0)
  102ff3:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  102ff7:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102ffb:	7f e4                	jg     102fe1 <printnum+0xca>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102ffd:	8b 45 d8             	mov    -0x28(%ebp),%eax
  103000:	05 50 3d 10 00       	add    $0x103d50,%eax
  103005:	0f b6 00             	movzbl (%eax),%eax
  103008:	0f be c0             	movsbl %al,%eax
  10300b:	8b 55 0c             	mov    0xc(%ebp),%edx
  10300e:	89 54 24 04          	mov    %edx,0x4(%esp)
  103012:	89 04 24             	mov    %eax,(%esp)
  103015:	8b 45 08             	mov    0x8(%ebp),%eax
  103018:	ff d0                	call   *%eax
}
  10301a:	c9                   	leave  
  10301b:	c3                   	ret    

0010301c <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  10301c:	55                   	push   %ebp
  10301d:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  10301f:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  103023:	7e 14                	jle    103039 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  103025:	8b 45 08             	mov    0x8(%ebp),%eax
  103028:	8b 00                	mov    (%eax),%eax
  10302a:	8d 48 08             	lea    0x8(%eax),%ecx
  10302d:	8b 55 08             	mov    0x8(%ebp),%edx
  103030:	89 0a                	mov    %ecx,(%edx)
  103032:	8b 50 04             	mov    0x4(%eax),%edx
  103035:	8b 00                	mov    (%eax),%eax
  103037:	eb 30                	jmp    103069 <getuint+0x4d>
    }
    else if (lflag) {
  103039:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10303d:	74 16                	je     103055 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  10303f:	8b 45 08             	mov    0x8(%ebp),%eax
  103042:	8b 00                	mov    (%eax),%eax
  103044:	8d 48 04             	lea    0x4(%eax),%ecx
  103047:	8b 55 08             	mov    0x8(%ebp),%edx
  10304a:	89 0a                	mov    %ecx,(%edx)
  10304c:	8b 00                	mov    (%eax),%eax
  10304e:	ba 00 00 00 00       	mov    $0x0,%edx
  103053:	eb 14                	jmp    103069 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  103055:	8b 45 08             	mov    0x8(%ebp),%eax
  103058:	8b 00                	mov    (%eax),%eax
  10305a:	8d 48 04             	lea    0x4(%eax),%ecx
  10305d:	8b 55 08             	mov    0x8(%ebp),%edx
  103060:	89 0a                	mov    %ecx,(%edx)
  103062:	8b 00                	mov    (%eax),%eax
  103064:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  103069:	5d                   	pop    %ebp
  10306a:	c3                   	ret    

0010306b <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  10306b:	55                   	push   %ebp
  10306c:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  10306e:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  103072:	7e 14                	jle    103088 <getint+0x1d>
        return va_arg(*ap, long long);
  103074:	8b 45 08             	mov    0x8(%ebp),%eax
  103077:	8b 00                	mov    (%eax),%eax
  103079:	8d 48 08             	lea    0x8(%eax),%ecx
  10307c:	8b 55 08             	mov    0x8(%ebp),%edx
  10307f:	89 0a                	mov    %ecx,(%edx)
  103081:	8b 50 04             	mov    0x4(%eax),%edx
  103084:	8b 00                	mov    (%eax),%eax
  103086:	eb 28                	jmp    1030b0 <getint+0x45>
    }
    else if (lflag) {
  103088:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10308c:	74 12                	je     1030a0 <getint+0x35>
        return va_arg(*ap, long);
  10308e:	8b 45 08             	mov    0x8(%ebp),%eax
  103091:	8b 00                	mov    (%eax),%eax
  103093:	8d 48 04             	lea    0x4(%eax),%ecx
  103096:	8b 55 08             	mov    0x8(%ebp),%edx
  103099:	89 0a                	mov    %ecx,(%edx)
  10309b:	8b 00                	mov    (%eax),%eax
  10309d:	99                   	cltd   
  10309e:	eb 10                	jmp    1030b0 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  1030a0:	8b 45 08             	mov    0x8(%ebp),%eax
  1030a3:	8b 00                	mov    (%eax),%eax
  1030a5:	8d 48 04             	lea    0x4(%eax),%ecx
  1030a8:	8b 55 08             	mov    0x8(%ebp),%edx
  1030ab:	89 0a                	mov    %ecx,(%edx)
  1030ad:	8b 00                	mov    (%eax),%eax
  1030af:	99                   	cltd   
    }
}
  1030b0:	5d                   	pop    %ebp
  1030b1:	c3                   	ret    

001030b2 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  1030b2:	55                   	push   %ebp
  1030b3:	89 e5                	mov    %esp,%ebp
  1030b5:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  1030b8:	8d 45 14             	lea    0x14(%ebp),%eax
  1030bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  1030be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1030c1:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1030c5:	8b 45 10             	mov    0x10(%ebp),%eax
  1030c8:	89 44 24 08          	mov    %eax,0x8(%esp)
  1030cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030cf:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1030d6:	89 04 24             	mov    %eax,(%esp)
  1030d9:	e8 02 00 00 00       	call   1030e0 <vprintfmt>
    va_end(ap);
}
  1030de:	c9                   	leave  
  1030df:	c3                   	ret    

001030e0 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  1030e0:	55                   	push   %ebp
  1030e1:	89 e5                	mov    %esp,%ebp
  1030e3:	56                   	push   %esi
  1030e4:	53                   	push   %ebx
  1030e5:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  1030e8:	eb 18                	jmp    103102 <vprintfmt+0x22>
            if (ch == '\0') {
  1030ea:	85 db                	test   %ebx,%ebx
  1030ec:	75 05                	jne    1030f3 <vprintfmt+0x13>
                return;
  1030ee:	e9 d1 03 00 00       	jmp    1034c4 <vprintfmt+0x3e4>
            }
            putch(ch, putdat);
  1030f3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030f6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030fa:	89 1c 24             	mov    %ebx,(%esp)
  1030fd:	8b 45 08             	mov    0x8(%ebp),%eax
  103100:	ff d0                	call   *%eax
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  103102:	8b 45 10             	mov    0x10(%ebp),%eax
  103105:	8d 50 01             	lea    0x1(%eax),%edx
  103108:	89 55 10             	mov    %edx,0x10(%ebp)
  10310b:	0f b6 00             	movzbl (%eax),%eax
  10310e:	0f b6 d8             	movzbl %al,%ebx
  103111:	83 fb 25             	cmp    $0x25,%ebx
  103114:	75 d4                	jne    1030ea <vprintfmt+0xa>
        }

        // Process a %-escape sequence
        char padc = ' ';
  103116:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  10311a:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  103121:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103124:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  103127:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  10312e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103131:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  103134:	8b 45 10             	mov    0x10(%ebp),%eax
  103137:	8d 50 01             	lea    0x1(%eax),%edx
  10313a:	89 55 10             	mov    %edx,0x10(%ebp)
  10313d:	0f b6 00             	movzbl (%eax),%eax
  103140:	0f b6 d8             	movzbl %al,%ebx
  103143:	8d 43 dd             	lea    -0x23(%ebx),%eax
  103146:	83 f8 55             	cmp    $0x55,%eax
  103149:	0f 87 44 03 00 00    	ja     103493 <vprintfmt+0x3b3>
  10314f:	8b 04 85 74 3d 10 00 	mov    0x103d74(,%eax,4),%eax
  103156:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  103158:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  10315c:	eb d6                	jmp    103134 <vprintfmt+0x54>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  10315e:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  103162:	eb d0                	jmp    103134 <vprintfmt+0x54>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  103164:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  10316b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10316e:	89 d0                	mov    %edx,%eax
  103170:	c1 e0 02             	shl    $0x2,%eax
  103173:	01 d0                	add    %edx,%eax
  103175:	01 c0                	add    %eax,%eax
  103177:	01 d8                	add    %ebx,%eax
  103179:	83 e8 30             	sub    $0x30,%eax
  10317c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  10317f:	8b 45 10             	mov    0x10(%ebp),%eax
  103182:	0f b6 00             	movzbl (%eax),%eax
  103185:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  103188:	83 fb 2f             	cmp    $0x2f,%ebx
  10318b:	7e 0b                	jle    103198 <vprintfmt+0xb8>
  10318d:	83 fb 39             	cmp    $0x39,%ebx
  103190:	7f 06                	jg     103198 <vprintfmt+0xb8>
            for (precision = 0; ; ++ fmt) {
  103192:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                    break;
                }
            }
  103196:	eb d3                	jmp    10316b <vprintfmt+0x8b>
            goto process_precision;
  103198:	eb 33                	jmp    1031cd <vprintfmt+0xed>

        case '*':
            precision = va_arg(ap, int);
  10319a:	8b 45 14             	mov    0x14(%ebp),%eax
  10319d:	8d 50 04             	lea    0x4(%eax),%edx
  1031a0:	89 55 14             	mov    %edx,0x14(%ebp)
  1031a3:	8b 00                	mov    (%eax),%eax
  1031a5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  1031a8:	eb 23                	jmp    1031cd <vprintfmt+0xed>

        case '.':
            if (width < 0)
  1031aa:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1031ae:	79 0c                	jns    1031bc <vprintfmt+0xdc>
                width = 0;
  1031b0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  1031b7:	e9 78 ff ff ff       	jmp    103134 <vprintfmt+0x54>
  1031bc:	e9 73 ff ff ff       	jmp    103134 <vprintfmt+0x54>

        case '#':
            altflag = 1;
  1031c1:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  1031c8:	e9 67 ff ff ff       	jmp    103134 <vprintfmt+0x54>

        process_precision:
            if (width < 0)
  1031cd:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1031d1:	79 12                	jns    1031e5 <vprintfmt+0x105>
                width = precision, precision = -1;
  1031d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1031d6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1031d9:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  1031e0:	e9 4f ff ff ff       	jmp    103134 <vprintfmt+0x54>
  1031e5:	e9 4a ff ff ff       	jmp    103134 <vprintfmt+0x54>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  1031ea:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  1031ee:	e9 41 ff ff ff       	jmp    103134 <vprintfmt+0x54>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  1031f3:	8b 45 14             	mov    0x14(%ebp),%eax
  1031f6:	8d 50 04             	lea    0x4(%eax),%edx
  1031f9:	89 55 14             	mov    %edx,0x14(%ebp)
  1031fc:	8b 00                	mov    (%eax),%eax
  1031fe:	8b 55 0c             	mov    0xc(%ebp),%edx
  103201:	89 54 24 04          	mov    %edx,0x4(%esp)
  103205:	89 04 24             	mov    %eax,(%esp)
  103208:	8b 45 08             	mov    0x8(%ebp),%eax
  10320b:	ff d0                	call   *%eax
            break;
  10320d:	e9 ac 02 00 00       	jmp    1034be <vprintfmt+0x3de>

        // error message
        case 'e':
            err = va_arg(ap, int);
  103212:	8b 45 14             	mov    0x14(%ebp),%eax
  103215:	8d 50 04             	lea    0x4(%eax),%edx
  103218:	89 55 14             	mov    %edx,0x14(%ebp)
  10321b:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  10321d:	85 db                	test   %ebx,%ebx
  10321f:	79 02                	jns    103223 <vprintfmt+0x143>
                err = -err;
  103221:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  103223:	83 fb 06             	cmp    $0x6,%ebx
  103226:	7f 0b                	jg     103233 <vprintfmt+0x153>
  103228:	8b 34 9d 34 3d 10 00 	mov    0x103d34(,%ebx,4),%esi
  10322f:	85 f6                	test   %esi,%esi
  103231:	75 23                	jne    103256 <vprintfmt+0x176>
                printfmt(putch, putdat, "error %d", err);
  103233:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  103237:	c7 44 24 08 61 3d 10 	movl   $0x103d61,0x8(%esp)
  10323e:	00 
  10323f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103242:	89 44 24 04          	mov    %eax,0x4(%esp)
  103246:	8b 45 08             	mov    0x8(%ebp),%eax
  103249:	89 04 24             	mov    %eax,(%esp)
  10324c:	e8 61 fe ff ff       	call   1030b2 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  103251:	e9 68 02 00 00       	jmp    1034be <vprintfmt+0x3de>
                printfmt(putch, putdat, "%s", p);
  103256:	89 74 24 0c          	mov    %esi,0xc(%esp)
  10325a:	c7 44 24 08 6a 3d 10 	movl   $0x103d6a,0x8(%esp)
  103261:	00 
  103262:	8b 45 0c             	mov    0xc(%ebp),%eax
  103265:	89 44 24 04          	mov    %eax,0x4(%esp)
  103269:	8b 45 08             	mov    0x8(%ebp),%eax
  10326c:	89 04 24             	mov    %eax,(%esp)
  10326f:	e8 3e fe ff ff       	call   1030b2 <printfmt>
            break;
  103274:	e9 45 02 00 00       	jmp    1034be <vprintfmt+0x3de>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  103279:	8b 45 14             	mov    0x14(%ebp),%eax
  10327c:	8d 50 04             	lea    0x4(%eax),%edx
  10327f:	89 55 14             	mov    %edx,0x14(%ebp)
  103282:	8b 30                	mov    (%eax),%esi
  103284:	85 f6                	test   %esi,%esi
  103286:	75 05                	jne    10328d <vprintfmt+0x1ad>
                p = "(null)";
  103288:	be 6d 3d 10 00       	mov    $0x103d6d,%esi
            }
            if (width > 0 && padc != '-') {
  10328d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103291:	7e 3e                	jle    1032d1 <vprintfmt+0x1f1>
  103293:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  103297:	74 38                	je     1032d1 <vprintfmt+0x1f1>
                for (width -= strnlen(p, precision); width > 0; width --) {
  103299:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  10329c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10329f:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032a3:	89 34 24             	mov    %esi,(%esp)
  1032a6:	e8 dc f7 ff ff       	call   102a87 <strnlen>
  1032ab:	29 c3                	sub    %eax,%ebx
  1032ad:	89 d8                	mov    %ebx,%eax
  1032af:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1032b2:	eb 17                	jmp    1032cb <vprintfmt+0x1eb>
                    putch(padc, putdat);
  1032b4:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  1032b8:	8b 55 0c             	mov    0xc(%ebp),%edx
  1032bb:	89 54 24 04          	mov    %edx,0x4(%esp)
  1032bf:	89 04 24             	mov    %eax,(%esp)
  1032c2:	8b 45 08             	mov    0x8(%ebp),%eax
  1032c5:	ff d0                	call   *%eax
                for (width -= strnlen(p, precision); width > 0; width --) {
  1032c7:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  1032cb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1032cf:	7f e3                	jg     1032b4 <vprintfmt+0x1d4>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  1032d1:	eb 38                	jmp    10330b <vprintfmt+0x22b>
                if (altflag && (ch < ' ' || ch > '~')) {
  1032d3:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  1032d7:	74 1f                	je     1032f8 <vprintfmt+0x218>
  1032d9:	83 fb 1f             	cmp    $0x1f,%ebx
  1032dc:	7e 05                	jle    1032e3 <vprintfmt+0x203>
  1032de:	83 fb 7e             	cmp    $0x7e,%ebx
  1032e1:	7e 15                	jle    1032f8 <vprintfmt+0x218>
                    putch('?', putdat);
  1032e3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032e6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032ea:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  1032f1:	8b 45 08             	mov    0x8(%ebp),%eax
  1032f4:	ff d0                	call   *%eax
  1032f6:	eb 0f                	jmp    103307 <vprintfmt+0x227>
                }
                else {
                    putch(ch, putdat);
  1032f8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032fb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032ff:	89 1c 24             	mov    %ebx,(%esp)
  103302:	8b 45 08             	mov    0x8(%ebp),%eax
  103305:	ff d0                	call   *%eax
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103307:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  10330b:	89 f0                	mov    %esi,%eax
  10330d:	8d 70 01             	lea    0x1(%eax),%esi
  103310:	0f b6 00             	movzbl (%eax),%eax
  103313:	0f be d8             	movsbl %al,%ebx
  103316:	85 db                	test   %ebx,%ebx
  103318:	74 10                	je     10332a <vprintfmt+0x24a>
  10331a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  10331e:	78 b3                	js     1032d3 <vprintfmt+0x1f3>
  103320:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  103324:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103328:	79 a9                	jns    1032d3 <vprintfmt+0x1f3>
                }
            }
            for (; width > 0; width --) {
  10332a:	eb 17                	jmp    103343 <vprintfmt+0x263>
                putch(' ', putdat);
  10332c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10332f:	89 44 24 04          	mov    %eax,0x4(%esp)
  103333:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10333a:	8b 45 08             	mov    0x8(%ebp),%eax
  10333d:	ff d0                	call   *%eax
            for (; width > 0; width --) {
  10333f:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  103343:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103347:	7f e3                	jg     10332c <vprintfmt+0x24c>
            }
            break;
  103349:	e9 70 01 00 00       	jmp    1034be <vprintfmt+0x3de>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  10334e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103351:	89 44 24 04          	mov    %eax,0x4(%esp)
  103355:	8d 45 14             	lea    0x14(%ebp),%eax
  103358:	89 04 24             	mov    %eax,(%esp)
  10335b:	e8 0b fd ff ff       	call   10306b <getint>
  103360:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103363:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  103366:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103369:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10336c:	85 d2                	test   %edx,%edx
  10336e:	79 26                	jns    103396 <vprintfmt+0x2b6>
                putch('-', putdat);
  103370:	8b 45 0c             	mov    0xc(%ebp),%eax
  103373:	89 44 24 04          	mov    %eax,0x4(%esp)
  103377:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  10337e:	8b 45 08             	mov    0x8(%ebp),%eax
  103381:	ff d0                	call   *%eax
                num = -(long long)num;
  103383:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103386:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103389:	f7 d8                	neg    %eax
  10338b:	83 d2 00             	adc    $0x0,%edx
  10338e:	f7 da                	neg    %edx
  103390:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103393:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  103396:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  10339d:	e9 a8 00 00 00       	jmp    10344a <vprintfmt+0x36a>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  1033a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1033a5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033a9:	8d 45 14             	lea    0x14(%ebp),%eax
  1033ac:	89 04 24             	mov    %eax,(%esp)
  1033af:	e8 68 fc ff ff       	call   10301c <getuint>
  1033b4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033b7:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  1033ba:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1033c1:	e9 84 00 00 00       	jmp    10344a <vprintfmt+0x36a>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  1033c6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1033c9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033cd:	8d 45 14             	lea    0x14(%ebp),%eax
  1033d0:	89 04 24             	mov    %eax,(%esp)
  1033d3:	e8 44 fc ff ff       	call   10301c <getuint>
  1033d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033db:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  1033de:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  1033e5:	eb 63                	jmp    10344a <vprintfmt+0x36a>

        // pointer
        case 'p':
            putch('0', putdat);
  1033e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033ea:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033ee:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  1033f5:	8b 45 08             	mov    0x8(%ebp),%eax
  1033f8:	ff d0                	call   *%eax
            putch('x', putdat);
  1033fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033fd:	89 44 24 04          	mov    %eax,0x4(%esp)
  103401:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  103408:	8b 45 08             	mov    0x8(%ebp),%eax
  10340b:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  10340d:	8b 45 14             	mov    0x14(%ebp),%eax
  103410:	8d 50 04             	lea    0x4(%eax),%edx
  103413:	89 55 14             	mov    %edx,0x14(%ebp)
  103416:	8b 00                	mov    (%eax),%eax
  103418:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10341b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  103422:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  103429:	eb 1f                	jmp    10344a <vprintfmt+0x36a>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  10342b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10342e:	89 44 24 04          	mov    %eax,0x4(%esp)
  103432:	8d 45 14             	lea    0x14(%ebp),%eax
  103435:	89 04 24             	mov    %eax,(%esp)
  103438:	e8 df fb ff ff       	call   10301c <getuint>
  10343d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103440:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  103443:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  10344a:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  10344e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103451:	89 54 24 18          	mov    %edx,0x18(%esp)
  103455:	8b 55 e8             	mov    -0x18(%ebp),%edx
  103458:	89 54 24 14          	mov    %edx,0x14(%esp)
  10345c:	89 44 24 10          	mov    %eax,0x10(%esp)
  103460:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103463:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103466:	89 44 24 08          	mov    %eax,0x8(%esp)
  10346a:	89 54 24 0c          	mov    %edx,0xc(%esp)
  10346e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103471:	89 44 24 04          	mov    %eax,0x4(%esp)
  103475:	8b 45 08             	mov    0x8(%ebp),%eax
  103478:	89 04 24             	mov    %eax,(%esp)
  10347b:	e8 97 fa ff ff       	call   102f17 <printnum>
            break;
  103480:	eb 3c                	jmp    1034be <vprintfmt+0x3de>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  103482:	8b 45 0c             	mov    0xc(%ebp),%eax
  103485:	89 44 24 04          	mov    %eax,0x4(%esp)
  103489:	89 1c 24             	mov    %ebx,(%esp)
  10348c:	8b 45 08             	mov    0x8(%ebp),%eax
  10348f:	ff d0                	call   *%eax
            break;
  103491:	eb 2b                	jmp    1034be <vprintfmt+0x3de>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  103493:	8b 45 0c             	mov    0xc(%ebp),%eax
  103496:	89 44 24 04          	mov    %eax,0x4(%esp)
  10349a:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  1034a1:	8b 45 08             	mov    0x8(%ebp),%eax
  1034a4:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  1034a6:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  1034aa:	eb 04                	jmp    1034b0 <vprintfmt+0x3d0>
  1034ac:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  1034b0:	8b 45 10             	mov    0x10(%ebp),%eax
  1034b3:	83 e8 01             	sub    $0x1,%eax
  1034b6:	0f b6 00             	movzbl (%eax),%eax
  1034b9:	3c 25                	cmp    $0x25,%al
  1034bb:	75 ef                	jne    1034ac <vprintfmt+0x3cc>
                /* do nothing */;
            break;
  1034bd:	90                   	nop
        }
    }
  1034be:	90                   	nop
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  1034bf:	e9 3e fc ff ff       	jmp    103102 <vprintfmt+0x22>
}
  1034c4:	83 c4 40             	add    $0x40,%esp
  1034c7:	5b                   	pop    %ebx
  1034c8:	5e                   	pop    %esi
  1034c9:	5d                   	pop    %ebp
  1034ca:	c3                   	ret    

001034cb <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  1034cb:	55                   	push   %ebp
  1034cc:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  1034ce:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034d1:	8b 40 08             	mov    0x8(%eax),%eax
  1034d4:	8d 50 01             	lea    0x1(%eax),%edx
  1034d7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034da:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  1034dd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034e0:	8b 10                	mov    (%eax),%edx
  1034e2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034e5:	8b 40 04             	mov    0x4(%eax),%eax
  1034e8:	39 c2                	cmp    %eax,%edx
  1034ea:	73 12                	jae    1034fe <sprintputch+0x33>
        *b->buf ++ = ch;
  1034ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034ef:	8b 00                	mov    (%eax),%eax
  1034f1:	8d 48 01             	lea    0x1(%eax),%ecx
  1034f4:	8b 55 0c             	mov    0xc(%ebp),%edx
  1034f7:	89 0a                	mov    %ecx,(%edx)
  1034f9:	8b 55 08             	mov    0x8(%ebp),%edx
  1034fc:	88 10                	mov    %dl,(%eax)
    }
}
  1034fe:	5d                   	pop    %ebp
  1034ff:	c3                   	ret    

00103500 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  103500:	55                   	push   %ebp
  103501:	89 e5                	mov    %esp,%ebp
  103503:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  103506:	8d 45 14             	lea    0x14(%ebp),%eax
  103509:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  10350c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10350f:	89 44 24 0c          	mov    %eax,0xc(%esp)
  103513:	8b 45 10             	mov    0x10(%ebp),%eax
  103516:	89 44 24 08          	mov    %eax,0x8(%esp)
  10351a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10351d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103521:	8b 45 08             	mov    0x8(%ebp),%eax
  103524:	89 04 24             	mov    %eax,(%esp)
  103527:	e8 08 00 00 00       	call   103534 <vsnprintf>
  10352c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10352f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103532:	c9                   	leave  
  103533:	c3                   	ret    

00103534 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  103534:	55                   	push   %ebp
  103535:	89 e5                	mov    %esp,%ebp
  103537:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  10353a:	8b 45 08             	mov    0x8(%ebp),%eax
  10353d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103540:	8b 45 0c             	mov    0xc(%ebp),%eax
  103543:	8d 50 ff             	lea    -0x1(%eax),%edx
  103546:	8b 45 08             	mov    0x8(%ebp),%eax
  103549:	01 d0                	add    %edx,%eax
  10354b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10354e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  103555:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  103559:	74 0a                	je     103565 <vsnprintf+0x31>
  10355b:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10355e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103561:	39 c2                	cmp    %eax,%edx
  103563:	76 07                	jbe    10356c <vsnprintf+0x38>
        return -E_INVAL;
  103565:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  10356a:	eb 2a                	jmp    103596 <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  10356c:	8b 45 14             	mov    0x14(%ebp),%eax
  10356f:	89 44 24 0c          	mov    %eax,0xc(%esp)
  103573:	8b 45 10             	mov    0x10(%ebp),%eax
  103576:	89 44 24 08          	mov    %eax,0x8(%esp)
  10357a:	8d 45 ec             	lea    -0x14(%ebp),%eax
  10357d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103581:	c7 04 24 cb 34 10 00 	movl   $0x1034cb,(%esp)
  103588:	e8 53 fb ff ff       	call   1030e0 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  10358d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103590:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  103593:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103596:	c9                   	leave  
  103597:	c3                   	ret    
