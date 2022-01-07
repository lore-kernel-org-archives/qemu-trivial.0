Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5rCN-0007mf-2e
	for mharc-qemu-trivial@gnu.org; Fri, 07 Jan 2022 10:30:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1n5rCJ-0007kW-MU; Fri, 07 Jan 2022 10:30:32 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:40684
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1n5rCE-0002kr-Uw; Fri, 07 Jan 2022 10:30:30 -0500
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id B7A7DDA0787;
 Fri,  7 Jan 2022 16:30:21 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id C21D4460019; Fri,  7 Jan 2022 16:30:20 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PATCH] simplebench: Fix Python syntax error (reported by LGTM)
Date: Fri,  7 Jan 2022 16:30:19 +0100
Message-Id: <20220107153019.504124-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
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
X-List-Received-Date: Fri, 07 Jan 2022 15:30:32 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 scripts/simplebench/bench-example.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/simplebench/bench-example.py b/scripts/simplebench/bench-example.py
index 4864435f39..fc370691e0 100644
--- a/scripts/simplebench/bench-example.py
+++ b/scripts/simplebench/bench-example.py
@@ -25,7 +25,7 @@
 
 def bench_func(env, case):
     """ Handle one "cell" of benchmarking table. """
-    return bench_block_copy(env['qemu_binary'], env['cmd'], {}
+    return bench_block_copy(env['qemu_binary'], env['cmd'], {},
                             case['source'], case['target'])
 
 
-- 
2.30.2


