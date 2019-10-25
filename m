Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iNv5Z-0001kM-LJ
	for mharc-qemu-trivial@gnu.org; Fri, 25 Oct 2019 04:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50588)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iNv5U-0001bk-Gr
 for qemu-trivial@nongnu.org; Fri, 25 Oct 2019 04:36:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iNv5T-0008Fl-Aw
 for qemu-trivial@nongnu.org; Fri, 25 Oct 2019 04:36:48 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:46229)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iNv5H-00087p-Q8; Fri, 25 Oct 2019 04:36:36 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M6DnM-1iLi9W0W2S-006iku; Fri, 25 Oct 2019 10:35:58 +0200
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
Subject: [PULL 17/19] hw/rtc/mc146818: Include mc146818rtc_regs.h a bit less
Date: Fri, 25 Oct 2019 10:35:09 +0200
Message-Id: <20191025083511.11463-18-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025083511.11463-1-laurent@vivier.eu>
References: <20191025083511.11463-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fo2sC3oBx2jPfCQrBxU70SXruu633246+ExBKU/D1kXsJeNwjU1
 KGlpKsDt/yD75ZoHmLJa2QkafdPSh1tg4ganhk/ql+nAX4rFsM0ITal+Dpn3xQi5yGSX2m8
 r42SjKHR50g2K6NplUIHbhIONu9cNLeMLQF/7zobNvxifyD7g9pXOBxZgdxQph2T5uvJfqW
 FgD4vOsO7cQBgO6ye4C3A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uqFFU+R/qyU=:7NGivjYrUMNBsUkQhEZnTC
 Bz8XFSK2xIFoUbLGzIQ4tYfkZmkARsWvxG0U5GkhD2jQc7F4RarVAo0PYMsympI+bLIyZoeMY
 LZkGTEdKcCSZBcbp9wEfiue5IVvuqGU4m8agSxf5zVIk83/gefhDLFvU6YgdKXOxclLRswq+n
 1wHyZoLHFxPvqS0vBlFeyH3lQ86gtDQMLCqFSHKNIz0If8FaC6qjL3EPmk71hyTr010qmUNO/
 lwpNLf6qAUIVHvHlos8BJXXmc/sVlPnJekaV6lbMgGi4rfKp2VmViwCCoQ3Ym0y4dMd0vtrYT
 lK5gekFz1M0bc61wWMB45rMztnRXs5m4GEN/qWoARZqDhDGAt3y2MPk3N5FWZksZX/huoOB0P
 yUUjB6LegLBYq5HyNuu4paf0f6jLmgES88n1aD6FSzlI0EMGRODT8QPXiI/P0OQ5k0oW1w4Sh
 H4nqf8BL2wYy/wyGBC3tG201UPAQ2ChOnzM/cn8hf9SbCevFTxs2zzKuK1zlj91JZf2KreNJG
 cqq/B7Miftl2i1zUxEluyS2CyKUVszXt48xECr2cBQbG6/5oHhKUEiH0NniqZWwQa2JaQvMfT
 kusdP9/mh/7e+E/0UM/OKysPzSx+4GrCTxJF4LSZwYN9Jj9rEs9jmx1Kv/Ftrgjxx8uRxx40P
 cRK9XzvtprSO738VZX9UpIvZlH+cCPGAd20si7mFB8QGBDWyt2TPL9IlYIgoiIQjmgpmb2/ZF
 OMTFHbJZu4GMDnXkd5MNUt0X55epUJL1wKccrgqkpmd+gzMuvKjHvCePnGizyyqH1EOVMGB3C
 k0Bub3cyWxFIeVSbJSCFi07onPe4kLMdXfBMFugMe4KRmRTUXEoFgGsViTOKByygFkbxcI4pa
 90n4bvXNmhFl4nRTSjgijuc/vdMwqo5iHH/11FzT8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.187
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
X-List-Received-Date: Fri, 25 Oct 2019 08:36:51 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Only 2 source files require the "mc146818rtc_regs.h" header.
Instead of having it processed 12 times, by all objects
using "mc146818rtc.h", include it directly where used.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20191003230404.19384-13-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/rtc/mc146818rtc.c         | 1 +
 hw/timer/hpet.c              | 1 +
 include/hw/rtc/mc146818rtc.h | 1 -
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index ced15f764fc1..9d4ed54f65e2 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -35,6 +35,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "hw/rtc/mc146818rtc.h"
+#include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-misc-target.h"
diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 02bf8a8ce8fc..9f17aaa278e2 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -34,6 +34,7 @@
 #include "hw/timer/hpet.h"
 #include "hw/sysbus.h"
 #include "hw/rtc/mc146818rtc.h"
+#include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
 #include "hw/timer/i8254.h"
 
diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
index 2e9331637a6d..7fa59d4279c5 100644
--- a/include/hw/rtc/mc146818rtc.h
+++ b/include/hw/rtc/mc146818rtc.h
@@ -10,7 +10,6 @@
 #define HW_RTC_MC146818RTC_H
 
 #include "hw/isa/isa.h"
-#include "hw/rtc/mc146818rtc_regs.h"
 
 #define TYPE_MC146818_RTC "mc146818rtc"
 
-- 
2.21.0


