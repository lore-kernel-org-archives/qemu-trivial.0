Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cibfw-0007Dg-0P
	for mharc-qemu-trivial@gnu.org; Tue, 28 Feb 2017 01:54:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cibft-0007A7-4C
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 01:54:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cibfs-0005uY-CL
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 01:54:17 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56570)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cibfo-0005t1-9s; Tue, 28 Feb 2017 01:54:12 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A2A714358B;
	Tue, 28 Feb 2017 09:54:10 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id CA3BD233;
	Tue, 28 Feb 2017 09:45:00 +0300 (MSK)
Received: (nullmailer pid 19637 invoked by uid 1000);
	Tue, 28 Feb 2017 06:44:59 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Vincenzo Maffione <v.maffione@gmail.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 28 Feb 2017 09:44:54 +0300
Message-Id: <79cad2faace2175f2f21dc4f8f40c3b7722cf999.1488264243.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
References: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
References: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 11/14] qemu-options.hx: add missing id=chr0
 chardev argument in vhost-user example
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
X-List-Received-Date: Tue, 28 Feb 2017 06:54:18 -0000

From: Vincenzo Maffione <v.maffione@gmail.com>

In the vhost-user example, a chardev with id chr0 is referenced by the
vhost-user net backend, but the id is not specified in the chardev option.

Signed-off-by: Vincenzo Maffione <v.maffione@gmail.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index bf458f8..faf5cf8 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2146,7 +2146,7 @@ Example:
 @example
 qemu -m 512 -object memory-backend-file,id=mem,size=512M,mem-path=/hugetlbfs,share=on \
      -numa node,memdev=mem \
-     -chardev socket,path=/path/to/socket \
+     -chardev socket,id=chr0,path=/path/to/socket \
      -netdev type=vhost-user,id=net0,chardev=chr0 \
      -device virtio-net-pci,netdev=net0
 @end example
-- 
2.1.4


