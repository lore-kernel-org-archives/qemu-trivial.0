Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZuhYd-0007mi-6D
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 08:59:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZuhYb-0007jc-1q
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 08:59:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZuhYW-0005Fl-37
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 08:59:56 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:54034)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZuhYL-0005Bf-Mi; Fri, 06 Nov 2015 08:59:41 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2D5D440DE3;
	Fri,  6 Nov 2015 16:59:39 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id EBB3FAC3;
	Fri,  6 Nov 2015 15:44:04 +0300 (MSK)
Received: (nullmailer pid 31680 invoked by uid 1000);
	Fri, 06 Nov 2015 12:44:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 15:43:41 +0300
Message-Id: <53d47be25a0c8bde5aa5b53625bc810f91c6271f.1446813769.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Eric Blake <eblake@redhat.com>
Subject: [Qemu-trivial] [PULL 04/24] maint: Ignore ivshmem binaries
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
X-List-Received-Date: Fri, 06 Nov 2015 13:59:58 -0000

From: Eric Blake <eblake@redhat.com>

Commit a75eb03b added ivshmem-client and ivshmem-server binaries,
but did not mark them for exclusion in .gitignore.

Signed-off-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitignore b/.gitignore
index 75bceb9..88a80ff 100644
--- a/.gitignore
+++ b/.gitignore
@@ -24,6 +24,8 @@
 /*-darwin-user
 /*-linux-user
 /*-bsd-user
+/ivshmem-client
+/ivshmem-server
 /libdis*
 /libuser
 /linux-headers/asm
-- 
2.1.4


