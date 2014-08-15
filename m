Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIJSx-0000gJ-Kh
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 11:30:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33442)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJSo-0000Z5-J0
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:30:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJSj-0002NV-K4
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:30:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34090)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XIJSX-0002Bf-JR; Fri, 15 Aug 2014 11:30:29 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E0FB24307B;
	Fri, 15 Aug 2014 19:30:28 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 60B5E6E4;
	Fri, 15 Aug 2014 19:15:14 +0400 (MSK)
Received: (nullmailer pid 17920 invoked by uid 1000);
	Fri, 15 Aug 2014 15:15:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 15 Aug 2014 19:15:00 +0400
Message-Id: <1408115711-17836-10-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 09/20] isa-bus: don't use 'Yoda conditions'
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
X-List-Received-Date: Fri, 15 Aug 2014 15:30:53 -0000

From: Gonglei <arei.gonglei@huawei.com>

imitate nearby code about using '!value' or 'value == NULL'

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/isa/isa-bus.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index b28981b..cc85e53 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -50,7 +50,7 @@ ISABus *isa_bus_new(DeviceState *dev, MemoryRegion *address_space_io)
         fprintf(stderr, "Can't create a second ISA bus\n");
         return NULL;
     }
-    if (NULL == dev) {
+    if (!dev) {
         dev = qdev_create(NULL, "isabus-bridge");
         qdev_init_nofail(dev);
     }
-- 
1.7.10.4


