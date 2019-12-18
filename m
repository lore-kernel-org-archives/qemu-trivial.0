Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ihXV0-0003Wm-9T
	for mharc-qemu-trivial@gnu.org; Wed, 18 Dec 2019 06:28:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47043)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1ihXUx-0003WZ-2l
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 06:28:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1ihXUw-0008NF-1u
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 06:28:10 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:58531)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1ihXUv-0008Dj-Ne
 for qemu-trivial@nongnu.org; Wed, 18 Dec 2019 06:28:09 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MnFps-1i0oIV1BZ6-00jLUf for <qemu-trivial@nongnu.org>; Wed, 18 Dec 2019
 12:28:07 +0100
Subject: Re: [PATCH 1/2] util/cutils: Turn FIXME comment into
 QEMU_BUILD_BUG_ON()
To: qemu-trivial@nongnu.org
References: <20191125133846.27790-1-armbru@redhat.com>
 <20191125133846.27790-2-armbru@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <0a9621b5-ea1c-3fa9-30ee-0bbac5065744@vivier.eu>
Date: Wed, 18 Dec 2019 12:28:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191125133846.27790-2-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9VLJ6LyF5IiurP/vc2cYjmLAMbb/A+/f6svxb8oBvXn3I8hKLUK
 b5FIdLHzja2evlMfpnAfT0zkb2KZNEdiyhQaPBGaXjqKTRzU3JCk9R1lMyQgWVqc/O6vsOQ
 hbt3GldXjSFpbzsG5p3kV+FRiCwuGfVL/sBG8hZnINPyF54ItMtrl1H2hHNGU61qtIUYcXi
 924SfwlQXWSPUNOP6OOkQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ENVoulOEMSs=:Qum79DPWkeVDJ1meU9Afra
 Q8SsZC6J4cLgVHiaqM/ZT1lF4DR1/sMfYbTSnH+3EXRW/g+DiX/pz0CJ2y1ewQyqeO1q6JBzY
 26s2Ni6nFYcZhCze6Slxk/Jc1g2eGYqBm+WxBOSu0uEkTIIFH/0Y2y1I2u/3jqem5qsQET0+U
 wwivp0MYxa3BvJoSTX5JG7A2XKvJOgpZkYCy5VUPS0Bm4K8pB0mHZOGWZWnu3QHi3WJkOiXET
 gJdF+5q+JgGhq8LINgwAdfLDVRqTKTA5hn61RzaexWu+VtawjK2Ez5Kwr6vxea7Jb7SqPnwPY
 p6PEe40CPe6IBOUkUbuZh/up2KlNQzdXqwQYg8L8q+Qfr7mB1q0VEiMcMHWT/GtibTP4l8NLi
 SwzfMS7f3owJ10OrnJTDtwaCXjsuXEb+BNynvuQyKenkPRQ+IECHV3yTpo4OgEx1sWOMiXHxX
 CO9df4vACrjMFTOpcA6hiN/Tz2imwxdhb9S5oUYvXUK7PUdvXAoRZF77cs5PILOlDvz3FG+6W
 3r5qUseLQgM61WhkbbiMBxlyDGok5WHrViP8gSQ8k+grihJmIK1qBaWzgP0GS2mEEPS4ZlvIO
 f+4Twn3iXhhMv8ztdjuvKfeHK/DyYRAImbg90smQ9MpRXtRKOpoE+ivvFr3rA+cUAZNCgSXS/
 ijp2w+pyfU7DRnjkz3Ygvp7RftWPyfSJwRQeEKB3+ApE6IjHOLHsUpxglRdtD9BFDjvfJOAO4
 GLcEnKhFySpxVvbu3Y4I6KcnyUFD9Ugk/fwa3c0dNIwIJCAAqanLsVMvAJ++9qlJHi3EkvIGX
 5+ocg5eqwsnVDMet879J974TIspBQn94zOhiAh7I1jweRda2QkA/tkwWRNzldUCQRIs8ewhzA
 BO2GVAF4yjzyYoK4mvqUi5IQigO43J0lFr0jKo+J8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.131
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Dec 2019 11:28:12 -0000

Le 25/11/2019 à 14:38, Markus Armbruster a écrit :
> qemu_strtoi64() assumes int64_t is long long.  This is marked FIXME.
> Replace by a QEMU_BUILD_BUG_ON() to avoid surprises.
> 
> Same for qemu_strtou64().
> 
> Fix a typo in qemu_strtoul()'s contract while there.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  util/cutils.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/util/cutils.c b/util/cutils.c
> index fd591cadf0..b372dd3e68 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -502,7 +502,7 @@ int qemu_strtoul(const char *nptr, const char **endptr, int base,
>   * Convert string @nptr to an int64_t.
>   *
>   * Works like qemu_strtol(), except it stores INT64_MAX on overflow,
> - * and INT_MIN on underflow.
> + * and INT64_MIN on underflow.
>   */
>  int qemu_strtoi64(const char *nptr, const char **endptr, int base,
>                   int64_t *result)
> @@ -517,8 +517,9 @@ int qemu_strtoi64(const char *nptr, const char **endptr, int base,
>          return -EINVAL;
>      }
>  
> +    /* This assumes int64_t is long long TODO relax */
> +    QEMU_BUILD_BUG_ON(sizeof(int64_t) != sizeof(long long)); 
>      errno = 0;
> -    /* FIXME This assumes int64_t is long long */
>      *result = strtoll(nptr, &ep, base);
>      return check_strtox_error(nptr, ep, endptr, errno);
>  }
> @@ -541,8 +542,9 @@ int qemu_strtou64(const char *nptr, const char **endptr, int base,
>          return -EINVAL;
>      }
>  
> +    /* This assumes uint64_t is unsigned long long TODO relax */
> +    QEMU_BUILD_BUG_ON(sizeof(uint64_t) != sizeof(unsigned long long));
>      errno = 0;
> -    /* FIXME This assumes uint64_t is unsigned long long */
>      *result = strtoull(nptr, &ep, base);
>      /* Windows returns 1 for negative out-of-range values.  */
>      if (errno == ERANGE) {
> 

Applied to my trivial-patches branch with removed trailing whitespace.

Thanks,
Laurent


