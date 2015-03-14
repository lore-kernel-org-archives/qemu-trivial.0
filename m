Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWhta-000856-00
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2015 04:58:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YWhtY-00083P-2A
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 04:58:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YWhtX-0002jX-8D
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 04:58:08 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:59195)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YWhtR-0002iQ-9h; Sat, 14 Mar 2015 04:58:01 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 4728B17F713; Sat, 14 Mar 2015 09:57:58 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sat, 14 Mar 2015 09:57:57 +0100
Message-Id: <1426323477-949-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] pci-assign: Fix warning from coverity
	(argument cannot be negative)
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
X-List-Received-Date: Sat, 14 Mar 2015 08:58:08 -0000

Coverity warns because function monitor_fd_param can return a negative
value which might be passed to function read.

This won't happen because dev->config_fd will only be negative (-1)
when local_err is set.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/i386/kvm/pci-assign.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/kvm/pci-assign.c b/hw/i386/kvm/pci-assign.c
index 9db7c77..f3d145b 100644
--- a/hw/i386/kvm/pci-assign.c
+++ b/hw/i386/kvm/pci-assign.c
@@ -554,7 +554,7 @@ static void get_real_device(AssignedDevice *pci_dev, Error **errp)
     if (pci_dev->configfd_name && *pci_dev->configfd_name) {
         dev->config_fd = monitor_fd_param(cur_mon, pci_dev->configfd_name,
                                           &local_err);
-        if (local_err) {
+        if (dev->config_fd < 0) {
             error_propagate(errp, local_err);
             return;
         }
-- 
1.7.10.4


