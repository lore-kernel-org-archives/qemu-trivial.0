Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz8Qd-0003HU-CV
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 13:25:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8QX-00035j-Oq
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:25:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8QT-00068d-Au
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:25:25 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:51785)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xz8QJ-00066U-GU; Thu, 11 Dec 2014 13:25:11 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6807D41D46;
	Thu, 11 Dec 2014 21:25:10 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id A19EE8F5;
	Thu, 11 Dec 2014 21:16:18 +0300 (MSK)
Received: (nullmailer pid 22985 invoked by uid 1000);
	Thu, 11 Dec 2014 18:16:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Dec 2014 21:16:03 +0300
Message-Id: <1c854067b31a7764fa346ea74e0f0fa0ae718458.1418321644.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
References: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 15/20] qapi-schema: fix typo about
	change-vnc-password
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
X-List-Received-Date: Thu, 11 Dec 2014 18:25:30 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qapi-schema.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index 9ffdcf8..563b4ad 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -1533,7 +1533,7 @@
 #
 # Change the VNC server password.
 #
-# @target:  the new password to use with VNC authentication
+# @password:  the new password to use with VNC authentication
 #
 # Since: 1.1
 #
-- 
2.1.3


