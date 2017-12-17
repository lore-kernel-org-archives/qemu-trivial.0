Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQgd1-0007KN-U0
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 16:37:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42115)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQgcz-0007Hi-IL
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 16:37:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQgcy-00018R-G9
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 16:37:45 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41173)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eQgct-00014K-A2; Sun, 17 Dec 2017 16:37:39 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1125741174;
	Mon, 18 Dec 2017 00:28:09 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id EA0FBCAE;
	Mon, 18 Dec 2017 00:25:45 +0300 (MSK)
Received: (nullmailer pid 30884 invoked by uid 1000);
	Sun, 17 Dec 2017 21:28:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Ladi Prosek <lprosek@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 18 Dec 2017 00:27:06 +0300
Message-Id: <320b69994d432ec08fe3cdc6bee10d04514688bb.1513545944.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 01/61] Remove empty statements
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
X-List-Received-Date: Sun, 17 Dec 2017 21:37:46 -0000

From: Ladi Prosek <lprosek@redhat.com>

Thanks to Laszlo Ersek for spotting the double semicolon in target/i386/kvm.c

I have trivially grepped the tree for ';;' in C files.

Suggested-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Ladi Prosek <lprosek@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/misc/imx6_ccm.c     | 2 +-
 hw/s390x/virtio-ccw.c  | 2 +-
 linux-user/signal.c    | 2 +-
 migration/block.c      | 2 +-
 target/i386/cpu.c      | 2 +-
 target/i386/kvm.c      | 2 +-
 target/sh4/translate.c | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
index 1b421013a3..4fa94835fe 100644
--- a/hw/misc/imx6_ccm.c
+++ b/hw/misc/imx6_ccm.c
@@ -335,7 +335,7 @@ static uint64_t imx6_ccm_get_ipg_clk(IMX6CCMState *dev)
     uint64_t freq = 0;
 
     freq = imx6_ccm_get_ahb_clk(dev)
-           / (1 + EXTRACT(dev->ccm[CCM_CBCDR], IPG_PODF));;
+           / (1 + EXTRACT(dev->ccm[CCM_CBCDR], IPG_PODF));
 
     DPRINTF("freq = %d\n", (uint32_t)freq);
 
diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index 3dd902a664..38f6a8afc9 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -486,7 +486,7 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
         } else {
             address_space_stb(&address_space_memory, ccw.cda, vdev->status,
                                         MEMTXATTRS_UNSPECIFIED, NULL);
-            sch->curr_status.scsw.count = ccw.count - sizeof(vdev->status);;
+            sch->curr_status.scsw.count = ccw.count - sizeof(vdev->status);
             ret = 0;
         }
         break;
diff --git a/linux-user/signal.c b/linux-user/signal.c
index cf35473671..dae14d4a89 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -6530,7 +6530,7 @@ static void setup_rt_frame(int sig, struct target_sigaction *ka,
         haddr = dest;
     }
     env->iaoq_f = haddr;
-    env->iaoq_b = haddr + 4;;
+    env->iaoq_b = haddr + 4;
     return;
 
  give_sigsegv:
diff --git a/migration/block.c b/migration/block.c
index 7147171bb7..e68e090c6f 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -897,7 +897,7 @@ static int block_load(QEMUFile *f, void *opaque, int version_id)
     int len, flags;
     char device_name[256];
     int64_t addr;
-    BlockBackend *blk, *blk_prev = NULL;;
+    BlockBackend *blk, *blk_prev = NULL;
     Error *local_err = NULL;
     uint8_t *buf;
     int64_t total_sectors = 0;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 045d66191f..82603e3130 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -2220,7 +2220,7 @@ static void x86_cpu_class_check_missing_features(X86CPUClass *xcc,
 
     if (xcc->kvm_required && !kvm_enabled()) {
         strList *new = g_new0(strList, 1);
-        new->value = g_strdup("kvm");;
+        new->value = g_strdup("kvm");
         *missing_feats = new;
         return;
     }
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index b1e32e95d3..d4b2ce2e94 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -1122,7 +1122,7 @@ static int kvm_get_supported_msrs(KVMState *s)
                     break;
                 case MSR_IA32_XSS:
                     has_msr_xss = true;
-                    break;;
+                    break;
                 case HV_X64_MSR_CRASH_CTL:
                     has_msr_hv_crash = true;
                     break;
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 703020fe87..8569179883 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -668,7 +668,7 @@ static void _decode_opc(DisasContext * ctx)
 	return;
     case 0x6008:		/* swap.b Rm,Rn */
 	{
-            TCGv low = tcg_temp_new();;
+            TCGv low = tcg_temp_new();
 	    tcg_gen_ext16u_i32(low, REG(B7_4));
 	    tcg_gen_bswap16_i32(low, low);
             tcg_gen_deposit_i32(REG(B11_8), REG(B7_4), low, 0, 16);
-- 
2.11.0


