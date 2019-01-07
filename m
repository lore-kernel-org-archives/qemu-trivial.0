Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ggQkq-0005uU-Ew
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jan 2019 03:59:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1ggQko-0005tF-Q2
	for qemu-trivial@nongnu.org; Mon, 07 Jan 2019 03:59:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1ggQkl-0000Th-VA
	for qemu-trivial@nongnu.org; Mon, 07 Jan 2019 03:59:25 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44034)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1ggQkj-0000Q4-KN
	for qemu-trivial@nongnu.org; Mon, 07 Jan 2019 03:59:23 -0500
Received: by mail-oi1-f196.google.com with SMTP id m6so35258003oig.11
	for <qemu-trivial@nongnu.org>; Mon, 07 Jan 2019 00:59:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4GWv31SBU9rVXpz8/1PXpayCeYS7BV69Svb/hc+/23s=;
	b=LbEwBgfVBE2qhZ6UJZAmm6MbrGzco/RKWxW/rVsF1r1vh9BaTQ0e3J/K7oCg4BN75g
	XO3ZyaOiCEpspwAowQzjlo8iUG+WJvuFl6ETQRcjZzT6pJoppqFvPF5QnlVH/B5Xd5yH
	JsIA7sG0VyDr12ZdNueLKFaaV6ygDdwok/Y+kjO51WTYzUDIV7xwltpeEX0+JwEWkGKe
	Ay/iEOqzEcd2FcDGboj+ItLt+qoU26MU5ajNQ5nxAzFVM3iOiHAEaZXpBtXteTrviZN5
	A/usvCWGM8fxRQOmBfjoZ4BlKpbfcabwEoM+ezOvgRlFvZny9iL3wzgSRegjk8cDLTA4
	u3Dg==
X-Gm-Message-State: AA+aEWZTAv2Tk+wcHK+8H9XYcc6kXZ1egrKnnzapTuxtCiwLxSjb2shY
	ZI+xy628IMFzy8zpQ6Iyk0j73Wt7rEzLa14O1dOftA==
X-Google-Smtp-Source: AFSGD/VGh3CH/1oAHHpnX3AaKqmF4cz3bocvvUpEZuALOcJEHFY5Se6IqflDzuwUhArRl2soUDvMlIW7q8R92d9hw9o=
X-Received: by 2002:aca:ed48:: with SMTP id l69mr42634175oih.31.1546851554825; 
	Mon, 07 Jan 2019 00:59:14 -0800 (PST)
MIME-Version: 1.0
References: <20190104181208.7809-1-philmd@redhat.com>
	<20190104181208.7809-2-philmd@redhat.com>
In-Reply-To: <20190104181208.7809-2-philmd@redhat.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Mon, 7 Jan 2019 09:59:03 +0100
Message-ID: <CAGxU2F6wbeFXAvcCMJbDn4_FF3iigiD25QZVo7RnR2--YbUbrQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, qemu-trivial@nongnu.org,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
	Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	"open list:S390" <qemu-s390x@nongnu.org>,
	Richard Henderson <rth@twiddle.net>, 
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.167.196
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
X-List-Received-Date: Mon, 07 Jan 2019 08:59:27 -0000

On Fri, Jan 4, 2019 at 7:12 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> The size_to_str() function doesn't need to be in a generic header.
>
> It makes also sens to find this function in the same header than
> the opposite string to size functions: qemu_strtosz*().
> Note than this function is already implemented in util/cutils.c.
>
> Since we introduce a new function in a header, we document it,
> using the previous comment from the source file.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/qemu-common.h        |  1 -
>  include/qemu/cutils.h        | 13 +++++++++++++
>  qapi/string-output-visitor.c |  2 +-
>  util/cutils.c                |  6 ------
>  4 files changed, 14 insertions(+), 8 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index ed60ba251d..760527294f 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -153,7 +153,6 @@ void qemu_hexdump(const char *buf, FILE *fp, const ch=
ar *prefix, size_t size);
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
> @@ -157,6 +157,19 @@ int qemu_strtosz(const char *nptr, const char **end,=
 uint64_t *result);
>  int qemu_strtosz_MiB(const char *nptr, const char **end, uint64_t *resul=
t);
>  int qemu_strtosz_metric(const char *nptr, const char **end, uint64_t *re=
sult);
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
>      static const char *suffixes[] =3D { "", "Ki", "Mi", "Gi", "Ti", "Pi"=
, "Ei" };
> --
> 2.17.2
>

