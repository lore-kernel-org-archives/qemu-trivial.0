Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sSfkK-0000Ep-VH
	for mharc-qemu-trivial@gnu.org; Sat, 13 Jul 2024 12:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@samjakob.com>) id 1sSfEE-00006A-OP
 for qemu-trivial@nongnu.org; Sat, 13 Jul 2024 12:04:08 -0400
Received: from qs51p00im-qukt01071502.me.com ([17.57.155.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@samjakob.com>) id 1sSfEB-00063M-S0
 for qemu-trivial@nongnu.org; Sat, 13 Jul 2024 12:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samjakob.com;
 s=sig1; t=1720886641;
 bh=Pm4YVouzr7AEZLWE6riErvbFYoXYD6jFvtrjxHqNMOI=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=jyWQkUnOVgkRs/Hv25WELvTi3CH+ddNz3ZV2IsiBKUJmYw7eullQcTQ5pGlgEw6EI
 w2kB/nY3xTZoudfeLlu8zgTYzRFrAF4EP45oN6CcrFSOBV/T334M+6ZEmD45LR+1v9
 Ql+PUHE72t95bVIwVZAG3vwuh1frXlOCIbIU3zASWA5T0zvMHKOKHlJN4D6bg+PMLx
 A2KuKJwD2KGHavQGM0ce8vnCmcjOfqQaAcKNN2p8yJDjT8N2Ntjk4PpdKaUIJjG5TU
 lw8spf/AGMs4d2Zgr9Y6N8c7l3pcAmoK26rG4w96SeRLxxspMvHYvxyoFyJaSmK3Nz
 OJ+6BYXDhmAiw==
Received: from localhost.localdomain (qs51p00im-dlb-asmtp-mailmevip.me.com
 [17.57.155.28])
 by qs51p00im-qukt01071502.me.com (Postfix) with ESMTPSA id D49E366803DD;
 Sat, 13 Jul 2024 16:03:58 +0000 (UTC)
From: SamJakob <me@samjakob.com>
To: qemu-trivial@nongnu.org
Cc: SamJakob <me@samjakob.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org (open list:Raspberry Pi),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] hw/display/bcm2835_fb: fix fb_use_offsets condition
Date: Sat, 13 Jul 2024 17:03:53 +0100
Message-ID: <20240713160353.62410-1-me@samjakob.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: InkTY5WYpDk3oIvHETJFkySVMkg9Ba05
X-Proofpoint-ORIG-GUID: InkTY5WYpDk3oIvHETJFkySVMkg9Ba05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_12,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 mlxlogscore=903 mlxscore=0 malwarescore=0 clxscore=1030 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2407130120
Received-SPF: pass client-ip=17.57.155.5; envelope-from=me@samjakob.com;
 helo=qs51p00im-qukt01071502.me.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 13 Jul 2024 12:37:09 -0400
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
X-List-Received-Date: Sat, 13 Jul 2024 16:04:09 -0000

	It is common practice when implementing double-buffering
	on VideoCore to do so by multiplying the height of the
	virtual buffer by the number of virtual screens desired
	(i.e., two - in the case of double-bufferring).

	At present, this won't work in QEMU because the logic in
	fb_use_offsets require that both the virtual width and
	height exceed their physical counterparts.

	This appears to be unintentional/a typo and indeed the
	comment states; "Experimentally, the hardware seems to
	do this only if the viewport size is larger than the
	physical screen". The viewport/virtual size would be
	larger than the physical size if either virtual dimension
	were larger than their physical counterparts and not
	necessarily both.

Signed-off-by: SamJakob <me@samjakob.com>
---
 hw/display/bcm2835_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index e40ed2d2e1..650db3da82 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -145,7 +145,7 @@ static bool fb_use_offsets(BCM2835FBConfig *config)
      * viewport size is larger than the physical screen. (It doesn't
      * prevent the guest setting this silly viewport setting, though...)
      */
-    return config->xres_virtual > config->xres &&
+    return config->xres_virtual > config->xres ||
         config->yres_virtual > config->yres;
 }
 
-- 
2.45.2


