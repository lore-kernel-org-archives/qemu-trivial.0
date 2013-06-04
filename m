Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjxmD-0001SY-Di
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2013 16:24:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1Ujxm7-0001Hx-Gc
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:24:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1Ujxm2-0005sL-IA
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:24:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:21152)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1Ujxls-0005pq-EW; Tue, 04 Jun 2013 16:23:56 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r54KNtwx009116
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 4 Jun 2013 16:23:55 -0400
Received: from garlic.sbx07344.newyony.wayport.net (vpn1-5-107.ams2.redhat.com
	[10.36.5.107])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r54KNeZg022345; Tue, 4 Jun 2013 16:23:52 -0400
From: Alon Levy <alevy@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue,  4 Jun 2013 16:23:36 -0400
Message-Id: <1370377419-31788-2-git-send-email-alevy@redhat.com>
In-Reply-To: <1370377419-31788-1-git-send-email-alevy@redhat.com>
References: <1370377419-31788-1-git-send-email-alevy@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 2/5] use qemu_pipe_non_block
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
X-List-Received-Date: Tue, 04 Jun 2013 20:24:16 -0000

This fixes six instances of unchecked fcntl return status, spotted by
Coverity.

Signed-off-by: Alon Levy <alevy@redhat.com>
---
 hw/display/qxl.c            | 10 +++-------
 hw/usb/ccid-card-emulated.c |  8 +++-----
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 9e5b7ad..25c8c5a 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -1797,15 +1797,11 @@ static void qxl_send_events(PCIQXLDevice *d, uint32_t events)
 
 static void init_pipe_signaling(PCIQXLDevice *d)
 {
-    if (pipe(d->pipe) < 0) {
-        fprintf(stderr, "%s:%s: qxl pipe creation failed\n",
-                __FILE__, __func__);
+    if (qxl_pipe_non_block(d->pipe)) {
+        fprintf(stderr, "%s:%s: qxl pipe creation failed: %s\n",
+                __FILE__, __func__, stderror(errno));
         exit(1);
     }
-    fcntl(d->pipe[0], F_SETFL, O_NONBLOCK);
-    fcntl(d->pipe[1], F_SETFL, O_NONBLOCK);
-    fcntl(d->pipe[0], F_SETOWN, getpid());
-
     qemu_thread_get_self(&d->main);
     qemu_set_fd_handler(d->pipe[0], pipe_read, NULL, d);
 }
diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
index deb6d47..2e6942e 100644
--- a/hw/usb/ccid-card-emulated.c
+++ b/hw/usb/ccid-card-emulated.c
@@ -406,13 +406,11 @@ static void pipe_read(void *opaque)
 
 static int init_pipe_signaling(EmulatedState *card)
 {
-    if (pipe(card->pipe) < 0) {
-        DPRINTF(card, 2, "pipe creation failed\n");
+    if (qemu_pipe_non_block(card->pipe) < 0) {
+        DPRINTF(card, 2, "pipe creation failed: %s\n",
+                strerror(errno));
         return -1;
     }
-    fcntl(card->pipe[0], F_SETFL, O_NONBLOCK);
-    fcntl(card->pipe[1], F_SETFL, O_NONBLOCK);
-    fcntl(card->pipe[0], F_SETOWN, getpid());
     qemu_set_fd_handler(card->pipe[0], pipe_read, NULL, card);
     return 0;
 }
-- 
1.8.2.1


