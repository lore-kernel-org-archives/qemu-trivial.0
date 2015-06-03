Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0C3U-0003Ss-2u
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 13:02:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1Z0C3N-0003I1-Gs
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 13:02:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1Z0C3J-0003OM-Nk
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 13:02:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34735)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1Z0BzR-00015s-2b; Wed, 03 Jun 2015 12:58:05 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id C4DB38E519;
	Wed,  3 Jun 2015 16:58:03 +0000 (UTC)
Received: from dgilbert-t530.redhat.com (ovpn-116-110.ams2.redhat.com
	[10.36.116.110])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t53Gw1jq006891; Wed, 3 Jun 2015 12:58:02 -0400
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 17:58:01 +0100
Message-Id: <1433350681-11504-1-git-send-email-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mst@redhat.com
Subject: [Qemu-trivial] [PATCH] Print error when failing to load PCI config
	data
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
X-List-Received-Date: Wed, 03 Jun 2015 17:02:13 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

When loading migration fails due to a disagreement about
PCI config data we don't currently get any errors explaining
that was the cause of the problem or which byte in the config
data was at fault.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/pci/pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 48f19a3..3afab6b 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -398,6 +398,10 @@ static int get_pci_config_device(QEMUFile *f, void *pv, size_t size)
     for (i = 0; i < size; ++i) {
         if ((config[i] ^ s->config[i]) &
             s->cmask[i] & ~s->wmask[i] & ~s->w1cmask[i]) {
+            error_report("%s: Bad config data: i=0x%x read: %x device: %x "
+                         "cmask: %x wmask: %x w1cmask:%x", __func__,
+                         i, config[i], s->config[i],
+                         s->cmask[i], s->wmask[i], s->w1cmask[i]);
             g_free(config);
             return -EINVAL;
         }
-- 
2.4.2


