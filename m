Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vj6Ll-0003lx-Gr
	for mharc-qemu-trivial@gnu.org; Wed, 20 Nov 2013 06:53:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vj6Le-0003Zp-Cr
	for qemu-trivial@nongnu.org; Wed, 20 Nov 2013 06:53:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vj6LZ-0003C9-HC
	for qemu-trivial@nongnu.org; Wed, 20 Nov 2013 06:53:34 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40814)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vj6LP-00037K-Fp; Wed, 20 Nov 2013 06:53:19 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C7D5B42C7C;
	Wed, 20 Nov 2013 15:53:18 +0400 (MSK)
Message-ID: <528CA2AE.6050303@msgid.tls.msk.ru>
Date: Wed, 20 Nov 2013 15:53:18 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1384711222-8916-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1384711222-8916-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [PATCH for 1.7] acpi-build: Fix compiler warning
 (missing gnu_printf format attribute)
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
X-List-Received-Date: Wed, 20 Nov 2013 11:53:39 -0000

17.11.2013 22:00, Stefan Weil wrote:
> gcc 4.8.2 reports this warning when extra warnings are enabled (-Wextra=
):
>=20
>   CC    m68k-softmmu/hw/m68k/mcf5206.o
> hw/i386/acpi-build.c: In function =E2=80=98build_append_nameseg=E2=80=99=
:
> hw/i386/acpi-build.c:294:5: error:
>  function might be possible candidate for =E2=80=98gnu_printf=E2=80=99 =
format attribute [-Werror=3Dsuggest-attribute=3Dformat]
>      g_string_vprintf(s, format, args);
>      ^
>=20
> When this warning is fixed, there is a new compiler warning:
>=20
>   CC    i386-softmmu/hw/i386/acpi-build.o
> hw/i386/acpi-build.c: In function =E2=80=98build_append_notify=E2=80=99=
:
> hw/i386/acpi-build.c:632:5: error:
>  format not a string literal and no format arguments [-Werror=3Dformat-=
security]
>      build_append_nameseg(method, name);
>      ^
>=20
> This is fixed here, too.

Thanks, applied to the trivial-patches queue.

Note this patch also triggers checkpatch.pl error:

> +static void GCC_FMT_ATTR(2, 3)
> +build_append_nameseg(GArray *array, const char *format, ...)
                               ^
ERROR: need consistent spacing around '*' (ctx:WxV)
#40: FILE: hw/i386/acpi-build.c:289:

It looks like checkpatch.pl needs some tweaking here, because
the spacing here is really consistent, as far as I can see.

/mjt

