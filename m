Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ry5HO-00061T-Mn
	for mharc-qemu-trivial@gnu.org; Thu, 16 Feb 2012 12:38:02 -0500
Received: from eggs.gnu.org ([140.186.70.92]:47362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Alexander_Barabash@mentor.com>) id 1Ry5HH-0005ok-Km
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 12:38:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Alexander_Barabash@mentor.com>) id 1Ry5H9-00033n-Mr
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 12:37:54 -0500
Received: from relay1.mentorg.com ([192.94.38.131]:37880)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Alexander_Barabash@mentor.com>)
	id 1Ry5Gx-00030y-Kd; Thu, 16 Feb 2012 12:37:35 -0500
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Ry5Gx-0007F9-48 from Alexander_Barabash@mentor.com ;
	Thu, 16 Feb 2012 09:37:35 -0800
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 16 Feb 2012 09:37:35 -0800
Received: from [137.202.52.68] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.1.289.1; Thu, 16 Feb 2012 17:37:32 +0000
Message-ID: <4F3D3EF2.4090503@mentor.com>
Date: Thu, 16 Feb 2012 19:37:54 +0200
From: Alexander Barabash <alexander_barabash@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 16 Feb 2012 17:37:35.0011 (UTC)
	FILETIME=[AB1E4730:01CCECD1]
X-detected-operating-system: by eggs.gnu.org: Solaris 10 (beta)
X-Received-From: 192.94.38.131
Subject: [Qemu-trivial] [PATCH] [TRIVIAL] Removed unused arm_sysctl_init().
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
X-List-Received-Date: Thu, 16 Feb 2012 17:38:01 -0000


     Removed unused arm_sysctl_init().
     Renamed arm_sysctl_init1() into arm_sysctl_init().

     Signed-off-by: Alexander Barabash <alexander_barabash@mentor.com>

diff --git a/hw/arm_sysctl.c b/hw/arm_sysctl.c
index 149c639..5f1237b 100644
--- a/hw/arm_sysctl.c
+++ b/hw/arm_sysctl.c
@@ -378,7 +378,7 @@ static void arm_sysctl_gpio_set(void *opaque, int 
line, int level)
      }
  }

-static int arm_sysctl_init1(SysBusDevice *dev)
+static int arm_sysctl_init(SysBusDevice *dev)
  {
      arm_sysctl_state *s = FROM_SYSBUS(arm_sysctl_state, dev);

@@ -389,18 +389,6 @@ static int arm_sysctl_init1(SysBusDevice *dev)
      return 0;
  }

-/* Legacy helper function.  */
-void arm_sysctl_init(uint32_t base, uint32_t sys_id, uint32_t proc_id)
-{
-    DeviceState *dev;
-
-    dev = qdev_create(NULL, "realview_sysctl");
-    qdev_prop_set_uint32(dev, "sys_id", sys_id);
-    qdev_init_nofail(dev);
-    qdev_prop_set_uint32(dev, "proc_id", proc_id);
-    sysbus_mmio_map(sysbus_from_qdev(dev), 0, base);
-}
-
  static Property arm_sysctl_properties[] = {
      DEFINE_PROP_UINT32("sys_id", arm_sysctl_state, sys_id, 0),
      DEFINE_PROP_UINT32("proc_id", arm_sysctl_state, proc_id, 0),
@@ -412,7 +400,7 @@ static void arm_sysctl_class_init(ObjectClass 
*klass, void *data)
      DeviceClass *dc = DEVICE_CLASS(klass);
      SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);

-    k->init = arm_sysctl_init1;
+    k->init = arm_sysctl_init;
      dc->reset = arm_sysctl_reset;
      dc->vmsd = &vmstate_arm_sysctl;
      dc->props = arm_sysctl_properties;
diff --git a/hw/primecell.h b/hw/primecell.h
index ded0446..7337c3b 100644
--- a/hw/primecell.h
+++ b/hw/primecell.h
@@ -5,9 +5,6 @@
  /* Also includes some devices that are currently only used by the
     ARM boards.  */

-/* arm_sysctl.c */
-void arm_sysctl_init(uint32_t base, uint32_t sys_id, uint32_t proc_id);
-
  /* arm_sysctl GPIO lines */
  #define ARM_SYSCTL_GPIO_MMC_WPROT 0
  #define ARM_SYSCTL_GPIO_MMC_CARDIN 1


