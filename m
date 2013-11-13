Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VgZ1M-0001jc-Nr
	for mharc-qemu-trivial@gnu.org; Wed, 13 Nov 2013 06:54:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37874)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgZ1F-0001aw-Nq
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 06:54:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgZ1A-0000gF-Ok
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 06:54:01 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56684)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VgZ10-0000bZ-2e; Wed, 13 Nov 2013 06:53:46 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 11EBC41736;
	Wed, 13 Nov 2013 15:53:35 +0400 (MSK)
Message-ID: <5283683F.9020102@msgid.tls.msk.ru>
Date: Wed, 13 Nov 2013 15:53:35 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1384105751-12815-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1384105751-12815-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [PATCH for 1.7] qga: Fix compilation for old
 versions of MinGW
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
X-List-Received-Date: Wed, 13 Nov 2013 11:54:06 -0000

10.11.2013 21:49, Stefan Weil wrote:
> While MinGW-w64 can compile the qga code, MinGW from Ubuntu lenny
> (gcc-mingw32 4.4.2-3) shows these errors:

I guess you mean Debian lenny, not Ubuntu lenny here ;)  And lenny
is an "old-old-stable" Debian release - it was before squeeze which
is now oldstable.  Lenny has been released at 14 Feb 2009...

> In file included from qga/vss-win32.c:17:
> qga/vss-win32/requester.h:31:
>  error: expected =C2=BB=3D=C2=AB, =C2=BB,=C2=AB, =C2=BB;=C2=AB, =C2=BBa=
sm=C2=AB or =C2=BB__attribute__=C2=AB before =C2=BBrequester_init=C2=AB
> qga/vss-win32/requester.h:32:
>  error: expected =C2=BB=3D=C2=AB, =C2=BB,=C2=AB, =C2=BB;=C2=AB, =C2=BBa=
sm=C2=AB or =C2=BB__attribute__=C2=AB before =C2=BBrequester_deinit=C2=AB
>=20
> The macro STDAPI is unknown, so add the missing include file which
> defines it.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>=20
> This patch also fixes the same error on the MinGW buildbot.
> I did not notice it earlier because I usually compile with MinGW-w64.
>=20
> Regards,
> Stefan
>=20
>  qga/vss-win32/requester.h |    1 +
>  1 file changed, 1 insertion(+)

Thanks, applied to the trivial-patches queue, with s/Ubuntu/Debian/ - hop=
efully
this is okay :)

/mjt

