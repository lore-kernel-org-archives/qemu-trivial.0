Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVy7t-0002oO-U6
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 05:14:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVy7q-0002kv-KI
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 05:14:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVy7p-0002cG-HJ
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 05:14:54 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41003)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVy7l-0002Zr-Ag; Tue, 24 Jan 2017 05:14:49 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AFBC84210E;
	Tue, 24 Jan 2017 13:14:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 922CC58E;
	Tue, 24 Jan 2017 12:39:44 +0300 (MSK)
Received: (nullmailer pid 12651 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:25 +0300
Message-Id: <4518d7929ee8a86e7e383c2087a8eba3386b4138.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 21/31] vfio: remove a duplicated word in
 comments
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
X-List-Received-Date: Tue, 24 Jan 2017 10:14:55 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/vfio/pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index d7dbe0e..882d3a9 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1881,8 +1881,8 @@ static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
      * 0 is reserved for this since absence of capabilities is indicated by
      * 0 for the ID, version, AND next pointer.  However, pcie_add_capability()
      * uses ID 0 as reserved for list management and will incorrectly match and
-     * assert if we attempt to pre-load the head of the chain with with this
-     * ID.  Use ID 0xFFFF temporarily since it is also seems to be reserved in
+     * assert if we attempt to pre-load the head of the chain with this ID.
+     * Use ID 0xFFFF temporarily since it is also seems to be reserved in
      * part for identifying absence of capabilities in a root complex register
      * block.  If the ID still exists after adding capabilities, switch back to
      * zero.  We'll mark this entire first dword as emulated for this purpose.
-- 
2.1.4


