Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1plbV5-0003cg-3N
	for mharc-qemu-trivial@gnu.org; Sun, 09 Apr 2023 16:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1plbV3-0003cT-TT; Sun, 09 Apr 2023 16:18:57 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1plbV2-0008Lv-5u; Sun, 09 Apr 2023 16:18:57 -0400
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 9A237DA0498;
 Sun,  9 Apr 2023 22:18:54 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 6A3B84668B2; Sun,  9 Apr 2023 22:18:54 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>
Subject: [PATCH for-8.0] docs/cxl: Fix sentence
Date: Sun,  9 Apr 2023 22:18:28 +0200
Message-Id: <20230409201828.1159568-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Apr 2023 20:18:58 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

If my change is okay I suggest to apply the patch for 8.0
because it fixes documentation.

Regards,
Stefan W.

 docs/system/devices/cxl.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
index f25783a4ec..4c38223069 100644
--- a/docs/system/devices/cxl.rst
+++ b/docs/system/devices/cxl.rst
@@ -111,7 +111,7 @@ Interfaces provided include:
 
 CXL Root Ports (CXL RP)
 ~~~~~~~~~~~~~~~~~~~~~~~
-A CXL Root Port servers te same purpose as a PCIe Root Port.
+A CXL Root Port serves the same purpose as a PCIe Root Port.
 There are a number of CXL specific Designated Vendor Specific
 Extended Capabilities (DVSEC) in PCIe Configuration Space
 and associated component register access via PCI bars.
-- 
2.39.2


