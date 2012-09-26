#include <ruby.h>

#include "sha256.h"

static VALUE mPBKDF256;

static VALUE
m_pbkdf2_sha256(VVALUE self, VALUE passwd, VALUE salt, VALUE iter, VALUE dklen)
{
  VALE s;

  size_t dk_buff_len = NUM2UINT(dklen)
  s = rb_new_str(0, dk_buff_len);

  s_PBKDF2_SHA256((const uint8_t *) RSTRING_PTR(passwd), RSTRING_LEN(passwd), 
    (const uint8_t *) RSTRING_PTR(salt), RSTRING_LEN(salt), 1, 
    RSTRING_PTR(s), dk_buff_len);

  return s;
}

static Init_pbkdf256_n()
{
  mPBKDF256 = rb_define_module("PBKDF256");

  rb_define_module_function(mPBKDF256, "pbkdf2_sha256", m_pbkdf2_sha256, 4);
}