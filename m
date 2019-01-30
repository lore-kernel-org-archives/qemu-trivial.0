Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gon19-0000T4-IN
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 05:22:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gon16-0000RN-Fz
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 05:22:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gon15-0001xH-Hi
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 05:22:48 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:49055)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gon15-0001vd-8f; Wed, 30 Jan 2019 05:22:47 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1M6lxe-1goDSF0QZy-008Kt2; Wed, 30 Jan 2019 11:22:29 +0100
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
	<20190104181208.7809-2-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	xsFNBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
	WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
	SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
	UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
	Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
	JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
	q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
	RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
	8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
	LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABzSNMYXVyZW50IFZp
	dmllciA8bHZpdmllckByZWRoYXQuY29tPsLBeAQTAQIAIgUCVgVQgAIbAwYLCQgHAwIGFQgC
	CQoLBBYCAwECHgECF4AACgkQ8ww4vT8vvjwpgg//fSGy0Rs/t8cPFuzoY1cex4limJQfReLr
	SJXCANg9NOWy/bFK5wunj+h/RCFxIFhZcyXveurkBwYikDPUrBoBRoOJY/BHK0iZo7/WQkur
	6H5losVZtrotmKOGnP/lJYZ3H6OWvXzdz8LL5hb3TvGOP68K8Bn8UsIaZJoeiKhaNR0sOJyI
	YYbgFQPWMHfVwHD/U+/gqRhD7apVysxv5by/pKDln1I5v0cRRH6hd8M8oXgKhF2+rAOL7gvh
	jEHSSWKUlMjC7YwwjSZmUkL+TQyE18e2XBk85X8Da3FznrLiHZFHQ/NzETYxRjnOzD7/kOVy
	gKD/o7asyWQVU65mh/ECrtjfhtCBSYmIIVkopoLaVJ/kEbVJQegT2P6NgERC/31kmTF69vn8
	uQyW11Hk8tyubicByL3/XVBrq4jZdJW3cePNJbTNaT0d/bjMg5zCWHbMErUib2Nellnbg6bc
	2HLDe0NLVPuRZhHUHM9hO/JNnHfvgiRQDh6loNOUnm9Iw2YiVgZNnT4soUehMZ7au8PwSl4I
	KYE4ulJ8RRiydN7fES3IZWmOPlyskp1QMQBD/w16o+lEtY6HSFEzsK3o0vuBRBVp2WKnssVH
	qeeV01ZHw0bvWKjxVNOksP98eJfWLfV9l9e7s6TaAeySKRRubtJ+21PRuYAxKsaueBfUE7ZT
	7zfOwU0EVgUmGQEQALxSQRbl/QOnmssVDxWhHM5TGxl7oLNJms2zmBpcmlrIsn8nNz0rRyxT
	460k2niaTwowSRK8KWVDeAW6ZAaWiYjLlTunoKwvF8vP3JyWpBz0diTxL5o+xpvy/Q6YU3BN
	efdq8Vy3rFsxgW7mMSrI/CxJ667y8ot5DVugeS2NyHfmZlPGE0Nsy7hlebS4liisXOrN3jFz
	asKyUws3VXek4V65lHwB23BVzsnFMn/bw/rPliqXGcwl8CoJu8dSyrCcd1Ibs0/Inq9S9+t0
	VmWiQWfQkz4rvEeTQkp/VfgZ6z98JRW7S6l6eophoWs0/ZyRfOm+QVSqRfFZdxdP2PlGeIFM
	C3fXJgygXJkFPyWkVElr76JTbtSHsGWbt6xUlYHKXWo+xf9WgtLeby3cfSkEchACrxDrQpj+
	Jt/JFP+q997dybkyZ5IoHWuPkn7uZGBrKIHmBunTco1+cKSuRiSCYpBIXZMHCzPgVDjk4viP
	brV9NwRkmaOxVvye0vctJeWvJ6KA7NoAURplIGCqkCRwg0MmLrfoZnK/gRqVJ/f6adhU1oo6
	z4p2/z3PemA0C0ANatgHgBb90cd16AUxpdEQmOCmdNnNJF/3Zt3inzF+NFzHoM5Vwq6rc1JP
	jfC3oqRLJzqAEHBDjQFlqNR3IFCIAo4SYQRBdAHBCzkM4rWyRhuVABEBAAHCwV8EGAECAAkF
	AlYFJhkCGwwACgkQ8ww4vT8vvjwg9w//VQrcnVg3TsjEybxDEUBm8dBmnKqcnTBFmxN5FFtI
	WlEuY8+YMiWRykd8Ln9RJ/98/ghABHz9TN8TRo2b6WimV64FmlVn17Ri6FgFU3xNt9TTEChq
	AcNg88eYryKsYpFwegGpwUlaUaaGh1m9OrTzcQy+klVfZWaVJ9Nw0keoGRGb8j4XjVpL8+2x
	OhXKrM1fzzb8JtAuSbuzZSQPDwQEI5CKKxp7zf76J21YeRrEW4WDznPyVcDTa+tz++q2S/Bp
	P4W98bXCBIuQgs2m+OflERv5c3Ojldp04/S4NEjXEYRWdiCxN7ca5iPml5gLtuvhJMSy36gl
	U6IW9kn30IWuSoBpTkgV7rLUEhh9Ms82VWW/h2TxL8enfx40PrfbDtWwqRID3WY8jLrjKfTd
	R3LW8BnUDNkG+c4FzvvGUs8AvuqxxyHbXAfDx9o/jXfPHVRmJVhSmd+hC3mcQ+4iX5bBPBPM
	oDqSoLt5w9GoQQ6gDVP2ZjTWqwSRMLzNr37rJjZ1pt0DCMMTbiYIUcrhX8eveCJtY7NGWNyx
	FCRkhxRuGcpwPmRVDwOl39MB3iTsRighiMnijkbLXiKoJ5CDVvX5yicNqYJPKh5MFXN1bvsB
	kmYiStMRbrD0HoY1kx5/VozBtc70OU0EB8Wrv9hZD+Ofp0T3KOr1RUHvCZoLURfFhSQ=
