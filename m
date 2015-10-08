Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkH2z-000823-O6
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 15:40:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZkGyX-0004dW-GZ
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 15:35:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZkGyW-0006Le-4z
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 15:35:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52420)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZkGyP-0006GY-8I; Thu, 08 Oct 2015 15:35:29 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id F2CF9C0B83CB;
	Thu,  8 Oct 2015 19:35:28 +0000 (UTC)
Received: from thh440s.redhat.com (vpn1-6-90.ams2.redhat.com [10.36.6.90])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t98JZH3K009701; Thu, 8 Oct 2015 15:35:27 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  8 Oct 2015 21:35:14 +0200
Message-Id: <1444332916-16476-4-git-send-email-thuth@redhat.com>
In-Reply-To: <1444332916-16476-1-git-send-email-thuth@redhat.com>
References: <1444332916-16476-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 3/5] hw/input/tsc210x: Remove superfluous
	memset
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
X-List-Received-Date: Thu, 08 Oct 2015 19:35:38 -0000

g_malloc0 already clears the memory, so no need for additional
memsets here. And while we're at it, let's also remove the
superfluous typecasts for the return values of g_malloc0.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/input/tsc210x.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index fae3385..92b076a 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -1086,9 +1086,7 @@ uWireSlave *tsc2102_init(qemu_irq pint)
 {
     TSC210xState *s;
 
-    s = (TSC210xState *)
-            g_malloc0(sizeof(TSC210xState));
-    memset(s, 0, sizeof(TSC210xState));
+    s = g_malloc0(sizeof(TSC210xState));
     s->x = 160;
     s->y = 160;
     s->pressure = 0;
@@ -1135,9 +1133,7 @@ uWireSlave *tsc2301_init(qemu_irq penirq, qemu_irq kbirq, qemu_irq dav)
 {
     TSC210xState *s;
 
-    s = (TSC210xState *)
-            g_malloc0(sizeof(TSC210xState));
-    memset(s, 0, sizeof(TSC210xState));
+    s = g_malloc0(sizeof(TSC210xState));
     s->x = 400;
     s->y = 240;
     s->pressure = 0;
-- 
1.8.3.1


