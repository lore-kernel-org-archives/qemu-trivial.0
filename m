Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SgQAp-0005Dl-RX
	for mharc-qemu-trivial@gnu.org; Sun, 17 Jun 2012 20:50:31 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1SgQAn-00054p-14
	for qemu-trivial@nongnu.org; Sun, 17 Jun 2012 20:50:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1SgQAj-00029y-Gf
	for qemu-trivial@nongnu.org; Sun, 17 Jun 2012 20:50:28 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:50472)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1SgQAj-00029k-AS
	for qemu-trivial@nongnu.org; Sun, 17 Jun 2012 20:50:25 -0400
Received: by pbbro12 with SMTP id ro12so8002564pbb.4
	for <qemu-trivial@nongnu.org>; Sun, 17 Jun 2012 17:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=N71Rskw3leHruZ+wF5kEhcLyBdFgLfGfsh5xVI4qnj0=;
	b=j8cxGxi61O8/LomKcyl+4AnrOorB2rphGANd7GyofvH/ApF87NnxbvXFM4MBAT3j0H
	UFtxPuEvMrDwdUe4f164/OtKYle32LVYrvMr9b95Lb68RrnmmBUJCLjPojYY5zgotvfA
	4WqDSTu2LU1/M79Fa/62rptFNpCin2doQX0QIwTTrqRmi1e1j2HjnvIMZUVkEFBrKSMl
	sxowqMedMv3tfiVKlf0mccbWedubrnKJrGib7UGReQ3bzpmoLEKaPu1cIx/DLbdKcsa5
	rYuM4JVArTOqJie6VeDJNMIWPQwDCrDekjbSAYZQyczSeCDP7no1KLk3CsjuVbCV2Sue
	KFgQ==
Received: by 10.68.200.102 with SMTP id jr6mr46377569pbc.0.1339980622661;
	Sun, 17 Jun 2012 17:50:22 -0700 (PDT)
Received: from localhost ([124.148.20.9])
	by mx.google.com with ESMTPS id og4sm21855001pbb.48.2012.06.17.17.50.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 17 Jun 2012 17:50:21 -0700 (PDT)
From: "Peter A. G. Crosthwaite" <peter.crosthwaite@petalogix.com>
To: edgar.iglesias@gmail.com,
	qemu-devel@nongnu.org
Date: Mon, 18 Jun 2012 11:00:18 +1000
Message-Id: <1339981218-25247-1-git-send-email-peter.crosthwaite@petalogix.com>
X-Mailer: git-send-email 1.7.3.2
X-Gm-Message-State: ALoCoQkdL8kwaJZD3vX30zsvYTVpICvtbc4QTOpaeKafssbgrMOZsS+ARxDZdjEi1YhmYVDXi/ry
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: peter.crosthwaite@petalogix.com, peter.maydell@linaro.org,
	qemu-trivial@nongnu.org, john.williams@petalogix.com
Subject: [Qemu-trivial] [PATCH] arm_gic: Send dbg msgs to stderr not stdout
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jun 2012 00:50:30 -0000

Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com>
---
 hw/arm_gic.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/arm_gic.c b/hw/arm_gic.c
index 72298b4..c78d58e 100644
--- a/hw/arm_gic.c
+++ b/hw/arm_gic.c
@@ -35,7 +35,7 @@
 
 #ifdef DEBUG_GIC
 #define DPRINTF(fmt, ...) \
-do { printf("arm_gic: " fmt , ## __VA_ARGS__); } while (0)
+do { fprintf(stderr, "arm_gic: " fmt , ## __VA_ARGS__); } while (0)
 #else
 #define DPRINTF(fmt, ...) do {} while(0)
 #endif
-- 
1.7.3.2


