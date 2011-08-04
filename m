Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qosaz-0007In-1W
	for mharc-qemu-trivial@gnu.org; Thu, 04 Aug 2011 03:43:57 -0400
Received: from eggs.gnu.org ([140.186.70.92]:54170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wuzhy@linux.vnet.ibm.com>) id 1Qosaw-0007IP-3H
	for qemu-trivial@nongnu.org; Thu, 04 Aug 2011 03:43:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wuzhy@linux.vnet.ibm.com>) id 1Qosav-0005od-6J
	for qemu-trivial@nongnu.org; Thu, 04 Aug 2011 03:43:54 -0400
Received: from e7.ny.us.ibm.com ([32.97.182.137]:55315)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wuzhy@linux.vnet.ibm.com>)
	id 1Qosav-0005oX-2a; Thu, 04 Aug 2011 03:43:53 -0400
Received: from d01relay07.pok.ibm.com (d01relay07.pok.ibm.com [9.56.227.147])
	by e7.ny.us.ibm.com (8.14.4/8.13.1) with ESMTP id p747HrRT031248;
	Thu, 4 Aug 2011 03:17:53 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay07.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	p747hnFH3223600; Thu, 4 Aug 2011 03:43:49 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	p743haXj017171; Thu, 4 Aug 2011 00:43:36 -0300
Received: from us.ibm.com (wks563189wss.cn.ibm.com [9.123.136.155] (may be
	forged))
	by d01av03.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with SMTP id
	p743hWWc016816; Thu, 4 Aug 2011 00:43:33 -0300
Received: by us.ibm.com (sSMTP sendmail emulation);
	Thu,  4 Aug 2011 15:40:36 +0800
From: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Thu,  4 Aug 2011 15:40:35 +0800
Message-Id: <1312443635-21856-1-git-send-email-wuzhy@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.2.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 32.97.182.137
Cc: aliguori@us.ibm.com, stefanha@linux.vnet.ibm.com,
	Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
	zwu.kernel@gmail.com, ryanh@us.ibm.com, luowenj@cn.ibm.com
Subject: [Qemu-trivial] [PATCH] scsi-bus: use DO_UPCAST.
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
X-List-Received-Date: Thu, 04 Aug 2011 07:43:55 -0000

Signed-off-by: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
---
 hw/scsi-bus.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/scsi-bus.c b/hw/scsi-bus.c
index ad6a730..f6c416e 100644
--- a/hw/scsi-bus.c
+++ b/hw/scsi-bus.c
@@ -712,7 +712,7 @@ void scsi_device_purge_requests(SCSIDevice *sdev)
 
 static char *scsibus_get_fw_dev_path(DeviceState *dev)
 {
-    SCSIDevice *d = (SCSIDevice*)dev;
+    SCSIDevice *d = DO_UPCAST(SCSIDevice, qdev, dev);
     SCSIBus *bus = scsi_bus_from_device(d);
     char path[100];
     int i;
-- 
1.7.2.3


