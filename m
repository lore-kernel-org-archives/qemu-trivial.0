Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSEBn-0005Xr-9k
	for mharc-qemu-trivial@gnu.org; Tue, 13 Oct 2020 02:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kSEBk-0005Pr-BF; Tue, 13 Oct 2020 02:53:36 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:43801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kSEBi-0000HR-I9; Tue, 13 Oct 2020 02:53:35 -0400
Received: from localhost.localdomain ([82.252.141.186]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MGQaz-1kgI8j1NrJ-00GtwU; Tue, 13 Oct 2020 08:53:28 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 14/15] mingw: fix error __USE_MINGW_ANSI_STDIO redefined
Date: Tue, 13 Oct 2020 08:53:12 +0200
Message-Id: <20201013065313.7349-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201013065313.7349-1-laurent@vivier.eu>
References: <20201013065313.7349-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qzo84/2lmQn6OL4sID/axj/WrK8k0CgmFxkj11HNlVd/WV6Z97G
 IU8OECXwAgvVxYyXMXKf0yihtzmUEpjUVysmy3mDJl5KfiwnGvnD6fdqP8hsdyCsj8bxnKS
 L/6f8bBSApOAe0/sPfHKGGV8QIyCl5iaNMOQIdAomFEq6QlO0aPlzsf8cbUtal0SDDa+OJy
 tdnfYFJ2k7vG2SUKuEM6Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:puqV8szmgMI=:dxfQStnfgMCR7NT7HfPQ2Y
 xc8JbUS55M7SGzbeK+ZazLtavqV5CYsfYKGvToiSnfw60PpPDOzxAevtZAj5jjW0aJMcOX6H0
 bQm0Pos7lwvHKtjlTcfAlD4tZHc3IQ1XQ5wS+mV4eql0KhrmzpaAZL3sA+o1annS51hLEwxPI
 0KsgvccKQ7/NCtBIP1QAjQkZqKOqFOMBF5AgtEXMA+2Af8JyQwhzmt3N9AHGBZjyXo66+0mFY
 8Rx4nuXsReFz53Y7W3Cxl9PXCyaa/PaFQDVwHuuNZYEkTBtPRai5/DJR+E3UiyM8PJUjdufEV
 7l3VNczvyDgkYNaXNEL8ddYvuyAF6CwuW7u2KG+RE//qsdSVK6DS4lLPf1qaBhbREh/G7zqst
 ctbiYfU7Dz3lV2o5AslF1E7wc4RBZD73o/exWh1BxpsOTvfC4MgxLKYec192RPSoPwRGcsMXk
 Lpdvgur5lOW1v0ScZZvohNqWSRa/iHvbjxJpsI3+dHvyVKt5t5rQN+RnUgWcvTFGZhp8UQKxi
 8wVHc4Ug07XxJPlgly5Pmj3T0Okhbadgeg7m/OcU2BpbpB7ErKwG47NqDmtlbhU6Ph5oOik32
 6ImW9/YbLry/7bf+Gbl5X4FiRHs6Egqfa2ahPWb/BSfOZ8Al/w1f5JuhcpZAh2JGDVI1QJrKX
 6+YYn9z1/Imsy/D/oux0pIu7SkbsTP9U7JN56rOSJZIJ/BTakQQWx10KQseeySEjXX8GwtT2K
 Ogu0jzG6if3s8ChgCVf6fzU3UOSHS5/fUp0aEQGIzI9tvcm0JqQHQO5SSAI4vOpQ2XSiDX6Mw
 sTLHIwst9ohN6xzo3A++3feIRUNQ2Du+jA4HjEaxOod8XxrNbw1Hb/5xHsowheMyt2VQqIZ
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 02:53:22
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 13 Oct 2020 06:53:36 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Always put osdep.h first, and remove redundant stdlib.h include.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201008165953.884599-1-marcandre.lureau@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 migration/dirtyrate.c | 3 ++-
 tests/test-bitmap.c   | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 68577ef25028..47f761e67acb 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -10,8 +10,9 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <zlib.h>
 #include "qemu/osdep.h"
+
+#include <zlib.h>
 #include "qapi/error.h"
 #include "cpu.h"
 #include "qemu/config-file.h"
diff --git a/tests/test-bitmap.c b/tests/test-bitmap.c
index 2f5b71458a3d..8db4f67883fe 100644
--- a/tests/test-bitmap.c
+++ b/tests/test-bitmap.c
@@ -8,7 +8,6 @@
  * Author: Peter Xu <peterx@redhat.com>
  */
 
-#include <stdlib.h>
 #include "qemu/osdep.h"
 #include "qemu/bitmap.h"
 
-- 
2.26.2


