Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iNv4u-0000aZ-8b
	for mharc-qemu-trivial@gnu.org; Fri, 25 Oct 2019 04:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49644)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iNv4r-0000Vt-82
 for qemu-trivial@nongnu.org; Fri, 25 Oct 2019 04:36:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iNv4q-0007jA-0W
 for qemu-trivial@nongnu.org; Fri, 25 Oct 2019 04:36:09 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:42539)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iNv4p-0007i4-NA; Fri, 25 Oct 2019 04:36:07 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MPXta-1iacMQ3LTG-00Mbyg; Fri, 25 Oct 2019 10:35:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Artyom Tarasenko <atar4qemu@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Joel Stanley <joel@jms.id.au>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <rth@twiddle.net>, qemu-block@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 qemu-trivial@nongnu.org, Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 06/19] hw/timer: Compile devices not target-dependent as common
 object
Date: Fri, 25 Oct 2019 10:34:58 +0200
Message-Id: <20191025083511.11463-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025083511.11463-1-laurent@vivier.eu>
References: <20191025083511.11463-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fJ4V1AnXTAcItYSV9oR8i35L0OGfAII0+g067o8KOiaQpL/F/Dy
 ZwprbljE8vnKw8Swcki38wOLABSHSdwgvzsbd+ruAOD6OewQ2dfUeIPD3xqRfGXKlWl8MGW
 uN+u7znWyXKIvvd+uqmtszoEu4aaEcKL/AakDVxCLTeOfq8keKigQPyAktuA1038zubP+aE
 R0KAfL6HP8jiXkSihxieg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2Rpo3xlo6y0=:J14/lgwOwfUNXqY26XKPK6
 /LCbiixh3U/3SOte/ZGRUhk+qolPY5xQqR270PaRTA3v/G2M+NOBR+aLMRmKFJPx4NdV/1ltx
 fv72HigBTOsZPL/BZJ+Et2RcShxvX28bivAsnJ2IlswAaPXI6xKuSVQ8NSB8qc5fBMccYLuEj
 F5qF4fkimZFsbsgoXyYmry9jl0cWgRd2hU4F22Bs49KlwCJuGSCrh5QFTKUmHn3N0ZE+jiB6W
 ZDf1pBmPYrsXfG9DVDbkGzPQJeocDJzxvh5uGm+Mrdgx3udtJ11UJpNWjQ6SKrAHxff413K8P
 xzagBpNEGKT4O2LUZsJ2fECKH60Llus3OwJ30mQyB2/p4JOIm/upvzxyx3cW6xt2EuKOjo+mr
 NcSHPmpzoYPhrzGFrUomDARcEsRLJ58rBbCObt91brilSotJ8rF/o6Vs/Gv0iDiYSI8AXAbGE
 B1W8Ias8YXT+zsuQm5KKja5bjWPWCbN9STEQquRCYj256usZuLNi9ms0n2GsDu4VvKc5ilGz6
 N9KTMkJieMGuT0JQYAUJZXUPw0t7jiqBk9UWsjJir50pZOyB1ncdpY2h3S7+4J/HSanLbYPTt
 Lj4FBn5fktue0bg3uDk0+Io9V6rDCtvvxiy3zKx6yBVjm5cM2PzaQopdc+zdIjKvpcktqw/vy
 HtFm25iYMsF8SRj35bU1kG9q+iIiITv+yAp2wzNkm1JevXaFgUAQl/djX+XMaDQVjoeGk7y8d
 2rJOl/ShR9yxS20Tx5wuxhNJRlFYqxvNLu+qz9YoBdOeEjD6pGeNlhJIPqwtJEUqibuT7wXod
 mVE40dupzFuta57phzfzRSI6J/I4S3cymRmnXEpBe4dwb09KizjrRiofQwws+hKwn6Gq0lZNl
 o5vwYz3el7btGeww7WCqF4c5qSYOgtzRxedd5CLao=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.134
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
X-List-Received-Date: Fri, 25 Oct 2019 08:36:11 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

All these devices do not contain any target-specific. While most
of them are arch-specific, they are shared between different
targets of the same arch family (ARM and AArch64, MIPS32/MIPS64,
endianess, ...).
Put them into common-obj-y to compile them once for all targets.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20191003230404.19384-2-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/timer/Makefile.objs | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 123d92c9692c..f407523aa49d 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -25,20 +25,20 @@ common-obj-$(CONFIG_MILKYMIST) += milkymist-sysctl.o
 common-obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp-rtc.o
 common-obj-$(CONFIG_NRF51_SOC) += nrf51_timer.o
 
-obj-$(CONFIG_ALTERA_TIMER) += altera_timer.o
-obj-$(CONFIG_EXYNOS4) += exynos4210_mct.o
-obj-$(CONFIG_EXYNOS4) += exynos4210_pwm.o
-obj-$(CONFIG_EXYNOS4) += exynos4210_rtc.o
-obj-$(CONFIG_OMAP) += omap_gptimer.o
-obj-$(CONFIG_OMAP) += omap_synctimer.o
-obj-$(CONFIG_PXA2XX) += pxa2xx_timer.o
-obj-$(CONFIG_SH4) += sh_timer.o
-obj-$(CONFIG_DIGIC) += digic-timer.o
-obj-$(CONFIG_MIPS_CPS) += mips_gictimer.o
+common-obj-$(CONFIG_ALTERA_TIMER) += altera_timer.o
+common-obj-$(CONFIG_EXYNOS4) += exynos4210_mct.o
+common-obj-$(CONFIG_EXYNOS4) += exynos4210_pwm.o
+common-obj-$(CONFIG_EXYNOS4) += exynos4210_rtc.o
+common-obj-$(CONFIG_OMAP) += omap_gptimer.o
+common-obj-$(CONFIG_OMAP) += omap_synctimer.o
+common-obj-$(CONFIG_PXA2XX) += pxa2xx_timer.o
+common-obj-$(CONFIG_SH4) += sh_timer.o
+common-obj-$(CONFIG_DIGIC) += digic-timer.o
+common-obj-$(CONFIG_MIPS_CPS) += mips_gictimer.o
 
 obj-$(CONFIG_MC146818RTC) += mc146818rtc.o
 
-obj-$(CONFIG_ALLWINNER_A10_PIT) += allwinner-a10-pit.o
+common-obj-$(CONFIG_ALLWINNER_A10_PIT) += allwinner-a10-pit.o
 
 common-obj-$(CONFIG_STM32F2XX_TIMER) += stm32f2xx_timer.o
 common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o aspeed_rtc.o
-- 
2.21.0


