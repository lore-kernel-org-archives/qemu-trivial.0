Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vj6IA-0002MC-FS
	for mharc-qemu-trivial@gnu.org; Wed, 20 Nov 2013 06:49:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vj6I4-0002EN-Be
	for qemu-trivial@nongnu.org; Wed, 20 Nov 2013 06:49:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vj6Hz-0002Lr-Fd
	for qemu-trivial@nongnu.org; Wed, 20 Nov 2013 06:49:52 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:60944)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vj6Ho-0002Kj-Sj; Wed, 20 Nov 2013 06:49:37 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 0539842C78;
	Wed, 20 Nov 2013 15:49:34 +0400 (MSK)
Message-ID: <528CA1CD.2020803@msgid.tls.msk.ru>
Date: Wed, 20 Nov 2013 15:49:33 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1384712392-10458-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1384712392-10458-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [PATCH for 1.7 v2] qga: Fix compiler warnings
 (missing format attribute, wrong format strings)
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
X-List-Received-Date: Wed, 20 Nov 2013 11:49:57 -0000

17.11.2013 22:19, Stefan Weil wrote:
> gcc 4.8.2 reports this warning when extra warnings are enabled (-Wextra=
):
>=20
>   CC    qga/commands.o
> qga/commands.c: In function =E2=80=98slog=E2=80=99:
> qga/commands.c:28:5: error:
>  function might be possible candidate for =E2=80=98gnu_printf=E2=80=99 =
format attribute [-Werror=3Dsuggest-attribute=3Dformat]
>      g_logv("syslog", G_LOG_LEVEL_INFO, fmt, ap);
>      ^
>=20
> gcc 4.8.2 reports this warning when slog is declared with the
> gnu_printf format attribute:
>=20
> qga/commands-posix.c: In function =E2=80=98qmp_guest_file_open=E2=80=99=
:
> qga/commands-posix.c:404:5: warning:
>  format =E2=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=
=99, but argument 2 has type =E2=80=98int64_t=E2=80=99 [-Wformat=3D]
>      slog("guest-file-open, handle: %d", handle);
>      ^
>=20
> On 32 bit hosts there are three more warnings which are also fixed here=
.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>=20
> v2: Fix three more wrong format strings for 32 bit hosts.

Thanks, applied to the trivial-patches queue.

/mjt

