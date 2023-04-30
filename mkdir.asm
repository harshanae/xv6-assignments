
_mkdir:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	bf 01 00 00 00       	mov    $0x1,%edi
  13:	56                   	push   %esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 59 04             	mov    0x4(%ecx),%ebx
  1c:	8b 31                	mov    (%ecx),%esi
  1e:	83 c3 04             	add    $0x4,%ebx
  int i;

  if(argc < 2){
  21:	83 fe 01             	cmp    $0x1,%esi
  24:	7e 3e                	jle    64 <main+0x64>
  26:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  2d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(mkdir(argv[i]) < 0){
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 33                	push   (%ebx)
  35:	e8 01 03 00 00       	call   33b <mkdir>
  3a:	83 c4 10             	add    $0x10,%esp
  3d:	85 c0                	test   %eax,%eax
  3f:	78 0f                	js     50 <main+0x50>
  for(i = 1; i < argc; i++){
  41:	83 c7 01             	add    $0x1,%edi
  44:	83 c3 04             	add    $0x4,%ebx
  47:	39 fe                	cmp    %edi,%esi
  49:	75 e5                	jne    30 <main+0x30>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      break;
    }
  }

  exit();
  4b:	e8 83 02 00 00       	call   2d3 <exit>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  50:	50                   	push   %eax
  51:	ff 33                	push   (%ebx)
  53:	68 af 07 00 00       	push   $0x7af
  58:	6a 02                	push   $0x2
  5a:	e8 11 04 00 00       	call   470 <printf>
      break;
  5f:	83 c4 10             	add    $0x10,%esp
  62:	eb e7                	jmp    4b <main+0x4b>
    printf(2, "Usage: mkdir files...\n");
  64:	52                   	push   %edx
  65:	52                   	push   %edx
  66:	68 98 07 00 00       	push   $0x798
  6b:	6a 02                	push   $0x2
  6d:	e8 fe 03 00 00       	call   470 <printf>
    exit();
  72:	e8 5c 02 00 00       	call   2d3 <exit>
  77:	66 90                	xchg   %ax,%ax
  79:	66 90                	xchg   %ax,%ax
  7b:	66 90                	xchg   %ax,%ax
  7d:	66 90                	xchg   %ax,%ax
  7f:	90                   	nop

00000080 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  80:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  81:	31 c0                	xor    %eax,%eax
{
  83:	89 e5                	mov    %esp,%ebp
  85:	53                   	push   %ebx
  86:	8b 4d 08             	mov    0x8(%ebp),%ecx
  89:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  90:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  94:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  97:	83 c0 01             	add    $0x1,%eax
  9a:	84 d2                	test   %dl,%dl
  9c:	75 f2                	jne    90 <strcpy+0x10>
    ;
  return os;
}
  9e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  a1:	89 c8                	mov    %ecx,%eax
  a3:	c9                   	leave  
  a4:	c3                   	ret    
  a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	53                   	push   %ebx
  b4:	8b 55 08             	mov    0x8(%ebp),%edx
  b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  ba:	0f b6 02             	movzbl (%edx),%eax
  bd:	84 c0                	test   %al,%al
  bf:	75 17                	jne    d8 <strcmp+0x28>
  c1:	eb 3a                	jmp    fd <strcmp+0x4d>
  c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  c7:	90                   	nop
  c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  cc:	83 c2 01             	add    $0x1,%edx
  cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  d2:	84 c0                	test   %al,%al
  d4:	74 1a                	je     f0 <strcmp+0x40>
    p++, q++;
  d6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  d8:	0f b6 19             	movzbl (%ecx),%ebx
  db:	38 c3                	cmp    %al,%bl
  dd:	74 e9                	je     c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  df:	29 d8                	sub    %ebx,%eax
}
  e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  e4:	c9                   	leave  
  e5:	c3                   	ret    
  e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ed:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  f4:	31 c0                	xor    %eax,%eax
  f6:	29 d8                	sub    %ebx,%eax
}
  f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  fb:	c9                   	leave  
  fc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
  fd:	0f b6 19             	movzbl (%ecx),%ebx
 100:	31 c0                	xor    %eax,%eax
 102:	eb db                	jmp    df <strcmp+0x2f>
 104:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 10f:	90                   	nop

