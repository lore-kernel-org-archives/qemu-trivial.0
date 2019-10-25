Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iNv5X-0001h8-RD
	for mharc-qemu-trivial@gnu.org; Fri, 25 Oct 2019 04:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50554)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iNv5T-0001aD-N4
 for qemu-trivial@nongnu.org; Fri, 25 Oct 2019 04:36:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iNv5S-0008F0-CB
 for qemu-trivial@nongnu.org; Fri, 25 Oct 2019 04:36:47 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:41995)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iNv5P-0008CZ-KG; Fri, 25 Oct 2019 04:36:43 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mn2Jj-1hgZlK1kvf-00k8uZ; Fri, 25 Oct 2019 10:35:49 +0200
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
Subject: [PULL 13/19] hw: Move DS1338 device from hw/timer/ to hw/rtc/
 subdirectory
Date: Fri, 25 Oct 2019 10:35:05 +0200
Message-Id: <20191025083511.11463-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025083511.11463-1-laurent@vivier.eu>
References: <20191025083511.11463-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rJpG7AFrJa5zxrJnEIXmaC/LXkpNWpKRKxi0bZbrkc9VUN2g1k8
 DXHNeKMyAVUlGUGkjaHVuQVS008mcDT2PxJr2db/xHm3FVKPAMvC6YLxMRNx/y6JmFXrF59
 Ft2lhi6+UyEYigpFA0rztXUlaM8fKeO7A7TZtf3mimGUO9J3izpXVp8G8YFOci4jyAOesAK
 2KiVUNcL+ksRH+BQoOCGg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0ukzWR3gjvI=:3PrK2L5ZBDozNBKmcHZ0M7
 5egoKg40fSD3DUXckVpDF2QdDXmBzc4DzQIKSGVcaDexevcg4JxgrKaUgMWPjK/g98DrPX38k
 OXas1TSHrdZpZVzNKIFrD9mYsJ6V7f1+DTGEyfihJrbcpjB4FxrgcvdpT9rmqvNLO6gzfZtSp
 TN2cPMcTgcaDifcrgNOKpAT+B3bKNKysjHYxsqqLPsGomyrus6sjFO0hItdw6NEjJ7LRvD4fW
 LcjteXijWhncjxB9O0qvplzE4KMyU/2s6a0Dj4SPuOj2Pe2U/FjOpiAEOu9ZhnKWL/KTtArD4
 2+uVYh1iMi32ebt5zjNbiuwDXr12duNV3vxx2sf6HfqNbgmg+1UbV1JyF4lUjyfcVKlxNIwdH
 UBiE9GJ3RuyWV34aNM0xOeCTMbjtR/0EJiEFD0/2rMSeNB083Q7SQPu6HIAV4nKROR1jkLccX
 mjwjWpnq+SRzZCtGRwgNrU3K0VsY4bm7ywdVBLJEc76wpfXP/Fg4su6kYdgPGraZUrrq5Et4h
 z28HAAOtXoCUJ/sxkFIc9vE9cInYebPrdsKmIDdQFXORNLoLKAvQdHXA3FmaE8SDtLIRm78cU
 his2uYCSPcKU0jBePrlmNWPPt0b2xbnoo8QFwhELKspKK4oONrNS+xq49hYXbr1dmpMiJYbF6
 nvAh00Wo8UVhg10y5xPODlcrvkz7CnJbaJ4GjuMa6DS5VKMbMd+e6kVWA0iY2U4t02W/EKJ8L
 bGPiRDhAuBBjJ1I/0Dga/x25ew5oivw/kvh0CCSLRIwYRDyr8EIGEnBDaX2VoowAxDVQBH+xQ
 62hMvRY9bqANKDCOG6rEGfyrwLXhGzEGvRHSbQ6sgrppHN4QKYTS2t/hnRb2+IsbnFVX2kdYU
 YzylShGK6taQVcAkc5H1L0sxiDsscHV0tFT8XDhNM=
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
X-List-Received-Date: Fri, 25 Oct 2019 08:36:50 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The DS1338 is a Real Time Clock, not a timer.
Move it under the hw/rtc/ subdirectory.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20191003230404.19384-9-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/rtc/Kconfig             | 4 ++++
 hw/rtc/Makefile.objs       | 1 +
 hw/{timer => rtc}/ds1338.c | 0
 hw/timer/Kconfig           | 4 ----
 hw/timer/Makefile.objs     | 1 -
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename hw/{timer => rtc}/ds1338.c (100%)

diff --git a/hw/rtc/Kconfig b/hw/rtc/Kconfig
index dff9d60946af..45daa8d655c9 100644
--- a/hw/rtc/Kconfig
+++ b/hw/rtc/Kconfig
@@ -1,3 +1,7 @@
+config DS1338
+    bool
+    depends on I2C
+
 config M41T80
     bool
     depends on I2C
diff --git a/hw/rtc/Makefile.objs b/hw/rtc/Makefile.objs
index 810a38ee7b3d..b195863291d1 100644
--- a/hw/rtc/Makefile.objs
+++ b/hw/rtc/Makefile.objs
@@ -1,3 +1,4 @@
+common-obj-$(CONFIG_DS1338) += ds1338.o
 common-obj-$(CONFIG_M41T80) += m41t80.o
 common-obj-$(CONFIG_M48T59) += m48t59.o
 ifeq ($(CONFIG_ISA_BUS),y)
diff --git a/hw/timer/ds1338.c b/hw/rtc/ds1338.c
similarity index 100%
rename from hw/timer/ds1338.c
rename to hw/rtc/ds1338.c
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index 9357875f285d..a990f9fe35fc 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -9,10 +9,6 @@ config ARM_MPTIMER
 config A9_GTIMER
     bool
 
-config DS1338
-    bool
-    depends on I2C
-
 config HPET
     bool
     default y if PC
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 23be70b71d32..70b61b69c7a4 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -3,7 +3,6 @@ common-obj-$(CONFIG_ARM_MPTIMER) += arm_mptimer.o
 common-obj-$(CONFIG_ARM_V7M) += armv7m_systick.o
 common-obj-$(CONFIG_A9_GTIMER) += a9gtimer.o
 common-obj-$(CONFIG_CADENCE) += cadence_ttc.o
-common-obj-$(CONFIG_DS1338) += ds1338.o
 common-obj-$(CONFIG_HPET) += hpet.o
 common-obj-$(CONFIG_I8254) += i8254_common.o i8254.o
 common-obj-$(CONFIG_PUV3) += puv3_ost.o
-- 
2.21.0


