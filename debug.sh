#!/bin/sh
openocd -f board/ti_ek-tm4c123gxl.cfg -c "program $1; reset"
