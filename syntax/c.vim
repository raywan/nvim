syn keyword cTypeCustom s8 u8 s16 u16 s32 u32 s64 u64
syn keyword cTypeCustom int8 uint8 int16 uint16 int32 uint32 int64 uint64
syn match cType "\<[a-zA-Z_][a-zA-Z0-9_]*_[ft]\>"

hi def link cTypeCustom Type
