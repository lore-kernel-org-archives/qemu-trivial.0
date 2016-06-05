Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9V2E-0007lz-PR
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 06:11:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9V28-0007fQ-Eo
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 06:11:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9V26-0003IT-Ev
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 06:11:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52566)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9V1n-0003Dg-Os; Sun, 05 Jun 2016 06:11:31 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2A4F340919;
	Sun,  5 Jun 2016 13:11:28 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 9E5FDB05;
	Sun,  5 Jun 2016 10:43:38 +0300 (MSK)
Received: (nullmailer pid 1157 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:10 +0300
Message-Id: <da29e171b17e37f38eb3d3f16eb5d2fa40f31811.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 33/52] host-utils: Prefer 'false' for bool type
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
X-List-Received-Date: Sun, 05 Jun 2016 10:11:57 -0000

From: Eric Blake <eblake@redhat.com>

Mixing '0' and 'bool' looks stupid.

Signed-off-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu/host-utils.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index 1cdae0d..3de7d4e 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -486,7 +486,7 @@ static inline uint64_t revbit64(uint64_t x)
 static inline bool is_power_of_2(uint64_t value)
 {
     if (!value) {
-        return 0;
+        return false;
     }
 
     return !(value & (value - 1));
-- 
2.1.4


