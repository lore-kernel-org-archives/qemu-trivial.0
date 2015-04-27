Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ymnu3-0005n2-AG
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 14:37:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1YmmNH-000744-DD
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:59:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1YmmNG-00080o-LO
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:59:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53965)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1YmmNA-0007nO-Ho; Mon, 27 Apr 2015 12:59:08 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t3RGx7b4024821
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 27 Apr 2015 12:59:07 -0400
Received: from thh440s.redhat.com (vpn1-6-72.ams2.redhat.com [10.36.6.72])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t3RGx4X9010006; Mon, 27 Apr 2015 12:59:05 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 27 Apr 2015 18:59:04 +0200
Message-Id: <1430153944-24368-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Mon, 27 Apr 2015 14:37:10 -0400
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH] kvm: Silence warning from valgrind
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
X-List-Received-Date: Mon, 27 Apr 2015 16:59:16 -0000

valgrind complains here about uninitialized bytes with the following message:

==17814== Syscall param ioctl(generic) points to uninitialised byte(s)
==17814==    at 0x466A780: ioctl (in /usr/lib64/power8/libc-2.17.so)
==17814==    by 0x100735B7: kvm_vm_ioctl (kvm-all.c:1920)
==17814==    by 0x10074583: kvm_set_ioeventfd_mmio (kvm-all.c:574)

Let's fix it by using a proper struct initializer in kvm_set_ioeventfd_mmio().

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 kvm-all.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/kvm-all.c b/kvm-all.c
index dd44f8c..077b0ed 100644
--- a/kvm-all.c
+++ b/kvm-all.c
@@ -552,13 +552,13 @@ static int kvm_set_ioeventfd_mmio(int fd, hwaddr addr, uint32_t val,
                                   bool assign, uint32_t size, bool datamatch)
 {
     int ret;
-    struct kvm_ioeventfd iofd;
-
-    iofd.datamatch = datamatch ? adjust_ioeventfd_endianness(val, size) : 0;
-    iofd.addr = addr;
-    iofd.len = size;
-    iofd.flags = 0;
-    iofd.fd = fd;
+    struct kvm_ioeventfd iofd = {
+        .datamatch = datamatch ? adjust_ioeventfd_endianness(val, size) : 0,
+        .addr = addr,
+        .len = size,
+        .flags = 0,
+        .fd = fd,
+    };
 
     if (!kvm_enabled()) {
         return -ENOSYS;
-- 
1.8.3.1


