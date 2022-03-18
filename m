Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nVDUA-0003WG-OC
	for mharc-qemu-trivial@gnu.org; Fri, 18 Mar 2022 10:21:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_rcran@quicinc.com>)
 id 1nV9a6-0002HI-KZ; Fri, 18 Mar 2022 06:11:38 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:46073)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_rcran@quicinc.com>)
 id 1nV9a4-00026V-D5; Fri, 18 Mar 2022 06:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647598296; x=1679134296;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fgjSfIXuy0HGkMmXU7zWHg3/1AONPr96up362g4wMsk=;
 b=k1YVauwmSMzL6GTq713tCyCsi1ue2Mj9gU5h8oQUVQA2XN8XfEdPPnad
 aG9Mr301dkoDrquxJ0wVzG9UEwiCwbm+9omemwEs7+OPG2yQJhILn3t/j
 A2RqLSVk2/S4jXKxX8RLalnVCP04D82XYNWwcZ+Gs1xhr12afZaOqEpAn Q=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 18 Mar 2022 03:11:32 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 03:11:32 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 18 Mar 2022 03:11:32 -0700
Received: from linbox.ba.nuviainc.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 18 Mar 2022 03:11:31 -0700
From: Rebecca Cran <quic_rcran@quicinc.com>
To: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 <qemu-trivial@nongnu.org>
CC: Rebecca Cran <quic_rcran@quicinc.com>, <qemu-devel@nongnu.org>
Subject: [PATCH trivial 1/1] hw/pci/pci.c: Fix typos of "Firewire",
 and of "controller" on same line
Date: Fri, 18 Mar 2022 04:11:24 -0600
Message-ID: <20220318101124.912-1-quic_rcran@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=quic_rcran@quicinc.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 18 Mar 2022 10:21:43 -0400
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
X-List-Received-Date: Fri, 18 Mar 2022 10:11:38 -0000

Signed-off-by: Rebecca Cran <quic_rcran@quicinc.com>
---
 hw/pci/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 5cb1232e271d..dae9119bfe5f 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1697,7 +1697,7 @@ static const pci_class_desc pci_class_descriptions[] =
     { 0x0902, "Mouse", "mouse"},
     { 0x0A00, "Dock station", "dock", 0x00ff},
     { 0x0B00, "i386 cpu", "cpu", 0x00ff},
-    { 0x0c00, "Fireware contorller", "fireware"},
+    { 0x0c00, "Firewire controller", "firewire"},
     { 0x0c01, "Access bus controller", "access-bus"},
     { 0x0c02, "SSA controller", "ssa"},
     { 0x0c03, "USB controller", "usb"},
-- 
2.34.1