00000110 <strlen>:

uint
strlen(const char *s)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 116:	80 3a 00             	cmpb   $0x0,(%edx)
 119:	74 15                	je     130 <strlen+0x20>
 11b:	31 c0                	xor    %eax,%eax
 11d:	8d 76 00             	lea    0x0(%esi),%esi
 120:	83 c0 01             	add    $0x1,%eax
 123:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 127:	89 c1                	mov    %eax,%ecx
 129:	75 f5                	jne    120 <strlen+0x10>
    ;
  return n;
}
 12b:	89 c8                	mov    %ecx,%eax
 12d:	5d                   	pop    %ebp
 12e:	c3                   	ret    
 12f:	90                   	nop
  for(n = 0; s[n]; n++)
 130:	31 c9                	xor    %ecx,%ecx
}
 132:	5d                   	pop    %ebp
 133:	89 c8                	mov    %ecx,%eax
 135:	c3                   	ret    
 136:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13d:	8d 76 00             	lea    0x0(%esi),%esi

00000140 <memset>:

void*
memset(void *dst, int c, uint n)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	57                   	push   %edi
 144:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 147:	8b 4d 10             	mov    0x10(%ebp),%ecx
 14a:	8b 45 0c             	mov    0xc(%ebp),%eax
 14d:	89 d7                	mov    %edx,%edi
 14f:	fc                   	cld    
 150:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 152:	8b 7d fc             	mov    -0x4(%ebp),%edi
 155:	89 d0                	mov    %edx,%eax
 157:	c9                   	leave  
 158:	c3                   	ret    
 159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000160 <strchr>:

char*
strchr(const char *s, char c)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 16a:	0f b6 10             	movzbl (%eax),%edx
 16d:	84 d2                	test   %dl,%dl
 16f:	75 12                	jne    183 <strchr+0x23>
 171:	eb 1d                	jmp    190 <strchr+0x30>
 173:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 177:	90                   	nop
 178:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 17c:	83 c0 01             	add    $0x1,%eax
 17f:	84 d2                	test   %dl,%dl
 181:	74 0d                	je     190 <strchr+0x30>
    if(*s == c)
 183:	38 d1                	cmp    %dl,%cl
 185:	75 f1                	jne    178 <strchr+0x18>
      return (char*)s;
  return 0;
}
 187:	5d                   	pop    %ebp
 188:	c3                   	ret    
 189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 190:	31 c0                	xor    %eax,%eax
}
 192:	5d                   	pop    %ebp
 193:	c3                   	ret    
 194:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 19f:	90                   	nop

000001a0 <gets>:

