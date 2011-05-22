Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QO7N9-0001J9-IP
	for mharc-qemu-trivial@gnu.org; Sun, 22 May 2011 08:03:03 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QO7N2-0001IK-6K
	for qemu-trivial@nongnu.org; Sun, 22 May 2011 08:03:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QO7N1-0002zo-52
	for qemu-trivial@nongnu.org; Sun, 22 May 2011 08:02:56 -0400
Received: from moutng.kundenserver.de ([212.227.17.10]:55039)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QO7N0-0002zE-Nc; Sun, 22 May 2011 08:02:55 -0400
Received: from flocke.weilnetz.de (p5086EED0.dip.t-dialin.net [80.134.238.208])
	by mrelayeu.kundenserver.de (node=mrbap3) with ESMTP (Nemesis)
	id 0Lwqoy-1PZFrm3ysC-016N7l; Sun, 22 May 2011 14:02:43 +0200
Received: from stefan by flocke.weilnetz.de with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QO7Mo-0001Bp-4e; Sun, 22 May 2011 14:02:42 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Sun, 22 May 2011 14:02:40 +0200
Message-Id: <1306065760-4541-2-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1306065760-4541-1-git-send-email-weil@mail.berlios.de>
References: <1306065760-4541-1-git-send-email-weil@mail.berlios.de>
X-Provags-ID: V02:K0:EF+wlUghMj1aM8AfJcml8yB3UN+q3WGPVOycLubtalO
	6aDenCWnF1ih1xfZsbZOjFikUhoUN8K+QUGMwqkf07g3dZTGmk
	OuVVWKqB313bGVlyS/WW7f4UVzvMdAgMaQUtcQVQcvHMtdCe3o
	Axr379A6VwKzE/3V4hRskLCJJ/mqSQzZv5pgh1wg6Kuo1hfx6G
	5eYAuGw7UiP0RwFVSAfZCHXnlell8db8WuUy33snLx/tU3l116 6r5dm5ec7cw4A
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.17.10
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH 2/2] Fix spelling in comment (additon ->
	addition)
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
X-List-Received-Date: Sun, 22 May 2011 12:03:02 -0000

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 tcg/tcg.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/tcg/tcg.h b/tcg/tcg.h
index cecef63..183a446 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -129,7 +129,7 @@ typedef tcg_target_ulong TCGArg;
    We use plain int by default to avoid this runtime overhead.
    Users of tcg_gen_* don't need to know about any of this, and should
    treat TCGv as an opaque type.
-   In additon we do typechecking for different types of variables.  TCGv_i32
+   In addition we do typechecking for different types of variables.  TCGv_i32
    and TCGv_i64 are 32/64-bit variables respectively.  TCGv and TCGv_ptr
    are aliases for target_ulong and host pointer sized values respectively.
  */
-- 
1.7.2.5


