Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjQbd-0001fZ-Bx
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2013 04:59:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1UjQbV-0001Pk-K3
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 04:59:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1UjQbP-0007j0-Ck
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 04:59:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:5824)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1UjQb9-0007gw-QO; Mon, 03 Jun 2013 04:58:39 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r538wcKD025458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 3 Jun 2013 04:58:38 -0400
Received: from localhost (ovpn-112-30.ams2.redhat.com [10.36.112.30])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r538waTc010299; Mon, 3 Jun 2013 04:58:37 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Mon,  3 Jun 2013 10:58:30 +0200
Message-Id: <1370249911-19708-2-git-send-email-stefanha@redhat.com>
In-Reply-To: <1370249911-19708-1-git-send-email-stefanha@redhat.com>
References: <1370249911-19708-1-git-send-email-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org,
	Nicholas Bellinger <nab@linux-iscsi.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Asias He <asias@redhat.com>,
	Eric Blake <eblake@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 1/2] vhost-scsi: fix
	k->set_guest_notifiers() NULL dereference
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
X-List-Received-Date: Mon, 03 Jun 2013 08:59:08 -0000

Coverity picked up a copy-paste bug.  In vhost_scsi_start() we check for
!k->set_guest_notifiers and error out.  The check probably got copied
but instead of erroring we actually use the function pointer!

Cc: Nicholas Bellinger <nab@linux-iscsi.org>
Cc: Asias He <asias@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/scsi/vhost-scsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index d7a1c33..785e93f 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -123,7 +123,7 @@ static void vhost_scsi_stop(VHostSCSI *s)
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
     int ret = 0;
 
-    if (!k->set_guest_notifiers) {
+    if (k->set_guest_notifiers) {
         ret = k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
         if (ret < 0) {
                 error_report("vhost guest notifier cleanup failed: %d\n", ret);
-- 
1.8.1.4


