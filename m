Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTCEg-0001Ts-AF
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 11:28:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCEY-0001Fq-Qo
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:28:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCEU-0002eX-Fn
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:28:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35126)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WTCEJ-0002bP-TI; Thu, 27 Mar 2014 11:28:32 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6C26A43721;
	Thu, 27 Mar 2014 19:28:30 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 4A59B673;
	Thu, 27 Mar 2014 19:28:30 +0400 (MSK)
Received: (nullmailer pid 1777 invoked by uid 1000);
	Thu, 27 Mar 2014 15:28:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 27 Mar 2014 19:28:11 +0400
Message-Id: <1395934108-1694-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Mario Smarduch <m.smarduch@samsung.com>
Subject: [Qemu-trivial] [PULL 06/23] fix return check for KVM_GET_DIRTY_LOG
	ioctl
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
X-List-Received-Date: Thu, 27 Mar 2014 15:28:51 -0000

From: Mario Smarduch <m.smarduch@samsung.com>

Fix return condition check from kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d) to
handle internal failures or no support for memory slot dirty bitmap.
Otherwise the ioctl succeeds and continues with migration.
Addresses BUG# 1294227

Signed-off-by: Mario Smarduch <m.smarduch@samsung.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 kvm-all.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kvm-all.c b/kvm-all.c
index 82a9119..cd4111d 100644
--- a/kvm-all.c
+++ b/kvm-all.c
@@ -441,7 +441,7 @@ static int kvm_physical_sync_dirty_bitmap(MemoryRegionSection *section)
 
         d.slot = mem->slot;
 
-        if (kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d) == -1) {
+        if (kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d) < 0) {
             DPRINTF("ioctl failed %d\n", errno);
             ret = -1;
             break;
-- 
1.7.10.4


