Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RVbxm-0000bI-64
	for mharc-qemu-trivial@gnu.org; Tue, 29 Nov 2011 23:40:06 -0500
Received: from eggs.gnu.org ([140.186.70.92]:60878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wuzhy@linux.vnet.ibm.com>) id 1RVbxj-0000Zg-Dg
	for qemu-trivial@nongnu.org; Tue, 29 Nov 2011 23:40:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wuzhy@linux.vnet.ibm.com>) id 1RVbxi-0003xu-Bb
	for qemu-trivial@nongnu.org; Tue, 29 Nov 2011 23:40:03 -0500
Received: from e38.co.us.ibm.com ([32.97.110.159]:60105)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wuzhy@linux.vnet.ibm.com>) id 1RVbxi-0003xF-6P
	for qemu-trivial@nongnu.org; Tue, 29 Nov 2011 23:40:02 -0500
Received: from /spool/local
	by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <wuzhy@linux.vnet.ibm.com>;
	Tue, 29 Nov 2011 21:39:57 -0700
Received: from d03relay02.boulder.ibm.com ([9.17.195.227])
	by e38.co.us.ibm.com ([192.168.1.138]) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 29 Nov 2011 21:39:55 -0700
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pAU4dsGd122000
	for <qemu-trivial@nongnu.org>; Tue, 29 Nov 2011 21:39:54 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id pAU4drNX025135
	for <qemu-trivial@nongnu.org>; Tue, 29 Nov 2011 21:39:54 -0700
Received: from us.ibm.com (f15.cn.ibm.com [9.115.118.120])
	by d03av01.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with SMTP id
	pAU4dpWW024894; Tue, 29 Nov 2011 21:39:51 -0700
Received: by us.ibm.com (sSMTP sendmail emulation);
	Wed, 30 Nov 2011 12:39:49 +0800
From: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
To: stefanha@linux.vnet.ibm.com, yamahata@valinux.co.jp
Date: Wed, 30 Nov 2011 12:39:47 +0800
Message-Id: <1322627987-8698-1-git-send-email-wuzhy@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.6
x-cbid: 11113004-5518-0000-0000-000000B32310
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 32.97.110.159
Cc: qemu-trivial@nongnu.org, Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH] pcie_aer: adjust do_pcie_aer_inejct_error ->
	do_pcie_aer_inject_error
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
X-List-Received-Date: Wed, 30 Nov 2011 04:40:04 -0000

This function name is a bit wrong. Although it doesn't impact function, it is a bit necessary that we should fixup it.


Signed-off-by: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
---
 hmp-commands.hx |    2 +-
 hw/pci-stub.c   |    2 +-
 hw/pcie_aer.c   |    2 +-
 sysemu.h        |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 089c1ac..5775144 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -922,7 +922,7 @@ ETEXI
                       "<tlb header> = 32bit x 4\n\t\t\t"
                       "<tlb header prefix> = 32bit x 4",
         .user_print  = pcie_aer_inject_error_print,
-        .mhandler.cmd_new = do_pcie_aer_inejct_error,
+        .mhandler.cmd_new = do_pcie_aer_inject_error,
     },
 
 STEXI
diff --git a/hw/pci-stub.c b/hw/pci-stub.c
index 636171c..134c448 100644
--- a/hw/pci-stub.c
+++ b/hw/pci-stub.c
@@ -34,7 +34,7 @@ static void pci_error_message(Monitor *mon)
     monitor_printf(mon, "PCI devices not supported\n");
 }
 
-int do_pcie_aer_inejct_error(Monitor *mon,
+int do_pcie_aer_inject_error(Monitor *mon,
                              const QDict *qdict, QObject **ret_data)
 {
     pci_error_message(mon);
diff --git a/hw/pcie_aer.c b/hw/pcie_aer.c
index 62c06ea..08bb25a 100644
--- a/hw/pcie_aer.c
+++ b/hw/pcie_aer.c
@@ -951,7 +951,7 @@ static int pcie_aer_parse_error_string(const char *error_name,
     return -EINVAL;
 }
 
-int do_pcie_aer_inejct_error(Monitor *mon,
+int do_pcie_aer_inject_error(Monitor *mon,
                              const QDict *qdict, QObject **ret_data)
 {
     const char *id = qdict_get_str(qdict, "id");
diff --git a/sysemu.h b/sysemu.h
index 22cd720..3806901 100644
--- a/sysemu.h
+++ b/sysemu.h
@@ -148,7 +148,7 @@ void do_pci_device_hot_remove(Monitor *mon, const QDict *qdict);
 
 /* pcie aer error injection */
 void pcie_aer_inject_error_print(Monitor *mon, const QObject *data);
-int do_pcie_aer_inejct_error(Monitor *mon,
+int do_pcie_aer_inject_error(Monitor *mon,
                              const QDict *qdict, QObject **ret_data);
 
 /* serial ports */
-- 
1.7.6


