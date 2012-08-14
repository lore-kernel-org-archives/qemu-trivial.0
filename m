Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1FVr-0005bs-J4
	for mharc-qemu-trivial@gnu.org; Tue, 14 Aug 2012 07:42:19 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@elpiso.org>) id 1T1FVo-0005aX-PL
	for qemu-trivial@nongnu.org; Tue, 14 Aug 2012 07:42:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@elpiso.org>) id 1T1FVk-00078q-Fz
	for qemu-trivial@nongnu.org; Tue, 14 Aug 2012 07:42:16 -0400
Received: from smtp4.mundo-r.com ([212.51.32.151]:47306)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@elpiso.org>) id 1T1FVk-00078K-8j
	for qemu-trivial@nongnu.org; Tue, 14 Aug 2012 07:42:12 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AmYCAC05KlBbdWObgWdsb2JhbABEhgG0DyIBARYmJ4JKBAsBRhkcAhgOAj6IRaU/k3GBIYx5ggqBEgOISI0DknI
X-IronPort-AV: E=Sophos;i="4.77,766,1336341600"; d="scan'208";a="957164508"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 14 Aug 2012 13:41:43 +0200
Received: from dsl-hkibrasgw4-fe53df00-164.dhcp.inet.fi ([80.223.83.164]
	helo=hermes.local) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1T1FVG-0005sw-KO; Tue, 14 Aug 2012 13:41:42 +0200
Received: from berto by hermes.local with local (Exim 4.80)
	(envelope-from <berto@elpiso.org>)
	id 1T1FV2-00073G-8i; Tue, 14 Aug 2012 14:41:28 +0300
From: Alberto Garcia <agarcia@igalia.com>
To: qemu-trivial@nongnu.org
Date: Tue, 14 Aug 2012 14:41:28 +0300
Message-Id: <1344944488-27075-1-git-send-email-agarcia@igalia.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.51.32.151
Cc: Luiz Capitulino <lcapitulino@redhat.com>
Subject: [Qemu-trivial] =?utf-8?q?=5BPATCH=5D_ivshmem=2C_qdev-monitor=3A_f?=
	=?utf-8?q?ix_order_of_qerror_parameters?=
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
X-List-Received-Date: Tue, 14 Aug 2012 11:42:18 -0000

Now that the QERR_ macros no longer contain a json dictionary,
the order of some parameters needs to be fixed for them to appear
correctly.
---
 hw/ivshmem.c      |    3 ++-
 hw/qdev-monitor.c |    2 +-
 2 ficheiros modificados, 3 adições(+), 2 eliminados(-)

diff --git a/hw/ivshmem.c b/hw/ivshmem.c
index 0c58161..b4d65a6 100644
--- a/hw/ivshmem.c
+++ b/hw/ivshmem.c
@@ -677,7 +677,8 @@ static int pci_ivshmem_init(PCIDevice *dev)
     }
 
     if (s->role_val == IVSHMEM_PEER) {
-        error_set(&s->migration_blocker, QERR_DEVICE_FEATURE_BLOCKS_MIGRATION, "ivshmem", "peer mode");
+        error_set(&s->migration_blocker, QERR_DEVICE_FEATURE_BLOCKS_MIGRATION,
+                  "peer mode", "ivshmem");
         migrate_add_blocker(s->migration_blocker);
     }
 
diff --git a/hw/qdev-monitor.c b/hw/qdev-monitor.c
index b22a37a..018b386 100644
--- a/hw/qdev-monitor.c
+++ b/hw/qdev-monitor.c
@@ -443,7 +443,7 @@ DeviceState *qdev_device_add(QemuOpts *opts)
         bus = qbus_find_recursive(sysbus_get_default(), NULL, k->bus_type);
         if (!bus) {
             qerror_report(QERR_NO_BUS_FOR_DEVICE,
-                          driver, k->bus_type);
+                          k->bus_type, driver);
             return NULL;
         }
     }
-- 
1.7.10.4


