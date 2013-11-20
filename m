Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vj4UT-0008Sy-Tu
	for mharc-qemu-trivial@gnu.org; Wed, 20 Nov 2013 04:54:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vj4UL-0008M0-IL
	for qemu-trivial@nongnu.org; Wed, 20 Nov 2013 04:54:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vj4UF-0001iY-KW
	for qemu-trivial@nongnu.org; Wed, 20 Nov 2013 04:54:25 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:37236)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vj4Tz-0001On-DF; Wed, 20 Nov 2013 04:54:03 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id DAB2842C2A;
	Wed, 20 Nov 2013 13:53:53 +0400 (MSK)
Message-ID: <528C86B1.4020808@msgid.tls.msk.ru>
Date: Wed, 20 Nov 2013 13:53:53 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1384711242-8978-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1384711242-8978-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [PATCH for 1.7] qobject: Fix compiler warning
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
X-List-Received-Date: Wed, 20 Nov 2013 09:54:31 -0000

17.11.2013 22:00, Stefan Weil wrote:
> gcc 4.8.2 reports this warning when extra warnings are enabled (-Wextra=
):
>=20
>   CC    qobject/qerror.o
> qobject/qerror.c: In function =E2=80=98qerror_from_info=E2=80=99:
> qobject/qerror.c:53:5: error:
>  function might be possible candidate for =E2=80=98gnu_printf=E2=80=99 =
format attribute [-Werror=3Dsuggest-attribute=3Dformat]
>      qerr->err_msg =3D g_strdup_vprintf(fmt, *va);
>      ^

Thanks, applied to the trivial-patches queue.  Hopefully we found and ver=
ified
all invlcations of qerror_from_info() and there really are no "wrong" inv=
ocations
which will lead to new warnings after this printf attribute addition... ;=
)

(This function is static so only this file needed to be checked).

/mjt

