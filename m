Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YJqTW-0000Wq-Jv
	for mharc-qemu-trivial@gnu.org; Fri, 06 Feb 2015 16:30:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqTU-0000Sy-Jr
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:30:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqTR-0002o8-5d
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:30:04 -0500
Received: from p54ac902a.dip0.t-ipconnect.de ([84.172.144.42]:45998 helo=edv32)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqTN-0002nG-MO
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:30:01 -0500
Received: from stefan by edv32 with local (Exim 4.84)
	(envelope-from <stefan@bib.uni-mannheim.de>)
	id 1YJpte-0002Fp-6n; Fri, 06 Feb 2015 21:53:02 +0100
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnug.org,
	qemu-trivial@nongnu.org
Date: Fri,  6 Feb 2015 21:52:48 +0100
Message-Id: <1423255968-8624-2-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1423255968-8624-1-git-send-email-sw@weilnetz.de>
References: <1423255968-8624-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 84.172.144.42
Cc: Amit Shah <amit.shah@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Juan Quintela <quintela@redhat.com>
Subject: [Qemu-trivial] [PATCH] migration: Fix warnings caused by missing
	'static' attribute
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
X-List-Received-Date: Fri, 06 Feb 2015 21:30:05 -0000

Warnings from the Sparse static analysis tool:

migration-rdma.c:151:12: warning:
 symbol 'wrid_desc' was not declared. Should it be static?
migration-rdma.c:190:12: warning:
 symbol 'control_desc' was not declared. Should it be static?
migration-rdma.c:3301:19: warning:
 symbol 'rdma_read_ops' was not declared. Should it be static?
migration-rdma.c:3308:19: warning:
 symbol 'rdma_write_ops' was not declared. Should it be static?

Cc: Juan Quintela <quintela@redhat.com>
Cc: Amit Shah <amit.shah@redhat.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 migration/rdma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index fc351ea..589931a 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -121,7 +121,7 @@ enum {
     RDMA_WRID_RECV_CONTROL = 4000,
 };
 
-const char *wrid_desc[] = {
+static const char *wrid_desc[] = {
     [RDMA_WRID_NONE] = "NONE",
     [RDMA_WRID_RDMA_WRITE] = "WRITE RDMA",
     [RDMA_WRID_SEND_CONTROL] = "CONTROL SEND",
@@ -160,7 +160,7 @@ enum {
     RDMA_CONTROL_UNREGISTER_FINISHED, /* unpinning finished */
 };
 
-const char *control_desc[] = {
+static const char *control_desc[] = {
     [RDMA_CONTROL_NONE] = "NONE",
     [RDMA_CONTROL_ERROR] = "ERROR",
     [RDMA_CONTROL_READY] = "READY",
@@ -3253,14 +3253,14 @@ static int qemu_rdma_get_fd(void *opaque)
     return rdma->comp_channel->fd;
 }
 
-const QEMUFileOps rdma_read_ops = {
+static const QEMUFileOps rdma_read_ops = {
     .get_buffer    = qemu_rdma_get_buffer,
     .get_fd        = qemu_rdma_get_fd,
     .close         = qemu_rdma_close,
     .hook_ram_load = qemu_rdma_registration_handle,
 };
 
-const QEMUFileOps rdma_write_ops = {
+static const QEMUFileOps rdma_write_ops = {
     .put_buffer         = qemu_rdma_put_buffer,
     .close              = qemu_rdma_close,
     .before_ram_iterate = qemu_rdma_registration_start,
-- 
2.1.4


