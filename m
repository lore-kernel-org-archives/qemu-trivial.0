Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZrpY5-0004s3-M1
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2015 11:55:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52333)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZrpY2-0004lw-5H
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 11:55:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZrpY1-0007XJ-7c
	for qemu-trivial@nongnu.org; Thu, 29 Oct 2015 11:55:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57843)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZrpXx-0007Vb-9F; Thu, 29 Oct 2015 11:55:25 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id D2614C0B5931;
	Thu, 29 Oct 2015 15:55:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-44.ams2.redhat.com
	[10.36.116.44])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9TFtNBK006505
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 29 Oct 2015 11:55:24 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8192D303E59A; Thu, 29 Oct 2015 16:55:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Oct 2015 16:55:21 +0100
Message-Id: <1446134122-32292-4-git-send-email-armbru@redhat.com>
In-Reply-To: <1446134122-32292-1-git-send-email-armbru@redhat.com>
References: <1446134122-32292-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH v2 3/4] qxl: Use g_new() & friends where that
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
X-List-Received-Date: Thu, 29 Oct 2015 15:55:31 -0000

g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
for two reasons.  One, it catches multiplication overflowing size_t.
Two, it returns T * rather than void *, which lets the compiler catch
more type errors.

This commit only touches allocations with size arguments of the form
sizeof(T).  Same Coccinelle semantic patch as in commit b45c03f.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
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
2.4.3


