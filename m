Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aY8aT-0008Ds-NP
	for mharc-qemu-trivial@gnu.org; Tue, 23 Feb 2016 03:44:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1aY8aR-0008AX-Af
	for qemu-trivial@nongnu.org; Tue, 23 Feb 2016 03:44:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1aY8aQ-0007CJ-AV
	for qemu-trivial@nongnu.org; Tue, 23 Feb 2016 03:44:51 -0500
Received: from smtp3.mundo-r.com ([212.51.32.191]:26876 helo=smtp4.mundo-r.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>)
	id 1aY8aJ-0007A0-U9; Tue, 23 Feb 2016 03:44:44 -0500
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2CQAgB3GsxW/5tjdVteGQEBAg8BAQEBgwqBP6cGBQEBAQEBAQUBgQ8BkCqCEwENgWYShXuBQjgUAQEBAQEBAWQnhS8ST040iB8Bu1OFSoh8gQeDbgWXB41egVyNEwKFcohXHgEBQoE2AYIvaIg5AQEB
X-IPAS-Result: A2CQAgB3GsxW/5tjdVteGQEBAg8BAQEBgwqBP6cGBQEBAQEBAQUBgQ8BkCqCEwENgWYShXuBQjgUAQEBAQEBAWQnhS8ST040iB8Bu1OFSoh8gQeDbgWXB41egVyNEwKFcohXHgEBQoE2AYIvaIg5AQEB
X-IronPort-AV: E=Sophos;i="5.22,488,1449529200"; d="scan'208";a="88301938"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 23 Feb 2016 09:44:41 +0100
Received: from dsl-hkibrasgw4-50df50-201.dhcp.inet.fi ([80.223.80.201]
	helo=perseus.local) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1aY8aH-0002gt-5Z; Tue, 23 Feb 2016 09:44:41 +0100
Received: from berto by perseus.local with local (Exim 4.86)
	(envelope-from <berto@igalia.com>)
	id 1aY8a3-0001Qo-OL; Tue, 23 Feb 2016 10:44:27 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Feb 2016 10:44:25 +0200
Message-Id: <1456217065-5465-1-git-send-email-berto@igalia.com>
X-Mailer: git-send-email 2.7.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.51.32.191
Cc: qemu-trivial@nongnu.org, Alberto Garcia <berto@igalia.com>
Subject: [Qemu-trivial] [PATCH] ipack: Update e-mail address
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
X-List-Received-Date: Tue, 23 Feb 2016 08:44:52 -0000

I'm not really using the old one anymore.

Signed-off-by: Alberto Garcia <berto@igalia.com>
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
index 7c5c30d..4967351 100644
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
2.7.0


