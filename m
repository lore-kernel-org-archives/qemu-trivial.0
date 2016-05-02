Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axCog-0005ay-5t
	for mharc-qemu-trivial@gnu.org; Mon, 02 May 2016 08:19:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1axCoV-0005HE-Nl
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 08:19:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1axCoK-00059Q-1J
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 08:18:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40880)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1axCo2-00050p-0M; Mon, 02 May 2016 08:18:30 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 2AFD340189;
	Mon,  2 May 2016 15:18:03 +0300 (MSK)
To: Jan Vesely <jano.vesely@gmail.com>, qemu-devel@nongnu.org
References: <1461935279-30418-1-git-send-email-jano.vesely@gmail.com>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>, Stefan Weil <sw@weilnetz.de>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <5727457A.30509@msgid.tls.msk.ru>
Date: Mon, 2 May 2016 15:18:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <1461935279-30418-1-git-send-email-jano.vesely@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] configure: Check if struct fsxattr is
 available from linux header
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
X-List-Received-Date: Mon, 02 May 2016 12:19:08 -0000

29.04.2016 16:07, Jan Vesely =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Fixes build failure with --enable-xfsctl and
> new linux headers (>=3D4.5) and older xfsprogs(<4.5):
> In file included from /usr/include/xfs/xfs.h:38:0,
>                  from /var/tmp/portage/app-emulation/qemu-2.5.0-r1/work=
/qemu-2.5.0/block/raw-posix.c:97:
> /usr/include/xfs/xfs_fs.h:42:8: error: redefinition of =E2=80=98struct =
fsxattr=E2=80=99
>  struct fsxattr {
>         ^
> In file included from /var/tmp/portage/app-emulation/qemu-2.5.0-r1/work=
/qemu-2.5.0/block/raw-posix.c:60:0:
> /usr/include/linux/fs.h:155:8: note: originally defined here
>  struct fsxattr {

This is a bug in xfsprogs, which has been fixed by a later
release.

I think it is wrong to fix it in qemu.

Thanks,

/mjt

