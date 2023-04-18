#ifndef TM4C_DEEPDIVE_HWREG_H
#define TM4C_DEEPDIVE_HWREG_H

#define HWREG8(x) *((volatile unsigned char*)(x))
#define HWREG16(x) *((volatile unsigned short*)(x))
#define HWREG32(x) *((volatile unsigned int*)(x))

#endif
