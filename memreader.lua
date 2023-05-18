---@meta memreader


memreader = {}


-- Notation typeA:typeB stands for: pass typeA value, library will treat (cast) it as typeB value.
-- Don't confuse with argName: type.

---@class pointer
---@class float
---@class int8
---@class int16
---@class int32
---@class uint8
---@class uint16
---@class uint32

---@alias int8..int32 int8 | int16 | int32
---@alias uint8..uint32 uint8 | uint16 | uint32
---@class ptrdiff_t

---@class LPVOID


----------------------------------- Constants -----------------------------------

---@type pointer pointer to game base address space
memreader.base = '0x0000000140000000'  ---@diagnostic disable-line: assign-type-mismatch


----------------------------------- Type casting -----------------------------------
-- pointer(string:LPVOID): pointer
-- pointer(pointer): pointer
-- Returns new userdata pointer. String conversion requires sizeof(LPVOID)=8 bytes of data.
--
-- uint8(float): uint8
-- int8(float): int8
-- uint16(float): uint16
-- int16(float): int16
-- uint32(float): uint32
-- int32(float): int32
-- Returns new userdata uint8..int32
--
-- uint32(string:UINT32): uint32
-- int32(string:UINT32): int32
-- String conversion requires sizeof(UINT32)=4 bytes of data.




---Returns new userdata pointer.
---@param value pointer
---@return pointer
---@overload fun(value: LPVOID): pointer
---String conversion requires sizeof(LPVOID)=8 bytes of data.
function memreader.pointer(value) end



---Returns new userdata int8
---@param value float
---@return int8
function memreader.int8(value) end

---Returns new userdata uint8
---@param value float
---@return uint8
function memreader.uint8(value) end

---Returns new userdata int16
---@param value float
---@return int16
function memreader.int16(value) end

---Returns new userdata uint16
---@param value float
---@return uint16
function memreader.uint16(value) end

---Returns new userdata int32
---@param value float
---@return int32
---@overload fun(value: string): int32 String conversion requires sizeof(UINT32)=4 bytes of data.
---String conversion requires sizeof(UINT32)=4 bytes of data.
function memreader.int32(value) end


---Returns new userdata uint32
---@param float float
---@return uint32 uint32
---@overload fun(value: string): uint32 String conversion requires sizeof(UINT32)=4 bytes of data.
---String conversion requires sizeof(UINT32)=4 bytes of data.
function memreader.uint32(float) end


-- ----------------------------------- Addition + -----------------------------------
-- add(float, float): float
-- add(float, uint8..int32): float
-- add(pointer, float:UINT32): pointer
-- add(pointer, string:UINT32): pointer
-- add(pointer, uint8..int32): pointer
-- add(uint8..int32, float:UINT32): uint8..int32
-- add(uint8..int32, string:UINT32): uint8..int32
-- add(uint8..int32, uint8..int32): uint8..int32


---`value1 + value2`
---@generic T 
---@param value1 float
---@param value2 float
---@return float
---@overload fun(value1: float, value2: int8..int32): float
---@overload fun(value1: float, value2: uint8..uint32): float
---@overload fun(value1: pointer, value2: int8..int32): pointer
---@overload fun(value1: pointer, value2: uint8..uint32): pointer
---if `add(pointer, float | string)` -> `float | string` will treat as UINT32
---@overload fun(value1: pointer, value2: float): pointer  float will treat as UINT32
---@overload fun(value1: pointer, value2: string): pointer  string will treat as UINT32
---@overload fun(value1: int8..int32, value2: int8..int32): int8..int32
---if `add(int8..int32, float | string)` -> `float | string` will treat as UINT32
---@overload fun(value1: int8..int32, value2: float): int8..int32  float will treat as UINT32
---@overload fun(value1: int8..int32, value2: string): int8..int32  string will treat as UINT32
---@overload fun(value1: uint8..uint32, value2: uint8..uint32): uint8..uint32
---if `add(uint8..uint32, float | string)` -> `float | string` will treat as UINT32
---@overload fun(value1: uint8..uint32, value2: float): uint8..uint32  float will treat as UINT32
---@overload fun(value1: uint8..uint32, value2: string): uint8..uint32  string will treat as UINT32
function memreader.add(value1, value2) end



