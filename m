Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c524Z-0002xm-EX
	for mharc-qemu-trivial@gnu.org; Thu, 10 Nov 2016 22:00:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1c524X-0002uF-7M
	for qemu-trivial@nongnu.org; Thu, 10 Nov 2016 22:00:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1c524W-0001sZ-HV
	for qemu-trivial@nongnu.org; Thu, 10 Nov 2016 22:00:09 -0500
Received: from [59.151.112.132] (port=35116 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1c524U-0001oR-Ft; Thu, 10 Nov 2016 22:00:06 -0500
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="12875391"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Nov 2016 11:00:04 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 2C67543972C6;
	Fri, 11 Nov 2016 11:00:03 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 11 Nov 2016 11:00:02 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <mst@redhat.com>, <arcel@redhat.com>
Date: Fri, 11 Nov 2016 11:02:48 +0800
Message-ID: <1478833368-25917-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 2C67543972C6.A7CAE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [PATCH 2/2] pcie: fix typo in comments
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
X-List-Received-Date: Fri, 11 Nov 2016 03:00:10 -0000

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 hw/pci/pcie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 99cfb45..39b10b8 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -656,7 +656,7 @@ static void pcie_ext_cap_set_next(PCIDevice *dev, uint16_t pos, uint16_t next)
 }
 
 /*
- * caller must supply valid (offset, size) * such that the range shouldn't
+ * Caller must supply valid (offset, size) such that the range wouldn't
  * overlap with other capability or other registers.
  * This function doesn't check it.
  */
-- 
2.1.0




