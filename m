Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBK2c-0008Co-Gl
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2020 11:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33494)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK2Z-00085V-FM
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:10:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK2Y-0007m6-9E
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:09:59 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:37415)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK2R-0007fp-AF; Mon, 09 Mar 2020 11:09:51 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mw9Lu-1jRt0S2TYa-00s5PG; Mon, 09 Mar 2020 16:09:08 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Helge Deller <deller@gmx.de>,
 qemu-trivial@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 11/33] hw/timer: Remove unused "ui/console.h" header
Date: Mon,  9 Mar 2020 16:08:15 +0100
Message-Id: <20200309150837.3193387-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tM2YDmot9ihGaPhyf6qhTyarNgEYi/pV4Q4kB4JhgYFNz9yEN62
 6m9K4srE81GDTMvq6HW+nrSU05dgDqxVxoc6T1JP8ZoPzReEsm9oCFmiYrW7TFq6QNQ9Ivb
 QL8ROcBTlwseBc7uI2EEjChxJ4a5Yi/bNPj9QgQihMxcuhPos3qlUU4111hzZvhfx/icFOB
 qfLvLwApS1ROlZFps2Qmg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BIzu0BJEkmM=:abdPkxT3jKmvPh6xvVPRht
 tK6BS77CiBwZeTxvxE/HDiQIU3QjYLrT8MuFRRjUjleEfVxDtRCC84+xETfRuzkLYUlhk3Xiv
 uuN/i6cvXRag8xpnAUFbHxMX0/AVjBbSh3BfmOMlu4AOqoqTZzh1F8Uojf3TZhCs3FSlw5A05
 9RE4fRJrhC9j11rZ4zTwvhxyTT/pS2H+dkT9cPkeg01384pxU+lTXSIsXeXcHWARfu5HwJ5uW
 L4hxSdHjOWHAG5j5PPHs19o5Cgt5QttzkQo31YNsfu9ONMnRHnwZpyRdYzPNmTyn1ScPwXOX3
 pyXw9qmMrBoqsdM4/1kShYW75XxpQknfOzqXB7FTeVWHe/k09aqNjRGPsZ/b98+rD2qYJz3nY
 G7AC5aaz8+k596vl/EKgMCVMhY3GcCVzKBa74hJxWwXxhp7eMmNuyjVg5E7C1SUx0GVaa9+wM
 8zt8mkwLe+ac4sBLiqCs6++21kVyZ+FIA1MzLWx6YWEwkkFkOAWmEOoRvbHipb464ftaOcwOT
 ThR5B95U/L6ubo6ecMzlppO5VGa8OtcbsbqiVmA3Pt7g2zBgZmEcCjzi6qZV2qkVDxifen7/K
 OUMaNmIQYSHKU+WBFIVc+WfLeex+9V9bijKEimyn1ZBRGROGfbuLaRXY5GavIS0mNVdUrZPRi
 Xm9DJPcAWhNoFJXi2WB1aSo8uYOOxEnWHbevGVcXXK0BRNc5lSEQ/DVH3mow1nH3P5PnF0QyB
 9hvSfqmF8cQyM6aquaQRP/JrvCL0/yhDrtg6J16ZSIK0q3Y6ZRq7HcazP8E87BrUpdyore2xK
 uUIag31ivesa3qSz6jlHiV7PLLFVTcHV5aZjyP+G5JW0W/V/MAXyzUmGqscHZfp1ui1rVQy
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
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
X-List-Received-Date: Mon, 09 Mar 2020 15:10:00 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The timer models don't need anything from "ui/console.h".
Remove it.

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200228114649.12818-5-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/rtc/twl92230.c | 1 -
 hw/timer/hpet.c   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/rtc/twl92230.c b/hw/rtc/twl92230.c
index 63bd13d2caa4..d0011be89eef 100644
--- a/hw/rtc/twl92230.c
+++ b/hw/rtc/twl92230.c
@@ -27,7 +27,6 @@
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
 #include "sysemu/sysemu.h"
-#include "ui/console.h"
 #include "qemu/bcd.h"
 #include "qemu/module.h"
 
diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 8dbcbdca16a6..4f30dd50a40a 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -27,7 +27,6 @@
 #include "qemu/osdep.h"
 #include "hw/i386/pc.h"
 #include "hw/irq.h"
-#include "ui/console.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
-- 
2.24.1


