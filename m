Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VMAcj-0005wO-M8
	for mharc-qemu-trivial@gnu.org; Wed, 18 Sep 2013 01:48:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VMAch-0005rs-2n
	for qemu-trivial@nongnu.org; Wed, 18 Sep 2013 01:48:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VMAcg-0002eH-84
	for qemu-trivial@nongnu.org; Wed, 18 Sep 2013 01:48:23 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:33749
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VMAce-0002dt-CY; Wed, 18 Sep 2013 01:48:20 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id D0F1C17FCC6; Wed, 18 Sep 2013 07:48:16 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Wed, 18 Sep 2013 07:48:15 +0200
Message-Id: <1379483296-20374-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PATCH] exec: Fix broken build for MinGW (regression)
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
X-List-Received-Date: Wed, 18 Sep 2013 05:48:24 -0000

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


