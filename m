Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hT6VW-0007b3-I1
	for mharc-qemu-trivial@gnu.org; Tue, 21 May 2019 11:16:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hT6VT-0007Xy-VV
	for qemu-trivial@nongnu.org; Tue, 21 May 2019 11:16:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hT6VS-0001bo-NQ
	for qemu-trivial@nongnu.org; Tue, 21 May 2019 11:16:47 -0400
Received: from m12-16.163.com ([220.181.12.16]:57272)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>)
	id 1hT6VP-0001Un-1W; Tue, 21 May 2019 11:16:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=UttzqMXxBg3C9gsY9v
	k62bseHEktjhLCwusQrF5t6iU=; b=d0Eb1yX2cEeDo3yIo2BrterEh+AAV6fDzV
	VTRe/lWxAmdG9E5Zwi5PAZs6gffxwxxyK+yxSdxIvZc2pDcFuHt1QD8W0q1OBria
	ZPZ8OmzX0kbT4q85tYlyahUrLO7vh+Q9CG+UcE/4OKDyD1+dxYsa6iILwY4cUTfi
	t9dmrfi1Q=
Received: from localhost.localdomain (unknown [115.192.71.0])
	by smtp12 (Coremail) with SMTP id EMCowAC31lxJFuRcie7uGw--.4521S4;
	Tue, 21 May 2019 23:16:33 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: alex.williamson@redhat.com,
	lvivier@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, liq3ea@gmail.com,
	philmd@redhat.com, Li Qiang <liq3ea@163.com>
Date: Tue, 21 May 2019 08:15:41 -0700
Message-Id: <20190521151543.92274-3-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190521151543.92274-1-liq3ea@163.com>
References: <20190521151543.92274-1-liq3ea@163.com>
X-CM-TRANSID: EMCowAC31lxJFuRcie7uGw--.4521S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFW7tFy5Wr48JFy5Kr13twb_yoW8KrykpF
	n7Ja4fWF1jgr4Yvw4xC3W5AFZ8GF4kG347K34kCw1ay3W5Gr17ZrWjyF4UArZ8Cry5ZFWa
	vF42yr4rAa1Fvr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jcMa8UUUUU=
X-Originating-IP: [115.192.71.0]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbBaxS7bVetvgGjDgAAsB
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.16
Subject: [Qemu-trivial] [PATCH v2 2/4] hw: vfio: drop TYPE_FOO MACRO in
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
X-List-Received-Date: Tue, 21 May 2019 15:16:49 -0000

It's recommended that VMStateDescription names are decoupled from QOM
type names as the latter may freely change without consideration of
migration compatibility.

Link: https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg02175.html

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



