Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ynh0C-0000s1-Km
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 01:27:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynh05-0000e7-Lq
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:27:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynh04-0000dg-TD
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:27:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39662)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Yngzx-0000bG-AZ; Thu, 30 Apr 2015 01:26:57 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 96F8C42B8E;
	Thu, 30 Apr 2015 08:26:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id AD6AC967;
	Thu, 30 Apr 2015 08:09:00 +0300 (MSK)
Received: (nullmailer pid 4374 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:53 +0300
Message-Id: <bcb983e5cd718f0e8ea7c1fdf7b670c327c5ec04.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 40/42] kvm: Silence warning from valgrind
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
X-List-Received-Date: Thu, 30 Apr 2015 05:27:06 -0000

From: Thomas Huth <thuth@redhat.com>

valgrind complains here about uninitialized bytes with the following message:

==17814== Syscall param ioctl(generic) points to uninitialised byte(s)
==17814==    at 0x466A780: ioctl (in /usr/lib64/power8/libc-2.17.so)
==17814==    by 0x100735B7: kvm_vm_ioctl (kvm-all.c:1920)
==17814==    by 0x10074583: kvm_set_ioeventfd_mmio (kvm-all.c:574)

Let's fix it by using a proper struct initializer in kvm_set_ioeventfd_mmio().

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 kvm-all.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/kvm-all.c b/kvm-all.c
index 2a717e5..37cc2cf 100644
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
2.1.4


