Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkiOf-0005KC-FS
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 20:52:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZkGyU-0004cF-1s
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 15:35:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZkGyP-0006Go-9z
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 15:35:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39088)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZkGyN-0006G3-Cc; Thu, 08 Oct 2015 15:35:27 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id DE4108EA3C;
	Thu,  8 Oct 2015 19:35:26 +0000 (UTC)
Received: from thh440s.redhat.com (vpn1-6-90.ams2.redhat.com [10.36.6.90])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t98JZH3J009701; Thu, 8 Oct 2015 15:35:24 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  8 Oct 2015 21:35:13 +0200
Message-Id: <1444332916-16476-3-git-send-email-thuth@redhat.com>
In-Reply-To: <1444332916-16476-1-git-send-email-thuth@redhat.com>
References: <1444332916-16476-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <agraf@suse.de>, David Gibson <david@gibson.dropbear.id.au>
Subject: [Qemu-trivial] [PATCH 2/5] hw/scsi/spapr_vscsi: Remove superfluous
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

g_malloc0 already clears the memory, so no need for
the additional memset here.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Alexander Graf <agraf@suse.de>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/scsi/spapr_vscsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
index 891424f..f4f5140 100644
--- a/hw/scsi/spapr_vscsi.c
+++ b/hw/scsi/spapr_vscsi.c
@@ -750,7 +750,6 @@ static void vscsi_report_luns(VSCSIState *s, vscsi_req *req)
     len = n+8;
 
     resp_data = g_malloc0(len);
-    memset(resp_data, 0, len);
     stl_be_p(resp_data, n);
     i = found_lun0 ? 8 : 16;
     QTAILQ_FOREACH(kid, &s->bus.qbus.children, sibling) {
-- 
1.8.3.1


