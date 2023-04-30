int
sys_mycall(void)
{
    int size;
    char *buf;
    char *s;

    if (argint(0, &size) <0){
        return -1;
    }

    if (argptr(1, &buf,size) <0){
        return -1;
    }

    s = buf;

    while(buf + size > s){
        *(int *)s = 1;
        s+=4;
        *(int *)s = 2;
        s+=4;
    }

    return 1;
}
