Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c523T-00026U-Ve
	for mharc-qemu-trivial@gnu.org; Thu, 10 Nov 2016 21:59:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1c523R-00025P-U2
	for qemu-trivial@nongnu.org; Thu, 10 Nov 2016 21:59:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1c523R-0001al-7R
	for qemu-trivial@nongnu.org; Thu, 10 Nov 2016 21:59:02 -0500
Received: from [59.151.112.132] (port=33959 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1c523L-0001XX-8V; Thu, 10 Nov 2016 21:58:55 -0500
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="12875351"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Nov 2016 10:58:52 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3CE1543972C6;
	Fri, 11 Nov 2016 10:58:49 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 11 Nov 2016 10:58:49 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alex.williamson@redhat.com>
Date: Fri, 11 Nov 2016 11:01:36 +0800
Message-ID: <1478833296-25853-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 3CE1543972C6.AB2C5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH 1/2] vfio: remove a duplicated word in
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
X-List-Received-Date: Fri, 11 Nov 2016 02:59:02 -0000

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 hw/vfio/pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 31aaecb..c94987c 100644
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
2.1.0




