Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RO3u4-0002EX-6K
	for mharc-qemu-trivial@gnu.org; Wed, 09 Nov 2011 03:53:04 -0500
Received: from eggs.gnu.org ([140.186.70.92]:49442)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RO3u1-00027g-Ov
	for qemu-trivial@nongnu.org; Wed, 09 Nov 2011 03:53:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RO3u0-0006xG-26
	for qemu-trivial@nongnu.org; Wed, 09 Nov 2011 03:53:01 -0500
Received: from oxygen.pond.sub.org ([78.46.104.156]:47018)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1RO3tx-0006wo-ME; Wed, 09 Nov 2011 03:52:57 -0500
Received: from blackfin.pond.sub.org (p5B32DABA.dip.t-dialin.net
	[91.50.218.186])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id D499BA246E;
	Wed,  9 Nov 2011 09:52:55 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 21E6A6006D; Wed,  9 Nov 2011 09:52:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  9 Nov 2011 09:52:55 +0100
Message-Id: <1320828775-16828-1-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH] qxl: Don't convert from size_t to int and
	back in qxl_cursor()
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
X-List-Received-Date: Wed, 09 Nov 2011 08:53:02 -0000

Just for cleanliness; it would take a truly gigantic cursor to break.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/qxl-render.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/qxl-render.c b/hw/qxl-render.c
index 2c51ba9..133d093 100644
--- a/hw/qxl-render.c
+++ b/hw/qxl-render.c
@@ -157,7 +157,7 @@ static QEMUCursor *qxl_cursor(PCIQXLDevice *qxl, QXLCursor *cursor)
 {
     QEMUCursor *c;
     uint8_t *image, *mask;
-    int size;
+    size_t size;
 
     c = cursor_alloc(cursor->header.width, cursor->header.height);
     c->hot_x = cursor->header.hot_spot_x;
-- 
1.7.6.4


