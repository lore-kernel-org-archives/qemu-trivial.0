Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bDw1X-00089x-6X
	for mharc-qemu-trivial@gnu.org; Fri, 17 Jun 2016 11:49:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <brogers@suse.com>) id 1bDvNn-000885-HX
	for qemu-trivial@nongnu.org; Fri, 17 Jun 2016 11:08:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <brogers@suse.com>) id 1bDvNm-0005Xt-F4
	for qemu-trivial@nongnu.org; Fri, 17 Jun 2016 11:08:31 -0400
Received: from inet-orm.provo.novell.com ([137.65.248.124]:59661
	helo=mail.novell.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <brogers@suse.com>)
	id 1bDvNg-0005WH-Kp; Fri, 17 Jun 2016 11:08:24 -0400
Received: from brogers1.gns.novell.com ([137.65.220.65])
	by mail.novell.com with ESMTP (NOT encrypted);
	Fri, 17 Jun 2016 09:08:11 -0600
From: Bruce Rogers <brogers@suse.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Bruce Rogers <brogers@suse.com>
Date: Fri, 17 Jun 2016 09:08:16 -0600
Message-Id: <1466176096-22478-1-git-send-email-brogers@suse.com>
X-Mailer: git-send-email 1.9.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 137.65.248.124
X-Mailman-Approved-At: Fri, 17 Jun 2016 11:49:34 -0400
Subject: [Qemu-trivial] [PATCH] pic: fix typo in error message:
 KVM_GET_IRQCHIP -> KVM_SET_IRQCHIP
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
X-List-Received-Date: Fri, 17 Jun 2016 15:08:32 -0000

Signed-off-by: Bruce Rogers <brogers@suse.com>
---
 hw/i386/kvm/i8259.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/kvm/i8259.c b/hw/i386/kvm/i8259.c
index 2b207de..11d1b72 100644
--- a/hw/i386/kvm/i8259.c
+++ b/hw/i386/kvm/i8259.c
@@ -92,7 +92,7 @@ static void kvm_pic_put(PICCommonState *s)
 
     ret = kvm_vm_ioctl(kvm_state, KVM_SET_IRQCHIP, &chip);
     if (ret < 0) {
-        fprintf(stderr, "KVM_GET_IRQCHIP failed: %s\n", strerror(ret));
+        fprintf(stderr, "KVM_SET_IRQCHIP failed: %s\n", strerror(ret));
         abort();
     }
 }
-- 
1.9.0


