Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i4pAT-0005WF-GP
	for mharc-qemu-trivial@gnu.org; Mon, 02 Sep 2019 12:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50256)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1i4pAQ-0005Sc-NH
 for qemu-trivial@nongnu.org; Mon, 02 Sep 2019 12:26:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1i4pAP-0001nY-H4
 for qemu-trivial@nongnu.org; Mon, 02 Sep 2019 12:26:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44980)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1i4pAJ-0001kK-Ey; Mon, 02 Sep 2019 12:26:51 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1AD0A3C91A;
 Mon,  2 Sep 2019 16:26:49 +0000 (UTC)
Received: from thuth.com (ovpn-116-48.ams2.redhat.com [10.36.116.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3B313DBB;
 Mon,  2 Sep 2019 16:26:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>
Date: Mon,  2 Sep 2019 18:26:38 +0200
Message-Id: <20190902162638.28142-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 02 Sep 2019 16:26:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/misc: Mark most objects as "common" code
 to speed up compilation a litte bit
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Sep 2019 16:27:00 -0000

Most of the code in hw/misc/ does not directly depend on CPU-specific
code. Mark it as "common" so that the code can be shared between e.g.
qemu-system-arm and qemu-system-aarch64, or between the various mips
flavours, instead of recompiling it for each and every target again
and again.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/misc/Makefile.objs | 90 +++++++++++++++++++++----------------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index e4aad707fb..a150680966 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -26,57 +26,57 @@ common-obj-$(CONFIG_PUV3) += puv3_pm.o
 
 common-obj-$(CONFIG_MACIO) += macio/
 
-obj-$(CONFIG_IVSHMEM_DEVICE) += ivshmem.o
+common-obj-$(CONFIG_IVSHMEM_DEVICE) += ivshmem.o
 
-obj-$(CONFIG_REALVIEW) += arm_sysctl.o
-obj-$(CONFIG_NSERIES) += cbus.o
-obj-$(CONFIG_ECCMEMCTL) += eccmemctl.o
-obj-$(CONFIG_EXYNOS4) += exynos4210_pmu.o exynos4210_clk.o exynos4210_rng.o
-obj-$(CONFIG_IMX) += imx_ccm.o
-obj-$(CONFIG_IMX) += imx31_ccm.o
-obj-$(CONFIG_IMX) += imx25_ccm.o
-obj-$(CONFIG_IMX) += imx6_ccm.o
-obj-$(CONFIG_IMX) += imx6ul_ccm.o
+common-obj-$(CONFIG_REALVIEW) += arm_sysctl.o
+common-obj-$(CONFIG_NSERIES) += cbus.o
+common-obj-$(CONFIG_ECCMEMCTL) += eccmemctl.o
+common-obj-$(CONFIG_EXYNOS4) += exynos4210_pmu.o exynos4210_clk.o exynos4210_rng.o
+common-obj-$(CONFIG_IMX) += imx_ccm.o
+common-obj-$(CONFIG_IMX) += imx31_ccm.o
+common-obj-$(CONFIG_IMX) += imx25_ccm.o
+common-obj-$(CONFIG_IMX) += imx6_ccm.o
+common-obj-$(CONFIG_IMX) += imx6ul_ccm.o
 obj-$(CONFIG_IMX) += imx6_src.o
-obj-$(CONFIG_IMX) += imx7_ccm.o
-obj-$(CONFIG_IMX) += imx2_wdt.o
-obj-$(CONFIG_IMX) += imx7_snvs.o
-obj-$(CONFIG_IMX) += imx7_gpr.o
-obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
-obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
-obj-$(CONFIG_MAINSTONE) += mst_fpga.o
-obj-$(CONFIG_OMAP) += omap_clk.o
-obj-$(CONFIG_OMAP) += omap_gpmc.o
-obj-$(CONFIG_OMAP) += omap_l4.o
-obj-$(CONFIG_OMAP) += omap_sdrc.o
-obj-$(CONFIG_OMAP) += omap_tap.o
-obj-$(CONFIG_RASPI) += bcm2835_mbox.o
-obj-$(CONFIG_RASPI) += bcm2835_property.o
-obj-$(CONFIG_RASPI) += bcm2835_rng.o
-obj-$(CONFIG_SLAVIO) += slavio_misc.o
-obj-$(CONFIG_ZYNQ) += zynq_slcr.o
-obj-$(CONFIG_ZYNQ) += zynq-xadc.o
-obj-$(CONFIG_STM32F2XX_SYSCFG) += stm32f2xx_syscfg.o
+common-obj-$(CONFIG_IMX) += imx7_ccm.o
+common-obj-$(CONFIG_IMX) += imx2_wdt.o
+common-obj-$(CONFIG_IMX) += imx7_snvs.o
+common-obj-$(CONFIG_IMX) += imx7_gpr.o
+common-obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
+common-obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
+common-obj-$(CONFIG_MAINSTONE) += mst_fpga.o
+common-obj-$(CONFIG_OMAP) += omap_clk.o
+common-obj-$(CONFIG_OMAP) += omap_gpmc.o
+common-obj-$(CONFIG_OMAP) += omap_l4.o
+common-obj-$(CONFIG_OMAP) += omap_sdrc.o
+common-obj-$(CONFIG_OMAP) += omap_tap.o
+common-obj-$(CONFIG_RASPI) += bcm2835_mbox.o
+common-obj-$(CONFIG_RASPI) += bcm2835_property.o
+common-obj-$(CONFIG_RASPI) += bcm2835_rng.o
+common-obj-$(CONFIG_SLAVIO) += slavio_misc.o
+common-obj-$(CONFIG_ZYNQ) += zynq_slcr.o
+common-obj-$(CONFIG_ZYNQ) += zynq-xadc.o
+common-obj-$(CONFIG_STM32F2XX_SYSCFG) += stm32f2xx_syscfg.o
 obj-$(CONFIG_MIPS_CPS) += mips_cmgcr.o
 obj-$(CONFIG_MIPS_CPS) += mips_cpc.o
 obj-$(CONFIG_MIPS_ITU) += mips_itu.o
-obj-$(CONFIG_MPS2_FPGAIO) += mps2-fpgaio.o
-obj-$(CONFIG_MPS2_SCC) += mps2-scc.o
+common-obj-$(CONFIG_MPS2_FPGAIO) += mps2-fpgaio.o
+common-obj-$(CONFIG_MPS2_SCC) += mps2-scc.o
 
-obj-$(CONFIG_TZ_MPC) += tz-mpc.o
-obj-$(CONFIG_TZ_MSC) += tz-msc.o
-obj-$(CONFIG_TZ_PPC) += tz-ppc.o
-obj-$(CONFIG_IOTKIT_SECCTL) += iotkit-secctl.o
+common-obj-$(CONFIG_TZ_MPC) += tz-mpc.o
+common-obj-$(CONFIG_TZ_MSC) += tz-msc.o
+common-obj-$(CONFIG_TZ_PPC) += tz-ppc.o
+common-obj-$(CONFIG_IOTKIT_SECCTL) += iotkit-secctl.o
 obj-$(CONFIG_IOTKIT_SYSCTL) += iotkit-sysctl.o
-obj-$(CONFIG_IOTKIT_SYSINFO) += iotkit-sysinfo.o
-obj-$(CONFIG_ARMSSE_CPUID) += armsse-cpuid.o
-obj-$(CONFIG_ARMSSE_MHU) += armsse-mhu.o
+common-obj-$(CONFIG_IOTKIT_SYSINFO) += iotkit-sysinfo.o
+common-obj-$(CONFIG_ARMSSE_CPUID) += armsse-cpuid.o
+common-obj-$(CONFIG_ARMSSE_MHU) += armsse-mhu.o
 
-obj-$(CONFIG_PVPANIC) += pvpanic.o
-obj-$(CONFIG_AUX) += auxbus.o
-obj-$(CONFIG_ASPEED_SOC) += aspeed_xdma.o
-obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
-obj-$(CONFIG_MSF2) += msf2-sysreg.o
-obj-$(CONFIG_NRF51_SOC) += nrf51_rng.o
+common-obj-$(CONFIG_PVPANIC) += pvpanic.o
+common-obj-$(CONFIG_AUX) += auxbus.o
+common-obj-$(CONFIG_ASPEED_SOC) += aspeed_xdma.o
+common-obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
+common-obj-$(CONFIG_MSF2) += msf2-sysreg.o
+common-obj-$(CONFIG_NRF51_SOC) += nrf51_rng.o
 
-obj-$(CONFIG_GRLIB) += grlib_ahb_apb_pnp.o
+common-obj-$(CONFIG_GRLIB) += grlib_ahb_apb_pnp.o
-- 
2.18.1


