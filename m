Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y4QFd-0002iQ-5h
	for mharc-qemu-trivial@gnu.org; Fri, 26 Dec 2014 03:28:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tiejun.chen@intel.com>) id 1Y4Pwd-0005PJ-1L
	for qemu-trivial@nongnu.org; Fri, 26 Dec 2014 03:08:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tiejun.chen@intel.com>) id 1Y4Pwc-00064V-5v
	for qemu-trivial@nongnu.org; Fri, 26 Dec 2014 03:08:22 -0500
Received: from mga11.intel.com ([192.55.52.93]:54510)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tiejun.chen@intel.com>)
	id 1Y4PwX-0005yy-Rl; Fri, 26 Dec 2014 03:08:17 -0500
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 26 Dec 2014 00:08:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="433582968"
Received: from tchen0-linux.bj.intel.com ([10.238.135.72])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Dec 2014 23:56:32 -0800
From: Tiejun Chen <tiejun.chen@intel.com>
To: pbonzini@redhat.com
Date: Fri, 26 Dec 2014 16:05:26 +0800
Message-Id: <1419581126-12927-1-git-send-email-tiejun.chen@intel.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.93
X-Mailman-Approved-At: Fri, 26 Dec 2014 03:27:59 -0500
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: [Qemu-trivial] [PATCH] kvm_irqchip_assign_irqfd: just set irqfd in
	case of kvm_irqfds_enabled()
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
X-List-Received-Date: Fri, 26 Dec 2014 08:08:24 -0000

We should avoid to set irqfd{} unconditionally.

Signed-off-by: Tiejun Chen <tiejun.chen@intel.com>
---
 kvm-all.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/kvm-all.c b/kvm-all.c
index 18cc6b4..5b9786b 100644
--- a/kvm-all.c
+++ b/kvm-all.c
@@ -1257,21 +1257,21 @@ int kvm_irqchip_update_msi_route(KVMState *s, int virq, MSIMessage msg)
 static int kvm_irqchip_assign_irqfd(KVMState *s, int fd, int rfd, int virq,
                                     bool assign)
 {
-    struct kvm_irqfd irqfd = {
-        .fd = fd,
-        .gsi = virq,
-        .flags = assign ? 0 : KVM_IRQFD_FLAG_DEASSIGN,
-    };
+    struct kvm_irqfd irqfd = {};
+
+    if (!kvm_irqfds_enabled()) {
+        return -ENOSYS;
+    }
+
+    irqfd.fd = fd;
+    irqfd.gsi = virq;
+    irqfd.flags = assign ? 0 : KVM_IRQFD_FLAG_DEASSIGN;
 
     if (rfd != -1) {
         irqfd.flags |= KVM_IRQFD_FLAG_RESAMPLE;
         irqfd.resamplefd = rfd;
     }
 
-    if (!kvm_irqfds_enabled()) {
-        return -ENOSYS;
-    }
-
     return kvm_vm_ioctl(s, KVM_IRQFD, &irqfd);
 }
 
-- 
1.9.1