-- ----------------------------------- Subtraction - -----------------------------------
-- sub(float, float): float
-- sub(float, uint8..int32): float
-- sub(pointer, float:UINT32): pointer
-- sub(pointer, string:UINT32): pointer
-- sub(pointer, pointer): pointer
-- sub(pointer, uint8..int32): pointer
-- sub(uint8..int32, float:UINT32): uint8..int32
-- sub(uint8..int32, string:UINT32): uint8..int32
-- sub(uint8..int32, uint8..int32): uint8..int32


---`value1 - value2`
---@param value1 float
---@param value2 float
---@return float
---@overload fun(value1: float, value2: int8..int32): float
---@overload fun(value1: float, value2: uint8..uint32): float
---@overload fun(value1: pointer, value2: pointer): pointer
---@overload fun(value1: pointer, value2: int8..int32): pointer
---@overload fun(value1: pointer, value2: uint8..uint32): pointer
---if `sub(pointer, float | string) -> `float | string` will treat as UINT32
---@overload fun(value1: pointer, value2: float): pointer  float will treat as UINT32
---@overload fun(value1: pointer, value2: string): pointer  string will treat as UINT32
---@overload fun(value1: int8..int32, value2: int8..int32): int8..int32
---if `sub(int8..int32, float | string)` -> `float | string` will treat as UINT32
---@overload fun(value1: int8..int32, value2: float): int8..int32  float will treat as UINT32
---@overload fun(value1: int8..int32, value2: string): int8..int32  string will treat as UINT32
---@overload fun(value1: uint8..uint32, value2: uint8..uint32): uint8..uint32
---if `sub(uint8..uint32, float | string)` -> `float | string` will treat as UINT32
---@overload fun(value1: uint8..uint32, value2: float): uint8..uint32  float will treat as UINT32
---@overload fun(value1: uint8..uint32, value2: string): uint8..uint32  string will treat as UINT32
function memreader.sub(value1, value2) end


-- ----------------------------------- Multiplication * -----------------------------------
-- mult(float, float): float
-- mult(float, uint8..int32): float
-- mult(uint8..int32, float:UINT32): uint8..int32
-- mult(uint8..int32, string:UINT32): uint8..int32
-- mult(uint8..int32, uint8..int32): uint8..int32


---multiple `value1` by `value2`
---@param value1 float
---@param value2 float
---@return float
---@overload fun(value1: float, value2: int8..int32): float
---@overload fun(value1: float, value2: uint8..uint32): float
---@overload fun(value1: int8..int32, value2: int8..int32): int8..int32
---@overload fun(value1: uint8..uint32, value2: uint8..uint32): uint8..uint32
---if `mult(int8..int32, float | string)` -> `float | string` will treat as UINT32
---@overload fun(value1: int8..int32, value2: float): int8..int32  float will treat as UINT32
---@overload fun(value1: int8..int32, value2: string): int8..int32  string will treat as UINT32
---if `mult(uint8..uint32, float | string)` -> `float | string` will treat as UINT32
---@overload fun(value1: uint8..uint32, value2: float): uint8..uint32  float will treat as UINT32
---@overload fun(value1: uint8..uint32, value2: string): uint8..uint32  string will treat as UINT32
function memreader.mult(value1, value2) end


-- ----------------------------------- Division / -----------------------------------
-- div(float, float): float
-- div(float, uint8..int32): float
-- div(pointer:ptrdiff_t, float:UINT32): pointer
-- div(pointer:ptrdiff_t, string:UINT32): pointer
-- div(pointer:ptrdiff_t, uint8..int32): pointer
-- div(uint8..int32, float:UINT32): uint8..int32
-- div(uint8..int32, string:UINT32): uint8..int32
-- div(uint8..int32, uint8..int32): uint8..int32


---`value1 / value2`
---@param value1 float
---@param value2 float
---@return float
---@overload fun(value1: float, value2: int8..int32): float
---@overload fun(value1: float, value2: uint8..uint32): float
---@overload fun(value1: ptrdiff_t, value2: int8..int32): pointer
---@overload fun(value1: ptrdiff_t, value2: uint8..uint32): pointer
---if `div(ptrdiff_t, float | string)` -> `float | string` will treat as UINT32
---@overload fun(value1: ptrdiff_t, value2: float): pointer  float will treat as UINT32
---@overload fun(value1: ptrdiff_t, value2: string): pointer  string will treat as UINT32
---@overload fun(value1: int8..int32, value2: int8..int32): int8..int32
---if `div(int8..int32, float | string)` -> `float | string` will treat as UINT32
---@overload fun(value1: int8..int32, value2: float): int8..int32  float will treat as UINT32
---@overload fun(value1: int8..int32, value2: string): int8..int32  string will treat as UINT32
---@overload fun(value1: uint8..uint32, value2: uint8..uint32): uint8..uint32
---if `div(uint8..uint32, float | string)` -> `float | string` will treat as UINT32
---@overload fun(value1: uint8..uint32, value2: float): uint8..uint32  float will treat as UINT32
---@overload fun(value1: uint8..uint32, value2: string): uint8..uint32  string will treat as UINT32
function memreader.div(value1, value2) end



----------------------------------- Comparison -----------------------------------
-- eq := ==
-- lt := <
-- gt := >
-- eq, lt and gt have the exact same function declarations.
--
-- eq(pointer, string:LPVOID): boolean
-- eq(pointer, pointer): boolean
-- eq(uint32..int32, float:UINT32): boolean
-- eq(uint32..int32, string:UINT32): boolean
-- eq(uint32..int32, uint32..int32): boolean


---`value1 == value2`
---@param value1 pointer
---@param value2 pointer
---@return boolean
---@overload fun(value1: pointer, value2: string): boolean  string will treat as LPVOID
---if `eq(pointer, string)` -> string will treat as LPVOID
---@overload fun(value1: int8..int32, value2: int8..int32): boolean
---if `eq(int8..int32, float | string)` -> `float | string` will treat as UINT32
---@overload fun(value1: int8..int32, value2: float): boolean  float will treat as UINT32
---@overload fun(value1: int8..int32, value2: string): boolean  string will treat as UINT32
---@overload fun(value1: uint8..uint32, value2: uint8..uint32): boolean
---if `eq(uint8..uint32, float | string)` -> `float | string` will treat as UINT32
---@overload fun(value1: uint8..uint32, value2: float): boolean  float will treat as UINT32
---@overload fun(value1: uint8..uint32, value2: string): boolean  string will treat as UINT32
function memreader.eq(value1, value2) end


---`value1 < value2`
---@param value1 pointer
---@param value2 pointer
---@return boolean
---@overload fun(value1: pointer, value2: string): boolean  string will treat as LPVOID
---if `eq(pointer, string)` -> string will treat as LPVOID
---@overload fun(value1: int8..int32, value2: int8..int32): boolean
---if `eq(int8..int32, float | string)` -> `float | string` will treat as UINT32
---@overload fun(value1: int8..int32, value2: float): boolean  float will treat as UINT32
---@overload fun(value1: int8..int32, value2: string): boolean  string will treat as UINT32
---@overload fun(value1: uint8..uint32, value2: uint8..uint32): boolean
---if `eq(uint8..uint32, float | string)` -> `float | string` will treat as UINT32
---@overload fun(value1: uint8..uint32, value2: float): boolean  float will treat as UINT32
---@overload fun(value1: uint8..uint32, value2: string): boolean  string will treat as UINT32
function memreader.lt(value1, value2) end


---`value1 > value2`
---@param value1 pointer
---@param value2 pointer
---@return boolean
---@overload fun(value1: pointer, value2: string): boolean  string will treat as LPVOID
---if `eq(pointer, string)` -> string will treat as LPVOID
---@overload fun(value1: int8..int32, value2: int8..int32): boolean
---if `eq(int8..int32, float | string)` -> `float | string` will treat as UINT32
---@overload fun(value1: int8..int32, value2: float): boolean  float will treat as UINT32
---@overload fun(value1: int8..int32, value2: string): boolean  string will treat as UINT32
---@overload fun(value1: uint8..uint32, value2: uint8..uint32): boolean
---if `eq(uint8..uint32, float | string)` -> `float | string` will treat as UINT32
---@overload fun(value1: uint8..uint32, value2: float): boolean  float will treat as UINT32
---@overload fun(value1: uint8..uint32, value2: string): boolean  string will treat as UINT32
function memreader.gt(value1, value2) end



----------------------------------- Reading -----------------------------------
-- read_float(pointer, [offset]): float
--
-- read_pointer(pointer, [offset]): pointer
--
-- read_uint8(pointer, [offset]): float
-- read_uint8(pointer, [offset], return_userdata: boolean): uint8
-- same function declarations for int8..int32
--
-- If you pass return_userdata=true, then function will return userdata uint8..int32, instead of casting it to `float`
--
-- Optional argument offset can be passed with types:
-- nil=0
-- float:UINT32
-- string:UINT32
-- uint32..int32
--
-- read_boolean(pointer, [offset]): boolean
-- Will return true if byte ~= 0x00
--
-- read_string(pointer, [offset], isPtr: boolean, isWide: boolean): string
-- Structure for string { INT32 size; INT32 capacity; char *pStr; }
-- isWide=true will return wchar_t raw data (not very userful in Lua)
-- If you pass isPtr=true, then library will do the following:
--
-- local ptr = read_pointer(ptr, offset)
-- return read_string(ptr, 0, false, isWide)
-- read_array(pointer, [offset]): float, pointer
-- read_array(pointer, [offset], return_userdata: boolean): int32, pointer
-- Structure for array { INT32 capacity; INT32 size; LPVOID pData; }
-- Returns size of array and pointer to data.
--
-- read_rowidx(pEntry: pointer, [offset], base: pointer, entry_size: float): float
-- Basically library does the following:
--
-- local entry = read_pointer(pEntry, offset)
-- return 1 + (entry - base) / entry_size
-- read(pointer, [offset], bytes: float:UINT32): string
-- Reads bytes from memory. String contains raw data. It is not null terminated.


-- (nil=0), (float:UINT32), (string:UINT32) (uint32..int32)

---read `float` from memory
---@param pointer pointer
---@param offset? nil | int32 | uint32 can be: `nil=0`, `float:UINT32`, `string:UINT32`, `int32`, `uint32`
---@return float
function memreader.read_float(pointer, offset) end


---read `pointer` from memory
---@param pointer pointer
---@param offset? nil | int32 | uint32 can be: `nil=0`, `float:UINT32`, `string:UINT32`, `int32`, `uint32`
---@return pointer
function memreader.read_pointer(pointer, offset) end


---read `boolean` from memory
---@param pointer pointer
---@param offset? nil | int32 | uint32 can be: `nil=0`, `float:UINT32`, `string:UINT32`, `int32`, `uint32`
---@return boolean
function memreader.read_boolean(pointer, offset) end


---read `string` STRUCTURE from memory
---@param pointer pointer
---@param offset? nil | int32 | uint32 can be: `nil=0`, `float:UINT32`, `string:UINT32`, `int32`, `uint32`
---@param isPtr? boolean will go for current `pointer+offset` address and only after that will start reading (default=`false`)
---@param isWide? boolean will return `wchar_t` raw data (not very userful in Lua) (default=`false`)
---@return string
---Structure for string is { INT32 size; INT32 capacity; char *pStr; }
function memreader.read_string(pointer, offset, isPtr, isWide) end


---read `array` STRUCTURE from memory -- Returns `size` of array and `pointer` to data.
---@param pointer pointer
---@param offset? nil | int32 | uint32 can be: `nil=0`, `float:UINT32`, `string:UINT32`, `int32`, `uint32`
---@param return_userdata? boolean will return `size` as `<userdata int32>`, instead of casting it to `float` (default=`false`)
---@return float|int32 size, pointer data
---Structure for array is { INT32 capacity; INT32 size; LPVOID pData; }
function memreader.read_array(pointer, offset, return_userdata) end


---calculate `row index` of `entity` inside a `array` from memory
---@param pEntry pointer
---@param offset number can be: `nil=0`, `float:UINT32`, `string:UINT32`, `int32`, `uint32`
---@param base pointer
---@param entry_size float
---@return float
---Structure for array is { INT32 capacity; INT32 size; LPVOID pData; }
function memreader.read_rowidx(pEntry, offset, base, entry_size) end


---read raw `bytes` from memory
---@param pointer pointer
---@param offset? nil | int32 | uint32 can be: `nil=0`, `float:UINT32`, `string:UINT32`, `int32`, `uint32`
---@param bytes? uint32 float will treat as UINT32
---@return string
---String contains raw data. It is not null terminated.
function memreader.read(pointer, offset, bytes) end


---------  read_int8..uint32


---read `int8` from memory
---@param pointer pointer
---@param offset? nil | int32 | uint32 can be: `nil=0`, `float:UINT32`, `string:UINT32`, `int32`, `uint32`
---@param return_userdata? boolean will return `<userdata int8>`, instead of casting it to `float` (default=`false`)
---@return float
function memreader.read_int8(pointer, offset, return_userdata) end

---read `int16` from memory
---@param pointer pointer
---@param offset? nil | int32 | uint32 can be: `nil=0`, `float:UINT32`, `string:UINT32`, `int32`, `uint32`
---@param return_userdata? boolean will return `<userdata int16>`, instead of casting it to `float` (default=`false`)
---@return float
function memreader.read_int16(pointer, offset, return_userdata) end

---read `int32` from memory
---@param pointer pointer
---@param offset? nil | int32 | uint32 can be: `nil=0`, `float:UINT32`, `string:UINT32`, `int32`, `uint32`
---@param return_userdata? boolean will return `<userdata int32>`, instead of casting it to `float` (default=`false`)
---@return float
function memreader.read_int32(pointer, offset, return_userdata) end


---read `uint8` from memory
---@param pointer pointer
---@param offset? nil | int32 | uint32 can be: `nil=0`, `float:UINT32`, `string:UINT32`, `int32`, `uint32`
---@param return_userdata? boolean will return `<userdata uint8>`, instead of casting it to `float` (default=`false`)
---@return float
function memreader.read_uint8(pointer, offset, return_userdata) end

---read `uint16` from memory
---@param pointer pointer
---@param offset? nil | int32 | uint32 can be: `nil=0`, `float:UINT32`, `string:UINT32`, `int32`, `uint32`
---@param return_userdata? boolean will return `<userdata uint16>`, instead of casting it to `float` (default=`false`)
---@return float
function memreader.read_uint16(pointer, offset, return_userdata) end

---read `uint32` from memory
---@param pointer pointer
---@param offset? nil | int32 | uint32 can be: `nil=0`, `float:UINT32`, `string:UINT32`, `int32`, `uint32`
---@param return_userdata? boolean will return `<userdata uint32>`, instead of casting it to `float` (default=`false`)
---@return float
function memreader.read_uint32(pointer, offset, return_userdata) end



----------------------------------- Writing -----------------------------------
-- write(pointer, [offset], boolean)
-- write(pointer, [offset], float)
-- write(pointer, [offset], string)
-- write(pointer, [offset], pointer)
-- write(pointer, [offset], uint8..int32)


---write data at desired address
---@param pointer pointer
---@param offset number can be: `nil=0`, `float:UINT32`, `string:UINT32`, `int32`, `uint32`
---@param data boolean
---@return nil
---@overload fun(pointer: pointer, offset: number, data: float): nil
---@overload fun(pointer: pointer, offset: number, data: string): nil
---@overload fun(pointer: pointer, offset: number, data: pointer): nil
---@overload fun(pointer: pointer, offset: number, data: int8..int32): nil
---@overload fun(pointer: pointer, offset: number, data: uint8..uint32): nil
---probably you won't need this functionality at all
function memreader.write(pointer, offset, data) end


----------------------------------- Modules -----------------------------------
-- modules(): { base: pointer, size: float, name: string, path: string }
-- for module in mr.modules() do
-- 	out('base = '.. mr.tostring(module.base) ..', size = '.. tostring(module.size) ..', name = '.. module.name ..', path = '.. module.path)
-- end


---@return {base: pointer, size: float, name: string, path: string}
---```
---for module in mr.modules() do
--- 	out('base = '.. mr.tostring(module.base) ..', size = '.. tostring(module.size) ..', name = '.. module.name ..', path = '.. module.path)
--- end
---```
function memreader.modules() end


----------------------------------- Misc: type -----------------------------------
-- type(nil): 'nil'
-- type(boolean): 'boolean'
-- type(float): 'float'
-- type(string): 'bytes'
-- type(pointer): 'pointer'
-- type(uint8..int32): 'uint8'..'int32'


---return type of a value
---@param value nil
---@return 'nil'
---@overload fun(value: boolean): 'boolean'
---@overload fun(value: float): 'float'
---@overload fun(value: string): 'bytes'
---@overload fun(value: pointer): 'pointer'
---@overload fun(value: int8..int32): 'int8' | 'int16' | 'int32'
---@overload fun(value: uint8..uint32): 'uint8' | 'uint16' | 'uint32'
function memreader.type(value) end


----------------------------------- Misc: tostring -----------------------------------
-- tostring(nil | boolean | number): tostring
-- Behaves same as default lua tostring function.
--
-- tostring(string): string
-- Returns hex representation of string.
--
-- tostring(pointer): string // %p
-- tostring(uint8): string // %hhu
-- tostring(int8): string // %hhd
-- tostring(uint16): string // %hu
-- tostring(int16): string // %hd
-- tostring(uint32): string // %u
-- tostring(int32): string // %d
-- Refer to sprintf_s documentation.


---behaves same as default lua tostring function
---@param value nil | boolean | number
---@return string string same as default lua `tostring()`
function memreader.tostring(value) end


---returns hex representation of string
---@param value string
---@return string string hex (0xXXXXXXXX)
function memreader.tostring(value) end


---string representation of internal types
---@param value pointer
---@return string string
---@overload fun(value: int8): string
---@overload fun(value: int16): string
---@overload fun(value: int32): string
---@overload fun(value: uint8): string
---@overload fun(value: uint16): string
---@overload fun(value: uint32): string
--- refer to sprintf_s documentation.
---```
--- tostring(int8)   -> sprintf_s(pointer, "%hhd")
--- tostring(int16)  -> sprintf_s(pointer, "%hd")
--- tostring(int32)  -> sprintf_s(pointer, "%d")
--- tostring(uint8)  -> sprintf_s(pointer, "%hhu")
--- tostring(uint16) -> sprintf_s(pointer, "%hu")
--- tostring(uint32) -> sprintf_s(pointer, "%u")
---```
function memreader.tostring(value) end


----------------------------------- Misc: tonumber -----------------------------------
-- tonumber(float:UINT32): float
-- tonumber(string:UINT32): float
-- tonumber(pointer): float
-- tonumber(uint32..int32): float


---return numeric representation
---@param value float
---@return float
---@overload fun(value: string): float
---@overload fun(value: pointer): float
---@overload fun(value: int8..int32): float
---@overload fun(value: uint8..uint32): float
---if `tonumber(float | string)` -> `float | string` will treat as UINT32
function memreader.tonumber(value) end


----------------------------------- Misc: userdata -----------------------------------
-- ud_topointer(userdata): pointer
-- Returns pointer of userdata value.
--
-- local chptr = ud_topointer(character)
-- chptr = read_pointer(chptr, 0x10)
-- local cqi = read_int32(chptr, 0xF0)
--
--
-- ud_debug(userdata): float, pointer
-- Returns lua type of value (TValue.tt) and pointer value p (TValue.value.p). Refer to lua documentation and source code.


---return pointer of userdata value
---@param value userdata
---@return pointer
---```
--- local chptr = ud_topointer(character)
--- chptr = read_pointer(chptr, 0x10)
--- local cqi = read_int32(chptr, 0xF0)
---```
function memreader.ud_topointer(value) end


---return lua type of value (`TValue.tt`) and pointer value `p` (`TValue.value.p`)
---@param value userdata
---@return float tvalue_tt, pointer tvalue_value_p
---refer to lua documentation and source code
function memreader.ud_debug(value) end


----------------------------------- Misc: createtable -----------------------------------
-- createtable(narr, nrec): table
--
-- Creates new table with preallocated space narr (raw array part) and nrec (hash part)
-- narr and nrec can be the following types:
-- float:UINT32
-- string:UINT32
-- uint32..int32


---create new table with preallocated space
---@param narr float|string|int32|uint32 raw array part
---@param nrec float|string|int32|uint32 hash part
---@return table
function memreader.createtable(narr, nrec) end
