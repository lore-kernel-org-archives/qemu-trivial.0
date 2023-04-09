Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1plbMu-0002BI-4V
	for mharc-qemu-trivial@gnu.org; Sun, 09 Apr 2023 16:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1plbMs-0002Ax-I9; Sun, 09 Apr 2023 16:10:30 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1plbMq-0007K0-Rv; Sun, 09 Apr 2023 16:10:30 -0400
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 50326DA0498;
 Sun,  9 Apr 2023 22:10:27 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 207A74668B2; Sun,  9 Apr 2023 22:10:27 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Subject: [PATCH for-8.0] docs: Fix typo (wphx => whpx)
Date: Sun,  9 Apr 2023 22:10:07 +0200
Message-Id: <20230409201007.1157671-1-sw@weilnetz.de>
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
X-List-Received-Date: Sun, 09 Apr 2023 20:10:31 -0000

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1529
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

I suggest to apply the patch for 8.0 because it fixes documentation.

Regards
Stefan W.

 docs/system/introduction.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/introduction.rst b/docs/system/introduction.rst
index c8a9fe6c1d..3e256f8326 100644
--- a/docs/system/introduction.rst
+++ b/docs/system/introduction.rst
@@ -27,7 +27,7 @@ Tiny Code Generator (TCG) capable of emulating many CPUs.
   * - Hypervisor Framework (hvf)
     - MacOS
     - x86 (64 bit only), Arm (64 bit only)
-  * - Windows Hypervisor Platform (wphx)
+  * - Windows Hypervisor Platform (whpx)
     - Windows
     - x86
   * - NetBSD Virtual Machine Monitor (nvmm)
-- 
2.39.2


