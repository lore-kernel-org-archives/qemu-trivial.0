Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qqXHa-0007fM-7r
	for mharc-qemu-trivial@gnu.org; Wed, 11 Oct 2023 07:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qqXHY-0007eg-Ou; Wed, 11 Oct 2023 07:21:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qqXHX-0000yh-1q; Wed, 11 Oct 2023 07:21:40 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 9A2EA2967A;
 Wed, 11 Oct 2023 14:21:02 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 07E8E2E700;
 Wed, 11 Oct 2023 14:20:57 +0300 (MSK)
Received: (nullmailer pid 1032046 invoked by uid 1000);
 Wed, 11 Oct 2023 11:20:55 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PULL 10/13] MAINTAINERS: Add some unowned files to the SBSA-REF
 section
Date: Wed, 11 Oct 2023 14:20:51 +0300
Message-Id: <20231011112054.1031975-11-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011112054.1031975-1-mjt@tls.msk.ru>
References: <20231011112054.1031975-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 11 Oct 2023 11:21:41 -0000

From: Thomas Huth <thuth@redhat.com>

These files belong to the sbsa-ref machine and thus should
be listed here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b217080fee..0bab360c12 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -945,6 +945,9 @@ R: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/sbsa-ref.c
+F: hw/misc/sbsa_ec.c
+F: hw/watchdog/sbsa_gwdt.c
+F: include/hw/watchdog/sbsa_gwdt.h
 F: docs/system/arm/sbsa.rst
 F: tests/avocado/machine_aarch64_sbsaref.py
 
-- 
2.39.2