char*
gets(char *buf, int max)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	57                   	push   %edi
 1a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1a5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 1a8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 1a9:	31 db                	xor    %ebx,%ebx
{
 1ab:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 1ae:	eb 27                	jmp    1d7 <gets+0x37>
    cc = read(0, &c, 1);
 1b0:	83 ec 04             	sub    $0x4,%esp
 1b3:	6a 01                	push   $0x1
 1b5:	57                   	push   %edi
 1b6:	6a 00                	push   $0x0
 1b8:	e8 2e 01 00 00       	call   2eb <read>
    if(cc < 1)
 1bd:	83 c4 10             	add    $0x10,%esp
 1c0:	85 c0                	test   %eax,%eax
 1c2:	7e 1d                	jle    1e1 <gets+0x41>
      break;
    buf[i++] = c;
 1c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1c8:	8b 55 08             	mov    0x8(%ebp),%edx
 1cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1cf:	3c 0a                	cmp    $0xa,%al
 1d1:	74 1d                	je     1f0 <gets+0x50>
 1d3:	3c 0d                	cmp    $0xd,%al
 1d5:	74 19                	je     1f0 <gets+0x50>
  for(i=0; i+1 < max; ){
 1d7:	89 de                	mov    %ebx,%esi
 1d9:	83 c3 01             	add    $0x1,%ebx
 1dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1df:	7c cf                	jl     1b0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 1e1:	8b 45 08             	mov    0x8(%ebp),%eax
 1e4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1eb:	5b                   	pop    %ebx
 1ec:	5e                   	pop    %esi
 1ed:	5f                   	pop    %edi
 1ee:	5d                   	pop    %ebp
 1ef:	c3                   	ret    
  buf[i] = '\0';
 1f0:	8b 45 08             	mov    0x8(%ebp),%eax
 1f3:	89 de                	mov    %ebx,%esi
 1f5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 1f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1fc:	5b                   	pop    %ebx
 1fd:	5e                   	pop    %esi
 1fe:	5f                   	pop    %edi
 1ff:	5d                   	pop    %ebp
 200:	c3                   	ret    
 201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 208:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20f:	90                   	nop

00000210 <stat>:

int
stat(const char *n, struct stat *st)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	56                   	push   %esi
 214:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 215:	83 ec 08             	sub    $0x8,%esp
 218:	6a 00                	push   $0x0
 21a:	ff 75 08             	push   0x8(%ebp)
 21d:	e8 f1 00 00 00       	call   313 <open>
  if(fd < 0)
 222:	83 c4 10             	add    $0x10,%esp
 225:	85 c0                	test   %eax,%eax
 227:	78 27                	js     250 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 229:	83 ec 08             	sub    $0x8,%esp
 22c:	ff 75 0c             	push   0xc(%ebp)
 22f:	89 c3                	mov    %eax,%ebx
 231:	50                   	push   %eax
 232:	e8 f4 00 00 00       	call   32b <fstat>
  close(fd);
 237:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 23a:	89 c6                	mov    %eax,%esi
  close(fd);
 23c:	e8 ba 00 00 00       	call   2fb <close>
  return r;
 241:	83 c4 10             	add    $0x10,%esp
}
 244:	8d 65 f8             	lea    -0x8(%ebp),%esp
 247:	89 f0                	mov    %esi,%eax
 249:	5b                   	pop    %ebx
 24a:	5e                   	pop    %esi
 24b:	5d                   	pop    %ebp
 24c:	c3                   	ret    
 24d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 250:	be ff ff ff ff       	mov    $0xffffffff,%esi
 255:	eb ed                	jmp    244 <stat+0x34>
 257:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25e:	66 90                	xchg   %ax,%ax

00000260 <atoi>:

int
atoi(const char *s)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	53                   	push   %ebx
 264:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 267:	0f be 02             	movsbl (%edx),%eax
 26a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 26d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 270:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 275:	77 1e                	ja     295 <atoi+0x35>
 277:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 280:	83 c2 01             	add    $0x1,%edx
 283:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 286:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 28a:	0f be 02             	movsbl (%edx),%eax
 28d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 290:	80 fb 09             	cmp    $0x9,%bl
 293:	76 eb                	jbe    280 <atoi+0x20>
  return n;
}
 295:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 298:	89 c8                	mov    %ecx,%eax
 29a:	c9                   	leave  
 29b:	c3                   	ret    
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	8b 45 10             	mov    0x10(%ebp),%eax
 2a7:	8b 55 08             	mov    0x8(%ebp),%edx
 2aa:	56                   	push   %esi
 2ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2ae:	85 c0                	test   %eax,%eax
 2b0:	7e 13                	jle    2c5 <memmove+0x25>
 2b2:	01 d0                	add    %edx,%eax
  dst = vdst;
 2b4:	89 d7                	mov    %edx,%edi
 2b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2c1:	39 f8                	cmp    %edi,%eax
 2c3:	75 fb                	jne    2c0 <memmove+0x20>
  return vdst;
}
 2c5:	5e                   	pop    %esi
 2c6:	89 d0                	mov    %edx,%eax
 2c8:	5f                   	pop    %edi
 2c9:	5d                   	pop    %ebp
 2ca:	c3                   	ret    

