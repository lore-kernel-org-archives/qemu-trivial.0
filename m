Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rHg2q-0007mw-9A
	for mharc-qemu-trivial@gnu.org; Mon, 25 Dec 2023 03:10:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1rHg2V-0007iC-RJ; Mon, 25 Dec 2023 03:10:21 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1rHg2T-0008KE-0F; Mon, 25 Dec 2023 03:10:18 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 644D53E967;
 Mon, 25 Dec 2023 11:10:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 227A95300E;
 Mon, 25 Dec 2023 11:10:08 +0300 (MSK)
Received: (nullmailer pid 78180 invoked by uid 1000);
 Mon, 25 Dec 2023 08:10:07 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PULL 3/7] qemu-options: Tell more for -display cocoa
Date: Mon, 25 Dec 2023 11:10:03 +0300
Message-Id: <20231225081007.78141-4-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231225081007.78141-1-mjt@tls.msk.ru>
References: <20231225081007.78141-1-mjt@tls.msk.ru>
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
X-List-Received-Date: Mon, 25 Dec 2023 08:10:25 -0000

From: Akihiko Odaki <akihiko.odaki@daynix.com>

Some options for -display cocoa were not described or not listed at all.

Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index ef49b856d6..b66570ae00 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2088,6 +2088,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #if defined(CONFIG_COCOA)
     "-display cocoa[,full-grab=on|off][,swap-opt-cmd=on|off]\n"
     "              [,show-cursor=on|off][,left-command-key=on|off]\n"
+    "              [,full-screen=on|off][,zoom-to-fit=on|off]\n"
 #endif
 #if defined(CONFIG_OPENGL)
     "-display egl-headless[,rendernode=<file>]\n"
@@ -2189,10 +2190,26 @@ SRST
         provides drop-down menus and other UI elements to configure and
         control the VM during runtime. Valid parameters are:
 
+        ``full-grab=on|off`` : Capture all key presses, including system combos.
+                               This requires accessibility permissions, since it
+                               performs a global grab on key events.
+                               (default: off) See
+                               https://support.apple.com/en-in/guide/mac-help/mh32356/mac
+
+        ``swap-opt-cmd=on|off`` : Swap the Option and Command keys so that their
+                                  key codes match their position on non-Mac
+                                  keyboards and you can use Meta/Super and Alt
+                                  where you expect them.  (default: off)
+
         ``show-cursor=on|off`` :  Force showing the mouse cursor
 
         ``left-command-key=on|off`` : Disable forwarding left command key to host
 
+        ``full-screen=on|off`` : Start in fullscreen mode
+
+        ``zoom-to-fit=on|off`` : Expand video output to the window size,
+                                 defaults to "off"
+
     ``egl-headless[,rendernode=<file>]``
         Offload all OpenGL operations to a local DRI device. For any
         graphical display, this display needs to be paired with either
-- 
2.39.2


