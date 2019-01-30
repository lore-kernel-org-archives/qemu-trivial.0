Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gon51-0002ik-Qu
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 05:26:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gon4y-0002gm-B2
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 05:26:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gon4v-0006cM-Az
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 05:26:48 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:38897)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gon4u-0006UJ-Si; Wed, 30 Jan 2019 05:26:45 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1M9nlN-1glCZj0Azd-005tM8; Wed, 30 Jan 2019 11:26:18 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
	David Hildenbrand <david@redhat.com>, qemu-trivial@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org, 
	qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella
	<sgarzare@redhat.com>, Richard Henderson <rth@twiddle.net>
References: <20190104181208.7809-1-philmd@redhat.com>
	<20190104181208.7809-4-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <5e973a94-f74e-6411-cdde-f09ede823108@vivier.eu>
Date: Wed, 30 Jan 2019 11:26:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190104181208.7809-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zNCe0jSDAOlU8bAL2/9XOA9YkKkIgmgn1m+emznb+wVFfkxy8gX
	xUqyPgbXNE80viVLDUJgKtrZ2rp0aVmRU5L1QNB8n+Blyl8k4gxYSHi63B1fMRvdTHEQYHq
	S0nJzUjAenJofm3IG9wgfod17hdYTjVtwZxudPymONvQyfRu3MN73aI698A7tHCLYb62Bl2
	1APzC6FECRoxyc8mCAUag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wZPxhJAoxfQ=:jtY4NrJCyZEUqMpU8jNuue
	pwy5cTjOlIC7rwGIP6oYGMLnWyLAYc2Y+xSrEDNgeDeteWNS9biidmRB0TnVXikJWRnw7IjTU
	4Y0Zaagal63je9wJkN+KyM/X8YHAxxyHM6FHePq7zWaMnJcKR0GY9doqa8bYXLXpMLWJoyzNr
	Pa9tla2FdEC6MsnSOueLPZ/oBI6JT/WDYKmPLTJmOP2iVTe08XK4nR244x0HqyefyLVXA7BjM
	Abi1Av+rn6Ys+boH/Xesy+jgEk9MxV9HBgw1XDCQmlTyvS+1TnSyIhrzUKZZcIjRJ8zg0Yzk1
	n70vwsjyahc1UOt8Fr1nLA2s2RIASib7Cgwd/JvkEMF6kGPXZ5yQmXRH+fIgq8Ff477ft/U/8
	cf+ctV6IxlVSK89oQrhreBHBLEgFUi1fn783Vjzl4OvPXh5bMWxl4ZghnxaqP8hFLUR+xbUic
	ypG6slIZK83HEixMOCqu2HVHb8v4GNiOLRnmIsW6jhLH2Bimx6jodJkG6is4RTeX2duqftX0a
	Dyi/zmaF/nqS09JMpW7OOX6qpvhjGj2k1+1Gx6eDlcjQ7m+erTPGf5MixoTiMC3agL7NXzQvB
	yjRZ/UHpPWaxC++dthnRW0eS73z6B7CzKKxCAFGtxSod0/PeGC4iDnOg+LY6WiYT+Qcm1FYr/
	4MlGwOPKHVQbcmK2Jlf1pbsg4SdI2ZjnK8Hx0daJYZAgj9rIA6N/4/A/shhsnBtycluZMxbVn
	rjCfvLHp8ZL7DKWyNsf3vL9ubzXgIaFPZMKGXENY2i6oeugmekXi5GZFLNQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: Re: [Qemu-trivial] [PATCH v2 3/3] util/cutils: Move function
 documentations to the header
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2019 10:26:51 -0000

