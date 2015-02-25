Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQTVX-0005de-J0
	for mharc-qemu-trivial@gnu.org; Tue, 24 Feb 2015 23:23:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQTVT-0005SY-DN
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 23:23:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQTVS-0006V7-Fw
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 23:23:31 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:35157)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YQTVL-0006Qx-1F; Tue, 24 Feb 2015 23:23:23 -0500
Received: from 172.24.2.119 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CJW53946; Wed, 25 Feb 2015 12:23:20 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml425-hub.china.huawei.com
	(10.82.67.180) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 25 Feb 2015 12:23:09 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 25 Feb 2015 12:22:31 +0800
Message-ID: <1424838157-5524-6-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1424838157-5524-1-git-send-email-arei.gonglei@huawei.com>
References: <1424838157-5524-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH v2 05/11] Remove superfluous '\n' around
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
X-List-Received-Date: Wed, 25 Feb 2015 04:23:33 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 exec.c               | 2 +-
 hw/ide/pci.c         | 2 +-
 hw/microblaze/boot.c | 2 +-
 migration/rdma.c     | 2 +-
 target-s390x/kvm.c   | 2 +-
 trace/control.c      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/exec.c b/exec.c
index 6dff7bc..a21ea20 100644
--- a/exec.c
+++ b/exec.c
@@ -1155,7 +1155,7 @@ static void *file_ram_alloc(RAMBlock *block,
 
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
index 6bee30c..1989f61 100644
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
index 6f2d5b4..83c03d1 100644
--- a/target-s390x/kvm.c
+++ b/target-s390x/kvm.c
@@ -210,7 +210,7 @@ void kvm_s390_reset_vcpu(S390CPU *cpu)
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
1.7.12.4



