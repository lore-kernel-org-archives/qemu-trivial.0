Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1moXHR-0001m2-8Z
	for mharc-qemu-trivial@gnu.org; Sat, 20 Nov 2021 15:48:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1moVNv-0004vS-8O; Sat, 20 Nov 2021 13:46:47 -0500
Received: from vps-vb.mhejs.net ([37.28.154.113]:44656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1moVNt-0004D2-7f; Sat, 20 Nov 2021 13:46:46 -0500
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1moVNg-0001xn-Ib; Sat, 20 Nov 2021 19:46:32 +0100
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jon Doron <arilou@gmail.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Denis V . Lunev" <den@openvz.org>,
 Roman Kagan <rvkagan@yandex-team.ru>, qemu-trivial@nongnu.org
Subject: [PATCH] MAINTAINERS: Add myself as a reviewer for Hyper-V VMBus
Date: Sat, 20 Nov 2021 19:46:27 +0100
Message-Id: <b145dcf08ae606e9d29e55b2f701a3fe4f16b347.1637433881.git.maciej.szmigiero@oracle.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 20 Nov 2021 15:48:09 -0500
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
X-List-Received-Date: Sat, 20 Nov 2021 18:46:47 -0000

From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>

This way there is at least some contact point for incoming patches.

We'll see whether the code still gets just a random patch a few times
a year or whether it requires a permanent maintainer to take care of it.

Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d3879aa3c12c..7f57e7fda73b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1729,6 +1729,12 @@ F: include/hw/block/fdc.h
 F: tests/qtest/fdc-test.c
 T: git https://gitlab.com/jsnow/qemu.git ide
 
+Hyper-V VMBus
+S: Odd Fixes
+R: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
+F: hw/hyperv/vmbus.c
+F: include/hw/hyperv/vmbus*.h
+
 OMAP
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org

