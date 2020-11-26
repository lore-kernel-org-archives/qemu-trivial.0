Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kiFNQ-0004fR-DJ
	for mharc-qemu-trivial@gnu.org; Thu, 26 Nov 2020 06:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kiFNJ-0004WS-9D; Thu, 26 Nov 2020 06:23:45 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kiFNF-0003sm-Qj; Thu, 26 Nov 2020 06:23:44 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Chb3R4d0Fzhhfx;
 Thu, 26 Nov 2020 19:23:15 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Thu, 26 Nov 2020
 19:23:25 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <peter.maydell@linaro.org>, <jcd@tribudubois.net>,
 <peter.chubb@nicta.com.au>
CC: <alex.chen@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-trivial@nongnu.org>, <zhang.zhanghailiang@huawei.com>,
 <qemu-arm@nongnu.org>
Subject: [PATCH 4/5] i.MX6ul: Fix bad printf format specifiers
Date: Thu, 26 Nov 2020 11:11:08 +0000
Message-ID: <20201126111109.112238-5-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20201126111109.112238-1-alex.chen@huawei.com>
References: <20201126111109.112238-1-alex.chen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Nov 2020 11:23:45 -0000

We should use printf format specifier "%u" instead of "%d" for
argument of type "unsigned int".

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 hw/misc/imx6ul_ccm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/imx6ul_ccm.c b/hw/misc/imx6ul_ccm.c
index 5e0661dacf..a65d031455 100644
--- a/hw/misc/imx6ul_ccm.c
+++ b/hw/misc/imx6ul_ccm.c
@@ -143,7 +143,7 @@ static const char *imx6ul_ccm_reg_name(uint32_t reg)
     case CCM_CMEOR:
         return "CMEOR";
     default:
-        sprintf(unknown, "%d ?", reg);
+        sprintf(unknown, "%u ?", reg);
         return unknown;
     }
 }
@@ -274,7 +274,7 @@ static const char *imx6ul_analog_reg_name(uint32_t reg)
     case USB_ANALOG_DIGPROG:
         return "USB_ANALOG_DIGPROG";
     default:
-        sprintf(unknown, "%d ?", reg);
+        sprintf(unknown, "%u ?", reg);
         return unknown;
     }
 }
-- 
2.19.1


