syn keyword cTypeCustom S8 U8 S16 U16 S32 U32 S64 U64 F32 F64 Sptr Uptr
syn keyword cTypeCustom int8 uint8 int16 uint16 int32 uint32 int64 uint64
syn keyword cTypeCustom Vec2 Vec3 Vec4 Mat3 Mat4 Point3 Point4
syn match cType "\<[a-zA-Z_][a-zA-Z0-9_]*_[ft]\>"

syn keyword cTodo contained TODO FIXME XXX REVISIT

hi def link cTypeCustom Type