000002cb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2cb:	b8 01 00 00 00       	mov    $0x1,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <exit>:
SYSCALL(exit)
 2d3:	b8 02 00 00 00       	mov    $0x2,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <wait>:
SYSCALL(wait)
 2db:	b8 03 00 00 00       	mov    $0x3,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <pipe>:
SYSCALL(pipe)
 2e3:	b8 04 00 00 00       	mov    $0x4,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <read>:
SYSCALL(read)
 2eb:	b8 05 00 00 00       	mov    $0x5,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <write>:
SYSCALL(write)
 2f3:	b8 10 00 00 00       	mov    $0x10,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <close>:
SYSCALL(close)
 2fb:	b8 15 00 00 00       	mov    $0x15,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <kill>:
SYSCALL(kill)
 303:	b8 06 00 00 00       	mov    $0x6,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <exec>:
SYSCALL(exec)
 30b:	b8 07 00 00 00       	mov    $0x7,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <open>:
SYSCALL(open)
 313:	b8 0f 00 00 00       	mov    $0xf,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <mknod>:
SYSCALL(mknod)
 31b:	b8 11 00 00 00       	mov    $0x11,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <unlink>:
SYSCALL(unlink)
 323:	b8 12 00 00 00       	mov    $0x12,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <fstat>:
SYSCALL(fstat)
 32b:	b8 08 00 00 00       	mov    $0x8,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <link>:
SYSCALL(link)
 333:	b8 13 00 00 00       	mov    $0x13,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <mkdir>:
SYSCALL(mkdir)
 33b:	b8 14 00 00 00       	mov    $0x14,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <chdir>:
SYSCALL(chdir)
 343:	b8 09 00 00 00       	mov    $0x9,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <dup>:
SYSCALL(dup)
 34b:	b8 0a 00 00 00       	mov    $0xa,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <getpid>:
SYSCALL(getpid)
 353:	b8 0b 00 00 00       	mov    $0xb,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <sbrk>:
SYSCALL(sbrk)
 35b:	b8 0c 00 00 00       	mov    $0xc,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <sleep>:
SYSCALL(sleep)
 363:	b8 0d 00 00 00       	mov    $0xd,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <uptime>:
SYSCALL(uptime)
 36b:	b8 0e 00 00 00       	mov    $0xe,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <getyear>:
SYSCALL(getyear)
 373:	b8 16 00 00 00       	mov    $0x16,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <getmysize>:
SYSCALL(getmysize)
 37b:	b8 17 00 00 00       	mov    $0x17,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <getkernelendaddr>:
SYSCALL(getkernelendaddr)
 383:	b8 19 00 00 00       	mov    $0x19,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <getkernelstartaddr>:
SYSCALL(getkernelstartaddr)
 38b:	b8 18 00 00 00       	mov    $0x18,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <getkernelvariaddr>:
SYSCALL(getkernelvariaddr)
 393:	b8 1a 00 00 00       	mov    $0x1a,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <getsystemcalladdr>:
SYSCALL(getsystemcalladdr)
 39b:	b8 1b 00 00 00       	mov    $0x1b,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <setpriority>:
SYSCALL(setpriority)
 3a3:	b8 1c 00 00 00       	mov    $0x1c,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <getinodesize>:
SYSCALL(getinodesize)
 3ab:	b8 1d 00 00 00       	mov    $0x1d,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <mycall>:
SYSCALL(mycall)
 3b3:	b8 1e 00 00 00       	mov    $0x1e,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    
 3bb:	66 90                	xchg   %ax,%ax
 3bd:	66 90                	xchg   %ax,%ax
 3bf:	90                   	nop

