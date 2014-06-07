Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WtJro-0004JG-SZ
	for mharc-qemu-trivial@gnu.org; Sat, 07 Jun 2014 12:53:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WtJrm-0004Fa-PT
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 12:53:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WtJrm-000271-0F
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 12:53:14 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:48535)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WtJrk-00026i-8U; Sat, 07 Jun 2014 12:53:12 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WtJrj-0003cy-6o; Sat, 07 Jun 2014 17:53:11 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat,  7 Jun 2014 17:53:11 +0100
Message-Id: <1402159991-13919-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] hw/net/ne2000-isa: Register vmstate struct
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
X-List-Received-Date: Sat, 07 Jun 2014 16:53:15 -0000

The ne2000-isa device defines a VMState struct for migration, but
we forgot to actually register it. Correct this deficiency by
setting dc->vmsd.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I think this is the last of the "oops, we didn't actually register
the vmstate" bugs that clang 3.4 warns about.

 hw/net/ne2000-isa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/net/ne2000-isa.c b/hw/net/ne2000-isa.c
index c660e58..0a14f6d 100644
--- a/hw/net/ne2000-isa.c
+++ b/hw/net/ne2000-isa.c
@@ -98,6 +98,7 @@ static void isa_ne2000_class_initfn(ObjectClass *klass, void *data)
 
     dc->realize = isa_ne2000_realizefn;
     dc->props = ne2000_isa_properties;
+    dc->vmsd = &vmstate_isa_ne2000;
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
 }
 
-- 
1.8.5.4


