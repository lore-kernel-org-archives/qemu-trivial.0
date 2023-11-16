Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r3X3a-0005lx-FX
	for mharc-qemu-trivial@gnu.org; Thu, 16 Nov 2023 02:44:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1r3X3Y-0005lV-V9; Thu, 16 Nov 2023 02:44:56 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1r3X3X-0004qV-7M; Thu, 16 Nov 2023 02:44:56 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 0DE3233BDC;
 Thu, 16 Nov 2023 10:45:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 98C3135842;
 Thu, 16 Nov 2023 10:44:41 +0300 (MSK)
Received: (nullmailer pid 3202496 invoked by uid 1000);
 Thu, 16 Nov 2023 07:44:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PULL 03/27] tests/data/qobject/qdict.txt: Avoid non-inclusive words
Date: Thu, 16 Nov 2023 10:44:17 +0300
Message-Id: <20231116074441.3202417-4-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231116074441.3202417-1-mjt@tls.msk.ru>
References: <20231116074441.3202417-1-mjt@tls.msk.ru>
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 16 Nov 2023 07:44:57 -0000

From: Thomas Huth <thuth@redhat.com>

qdict.txt only consists of more or less random test data. We
can simply drop the lines with the problematic words here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/data/qobject/qdict.txt | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/data/qobject/qdict.txt b/tests/data/qobject/qdict.txt
index 122fda4524..e2edc88161 100644
--- a/tests/data/qobject/qdict.txt
+++ b/tests/data/qobject/qdict.txt
@@ -1866,10 +1866,6 @@ blackfin: 4096
 blackfin.c: 7552
 blackfin.h: 1089
 blackfin_sram.h: 1207
-blacklist.c: 8658
-blacklist.h: 108
-blackstamp.c: 9838
-BlackStamp_defconfig: 27434
 blinken.h: 617
 blizzard.c: 41338
 blizzard.h: 249
-- 
2.39.2


