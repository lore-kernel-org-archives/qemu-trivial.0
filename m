Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YziZ6-0002Y6-HL
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 05:32:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1YziZ4-0002Ur-9R
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 05:32:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1YziZ3-0005dm-Hm
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 05:32:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44628)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1YziYx-0005Zq-B3; Tue, 02 Jun 2015 05:32:47 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id E0C62CC7ED;
	Tue,  2 Jun 2015 09:32:46 +0000 (UTC)
Received: from dhcp-14-238.nay.redhat.com (dhcp-14-104.nay.redhat.com
	[10.66.14.104])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t529WgRB006530; Tue, 2 Jun 2015 05:32:43 -0400
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Jun 2015 17:32:41 +0800
Message-Id: <1433237561-10846-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
	Jeff Cody <jcody@redhat.com>, qemu-block@nongnu.org
Subject: [Qemu-trivial] [PATCH] sheepdog: Fix error message if failed to
	load vmstate
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
X-List-Received-Date: Tue, 02 Jun 2015 09:32:55 -0000

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 block/sheepdog.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/block/sheepdog.c b/block/sheepdog.c
index bd7cbed..a22f838 100644
--- a/block/sheepdog.c
+++ b/block/sheepdog.c
@@ -2556,7 +2556,11 @@ static int do_load_save_vmstate(BDRVSheepdogState *s, uint8_t *data,
         }
 
         if (ret < 0) {
-            error_report("failed to save vmstate %s", strerror(errno));
+            if (load) {
+                error_report("failed to load vmstate %s", strerror(errno));
+            } else {
+                error_report("failed to save vmstate %s", strerror(errno));
+            }
             goto cleanup;
         }
 
-- 
2.4.2


