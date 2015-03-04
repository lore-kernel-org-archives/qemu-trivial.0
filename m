Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTE0T-0002pP-A2
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 13:26:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTE0L-0002Va-FE
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 13:26:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTE0H-00023c-FR
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 13:26:45 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:38839)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTE0A-00020h-1Z; Wed, 04 Mar 2015 13:26:34 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D2D9D408D0;
	Wed,  4 Mar 2015 21:26:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 99F43988;
	Wed,  4 Mar 2015 20:07:12 +0300 (MSK)
Received: (nullmailer pid 17516 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:33 +0300
Message-Id: <17353efcb47f846465a592d9ae23ef5b4681f94d.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 16/47] Remove superfluous '\n' around
	error_report()
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
X-List-Received-Date: Wed, 04 Mar 2015 18:26:50 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 exec.c               | 2 +-
 hw/ide/pci.c         | 2 +-
 hw/microblaze/boot.c | 2 +-
 migration/rdma.c     | 2 +-
 target-s390x/kvm.c   | 2 +-
 trace/control.c      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/exec.c b/exec.c
index c85321a..ebee8cc 100644
--- a/exec.c
+++ b/exec.c
@@ -1188,7 +1188,7 @@ static void *file_ram_alloc(RAMBlock *block,
 
 error:
     if (mem_prealloc) {
-        error_report("%s\n", error_get_pretty(*errp));
+        error_report("%s", error_get_pretty(*errp));
         exit(1);
     }
     return NULL;
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index e3f2054..913a976 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -99,7 +99,7 @@ static int32_t bmdma_prepare_buf(IDEDMA *dma, int is_write)
              * This should accommodate the largest ATA transaction
              * for LBA48 (65,536 sectors) and 32K sector sizes. */
             if (s->sg.size > INT32_MAX) {
-                error_report("IDE: sglist describes more than 2GiB.\n");
+                error_report("IDE: sglist describes more than 2GiB.");
                 break;
             }
             bm->cur_prd_addr += l;
diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index a2843cd..38c59db 100644
--- a/hw/microblaze/boot.c
+++ b/hw/microblaze/boot.c
@@ -185,7 +185,7 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
                                                   ram_size - initrd_offset);
             }
             if (initrd_size < 0) {
-                error_report("qemu: could not load initrd '%s'\n",
+                error_report("qemu: could not load initrd '%s'",
                              initrd_filename);
                 exit(EXIT_FAILURE);
             }
diff --git a/migration/rdma.c b/migration/rdma.c
index a7bca91..a8c2407 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1627,7 +1627,7 @@ static int qemu_rdma_exchange_get_response(RDMAContext *rdma,
         return -EIO;
     }
     if (head->len > RDMA_CONTROL_MAX_BUFFER - sizeof(*head)) {
-        error_report("too long length: %d\n", head->len);
+        error_report("too long length: %d", head->len);
         return -EINVAL;
     }
     if (sizeof(*head) + head->len != byte_len) {
diff --git a/target-s390x/kvm.c b/target-s390x/kvm.c
index d7c57d9..508cc0a 100644
--- a/target-s390x/kvm.c
+++ b/target-s390x/kvm.c
@@ -211,7 +211,7 @@ void kvm_s390_reset_vcpu(S390CPU *cpu)
      * Before this ioctl cpu_synchronize_state() is called in common kvm
      * code (kvm-all) */
     if (kvm_vcpu_ioctl(cs, KVM_S390_INITIAL_RESET, NULL)) {
-        error_report("Initial CPU reset failed on CPU %i\n", cs->cpu_index);
+        error_report("Initial CPU reset failed on CPU %i", cs->cpu_index);
     }
 }
 
diff --git a/trace/control.c b/trace/control.c
index 0d30801..995beb3 100644
--- a/trace/control.c
+++ b/trace/control.c
@@ -126,7 +126,7 @@ static void trace_init_events(const char *fname)
                     error_report("WARNING: trace event '%s' does not exist",
                                  line_ptr);
                 } else if (!trace_event_get_state_static(ev)) {
-                    error_report("WARNING: trace event '%s' is not traceable\n",
+                    error_report("WARNING: trace event '%s' is not traceable",
                                  line_ptr);
                 } else {
                     trace_event_set_state_dynamic(ev, enable);
-- 
2.1.4


