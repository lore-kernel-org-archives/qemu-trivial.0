Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yan4K-0003WT-Ax
	for mharc-qemu-trivial@gnu.org; Wed, 25 Mar 2015 11:18:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44754)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yan4E-0003IV-HA
	for qemu-trivial@nongnu.org; Wed, 25 Mar 2015 11:18:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yan48-0006g9-Q7
	for qemu-trivial@nongnu.org; Wed, 25 Mar 2015 11:18:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56812)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Yan43-0006eE-CI; Wed, 25 Mar 2015 11:17:51 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A95A542654;
	Wed, 25 Mar 2015 18:17:50 +0300 (MSK)
Message-ID: <5512D1A0.9020106@msgid.tls.msk.ru>
Date: Wed, 25 Mar 2015 18:17:52 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1426871518-2761-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1426871518-2761-1-git-send-email-sw@weilnetz.de>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: QEMU Developer <qemu-devel@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] acpi: Add missing GCC_FMT_ATTR to local
	function
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
X-List-Received-Date: Wed, 25 Mar 2015 15:18:06 -0000

20.03.2015 20:11, Stefan Weil wrote:
> This fixes these gcc warnings (not enabled in default build):
>=20
> hw/acpi/aml-build.c:83:5: warning:
>  function might be possible candidate for =E2=80=98gnu_printf=E2=80=99 =
format attribute [-Wsuggest-attribute=3Dformat]
> hw/acpi/aml-build.c:88:5: warning:
>  function might be possible candidate for =E2=80=98gnu_printf=E2=80=99 =
format attribute [-Wsuggest-attribute=3Dformat]

Not very important but does not hurt, applied to -trivial, thanks!

/mjt

