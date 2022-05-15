void _start()
{
    unsigned char* vidmem = (unsigned char*) 0xb8000;

    *vidmem = 'a';
}