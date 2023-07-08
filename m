Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qI0GG-0006Qp-4B
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jul 2023 01:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qI0G3-0006HQ-K8; Sat, 08 Jul 2023 01:13:23 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qI0G1-0001lR-Um; Sat, 08 Jul 2023 01:13:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 4262812686;
 Sat,  8 Jul 2023 08:13:09 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 6CC0A139D4;
 Sat,  8 Jul 2023 08:13:05 +0300 (MSK)
Received: (nullmailer pid 3229997 invoked by uid 1000);
 Sat, 08 Jul 2023 05:13:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PULL 07/10] qemu-options.hx: Fix indentation of some option
 descriptions
Date: Sat,  8 Jul 2023 08:12:47 +0300
Message-Id: <a635bcfc7a4c8d8589cff3e1cd22487ae561665e.1688793073.git.mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1688793073.git.mjt@tls.msk.ru>
References: <cover.1688793073.git.mjt@tls.msk.ru>
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
X-List-Received-Date: Sat, 08 Jul 2023 05:13:27 -0000

From: Thomas Huth <thuth@redhat.com>

The description of the options starts at column 16, so fix
this in some runaway lines for a more uniform output.

While we're at it, replace the capital "NOTE" with "Note"
since this seems to be the more common capitalization in
qemu-options.hx.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 80bd0252d9..96087505b2 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -652,7 +652,7 @@ DEF("m", HAS_ARG, QEMU_OPTION_m,
     "                size: initial amount of guest memory\n"
     "                slots: number of hotplug slots (default: none)\n"
     "                maxmem: maximum amount of guest memory (default: none)\n"
-    "NOTE: Some architectures might enforce a specific granularity\n",
+    "                Note: Some architectures might enforce a specific granularity\n",
     QEMU_ARCH_ALL)
 SRST
 ``-m [size=]megs[,slots=n,maxmem=size]``
@@ -2217,8 +2217,8 @@ DEF("spice", HAS_ARG, QEMU_OPTION_spice,
     "       [,disable-agent-file-xfer=on|off][,agent-mouse=[on|off]]\n"
     "       [,playback-compression=[on|off]][,seamless-migration=[on|off]]\n"
     "       [,gl=[on|off]][,rendernode=<file>]\n"
-    "   enable spice\n"
-    "   at least one of {port, tls-port} is mandatory\n",
+    "                enable spice\n"
+    "                at least one of {port, tls-port} is mandatory\n",
     QEMU_ARCH_ALL)
 #endif
 SRST
-- 
2.39.2


