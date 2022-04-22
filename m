Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhovn-0003Ys-25
	for mharc-qemu-trivial@gnu.org; Fri, 22 Apr 2022 04:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1nhovh-0003SW-J1; Fri, 22 Apr 2022 04:46:20 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:51208
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1nhove-0007Zt-FI; Fri, 22 Apr 2022 04:46:17 -0400
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id A2C26DA0C54;
 Fri, 22 Apr 2022 10:46:12 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 9CBB6462074; Fri, 22 Apr 2022 10:46:12 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>
Subject: [PATCH] nsis: Add missing tools to installer for Windows
Date: Fri, 22 Apr 2022 10:46:11 +0200
Message-Id: <20220422084611.1083806-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 22 Apr 2022 08:46:21 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 qemu.nsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/qemu.nsi b/qemu.nsi
index 564d617d11..f56a18901c 100644
--- a/qemu.nsi
+++ b/qemu.nsi
@@ -142,8 +142,12 @@ SectionEnd
 
 Section "Tools" SectionTools
     SetOutPath "$INSTDIR"
+    File "${BINDIR}\qemu-edid.exe"
+    File "${BINDIR}\qemu-ga.exe"
     File "${BINDIR}\qemu-img.exe"
     File "${BINDIR}\qemu-io.exe"
+    File "${BINDIR}\qemu-nbd.exe"
+    File "${BINDIR}\qemu-storage-daemon.exe"
 SectionEnd
 
 SectionGroup "System Emulations" SectionSystem
@@ -209,10 +213,7 @@ Section "Uninstall"
     Delete "$INSTDIR\*.ndrv"
     Delete "$INSTDIR\*.rom"
     Delete "$INSTDIR\openbios-*"
-    Delete "$INSTDIR\qemu-img.exe"
-    Delete "$INSTDIR\qemu-io.exe"
-    Delete "$INSTDIR\qemu.exe"
-    Delete "$INSTDIR\qemu-system-*.exe"
+    Delete "$INSTDIR\qemu-*.exe"
     RMDir /r "$INSTDIR\doc"
     RMDir /r "$INSTDIR\share"
     ; Remove generated files
-- 
2.30.2