On 04/01/2019 19:12, Philippe Mathieu-Daudé wrote:
> Many functions have documentation before the implementation in
> cutils.c. Since we expect documentation around the prototype
> declaration in headers, move the comments in cutils.h.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/qemu/cutils.h | 224 ++++++++++++++++++++++++++++++++++++++++++
>  util/cutils.c         | 185 ----------------------------------
>  2 files changed, 224 insertions(+), 185 deletions(-)
> 
> diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
> index 644f2d75bd..f41b00ad37 100644
> --- a/include/qemu/cutils.h
> +++ b/include/qemu/cutils.h
> @@ -47,6 +47,7 @@
>   *    bytes and then add a NUL
>   */
>  void pstrcpy(char *buf, int buf_size, const char *str);
> +
>  /**
>   * strpadcpy:
>   * @buf: buffer to copy string into
> @@ -60,6 +61,7 @@ void pstrcpy(char *buf, int buf_size, const char *str);
>   * first @buf_size characters of @str, with no terminator.
>   */
>  void strpadcpy(char *buf, int buf_size, const char *str, char pad);
> +
>  /**
>   * pstrcat:
>   * @buf: buffer containing existing string
> @@ -77,6 +79,7 @@ void strpadcpy(char *buf, int buf_size, const char *str, char pad);
>   * Returns: @buf.
>   */
>  char *pstrcat(char *buf, int buf_size, const char *s);
> +
>  /**
>   * strstart:
>   * @str: string to test
> @@ -94,6 +97,7 @@ char *pstrcat(char *buf, int buf_size, const char *s);
>   * Returns: true if @str starts with prefix @val, false otherwise.
>   */
>  int strstart(const char *str, const char *val, const char **ptr);
> +
>  /**
>   * stristart:
>   * @str: string to test
> @@ -110,6 +114,7 @@ int strstart(const char *str, const char *val, const char **ptr);
>   *          false otherwise.
>   */
>  int stristart(const char *str, const char *val, const char **ptr);
> +
>  /**
>   * qemu_strnlen:
>   * @s: string
> @@ -126,6 +131,7 @@ int stristart(const char *str, const char *val, const char **ptr);
>   * Returns: length of @s in bytes, or @max_len, whichever is smaller.
>   */
>  int qemu_strnlen(const char *s, int max_len);
> +
>  /**
>   * qemu_strsep:
>   * @input: pointer to string to parse
> @@ -147,6 +153,16 @@ int qemu_strnlen(const char *s, int max_len);
>   * Returns: the pointer originally in @input.
>   */
>  char *qemu_strsep(char **input, const char *delim);
> +
> +/**
> + * qemu_strchrnul:
> + *
> + * @s: String to parse.
> + * @c: Character to find.
> + *
> + * Searches for the first occurrence of @c in @s, and returns a pointer
> + * to the trailing null byte if none was found.
> + */
>  #ifdef HAVE_STRCHRNUL
>  static inline const char *qemu_strchrnul(const char *s, int c)
>  {
> @@ -155,27 +171,235 @@ static inline const char *qemu_strchrnul(const char *s, int c)
>  #else
>  const char *qemu_strchrnul(const char *s, int c);
>  #endif
> +
>  time_t mktimegm(struct tm *tm);
>  int qemu_fdatasync(int fd);
>  int fcntl_setfl(int fd, int flag);
>  int qemu_parse_fd(const char *param);
> +
> +/**
> + * qemu_strtoi:
> + *
> + * Convert string @nptr to an integer, and store it in @result.
> + *
> + * This is a wrapper around strtol() that is harder to misuse.
> + * Semantics of @nptr, @endptr, @base match strtol() with differences
> + * noted below.
> + *
> + * @nptr may be null, and no conversion is performed then.
> + *
> + * If no conversion is performed, store @nptr in *@endptr and return
> + * -EINVAL.
> + *
> + * If @endptr is null, and the string isn't fully converted, return
> + * -EINVAL.  This is the case when the pointer that would be stored in
> + * a non-null @endptr points to a character other than '\0'.
> + *
> + * If the conversion overflows @result, store INT_MAX in @result,
> + * and return -ERANGE.
> + *
> + * If the conversion underflows @result, store INT_MIN in @result,
> + * and return -ERANGE.
> + *
> + * Else store the converted value in @result, and return zero.
> + */
>  int qemu_strtoi(const char *nptr, const char **endptr, int base,
>                  int *result);
> +
> +/**
> + * qemu_strtoui:
> + *
> + * Convert string @nptr to an unsigned integer, and store it in @result.
> + *
> + * This is a wrapper around strtoul() that is harder to misuse.
> + * Semantics of @nptr, @endptr, @base match strtoul() with differences
> + * noted below.
> + *
> + * @nptr may be null, and no conversion is performed then.
> + *
> + * If no conversion is performed, store @nptr in *@endptr and return
> + * -EINVAL.
> + *
> + * If @endptr is null, and the string isn't fully converted, return
> + * -EINVAL.  This is the case when the pointer that would be stored in
> + * a non-null @endptr points to a character other than '\0'.
> + *
> + * If the conversion overflows @result, store UINT_MAX in @result,
> + * and return -ERANGE.
> + *
> + * Else store the converted value in @result, and return zero.
> + *
> + * Note that a number with a leading minus sign gets converted without
> + * the minus sign, checked for overflow (see above), then negated (in
> + * @result's type).  This is exactly how strtoul() works.
> + */
>  int qemu_strtoui(const char *nptr, const char **endptr, int base,
>                   unsigned int *result);
> +
> +/**
> + * qemu_strtol:
> + *
> + * Convert string @nptr to a long integer, and store it in @result.
> + *
> + * This is a wrapper around strtol() that is harder to misuse.
> + * Semantics of @nptr, @endptr, @base match strtol() with differences
> + * noted below.
> + *
> + * @nptr may be null, and no conversion is performed then.
> + *
> + * If no conversion is performed, store @nptr in *@endptr and return
> + * -EINVAL.
> + *
> + * If @endptr is null, and the string isn't fully converted, return
> + * -EINVAL.  This is the case when the pointer that would be stored in
> + * a non-null @endptr points to a character other than '\0'.
> + *
> + * If the conversion overflows @result, store LONG_MAX in @result,
> + * and return -ERANGE.
> + *
> + * If the conversion underflows @result, store LONG_MIN in @result,
> + * and return -ERANGE.
> + *
> + * Else store the converted value in @result, and return zero.
> + */
>  int qemu_strtol(const char *nptr, const char **endptr, int base,
>                  long *result);
> +
> +/**
> + * qemu_strtoul:
> + *
> + * Convert string @nptr to an unsigned long, and store it in @result.
> + *
> + * This is a wrapper around strtoul() that is harder to misuse.
> + * Semantics of @nptr, @endptr, @base match strtoul() with differences
> + * noted below.
> + *
> + * @nptr may be null, and no conversion is performed then.
> + *
> + * If no conversion is performed, store @nptr in *@endptr and return
> + * -EINVAL.
> + *
> + * If @endptr is null, and the string isn't fully converted, return
> + * -EINVAL.  This is the case when the pointer that would be stored in
> + * a non-null @endptr points to a character other than '\0'.
> + *
> + * If the conversion overflows @result, store ULONG_MAX in @result,
> + * and return -ERANGE.
> + *
> + * Else store the converted value in @result, and return zero.
> + *
> + * Note that a number with a leading minus sign gets converted without
> + * the minus sign, checked for overflow (see above), then negated (in
> + * @result's type).  This is exactly how strtoul() works.
> + */
> +
>  int qemu_strtoul(const char *nptr, const char **endptr, int base,
>                   unsigned long *result);
> +
> +/**
> + * qemu_strtoi64:
> + *
> + * Convert string @nptr to an int64_t.
> + *
> + * Works like qemu_strtol(), except it stores INT64_MAX on overflow,
> + * and INT_MIN on underflow.
> + */
>  int qemu_strtoi64(const char *nptr, const char **endptr, int base,
>                    int64_t *result);
> +
> +/**
> + * qemu_strtou64:
> + *
> + * Convert string @nptr to an uint64_t.
> + *
> + * Works like qemu_strtoul(), except it stores UINT64_MAX on overflow.
> + */
>  int qemu_strtou64(const char *nptr, const char **endptr, int base,
>                    uint64_t *result);
> +
> +/**
> + * qemu_strtod:
> + *
> + * Convert string @nptr to a double.
> + *
> + * This is a wrapper around strtod() that is harder to misuse.
> + * Semantics of @nptr and @endptr match strtod() with differences
> + * noted below.
> + *
> + * @nptr may be null, and no conversion is performed then.
> + *
> + * If no conversion is performed, store @nptr in *@endptr and return
> + * -EINVAL.
> + *
> + * If @endptr is null, and the string isn't fully converted, return
> + * -EINVAL. This is the case when the pointer that would be stored in
> + * a non-null @endptr points to a character other than '\0'.
> + *
> + * If the conversion overflows, store +/-HUGE_VAL in @result, depending
> + * on the sign, and return -ERANGE.
> + *
> + * If the conversion underflows, store +/-0.0 in @result, depending on the
> + * sign, and return -ERANGE.
> + *
> + * Else store the converted value in @result, and return zero.
> + */
>  int qemu_strtod(const char *nptr, const char **endptr, double *result);
> +
> +/**
> + * qemu_strtod_finite:
> + *
> + * Convert string @nptr to a finite double.
> + *
> + * Works like qemu_strtod(), except that "NaN" and "inf" are rejected
> + * with -EINVAL and no conversion is performed.
> + */
>  int qemu_strtod_finite(const char *nptr, const char **endptr, double *result);
>  
> +/**
> + * parse_uint:
> + *
> + * @s: String to parse
> + * @value: Destination for parsed integer value
> + * @endptr: Destination for pointer to first character not consumed
> + * @base: integer base, between 2 and 36 inclusive, or 0
> + *
> + * Parse unsigned integer
> + *
> + * Parsed syntax is like strtoull()'s: arbitrary whitespace, a single optional
> + * '+' or '-', an optional "0x" if @base is 0 or 16, one or more digits.
> + *
> + * If @s is null, or @base is invalid, or @s doesn't start with an
> + * integer in the syntax above, set *@value to 0, *@endptr to @s, and
> + * return -EINVAL.
> + *
> + * Set *@endptr to point right beyond the parsed integer (even if the integer
> + * overflows or is negative, all digits will be parsed and *@endptr will
> + * point right beyond them).
> + *
> + * If the integer is negative, set *@value to 0, and return -ERANGE.
> + *
> + * If the integer overflows unsigned long long, set *@value to
> + * ULLONG_MAX, and return -ERANGE.
> + *
> + * Else, set *@value to the parsed integer, and return 0.
> + */
>  int parse_uint(const char *s, unsigned long long *value, char **endptr,
>                 int base);
> +
> +/**
> + * parse_uint_full:
> + *
> + * @s: String to parse
> + * @value: Destination for parsed integer value
> + * @base: integer base, between 2 and 36 inclusive, or 0
> + *
> + * Parse unsigned integer from entire string
> + *
> + * Have the same behavior of parse_uint(), but with an additional check
> + * for additional data after the parsed number. If extra characters are present
> + * after the parsed number, the function will return -EINVAL, and *@v will
> + * be set to 0.
> + */
>  int parse_uint_full(const char *s, unsigned long long *value, int base);
>  
>  int qemu_strtosz(const char *nptr, const char **end, uint64_t *result);
> diff --git a/util/cutils.c b/util/cutils.c
> index a8a3a3ba3b..a4c8858712 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -296,30 +296,6 @@ static int check_strtox_error(const char *nptr, char *ep,
>      return -libc_errno;
>  }
>  
> -/**
> - * Convert string @nptr to an integer, and store it in @result.
> - *
> - * This is a wrapper around strtol() that is harder to misuse.
> - * Semantics of @nptr, @endptr, @base match strtol() with differences
> - * noted below.
> - *
> - * @nptr may be null, and no conversion is performed then.
> - *
> - * If no conversion is performed, store @nptr in *@endptr and return
> - * -EINVAL.
> - *
> - * If @endptr is null, and the string isn't fully converted, return
> - * -EINVAL.  This is the case when the pointer that would be stored in
> - * a non-null @endptr points to a character other than '\0'.
> - *
> - * If the conversion overflows @result, store INT_MAX in @result,
> - * and return -ERANGE.
> - *
> - * If the conversion underflows @result, store INT_MIN in @result,
> - * and return -ERANGE.
> - *
> - * Else store the converted value in @result, and return zero.
> - */
>  int qemu_strtoi(const char *nptr, const char **endptr, int base,
>                  int *result)
>  {
> @@ -348,31 +324,6 @@ int qemu_strtoi(const char *nptr, const char **endptr, int base,
>      return check_strtox_error(nptr, ep, endptr, errno);
>  }
>  
> -/**
> - * Convert string @nptr to an unsigned integer, and store it in @result.
> - *
> - * This is a wrapper around strtoul() that is harder to misuse.
> - * Semantics of @nptr, @endptr, @base match strtoul() with differences
> - * noted below.
> - *
> - * @nptr may be null, and no conversion is performed then.
> - *
> - * If no conversion is performed, store @nptr in *@endptr and return
> - * -EINVAL.
> - *
> - * If @endptr is null, and the string isn't fully converted, return
> - * -EINVAL.  This is the case when the pointer that would be stored in
> - * a non-null @endptr points to a character other than '\0'.
> - *
> - * If the conversion overflows @result, store UINT_MAX in @result,
> - * and return -ERANGE.
> - *
> - * Else store the converted value in @result, and return zero.
> - *
> - * Note that a number with a leading minus sign gets converted without
> - * the minus sign, checked for overflow (see above), then negated (in
> - * @result's type).  This is exactly how strtoul() works.
> - */
>  int qemu_strtoui(const char *nptr, const char **endptr, int base,
>                   unsigned int *result)
>  {
> @@ -407,30 +358,6 @@ int qemu_strtoui(const char *nptr, const char **endptr, int base,
>      return check_strtox_error(nptr, ep, endptr, errno);
>  }
>  
> -/**
> - * Convert string @nptr to a long integer, and store it in @result.
> - *
> - * This is a wrapper around strtol() that is harder to misuse.
> - * Semantics of @nptr, @endptr, @base match strtol() with differences
> - * noted below.
> - *
> - * @nptr may be null, and no conversion is performed then.
> - *
> - * If no conversion is performed, store @nptr in *@endptr and return
> - * -EINVAL.
> - *
> - * If @endptr is null, and the string isn't fully converted, return
> - * -EINVAL.  This is the case when the pointer that would be stored in
> - * a non-null @endptr points to a character other than '\0'.
> - *
> - * If the conversion overflows @result, store LONG_MAX in @result,
> - * and return -ERANGE.
> - *
> - * If the conversion underflows @result, store LONG_MIN in @result,
> - * and return -ERANGE.
> - *
> - * Else store the converted value in @result, and return zero.
> - */
>  int qemu_strtol(const char *nptr, const char **endptr, int base,
>                  long *result)
>  {
> @@ -449,31 +376,6 @@ int qemu_strtol(const char *nptr, const char **endptr, int base,
>      return check_strtox_error(nptr, ep, endptr, errno);
>  }
>  
> -/**
> - * Convert string @nptr to an unsigned long, and store it in @result.
> - *
> - * This is a wrapper around strtoul() that is harder to misuse.
> - * Semantics of @nptr, @endptr, @base match strtoul() with differences
> - * noted below.
> - *
> - * @nptr may be null, and no conversion is performed then.
> - *
> - * If no conversion is performed, store @nptr in *@endptr and return
> - * -EINVAL.
> - *
> - * If @endptr is null, and the string isn't fully converted, return
> - * -EINVAL.  This is the case when the pointer that would be stored in
> - * a non-null @endptr points to a character other than '\0'.
> - *
> - * If the conversion overflows @result, store ULONG_MAX in @result,
> - * and return -ERANGE.
> - *
> - * Else store the converted value in @result, and return zero.
> - *
> - * Note that a number with a leading minus sign gets converted without
> - * the minus sign, checked for overflow (see above), then negated (in
> - * @result's type).  This is exactly how strtoul() works.
> - */
>  int qemu_strtoul(const char *nptr, const char **endptr, int base,
>                   unsigned long *result)
>  {
> @@ -496,12 +398,6 @@ int qemu_strtoul(const char *nptr, const char **endptr, int base,
>      return check_strtox_error(nptr, ep, endptr, errno);
>  }
>  
> -/**
> - * Convert string @nptr to an int64_t.
> - *
> - * Works like qemu_strtol(), except it stores INT64_MAX on overflow,
> - * and INT_MIN on underflow.
> - */
>  int qemu_strtoi64(const char *nptr, const char **endptr, int base,
>                   int64_t *result)
>  {
> @@ -521,11 +417,6 @@ int qemu_strtoi64(const char *nptr, const char **endptr, int base,
>      return check_strtox_error(nptr, ep, endptr, errno);
>  }
>  
> -/**
> - * Convert string @nptr to an uint64_t.
> - *
> - * Works like qemu_strtoul(), except it stores UINT64_MAX on overflow.
> - */
>  int qemu_strtou64(const char *nptr, const char **endptr, int base,
>                    uint64_t *result)
>  {
> @@ -549,30 +440,6 @@ int qemu_strtou64(const char *nptr, const char **endptr, int base,
>      return check_strtox_error(nptr, ep, endptr, errno);
>  }
>  
> -/**
> - * Convert string @nptr to a double.
> -  *
> - * This is a wrapper around strtod() that is harder to misuse.
> - * Semantics of @nptr and @endptr match strtod() with differences
> - * noted below.
> - *
> - * @nptr may be null, and no conversion is performed then.
> - *
> - * If no conversion is performed, store @nptr in *@endptr and return
> - * -EINVAL.
> - *
> - * If @endptr is null, and the string isn't fully converted, return
> - * -EINVAL. This is the case when the pointer that would be stored in
> - * a non-null @endptr points to a character other than '\0'.
> - *
> - * If the conversion overflows, store +/-HUGE_VAL in @result, depending
> - * on the sign, and return -ERANGE.
> - *
> - * If the conversion underflows, store +/-0.0 in @result, depending on the
> - * sign, and return -ERANGE.
> - *
> - * Else store the converted value in @result, and return zero.
> - */
>  int qemu_strtod(const char *nptr, const char **endptr, double *result)
>  {
>      char *ep;
> @@ -589,12 +456,6 @@ int qemu_strtod(const char *nptr, const char **endptr, double *result)
>      return check_strtox_error(nptr, ep, endptr, errno);
>  }
>  
> -/**
> - * Convert string @nptr to a finite double.
> - *
> - * Works like qemu_strtod(), except that "NaN" and "inf" are rejected
> - * with -EINVAL and no conversion is performed.
> - */
>  int qemu_strtod_finite(const char *nptr, const char **endptr, double *result)
>  {
>      double tmp;
> @@ -614,10 +475,6 @@ int qemu_strtod_finite(const char *nptr, const char **endptr, double *result)
>      return ret;
>  }
>  
> -/**
> - * Searches for the first occurrence of 'c' in 's', and returns a pointer
> - * to the trailing null byte if none was found.
> - */
>  #ifndef HAVE_STRCHRNUL
>  const char *qemu_strchrnul(const char *s, int c)
>  {
> @@ -629,34 +486,6 @@ const char *qemu_strchrnul(const char *s, int c)
>  }
>  #endif
>  
> -/**
> - * parse_uint:
> - *
> - * @s: String to parse
> - * @value: Destination for parsed integer value
> - * @endptr: Destination for pointer to first character not consumed
> - * @base: integer base, between 2 and 36 inclusive, or 0
> - *
> - * Parse unsigned integer
> - *
> - * Parsed syntax is like strtoull()'s: arbitrary whitespace, a single optional
> - * '+' or '-', an optional "0x" if @base is 0 or 16, one or more digits.
> - *
> - * If @s is null, or @base is invalid, or @s doesn't start with an
> - * integer in the syntax above, set *@value to 0, *@endptr to @s, and
> - * return -EINVAL.
> - *
> - * Set *@endptr to point right beyond the parsed integer (even if the integer
> - * overflows or is negative, all digits will be parsed and *@endptr will
> - * point right beyond them).
> - *
> - * If the integer is negative, set *@value to 0, and return -ERANGE.
> - *
> - * If the integer overflows unsigned long long, set *@value to
> - * ULLONG_MAX, and return -ERANGE.
> - *
> - * Else, set *@value to the parsed integer, and return 0.
> - */
>  int parse_uint(const char *s, unsigned long long *value, char **endptr,
>                 int base)
>  {
> @@ -698,20 +527,6 @@ out:
>      return r;
>  }
>  
> -/**
> - * parse_uint_full:
> - *
> - * @s: String to parse
> - * @value: Destination for parsed integer value
> - * @base: integer base, between 2 and 36 inclusive, or 0
> - *
> - * Parse unsigned integer from entire string
> - *
> - * Have the same behavior of parse_uint(), but with an additional check
> - * for additional data after the parsed number. If extra characters are present
> - * after the parsed number, the function will return -EINVAL, and *@v will
> - * be set to 0.
> - */
>  int parse_uint_full(const char *s, unsigned long long *value, int base)
>  {
>      char *endp;
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

