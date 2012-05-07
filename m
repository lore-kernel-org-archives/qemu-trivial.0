Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SRS2I-00059u-B1
	for mharc-qemu-trivial@gnu.org; Mon, 07 May 2012 13:47:50 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SRS2E-0004xX-Tx
	for qemu-trivial@nongnu.org; Mon, 07 May 2012 13:47:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SRS2C-00078e-DM
	for qemu-trivial@nongnu.org; Mon, 07 May 2012 13:47:46 -0400
Received: from cantor2.suse.de ([195.135.220.15]:40641 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1SRS29-000779-6B; Mon, 07 May 2012 13:47:41 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 77EE48FFEB;
	Mon,  7 May 2012 19:47:39 +0200 (CEST)
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To: qemu-devel@nongnu.org
Date: Mon,  7 May 2012 19:47:37 +0200
Message-Id: <1336412858-9366-1-git-send-email-afaerber@suse.de>
X-Mailer: git-send-email 1.7.7
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, agraf@suse.de,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Qemu-trivial] [PATCH for-1.1] scripts/qemu-binfmt-conf.sh: Fix
	shell syntax
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
X-List-Received-Date: Mon, 07 May 2012 17:47:48 -0000

The script is organized as a sequence of binfmt registrations, with a
check whether the to be registered architecture matches the host.

Add a missing fi for the SuperH section.

Reported-by: Alexander Graf <agraf@suse.de>
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 scripts/qemu-binfmt-conf.sh |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 83a44d8..0da2618 100644
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -63,6 +63,7 @@ fi
 if [ $cpu !=3D "sh" ] ; then
     echo    ':sh4:M::\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00=
\x00\x02\x00\x2a\x00:\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff=
\xff\xff\xff\xfe\xff\xff\xff:/usr/local/bin/qemu-sh4:' > /proc/sys/fs/bin=
fmt_misc/register
     echo    ':sh4eb:M::\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x=
00\x00\x00\x02\x00\x2a:\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\x=
ff\xff\xff\xff\xff\xfe\xff\xff:/usr/local/bin/qemu-sh4eb:' > /proc/sys/fs=
/binfmt_misc/register
+fi
 if [ $cpu !=3D "s390x" ] ; then
     echo   ':s390x:M::\x7fELF\x02\x02\x01\x00\x00\x00\x00\x00\x00\x00\x0=
0\x00\x00\x02\x00\x16:\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xf=
f\xff\xff\xff\xff\xfe\xff\xff:/usr/local/bin/qemu-s390x:' > /proc/sys/fs/=
binfmt_misc/register
 fi
--=20
1.7.7


