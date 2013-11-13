Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VgaE3-00025V-Td
	for mharc-qemu-trivial@gnu.org; Wed, 13 Nov 2013 08:11:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgaDx-0001ri-1f
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:11:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgaDs-0001mW-6I
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:11:12 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48600)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VgaDf-0001jq-Ee; Wed, 13 Nov 2013 08:10:55 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C940541706;
	Wed, 13 Nov 2013 17:10:52 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id DC6DA52D;
	Wed, 13 Nov 2013 17:01:25 +0400 (MSK)
Received: (nullmailer pid 16045 invoked by uid 1000);
	Wed, 13 Nov 2013 13:01:24 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Wed, 13 Nov 2013 17:01:11 +0400
Message-Id: <1384347680-15976-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 07/16] qapi: Fix comment for create-type to
	match code.
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
X-List-Received-Date: Wed, 13 Nov 2013 13:11:18 -0000

From: Fam Zheng <famz@redhat.com>

Signed-off-by: Fam Zheng <famz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qapi-schema.json |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index 81a375b..76c98a7 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -227,7 +227,7 @@
 ##
 # @ImageInfoSpecificVmdk:
 #
-# @create_type: The create type of VMDK image
+# @create-type: The create type of VMDK image
 #
 # @cid: Content id of image
 #
-- 
1.7.10.4


