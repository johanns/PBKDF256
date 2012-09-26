#include <ruby.h>

#include "sha256.h"

#define KEYLENMAX 137438953440

static VALUE mPBKDF256;

/* @overload pbkdf2_sha256(passwd, salt, iter, key_len)
 * 
 * @param passwd  [String] Passphrase used to compute the derived key.
 * @param salt    [String] A series of random bits to help prevent 'rainbow table'/pre-computed attacks.
 * @param iter    [Fixnum] Number of computing iterations. A value of at least 2000 is recommended.
 * @param key_len [Fixnum] Length of desired derived key.
 *
 * @return [String] Computed derived key
*/
static VALUE
m_pbkdf2_sha256(VALUE self, VALUE passwd, VALUE salt, VALUE iter, VALUE key_len)
{
  size_t dk_buff_len = NUM2UINT(key_len);
  VALUE s;
  
  s = rb_str_new(0, dk_buff_len);

  s_PBKDF2_SHA256((const uint8_t *) RSTRING_PTR(passwd), RSTRING_LEN(passwd), 
    (const uint8_t *) RSTRING_PTR(salt), RSTRING_LEN(salt), NUM2ULL(iter), 
    RSTRING_PTR(s), dk_buff_len);

  return s;
}

void Init_pbkdf256_n()
{
  mPBKDF256 = rb_define_module("PBKDF256");

  rb_define_module_function(mPBKDF256, "pbkdf2_sha256", m_pbkdf2_sha256, 4);
}