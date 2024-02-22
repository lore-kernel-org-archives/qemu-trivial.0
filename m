Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rd7E4-0008BH-DZ
	for mharc-qemu-trivial@gnu.org; Thu, 22 Feb 2024 06:26:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1rd7Do-00086N-Vh; Thu, 22 Feb 2024 06:26:37 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1rd7Dm-00050z-Sq; Thu, 22 Feb 2024 06:26:36 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id E5EB54FB4B;
 Thu, 22 Feb 2024 14:26:25 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 6C5A487177;
 Thu, 22 Feb 2024 14:26:02 +0300 (MSK)
Received: (nullmailer pid 2526167 invoked by uid 1000);
 Thu, 22 Feb 2024 11:26:01 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PULL 09/34] hw/i386/port92: Add missing 'hw/isa/isa.h' header
Date: Thu, 22 Feb 2024 14:25:36 +0300
Message-Id: <20240222112601.2526057-10-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240222112601.2526057-1-mjt@tls.msk.ru>
References: <20240222112601.2526057-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 22 Feb 2024 11:26:49 -0000

From: Philippe Mathieu-Daudé <philmd@linaro.org>

TYPE_PORT92 inherits TYPE_ISA_DEVICE, so need to include
"hw/isa/isa.h" to get its declarations (currently we
indirectly include this header via "hw/i386/pc.h").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Luc Michel <luc.michel@amd.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/port92.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/port92.c b/hw/i386/port92.c
index 1070bfbf36..b25157f6e4 100644
--- a/hw/i386/port92.c
+++ b/hw/i386/port92.c
@@ -10,6 +10,7 @@
 #include "sysemu/runstate.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
+#include "hw/isa/isa.h"
 #include "hw/i386/pc.h"
 #include "trace.h"
 #include "qom/object.h"
-- 
2.39.2


