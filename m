Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnRgu-000459-GV
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 06:57:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56589)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRgp-0003vO-N6
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:57:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRgn-0006Nk-Ld
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:57:07 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48040)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnRgi-0006DM-Fr; Fri, 14 Jun 2013 06:57:00 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id BAE6C41661;
	Fri, 14 Jun 2013 14:56:59 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id B66EA50A; Fri, 14 Jun 2013 14:50:47 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 14 Jun 2013 14:50:31 +0400
Message-Id: <1371207042-17980-16-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 15/26] target-sparc: Replace free by g_free
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
X-List-Received-Date: Fri, 14 Jun 2013 10:57:09 -0000

From: Stefan Weil <sw@weilnetz.de>

The wrong function was reported by cppcheck.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-sparc/cpu.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-sparc/cpu.c b/target-sparc/cpu.c
index 290b580..13bb7bb 100644
--- a/target-sparc/cpu.c
+++ b/target-sparc/cpu.c
@@ -614,7 +614,7 @@ static int cpu_sparc_find_by_name(sparc_def_t *cpu_de=
f, const char *cpu_model)
     return 0;
=20
  error:
-    free(s);
+    g_free(s);
     return -1;
 }
=20
--=20
1.7.10.4


