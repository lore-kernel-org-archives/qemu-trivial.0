Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZugcQ-0007XP-U3
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 07:59:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugcM-0007L9-8t
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:59:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugcL-0004qK-Ax
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:59:46 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40590)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZugcF-0004hH-QP; Fri, 06 Nov 2015 07:59:39 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1086340DD3;
	Fri,  6 Nov 2015 15:59:39 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 0AFF8AC5;
	Fri,  6 Nov 2015 15:44:05 +0300 (MSK)
Received: (nullmailer pid 31701 invoked by uid 1000);
	Fri, 06 Nov 2015 12:44:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 15:43:51 +0300
Message-Id: <9de68637dff05a18d0eafcff2737e551b70bc490.1446813769.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 14/24] qxl: Use g_new() & friends where that
	makes obvious sense
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
X-List-Received-Date: Fri, 06 Nov 2015 12:59:47 -0000

From: Markus Armbruster <armbru@redhat.com>

g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
for two reasons.  One, it catches multiplication overflowing size_t.
Two, it returns T * rather than void *, which lets the compiler catch
more type errors.

This commit only touches allocations with size arguments of the form
sizeof(T).  Same Coccinelle semantic patch as in commit b45c03f.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/display/qxl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 9c961da..8a3040c 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -2156,7 +2156,7 @@ static int qxl_post_load(void *opaque, int version)
         qxl_create_guest_primary(d, 1, QXL_SYNC);
 
         /* replay surface-create and cursor-set commands */
-        cmds = g_malloc0(sizeof(QXLCommandExt) * (d->ssd.num_surfaces + 1));
+        cmds = g_new0(QXLCommandExt, d->ssd.num_surfaces + 1);
         for (in = 0, out = 0; in < d->ssd.num_surfaces; in++) {
             if (d->guest_surfaces.cmds[in] == 0) {
                 continue;
-- 
2.1.4