Message-ID: <56ccdced-739b-49f9-7251-ec75aba01f92@vivier.eu>
Date: Wed, 30 Jan 2019 11:22:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190104181208.7809-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Nw/AOqZgxxk3FDWrazqYEYeZabMEg1MWN3TOdio7+YtAVTu2+MB
	shjdaFM24tNFBUIkMH6HUA+w6HSjoXtl5AG777XoAi9Nzq0TipikLyPx8FSVHmVyBsQ5X+V
	6E3HomccwLuFgydL9m+W7LFY/WC64PtstdqzD9FtLsDzI2Xtosxa8ROO614ZI67YAoUutMe
	z/qXvPM1vNIosH0b6V4rQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qaoqMuJz8Mk=:f3rv8jI3aw1AICRgpeR8FL
	BVpL5fFSej1aOJlFhqOZom9KWz+IealAcK/HX4ggRg6h65TUm/k7Z1eOBUvzjxfwgNZrTWyws
	E6/noaAsswokQ7XnNQFe+qZ5brWXOnK3/uX1G5TD7B4PqCBpT63o1JVAFTV/u1BeK4ou8TS5b
	nO00OsJQSdaSEVXeqCl6NAs1eYwKw55W8Exdfdo2HHqqSZIQA2EHdBFiMiUKVFoVS04Bq9rT2
	u/PUz8Y19iUwG1e3cOPgtf3n530KcgArrS8UknXoTZl6hfOEGVSUQSbQIszi9pXXagAgHz6++
	dKWGcn5RnVnQVS70uDw5kXIPOrw3O9R3xNWnOAc5ep22Elmpm3HrNQvQgvmlZ2whHARMQ1DqJ
	CbQdoIM0Cs73vG9oRZy9ElcL3Oq87INHoFSWBZOGz4os21Sb8Se7x+FVU42RSA3DEiGudqYpg
	9Y42yN9WD04G2BELO7JMLIp466Vhi2ixo/OYKyj9kKmmAxAU+H6yjvnKWuGOK3uSGgXwaXeji
	hMUaJp/GECtAy11bFraV4z4ijOhdsbBDiYfw5FHjlxwfvcqCc0pPVTq9C7jf2H+pqVwjkz2fY
	Ujdg542R0pW9k2xvId/2jtdZlHlG8gh0s9/aukgyxYh8yFMcaHQqDDD1nUpObM225SlFQumtg
	DtZiqEqbvRRE8OjoLNy4ryC+fiTGU7kyn+FiWfwGyVUoWL9dovcJRFv3RijxAIXkyM2+mjy8l
	vUufBP7umcrRYozI+dBntoqWjYVPlTooAOXqTyXpxUM9FwzS+YkwnP8Ytv4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: Re: [Qemu-trivial] [PATCH v2 1/3] util/cutils: Move size_to_str()
 from "qemu-common.h" to "cutils.h"
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
X-List-Received-Date: Wed, 30 Jan 2019 10:22:49 -0000

