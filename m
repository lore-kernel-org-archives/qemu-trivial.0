Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4fM-0006Gg-8j
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 01:51:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4fF-00065E-Kv
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:51:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4fE-0007os-UP
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:51:17 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:32809)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL4f2-0007kX-Fd; Tue, 10 Feb 2015 01:51:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 44F2D41821;
	Tue, 10 Feb 2015 09:51:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 32EAC93D;
	Tue, 10 Feb 2015 09:34:45 +0300 (MSK)
Received: (nullmailer pid 9392 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:18 +0300
Message-Id: <559782cc94581481cb7748eb17c4790e418bf86e.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Greg Kurz <gkurz@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PULL 29/46] QJSON: fix typo in author's email
	address
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
X-List-Received-Date: Tue, 10 Feb 2015 06:51:18 -0000

From: Greg Kurz <gkurz@linux.vnet.ibm.com>

Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qjson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qjson.c b/qjson.c
index b242222..0cda269 100644
--- a/qjson.c
+++ b/qjson.c
@@ -4,7 +4,7 @@
  * Copyright Alexander Graf
  *
  * Authors:
- *  Alexander Graf <agraf@suse.de
+ *  Alexander Graf <agraf@suse.de>
  *
  * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
  * See the COPYING.LIB file in the top-level directory.
-- 
2.1.4