000003c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	56                   	push   %esi
 3c5:	53                   	push   %ebx
 3c6:	83 ec 3c             	sub    $0x3c,%esp
 3c9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3cc:	89 d1                	mov    %edx,%ecx
{
 3ce:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 3d1:	85 d2                	test   %edx,%edx
 3d3:	0f 89 7f 00 00 00    	jns    458 <printint+0x98>
 3d9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 3dd:	74 79                	je     458 <printint+0x98>
    neg = 1;
 3df:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 3e6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 3e8:	31 db                	xor    %ebx,%ebx
 3ea:	8d 75 d7             	lea    -0x29(%ebp),%esi
 3ed:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3f0:	89 c8                	mov    %ecx,%eax
 3f2:	31 d2                	xor    %edx,%edx
 3f4:	89 cf                	mov    %ecx,%edi
 3f6:	f7 75 c4             	divl   -0x3c(%ebp)
 3f9:	0f b6 92 2c 08 00 00 	movzbl 0x82c(%edx),%edx
 400:	89 45 c0             	mov    %eax,-0x40(%ebp)
 403:	89 d8                	mov    %ebx,%eax
 405:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 408:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 40b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 40e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 411:	76 dd                	jbe    3f0 <printint+0x30>
  if(neg)
 413:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 416:	85 c9                	test   %ecx,%ecx
 418:	74 0c                	je     426 <printint+0x66>
    buf[i++] = '-';
 41a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 41f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 421:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 426:	8b 7d b8             	mov    -0x48(%ebp),%edi
 429:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 42d:	eb 07                	jmp    436 <printint+0x76>
 42f:	90                   	nop
    putc(fd, buf[i]);
 430:	0f b6 13             	movzbl (%ebx),%edx
 433:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 436:	83 ec 04             	sub    $0x4,%esp
 439:	88 55 d7             	mov    %dl,-0x29(%ebp)
 43c:	6a 01                	push   $0x1
 43e:	56                   	push   %esi
 43f:	57                   	push   %edi
 440:	e8 ae fe ff ff       	call   2f3 <write>
  while(--i >= 0)
 445:	83 c4 10             	add    $0x10,%esp
 448:	39 de                	cmp    %ebx,%esi
 44a:	75 e4                	jne    430 <printint+0x70>
}
 44c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 44f:	5b                   	pop    %ebx
 450:	5e                   	pop    %esi
 451:	5f                   	pop    %edi
 452:	5d                   	pop    %ebp
 453:	c3                   	ret    
 454:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 458:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 45f:	eb 87                	jmp    3e8 <printint+0x28>
 461:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 468:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46f:	90                   	nop

