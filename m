Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9TwI-0004BN-Te
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 05:01:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9TwE-00045x-7Q
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 05:01:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9TwC-0004o0-9x
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 05:01:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38097)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9Tw8-0004mE-T3; Sun, 05 Jun 2016 05:01:37 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id F329E40917;
	Sun,  5 Jun 2016 12:01:26 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 97097ADF;
	Sun,  5 Jun 2016 10:43:33 +0300 (MSK)
Received: (nullmailer pid 1113 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:42:49 +0300
Message-Id: <bd01b6b58a46a7a0b57c85a5527ec6c4f7bb6b2c.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 12/52] replace muldiv64(a, b,
 c) by (uint64_t)a * b / c
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
X-List-Received-Date: Sun, 05 Jun 2016 09:01:45 -0000

From: Laurent Vivier <lvivier@redhat.com>

When "a" and "b" are 32bit values, we don't have to cast
them to 128bit, 64bit is enough.

This patch is the result of coccinelle script
scripts/coccinelle/simplify_muldiv64.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
For xtensa PIC:
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/audio/gus.c      | 2 +-
 hw/xtensa/pic_cpu.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/audio/gus.c b/hw/audio/gus.c
index 9dd6947..6c02646 100644
--- a/hw/audio/gus.c
+++ b/hw/audio/gus.c
@@ -144,7 +144,7 @@ static void GUS_callback (void *opaque, int free)
     s->left = samples;
 
  reset:
-    gus_irqgen (&s->emu, muldiv64 (net, 1000000, s->freq));
+    gus_irqgen (&s->emu, (uint64_t)net * 1000000 / s->freq);
 }
 
 int GUS_irqrequest (GUSEmuState *emu, int hwirq, int n)
diff --git a/hw/xtensa/pic_cpu.c b/hw/xtensa/pic_cpu.c
index ccf65fd..2bed64f 100644
--- a/hw/xtensa/pic_cpu.c
+++ b/hw/xtensa/pic_cpu.c
@@ -122,8 +122,8 @@ void xtensa_rearm_ccompare_timer(CPUXtensaState *env)
     }
     env->wake_ccount = wake_ccount;
     timer_mod(env->ccompare_timer, env->halt_clock +
-            muldiv64(wake_ccount - env->sregs[CCOUNT],
-                1000000, env->config->clock_freq_khz));
+            (uint64_t)(wake_ccount - env->sregs[CCOUNT]) *
+            1000000 / env->config->clock_freq_khz);
 }
 
 static void xtensa_ccompare_cb(void *opaque)
-- 
2.1.4


