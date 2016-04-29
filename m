Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aw8sv-0005tS-2Y
	for mharc-qemu-trivial@gnu.org; Fri, 29 Apr 2016 09:55:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aw8sm-0005Zs-P4
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 09:55:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aw8sb-0001qS-38
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 09:54:55 -0400
Received: from mail.weilnetz.de ([37.221.199.173]:47100)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aw8sa-0001nz-U5
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 09:54:49 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id 4B12E11810AF;
	Fri, 29 Apr 2016 15:54:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id JpdBWt8V71G3; Fri, 29 Apr 2016 15:54:28 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (mobile-207-146.wlan.uni-mannheim.de
	[134.155.207.146])
	by mail.weilnetz.de (Postfix) with ESMTPSA id 5A8E71181097;
	Fri, 29 Apr 2016 15:54:28 +0200 (CEST)
To: Jan Vesely <jano.vesely@gmail.com>, qemu-devel@nongnu.org
References: <1461935279-30418-1-git-send-email-jano.vesely@gmail.com>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
From: Stefan Weil <sw@weilnetz.de>
X-Enigmail-Draft-Status: N1110
Message-ID: <57236794.2020901@weilnetz.de>
Date: Fri, 29 Apr 2016 15:54:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <1461935279-30418-1-git-send-email-jano.vesely@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
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
X-List-Received-Date: Fri, 29 Apr 2016 13:55:07 -0000

Am 29.04.2016 um 15:07 schrieb Jan Vesely:
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
>=20
> CC: qemu-trivial@nongnu.org
> CC: Markus Armbruster <armbru@redhat.com>
> CC: Peter Maydell <peter.maydell@linaro.org>
> CC: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: Jan Vesely <jano.vesely@gmail.com>
> ---

I had this problem with Debian's xfslibs-dev 3.2.1,
linux-libc-dev 4.5.1-1 and either clang or gcc.

This patch fixes it.

Tested-by: Stefan Weil <sw@weilnetz.de>


