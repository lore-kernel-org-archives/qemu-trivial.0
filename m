Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b30FL-0003nT-RV
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 08:06:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30FJ-0003lA-8C
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:06:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b30FE-0000xX-UK
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 08:06:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45915)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b30F5-0000v4-Cc; Wed, 18 May 2016 08:06:23 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2D3FD417A2;
	Wed, 18 May 2016 15:06:11 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 4CBFBADA;
	Wed, 18 May 2016 15:06:10 +0300 (MSK)
Received: (nullmailer pid 12396 invoked by uid 1000);
	Wed, 18 May 2016 12:06:09 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Alberto Garcia <berto@igalia.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 18 May 2016 15:06:03 +0300
Message-Id: <b996aed510219f4178a9169e41da3253b1789a45.1463573089.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
References: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 08/13] ipack: Update e-mail address
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2016 12:06:38 -0000

From: Alberto Garcia <berto@igalia.com>

I'm not really using the old one anymore.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/char/ipoctal232.c     | 2 +-
 hw/ipack/ipack.c         | 2 +-
 hw/ipack/tpci200.c       | 2 +-
 include/hw/ipack/ipack.h | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/char/ipoctal232.c b/hw/char/ipoctal232.c
index bc0ae49..9ead32a 100644
--- a/hw/char/ipoctal232.c
+++ b/hw/char/ipoctal232.c
@@ -2,7 +2,7 @@
  * QEMU GE IP-Octal 232 IndustryPack emulation
  *
  * Copyright (C) 2012 Igalia, S.L.
- * Author: Alberto Garcia <agarcia@igalia.com>
+ * Author: Alberto Garcia <berto@igalia.com>
  *
  * This code is licensed under the GNU GPL v2 or (at your option) any
  * later version.
diff --git a/hw/ipack/ipack.c b/hw/ipack/ipack.c
index 5f99ed9..6021e6d 100644
--- a/hw/ipack/ipack.c
+++ b/hw/ipack/ipack.c
@@ -2,7 +2,7 @@
  * QEMU IndustryPack emulation
  *
  * Copyright (C) 2012 Igalia, S.L.
- * Author: Alberto Garcia <agarcia@igalia.com>
+ * Author: Alberto Garcia <berto@igalia.com>
  *
  * This code is licensed under the GNU GPL v2 or (at your option) any
  * later version.
diff --git a/hw/ipack/tpci200.c b/hw/ipack/tpci200.c
index fdda6f4..4dfa6b3 100644
--- a/hw/ipack/tpci200.c
+++ b/hw/ipack/tpci200.c
@@ -2,7 +2,7 @@
  * QEMU TEWS TPCI200 IndustryPack carrier emulation
  *
  * Copyright (C) 2012 Igalia, S.L.
- * Author: Alberto Garcia <agarcia@igalia.com>
+ * Author: Alberto Garcia <berto@igalia.com>
  *
  * This code is licensed under the GNU GPL v2 or (at your option) any
  * later version.
diff --git a/include/hw/ipack/ipack.h b/include/hw/ipack/ipack.h
index e95ffe8..e33e032 100644
--- a/include/hw/ipack/ipack.h
+++ b/include/hw/ipack/ipack.h
@@ -2,7 +2,7 @@
  * QEMU IndustryPack emulation
  *
  * Copyright (C) 2012 Igalia, S.L.
- * Author: Alberto Garcia <agarcia@igalia.com>
+ * Author: Alberto Garcia <berto@igalia.com>
  *
  * This code is licensed under the GNU GPL v2 or (at your option) any
  * later version.
-- 
2.1.4


