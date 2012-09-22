Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFX9Y-0006lK-FP
	for mharc-qemu-trivial@gnu.org; Sat, 22 Sep 2012 17:22:20 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TFX9W-0006kv-3U
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 17:22:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TFX9V-0008MY-07
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 17:22:18 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:32846)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TFX9U-0008Lq-QP
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 17:22:16 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	62B977280033; Sat, 22 Sep 2012 23:22:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id BwmcRhkt8Ls3; Sat, 22 Sep 2012 23:22:14 +0200 (CEST)
Received: from flocke.weilnetz.de (p54ADAD92.dip.t-dialin.net [84.173.173.146])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	E59497280032; Sat, 22 Sep 2012 23:22:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1TFX9R-00016j-78; Sat, 22 Sep 2012 23:22:13 +0200
Message-ID: <505E2C05.7060507@weilnetz.de>
Date: Sat, 22 Sep 2012 23:22:13 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20120724 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Blue Swirl <blauwirbel@gmail.com>
References: <1345664451-28890-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1345664451-28890-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] w32: Always use standard instead of
	native format strings
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Sep 2012 21:22:19 -0000

Am 22.08.2012 21:40, schrieb Stefan Weil:
> GLib 2.0 include files use __printf__ for the format attribute
> which resolves to native format strings on w32 hosts.
>
> QEMU wants standard format strings instead of native format
> strings, so we simply change any declaration with __printf__
> to use __gnu_printf__.
>
> This works because all basic printf functions support both
> kinds of format strings.
>
> This fixes a compiler warning:
>
> qapi/string-output-visitor.c: In function =E2=80=98print_type_int=E2=80=
=99:
> qapi/string-output-visitor.c:34:5: warning: unknown conversion type cha=
racter =E2=80=98l=E2=80=99 in format [-Wformat]
> qapi/string-output-visitor.c:34:5: warning: too many arguments for form=
at [-Wformat-extra-args]
>
> Signed-off-by: Stefan Weil<sw@weilnetz.de>
> ---
>   compiler.h |    5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/compiler.h b/compiler.h
> index 07ba1f8..c734a71 100644
> --- a/compiler.h
> +++ b/compiler.h
> @@ -44,6 +44,11 @@
>      /* Use gnu_printf when supported (qemu uses standard format string=
s). */
>   #  define GCC_ATTR __attribute__((__unused__, format(gnu_printf, 1, 2=
)))
>   #  define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m))=
)
> +#  if defined(_WIN32)
> +    /* Map __printf__ to __gnu_printf__ because we want standard forma=
t strings
> +     * even when MinGW or GLib include files use __printf__. */
> +#   define __printf__ __gnu_printf__
> +#  endif
>   # endif
>   #if defined(_WIN32)
>   #define GCC_WEAK __attribute__((weak))
>   =20

Ping? Should I send a pull request?

Stefan W.