On 04/01/2019 19:12, Philippe Mathieu-Daudé wrote:
> The size_to_str() function doesn't need to be in a generic header.
> 
> It makes also sens to find this function in the same header than
> the opposite string to size functions: qemu_strtosz*().
> Note than this function is already implemented in util/cutils.c.
> 
> Since we introduce a new function in a header, we document it,
> using the previous comment from the source file.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/qemu-common.h        |  1 -
>  include/qemu/cutils.h        | 13 +++++++++++++
>  qapi/string-output-visitor.c |  2 +-
>  util/cutils.c                |  6 ------
>  4 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index ed60ba251d..760527294f 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -153,7 +153,6 @@ void qemu_hexdump(const char *buf, FILE *fp, const char *prefix, size_t size);
>  int parse_debug_env(const char *name, int max, int initial);
>  
>  const char *qemu_ether_ntoa(const MACAddr *mac);
> -char *size_to_str(uint64_t val);
>  void page_size_init(void);
>  
>  /* returns non-zero if dump is in progress, otherwise zero is
> diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
> index d2dad3057c..9ee40470e3 100644
> --- a/include/qemu/cutils.h
> +++ b/include/qemu/cutils.h
> @@ -157,6 +157,19 @@ int qemu_strtosz(const char *nptr, const char **end, uint64_t *result);
>  int qemu_strtosz_MiB(const char *nptr, const char **end, uint64_t *result);
>  int qemu_strtosz_metric(const char *nptr, const char **end, uint64_t *result);
>  
> +/**
> + * size_to_str:
> + *
> + * Return human readable string for size @val.
> + * Use IEC binary units like KiB, MiB, and so forth.
> + *
> + * @val: The value to format.
> + *       Can be anything that uint64_t allows (no more than "16 EiB").
> + *
> + * Caller is responsible for passing it to g_free().
> + */
> +char *size_to_str(uint64_t val);
> +
>  /* used to print char* safely */
>  #define STR_OR_NULL(str) ((str) ? (str) : "null")
>  
> diff --git a/qapi/string-output-visitor.c b/qapi/string-output-visitor.c
> index 7ab64468d9..edf268b373 100644
> --- a/qapi/string-output-visitor.c
> +++ b/qapi/string-output-visitor.c
> @@ -11,9 +11,9 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
>  #include "qapi/string-output-visitor.h"
>  #include "qapi/visitor-impl.h"
> +#include "qemu/cutils.h"
>  #include "qemu/host-utils.h"
>  #include <math.h>
>  #include "qemu/range.h"
> diff --git a/util/cutils.c b/util/cutils.c
> index e098debdc0..a8a3a3ba3b 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -816,12 +816,6 @@ const char *qemu_ether_ntoa(const MACAddr *mac)
>      return ret;
>  }
>  
> -/*
> - * Return human readable string for size @val.
> - * @val can be anything that uint64_t allows (no more than "16 EiB").
> - * Use IEC binary units like KiB, MiB, and so forth.
> - * Caller is responsible for passing it to g_free().
> - */
>  char *size_to_str(uint64_t val)
>  {
>      static const char *suffixes[] = { "", "Ki", "Mi", "Gi", "Ti", "Pi", "Ei" };
> 

Applied to my trivial-patches branch with updated patch description.

Thanks,
Laurent

