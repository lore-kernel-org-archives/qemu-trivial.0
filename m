Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iNv5X-0001go-Iy
	for mharc-qemu-trivial@gnu.org; Fri, 25 Oct 2019 04:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50541)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iNv5T-0001Zp-EO
 for qemu-trivial@nongnu.org; Fri, 25 Oct 2019 04:36:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iNv5S-0008Eo-5U
 for qemu-trivial@nongnu.org; Fri, 25 Oct 2019 04:36:47 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:34557)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iNv5P-0008CN-FA; Fri, 25 Oct 2019 04:36:43 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M4K6z-1iOC3d1MB7-000O1d; Fri, 25 Oct 2019 10:36:00 +0200
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
Subject: [PULL 18/19] hw/rtc/xlnx-zynqmp-rtc: Remove unused "ptimer.h" include
Date: Fri, 25 Oct 2019 10:35:10 +0200
Message-Id: <20191025083511.11463-19-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025083511.11463-1-laurent@vivier.eu>
References: <20191025083511.11463-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bIVh4Atdz8bHUNgDKytO4sxywaGZPxNGPkscIkQ59ZOiIyIm/xq
 c8nPdAO8wITFiXU10dVK67Q/hD/eeRjyt7FlwozDNzVNUSu7N5VWqK4n9MHIEupT16Crppp
 +0UYhJlob30MSu6hlUpt/rYmmSIknby3svJtfkCbqClmTP2DvE77O6Cr/Vjh0/9KYswm32T
 w1Ix0+hjxjmif4ar3mGhg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ra8smSEyvIs=:JTCe2FY0XoUYysYNNN89O1
 Aro3pi6I4fhHm4AXqjsGea1WxQ8lDqO8HwQEFWwhrLOhITnHTI5eUXJvhIt0GMXwm/DeFkNdR
 hwoS5iC4RNrZKP67fcCvcGfzLiSA9UTG4C9iXv22bVb8VvQXUkSA9dYfqd/dsLiRs45QUnad9
 zA/nUqmX8FuHrTAG0tIu/nU54+5tcZ4yzruXEVO3gmKT3Y57Vg3TgEMP6m5a1YD0dYifPr4Pd
 sXmSE/JT4TCZVAdDieQlFOlQvbKJRPIsceaIAmRxPqwBGs0HASYSfi+lfAwHw0U7Y0x5wsm3/
 9WJxT8d+CzM8spnitrE5LWibeOCMgXQIs1OHPLTGpeUzjDeN2VwO0T+Er2WnAJsor16ProFgS
 wAEVxOrsFTiWUV3lmudp0OACmpXsVweblTah713IRaExbhR/8dh0Mt13VZ0e/cQ6MHC38TaE0
 9kaFSItY77DwttlKpPO9H++p5pz30/gi+/218zR38dNd3kQhD8xRp1sM+9hU0WASgdwMJ8r4n
 TdVGDxjqw4EuezAQ8Oj8c/CLg1pXmsBW5K2db5k3aXxr6ZejRx7CrFXlLe8UJJaE7NIfd+9lA
 0QzMMrM8UMUV+e0eDDj6N9EqBfWifrQTW0K6cqBviaI0NY41Jkdz1Nrb8Tsa1eOJbmIEpnEou
 i90n4oLape0x7p56MhqJU6a3/17VV2xLf/+iQoZHWaulz5scPM0C+YT1BBp9XWHhZCJ0P6m/l
 m/ZN9K3mlbjRLF4NFqnVPHbc4j8RkIPBYHBFLZVbL+N8LlTHkUBasWh479xXMrKjxUT3dYn1w
 Y1NtT6Ae5egJGyc+vSkA61Alkz492aB6TBA+1GkOGAVQvyn9Wwp8KmcJQomuV6rs7nr+2U36q
 c7X5oYlwsc6k8qGcSOZEzK/5ySzyhlnCIxPACRGrk=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.131
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
X-List-Received-Date: Fri, 25 Oct 2019 08:36:50 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The "hw/ptimer.h" header is not used, remove it.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20191003230404.19384-14-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/rtc/xlnx-zynqmp-rtc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/rtc/xlnx-zynqmp-rtc.c b/hw/rtc/xlnx-zynqmp-rtc.c
index f9f09b72965a..2bcd14d7795d 100644
--- a/hw/rtc/xlnx-zynqmp-rtc.c
+++ b/hw/rtc/xlnx-zynqmp-rtc.c
@@ -32,7 +32,6 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/irq.h"
-#include "hw/ptimer.h"
 #include "qemu/cutils.h"
 #include "sysemu/sysemu.h"
 #include "trace.h"
-- 
2.21.0


