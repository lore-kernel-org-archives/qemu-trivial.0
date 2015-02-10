Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL7mr-0005Tp-Db
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 05:11:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL7mi-0005F2-5H
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 05:11:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL7mh-0003tT-1h
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 05:11:12 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34072)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL7ma-0003pr-Lx; Tue, 10 Feb 2015 05:11:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 666B4418BF;
	Tue, 10 Feb 2015 13:11:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E05CE95E;
	Tue, 10 Feb 2015 09:34:47 +0300 (MSK)
Received: (nullmailer pid 9415 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:29 +0300
Message-Id: <0a4b563c38b9ab036a1a7342b2c489e074783069.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, Amit Shah <amit.shah@redhat.com>,
	Juan Quintela <quintela@redhat.com>
Subject: [Qemu-trivial] [PULL 40/46] migration: Fix warnings caused by
	missing 'static' attribute
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
X-List-Received-Date: Tue, 10 Feb 2015 10:11:16 -0000

From: Stefan Weil <sw@weilnetz.de>

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
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 migration/rdma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 29285e6..6bee30c 100644
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
@@ -3250,14 +3250,14 @@ static int qemu_rdma_get_fd(void *opaque)
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