00000470 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	57                   	push   %edi
 474:	56                   	push   %esi
 475:	53                   	push   %ebx
 476:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 479:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 47c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 47f:	0f b6 13             	movzbl (%ebx),%edx
 482:	84 d2                	test   %dl,%dl
 484:	74 6a                	je     4f0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 486:	8d 45 10             	lea    0x10(%ebp),%eax
 489:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 48c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 48f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 491:	89 45 d0             	mov    %eax,-0x30(%ebp)
 494:	eb 36                	jmp    4cc <printf+0x5c>
 496:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49d:	8d 76 00             	lea    0x0(%esi),%esi
 4a0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4a3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 4a8:	83 f8 25             	cmp    $0x25,%eax
 4ab:	74 15                	je     4c2 <printf+0x52>
  write(fd, &c, 1);
 4ad:	83 ec 04             	sub    $0x4,%esp
 4b0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4b3:	6a 01                	push   $0x1
 4b5:	57                   	push   %edi
 4b6:	56                   	push   %esi
 4b7:	e8 37 fe ff ff       	call   2f3 <write>
 4bc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 4bf:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4c2:	0f b6 13             	movzbl (%ebx),%edx
 4c5:	83 c3 01             	add    $0x1,%ebx
 4c8:	84 d2                	test   %dl,%dl
 4ca:	74 24                	je     4f0 <printf+0x80>
    c = fmt[i] & 0xff;
 4cc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 4cf:	85 c9                	test   %ecx,%ecx
 4d1:	74 cd                	je     4a0 <printf+0x30>
      }
    } else if(state == '%'){
 4d3:	83 f9 25             	cmp    $0x25,%ecx
 4d6:	75 ea                	jne    4c2 <printf+0x52>
      if(c == 'd'){
 4d8:	83 f8 25             	cmp    $0x25,%eax
 4db:	0f 84 07 01 00 00    	je     5e8 <printf+0x178>
 4e1:	83 e8 63             	sub    $0x63,%eax
 4e4:	83 f8 15             	cmp    $0x15,%eax
 4e7:	77 17                	ja     500 <printf+0x90>
 4e9:	ff 24 85 d4 07 00 00 	jmp    *0x7d4(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4f3:	5b                   	pop    %ebx
 4f4:	5e                   	pop    %esi
 4f5:	5f                   	pop    %edi
 4f6:	5d                   	pop    %ebp
 4f7:	c3                   	ret    
 4f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ff:	90                   	nop
  write(fd, &c, 1);
 500:	83 ec 04             	sub    $0x4,%esp
 503:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 506:	6a 01                	push   $0x1
 508:	57                   	push   %edi
 509:	56                   	push   %esi
 50a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 50e:	e8 e0 fd ff ff       	call   2f3 <write>
        putc(fd, c);
 513:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 517:	83 c4 0c             	add    $0xc,%esp
 51a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 51d:	6a 01                	push   $0x1
 51f:	57                   	push   %edi
 520:	56                   	push   %esi
 521:	e8 cd fd ff ff       	call   2f3 <write>
        putc(fd, c);
 526:	83 c4 10             	add    $0x10,%esp
      state = 0;
 529:	31 c9                	xor    %ecx,%ecx
 52b:	eb 95                	jmp    4c2 <printf+0x52>
 52d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 530:	83 ec 0c             	sub    $0xc,%esp
 533:	b9 10 00 00 00       	mov    $0x10,%ecx
 538:	6a 00                	push   $0x0
 53a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 53d:	8b 10                	mov    (%eax),%edx
 53f:	89 f0                	mov    %esi,%eax
 541:	e8 7a fe ff ff       	call   3c0 <printint>
        ap++;
 546:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 54a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 54d:	31 c9                	xor    %ecx,%ecx
 54f:	e9 6e ff ff ff       	jmp    4c2 <printf+0x52>
 554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 558:	8b 45 d0             	mov    -0x30(%ebp),%eax
 55b:	8b 10                	mov    (%eax),%edx
        ap++;
 55d:	83 c0 04             	add    $0x4,%eax
 560:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 563:	85 d2                	test   %edx,%edx
 565:	0f 84 8d 00 00 00    	je     5f8 <printf+0x188>
        while(*s != 0){
 56b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 56e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 570:	84 c0                	test   %al,%al
 572:	0f 84 4a ff ff ff    	je     4c2 <printf+0x52>
 578:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 57b:	89 d3                	mov    %edx,%ebx
 57d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 580:	83 ec 04             	sub    $0x4,%esp
          s++;
 583:	83 c3 01             	add    $0x1,%ebx
 586:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 589:	6a 01                	push   $0x1
 58b:	57                   	push   %edi
 58c:	56                   	push   %esi
 58d:	e8 61 fd ff ff       	call   2f3 <write>
        while(*s != 0){
 592:	0f b6 03             	movzbl (%ebx),%eax
 595:	83 c4 10             	add    $0x10,%esp
 598:	84 c0                	test   %al,%al
 59a:	75 e4                	jne    580 <printf+0x110>
      state = 0;
 59c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 59f:	31 c9                	xor    %ecx,%ecx
 5a1:	e9 1c ff ff ff       	jmp    4c2 <printf+0x52>
 5a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ad:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 5b0:	83 ec 0c             	sub    $0xc,%esp
 5b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5b8:	6a 01                	push   $0x1
 5ba:	e9 7b ff ff ff       	jmp    53a <printf+0xca>
 5bf:	90                   	nop
        putc(fd, *ap);
 5c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 5c3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 5c6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 5c8:	6a 01                	push   $0x1
 5ca:	57                   	push   %edi
 5cb:	56                   	push   %esi
        putc(fd, *ap);
 5cc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5cf:	e8 1f fd ff ff       	call   2f3 <write>
        ap++;
 5d4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 5d8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5db:	31 c9                	xor    %ecx,%ecx
 5dd:	e9 e0 fe ff ff       	jmp    4c2 <printf+0x52>
 5e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 5e8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 5eb:	83 ec 04             	sub    $0x4,%esp
 5ee:	e9 2a ff ff ff       	jmp    51d <printf+0xad>
 5f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5f7:	90                   	nop
          s = "(null)";
 5f8:	ba cb 07 00 00       	mov    $0x7cb,%edx
        while(*s != 0){
 5fd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 600:	b8 28 00 00 00       	mov    $0x28,%eax
 605:	89 d3                	mov    %edx,%ebx
 607:	e9 74 ff ff ff       	jmp    580 <printf+0x110>
 60c:	66 90                	xchg   %ax,%ax
 60e:	66 90                	xchg   %ax,%ax

00000610 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 610:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 611:	a1 e4 0a 00 00       	mov    0xae4,%eax
{
 616:	89 e5                	mov    %esp,%ebp
 618:	57                   	push   %edi
 619:	56                   	push   %esi
 61a:	53                   	push   %ebx
 61b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 61e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 621:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 628:	89 c2                	mov    %eax,%edx
 62a:	8b 00                	mov    (%eax),%eax
 62c:	39 ca                	cmp    %ecx,%edx
 62e:	73 30                	jae    660 <free+0x50>
 630:	39 c1                	cmp    %eax,%ecx
 632:	72 04                	jb     638 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 634:	39 c2                	cmp    %eax,%edx
 636:	72 f0                	jb     628 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 638:	8b 73 fc             	mov    -0x4(%ebx),%esi
 63b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 63e:	39 f8                	cmp    %edi,%eax
 640:	74 30                	je     672 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 642:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 645:	8b 42 04             	mov    0x4(%edx),%eax
 648:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 64b:	39 f1                	cmp    %esi,%ecx
 64d:	74 3a                	je     689 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 64f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 651:	5b                   	pop    %ebx
  freep = p;
 652:	89 15 e4 0a 00 00    	mov    %edx,0xae4
}
 658:	5e                   	pop    %esi
 659:	5f                   	pop    %edi
 65a:	5d                   	pop    %ebp
 65b:	c3                   	ret    
 65c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 660:	39 c2                	cmp    %eax,%edx
 662:	72 c4                	jb     628 <free+0x18>
 664:	39 c1                	cmp    %eax,%ecx
 666:	73 c0                	jae    628 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 668:	8b 73 fc             	mov    -0x4(%ebx),%esi
 66b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 66e:	39 f8                	cmp    %edi,%eax
 670:	75 d0                	jne    642 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 672:	03 70 04             	add    0x4(%eax),%esi
 675:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 678:	8b 02                	mov    (%edx),%eax
 67a:	8b 00                	mov    (%eax),%eax
 67c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 67f:	8b 42 04             	mov    0x4(%edx),%eax
 682:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 685:	39 f1                	cmp    %esi,%ecx
 687:	75 c6                	jne    64f <free+0x3f>
    p->s.size += bp->s.size;
 689:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 68c:	89 15 e4 0a 00 00    	mov    %edx,0xae4
    p->s.size += bp->s.size;
 692:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 695:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 698:	89 0a                	mov    %ecx,(%edx)
}
 69a:	5b                   	pop    %ebx
 69b:	5e                   	pop    %esi
 69c:	5f                   	pop    %edi
 69d:	5d                   	pop    %ebp
 69e:	c3                   	ret    
 69f:	90                   	nop

000006a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	57                   	push   %edi
 6a4:	56                   	push   %esi
 6a5:	53                   	push   %ebx
 6a6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6ac:	8b 3d e4 0a 00 00    	mov    0xae4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6b2:	8d 70 07             	lea    0x7(%eax),%esi
 6b5:	c1 ee 03             	shr    $0x3,%esi
 6b8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 6bb:	85 ff                	test   %edi,%edi
 6bd:	0f 84 9d 00 00 00    	je     760 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6c3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 6c5:	8b 4a 04             	mov    0x4(%edx),%ecx
 6c8:	39 f1                	cmp    %esi,%ecx
 6ca:	73 6a                	jae    736 <malloc+0x96>
 6cc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6d1:	39 de                	cmp    %ebx,%esi
 6d3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 6d6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6dd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 6e0:	eb 17                	jmp    6f9 <malloc+0x59>
 6e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6ea:	8b 48 04             	mov    0x4(%eax),%ecx
 6ed:	39 f1                	cmp    %esi,%ecx
 6ef:	73 4f                	jae    740 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6f1:	8b 3d e4 0a 00 00    	mov    0xae4,%edi
 6f7:	89 c2                	mov    %eax,%edx
 6f9:	39 d7                	cmp    %edx,%edi
 6fb:	75 eb                	jne    6e8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 6fd:	83 ec 0c             	sub    $0xc,%esp
 700:	ff 75 e4             	push   -0x1c(%ebp)
 703:	e8 53 fc ff ff       	call   35b <sbrk>
  if(p == (char*)-1)
 708:	83 c4 10             	add    $0x10,%esp
 70b:	83 f8 ff             	cmp    $0xffffffff,%eax
 70e:	74 1c                	je     72c <malloc+0x8c>
  hp->s.size = nu;
 710:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 713:	83 ec 0c             	sub    $0xc,%esp
 716:	83 c0 08             	add    $0x8,%eax
 719:	50                   	push   %eax
 71a:	e8 f1 fe ff ff       	call   610 <free>
  return freep;
 71f:	8b 15 e4 0a 00 00    	mov    0xae4,%edx
      if((p = morecore(nunits)) == 0)
 725:	83 c4 10             	add    $0x10,%esp
 728:	85 d2                	test   %edx,%edx
 72a:	75 bc                	jne    6e8 <malloc+0x48>
        return 0;
  }
}
 72c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 72f:	31 c0                	xor    %eax,%eax
}
 731:	5b                   	pop    %ebx
 732:	5e                   	pop    %esi
 733:	5f                   	pop    %edi
 734:	5d                   	pop    %ebp
 735:	c3                   	ret    
    if(p->s.size >= nunits){
 736:	89 d0                	mov    %edx,%eax
 738:	89 fa                	mov    %edi,%edx
 73a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 740:	39 ce                	cmp    %ecx,%esi
 742:	74 4c                	je     790 <malloc+0xf0>
        p->s.size -= nunits;
 744:	29 f1                	sub    %esi,%ecx
 746:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 749:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 74c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 74f:	89 15 e4 0a 00 00    	mov    %edx,0xae4
}
 755:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 758:	83 c0 08             	add    $0x8,%eax
}
 75b:	5b                   	pop    %ebx
 75c:	5e                   	pop    %esi
 75d:	5f                   	pop    %edi
 75e:	5d                   	pop    %ebp
 75f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 760:	c7 05 e4 0a 00 00 e8 	movl   $0xae8,0xae4
 767:	0a 00 00 
    base.s.size = 0;
 76a:	bf e8 0a 00 00       	mov    $0xae8,%edi
    base.s.ptr = freep = prevp = &base;
 76f:	c7 05 e8 0a 00 00 e8 	movl   $0xae8,0xae8
 776:	0a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 779:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 77b:	c7 05 ec 0a 00 00 00 	movl   $0x0,0xaec
 782:	00 00 00 
    if(p->s.size >= nunits){
 785:	e9 42 ff ff ff       	jmp    6cc <malloc+0x2c>
 78a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 790:	8b 08                	mov    (%eax),%ecx
 792:	89 0a                	mov    %ecx,(%edx)
 794:	eb b9                	jmp    74f <malloc+0xaf>
