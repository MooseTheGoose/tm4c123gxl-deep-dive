MEMORY
{
    FLASH (rx) : ORIGIN = 0x0 , LENGTH = 0x40000
    SRAM (rw) : ORIGIN = 0x20000000 , LENGTH = 0x8000
}

SECTIONS
{
    .text : 
    {
        *(.isr_vector)
        *(.text)
        *(text)
    } >FLASH
    .bss :
    {
        _bss = .;
        *(.bss)
        *(bss)
        _ebss = .;
    } >SRAM
    .data : AT(ADDR(.text) + SIZEOF(.text))
    {
        _data = .;
        _ldata = LOADADDR(.data);
        *(.data)
        *(data)
        _edata = .;
    } >SRAM
    _stack_end = ORIGIN(SRAM) + LENGTH(SRAM);
}
