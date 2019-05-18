Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hRq1a-0000f6-T0
	for mharc-qemu-trivial@gnu.org; Fri, 17 May 2019 23:28:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hRq1X-0000bk-SF
	for qemu-trivial@nongnu.org; Fri, 17 May 2019 23:28:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hRq1W-00038P-Uu
	for qemu-trivial@nongnu.org; Fri, 17 May 2019 23:28:39 -0400
Received: from m12-18.163.com ([220.181.12.18]:40551)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>)
	id 1hRq1T-00031E-Py; Fri, 17 May 2019 23:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=ZkRZ93Zkgu3En+FaaA
	Yw/AoU28oCCnJZpXGm1pEjk1s=; b=Fk8SHmxyQX4smd841NzyhDTYEPREzPt0jO
	/JT1Rp+dDCuku1SMey7bxbRzSvYNu0V9kKdzCu2ue264REQGSxKExYsxnNlM1Uto
	mC6Dv2dWQi58T0YulnSmpXyUHWqp/5f6JMyEAeAN00R/MBeIkSRNqFXijAwAYlqT
	ZMM75JKPc=
Received: from localhost.localdomain (unknown [183.159.73.182])
	by smtp14 (Coremail) with SMTP id EsCowACXzsrXe99czqL5Gg--.37649S3;
	Sat, 18 May 2019 11:28:29 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: alex.williamson@redhat.com,
	lvivier@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, liq3ea@gmail.com,
	philmd@redhat.com, Li Qiang <liq3ea@163.com>
Date: Fri, 17 May 2019 20:28:09 -0700
Message-Id: <20190518032811.60341-2-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190518032811.60341-1-liq3ea@163.com>
References: <20190518032811.60341-1-liq3ea@163.com>
X-CM-TRANSID: EsCowACXzsrXe99czqL5Gg--.37649S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tryfZF4Dtw4UXryUGr13XFb_yoW8uFWxpF
	n7Ja4fWF4jgr4Yvw42k3W5AFZ8GF4kG347K34kCw1ay3W5GrnrZrWUAFWUArZ8Cry5ZFW3
	ZF42yr4rAa1Fvr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uj2NNUUUUU=
X-Originating-IP: [183.159.73.182]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbBLx24bVUMJXo4KgAAsz
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.18
Subject: [Qemu-trivial] [PATCH 2/4] hw: vfio: drop TYPE_FOO MACRO in
 VMStateDescription
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 18 May 2019 03:28:41 -0000

As the vmstate structure names aren't related with
the QOM type names.

CC: qemu-trivial@nongnu.org
Signed-off-by: Li Qiang <liq3ea@163.com>
---
 hw/vfio/amd-xgbe.c      | 2 +-
 hw/vfio/ap.c            | 2 +-
 hw/vfio/calxeda-xgmac.c | 2 +-
 hw/vfio/ccw.c           | 2 +-
 hw/vfio/platform.c      | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/vfio/amd-xgbe.c b/hw/vfio/amd-xgbe.c
index ee64a3b4a2..1b06c0f3ea 100644
--- a/hw/vfio/amd-xgbe.c
+++ b/hw/vfio/amd-xgbe.c
@@ -26,7 +26,7 @@ static void amd_xgbe_realize(DeviceState *dev, Error **errp)
 }
 
 static const VMStateDescription vfio_platform_amd_xgbe_vmstate = {
-    .name = TYPE_VFIO_AMD_XGBE,
+    .name = "vfio-amd-xgbe",
     .unmigratable = 1,
 };
 
diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
index d8b79ebe53..564751650f 100644
--- a/hw/vfio/ap.c
+++ b/hw/vfio/ap.c
@@ -155,7 +155,7 @@ static void vfio_ap_reset(DeviceState *dev)
 }
 
 static const VMStateDescription vfio_ap_vmstate = {
-    .name = VFIO_AP_DEVICE_TYPE,
+    .name = "vfio-ap",
     .unmigratable = 1,
 };
 
diff --git a/hw/vfio/calxeda-xgmac.c b/hw/vfio/calxeda-xgmac.c
index e7767c4b02..6cc608b6ca 100644
--- a/hw/vfio/calxeda-xgmac.c
+++ b/hw/vfio/calxeda-xgmac.c
@@ -26,7 +26,7 @@ static void calxeda_xgmac_realize(DeviceState *dev, Error **errp)
 }
 
 static const VMStateDescription vfio_platform_calxeda_xgmac_vmstate = {
-    .name = TYPE_VFIO_CALXEDA_XGMAC,
+    .name = "vfio-calxeda-xgmac",
     .unmigratable = 1,
 };
 
diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 31dd3a2a87..d9e39552e2 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -468,7 +468,7 @@ static Property vfio_ccw_properties[] = {
 };
 
 static const VMStateDescription vfio_ccw_vmstate = {
-    .name = TYPE_VFIO_CCW,
+    .name = "vfio-ccw",
     .unmigratable = 1,
 };
 
diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index 398db38f14..e59a0234dd 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -697,7 +697,7 @@ out:
 }
 
 static const VMStateDescription vfio_platform_vmstate = {
-    .name = TYPE_VFIO_PLATFORM,
+    .name = "vfio-platform",
     .unmigratable = 1,
 };
 
-- 
2.17.1



