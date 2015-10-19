Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZoB7T-0004nD-Dc
	for mharc-qemu-trivial@gnu.org; Mon, 19 Oct 2015 10:08:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZoB7L-0004Z9-RW
	for qemu-trivial@nongnu.org; Mon, 19 Oct 2015 10:08:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZoB7K-0000pj-Uf
	for qemu-trivial@nongnu.org; Mon, 19 Oct 2015 10:08:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58371)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZoB7E-0000oC-UI; Mon, 19 Oct 2015 10:08:45 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 71B3491E9D;
	Mon, 19 Oct 2015 14:08:44 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-64.ams2.redhat.com
	[10.36.112.64])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9JE8e6w026368; Mon, 19 Oct 2015 10:08:43 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Oct 2015 16:08:39 +0200
Message-Id: <1445263720-6765-2-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] xen: fix invalid assertion
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
X-List-Received-Date: Mon, 19 Oct 2015 14:08:57 -0000

Asserting "true" is not that useful.

Reported by Coverity.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/xen/xen_pt_config_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index 4a5bc11..f6969ad 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -1937,7 +1937,7 @@ static int xen_pt_config_reg_init(XenPCIPassthroughState *s,
                 break;
         case 4: rc = xen_host_pci_get_long(&s->real_device, offset, &val);
                 break;
-        default: assert(1);
+        default: abort();
         }
         if (rc) {
             /* Serious issues when we cannot read the host values! */
@@ -1982,7 +1982,7 @@ static int xen_pt_config_reg_init(XenPCIPassthroughState *s,
                 break;
         case 4: pci_set_long(s->dev.config + offset, val);
                 break;
-        default: assert(1);
+        default: abort();
         }
         /* set register value pointer to the data. */
         reg_entry->ptr.byte = s->dev.config + offset;
-- 
2.5.0


