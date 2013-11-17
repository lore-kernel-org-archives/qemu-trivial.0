Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vi99L-00038E-Jm
	for mharc-qemu-trivial@gnu.org; Sun, 17 Nov 2013 15:40:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vi99C-0002zU-VT
	for qemu-trivial@nongnu.org; Sun, 17 Nov 2013 15:40:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vi996-0003A5-W8
	for qemu-trivial@nongnu.org; Sun, 17 Nov 2013 15:40:46 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:33248)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vi98u-00039R-Hd; Sun, 17 Nov 2013 15:40:28 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 0653341E3B;
	Mon, 18 Nov 2013 00:40:25 +0400 (MSK)
Message-ID: <528929B8.9010706@msgid.tls.msk.ru>
Date: Mon, 18 Nov 2013 00:40:24 +0400
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
X-List-Received-Date: Sun, 17 Nov 2013 20:40:53 -0000

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

Why are you sending for-1.7 patches which fixes issues which are not
present in 1.7?  As far as I can see, -Wextra isn't enabled in 1.7, is it=
?

Thanks,

/mjt

