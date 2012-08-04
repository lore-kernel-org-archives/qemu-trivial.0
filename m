Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SxcYe-0005EX-5l
	for mharc-qemu-trivial@gnu.org; Sat, 04 Aug 2012 07:30:12 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1SxcYb-00056D-4j
	for qemu-trivial@nongnu.org; Sat, 04 Aug 2012 07:30:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1SxcYa-0000vV-04
	for qemu-trivial@nongnu.org; Sat, 04 Aug 2012 07:30:09 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:57655)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>)
	id 1SxcYW-0000he-9c; Sat, 04 Aug 2012 07:30:04 -0400
Received: by pbbro12 with SMTP id ro12so2651225pbb.4
	for <multiple recipients>; Sat, 04 Aug 2012 04:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=1H1RwF17126vHH8RI2UDMsvsWI5TIMdaubEWShPNsK4=;
	b=RqnDy/sltxcWH+WTKKC39RkhBCB+4+F2u1O+3pB4dC1zqJz6s3aEZKmQN+6C6KsEW/
	MSwMWLnS+M2in09twC44qamYerCuI6fp0mjemW+7H1he/tL9Z+N7tGvJ/0M6cjeJYxAq
	sdwNsHb7FgekKtDpvc7oXzCsx2S1rdaG72UJ8ZVqbM7qDqoMCAUvX8wAHoVUx/IjhaLl
	3Y/AiHsQLVOBXL+8EyXXKfxlC0qdxTEQmGujXDjRWmUZH0ojHBaUDO6MlQhEG8qOAHQZ
	JoTLdZICuiZcePqoVwUBnDrAKdpX+UNCb2PdOKo/Ka3zgVcgn6FCAULVjUmbbSTqpxIW
	tfog==
Received: by 10.66.74.100 with SMTP id s4mr4822909pav.27.1344079800390;
	Sat, 04 Aug 2012 04:30:00 -0700 (PDT)
Received: from localhost.localdomain ([114.249.89.76])
	by mx.google.com with ESMTPS id og7sm4468928pbb.62.2012.08.04.04.29.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Aug 2012 04:29:59 -0700 (PDT)
From: riegamaths@gmail.com
To: qemu-devel <qemu-devel@nongnu.org>,
	<qemu-trivial@nongnu.org>
Date: Sat,  4 Aug 2012 19:29:55 +0800
Message-Id: <1344079795-8050-1-git-send-email-riegamaths@gmail.com>
X-Mailer: git-send-email 1.7.8.6
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>,
	Dunrong Huang <riegamaths@gmail.com>
Subject: [Qemu-trivial] [PATCH] build: Fix build breakage detected by
	buildbot
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
X-List-Received-Date: Sat, 04 Aug 2012 11:30:10 -0000

From: Dunrong Huang <riegamaths@gmail.com>

More details:
http://buildbot.b1-systems.de/qemu/builders/xen_unstable/builds/83/steps/compile/logs/stdio

VLANState has been removed since commit a005d07, so "vlan id" should be
fetched using net_hub_id_for_client().

Signed-off-by: Dunrong Huang <riegamaths@gmail.com>
---
 hw/xen_backend.h   |    1 +
 hw/xen_devconfig.c |   10 ++++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/xen_backend.h b/hw/xen_backend.h
index 3305630..fea86dd 100644
--- a/hw/xen_backend.h
+++ b/hw/xen_backend.h
@@ -4,6 +4,7 @@
 #include "xen_common.h"
 #include "sysemu.h"
 #include "net.h"
+#include "net/hub.h"
 
 /* ------------------------------------------------------------- */
 
diff --git a/hw/xen_devconfig.c b/hw/xen_devconfig.c
index 0928613..d83e8d0 100644
--- a/hw/xen_devconfig.c
+++ b/hw/xen_devconfig.c
@@ -123,19 +123,21 @@ int xen_config_dev_nic(NICInfo *nic)
 {
     char fe[256], be[256];
     char mac[20];
+    int vlan_id = -1;
 
+    net_hub_id_for_client(nic->netdev, &vlan_id);
     snprintf(mac, sizeof(mac), "%02x:%02x:%02x:%02x:%02x:%02x",
              nic->macaddr.a[0], nic->macaddr.a[1], nic->macaddr.a[2],
              nic->macaddr.a[3], nic->macaddr.a[4], nic->macaddr.a[5]);
-    xen_be_printf(NULL, 1, "config nic %d: mac=\"%s\"\n", nic->vlan->id, mac);
-    xen_config_dev_dirs("vif", "qnic", nic->vlan->id, fe, be, sizeof(fe));
+    xen_be_printf(NULL, 1, "config nic %d: mac=\"%s\"\n", vlan_id, mac);
+    xen_config_dev_dirs("vif", "qnic", vlan_id, fe, be, sizeof(fe));
 
     /* frontend */
-    xenstore_write_int(fe, "handle",     nic->vlan->id);
+    xenstore_write_int(fe, "handle",     vlan_id);
     xenstore_write_str(fe, "mac",        mac);
 
     /* backend */
-    xenstore_write_int(be, "handle",     nic->vlan->id);
+    xenstore_write_int(be, "handle",     vlan_id);
     xenstore_write_str(be, "mac",        mac);
 
     /* common stuff */
-- 
1.7.8.6


