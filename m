Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VN4Bj-00059q-9Q
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2013 13:08:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4Bc-0004wH-HI
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:08:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4BY-0003H0-4Z
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:08:08 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44243)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VN4BJ-0003DX-Af; Fri, 20 Sep 2013 13:07:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3453A419CE;
	Fri, 20 Sep 2013 21:07:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B0C0051B;
	Fri, 20 Sep 2013 20:58:22 +0400 (MSK)
Received: (nullmailer pid 32197 invoked by uid 1000);
	Fri, 20 Sep 2013 16:58:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Fri, 20 Sep 2013 20:58:15 +0400
Message-Id: <1379696296-32105-17-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 16/17] exec: Fix broken build for MinGW
	(regression)
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
X-List-Received-Date: Fri, 20 Sep 2013 17:08:13 -0000

From: Stefan Weil <sw@weilnetz.de>

Commit 3435f39513a104294b5e3bbf3612047028d25cfc reduced the ifdeffery wit=
h
this result for MinGW:

exec.c: In function =E2=80=98qemu_ram_free=E2=80=99:
exec.c:1239:17: warning:
 implicit declaration of function =E2=80=98munmap=E2=80=99 [-Wimplicit-fu=
nction-declaration]
exec.c:1239:17: warning:
 nested extern declaration of =E2=80=98munmap=E2=80=99 [-Wnested-externs]
exec.c:1239: undefined reference to `munmap'

Add some ifdeffery again to fix this.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 exec.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/exec.c b/exec.c
index 2646912..efeca14 100644
--- a/exec.c
+++ b/exec.c
@@ -1229,9 +1229,11 @@ void qemu_ram_free(ram_addr_t addr)
                 ;
             } else if (xen_enabled()) {
                 xen_invalidate_map_cache_entry(block->host);
+#ifndef _WIN32
             } else if (block->fd >=3D 0) {
                 munmap(block->host, block->length);
                 close(block->fd);
+#endif
             } else {
                 qemu_anon_ram_free(block->host, block->length);
             }
--=20
1.7.10.4


