Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XoW7h-0005oW-1n
	for mharc-qemu-trivial@gnu.org; Wed, 12 Nov 2014 06:30:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XoW7Y-0005ft-U8
	for qemu-trivial@nongnu.org; Wed, 12 Nov 2014 06:30:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XoW7S-0006zA-It
	for qemu-trivial@nongnu.org; Wed, 12 Nov 2014 06:29:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53152)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1XoW7G-0006xI-2n; Wed, 12 Nov 2014 06:29:38 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sACBTa8P002532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 12 Nov 2014 06:29:36 -0500
Received: from fam-t430.nay.redhat.com (dhcp-14-161.nay.redhat.com
	[10.66.14.161])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sACBTX06022207; Wed, 12 Nov 2014 06:29:33 -0500
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 12 Nov 2014 19:29:55 +0800
Message-Id: <1415791795-6779-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PATCH] virtio-scsi: Fix comment for VirtIOSCSIReq
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
X-List-Received-Date: Wed, 12 Nov 2014 11:30:03 -0000

The cdb is not zeroed by virtio_scsi_init_req, so fix the misleading
comment.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Fam Zheng <famz@redhat.com>
---
 include/hw/virtio/virtio-scsi.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
index 9e1a49c..bf17cc9 100644
--- a/include/hw/virtio/virtio-scsi.h
+++ b/include/hw/virtio/virtio-scsi.h
@@ -209,7 +209,8 @@ typedef struct VirtIOSCSIReq {
     /* Note:
      * - fields before elem are initialized by virtio_scsi_init_req;
      * - elem is uninitialized at the time of allocation.
-     * - fields after elem are zeroed by virtio_scsi_init_req.
+     * - fields after elem (except the ending cdb[]) are zeroed by
+     *   virtio_scsi_init_req.
      * */
 
     VirtQueueElement elem;
-- 
1.9.3


