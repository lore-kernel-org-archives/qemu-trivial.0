Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Va0En-00027s-4k
	for mharc-qemu-trivial@gnu.org; Sat, 26 Oct 2013 05:32:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Va0Eg-0001uX-Ac
	for qemu-trivial@nongnu.org; Sat, 26 Oct 2013 05:32:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Va0Eb-000866-Eo
	for qemu-trivial@nongnu.org; Sat, 26 Oct 2013 05:32:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57708)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Va0EN-00083t-O5; Sat, 26 Oct 2013 05:32:27 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E7E9243918;
	Sat, 26 Oct 2013 13:32:26 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id C4C8152F;
	Sat, 26 Oct 2013 13:32:26 +0400 (MSK)
Received: (nullmailer pid 19533 invoked by uid 1000);
	Sat, 26 Oct 2013 09:32:26 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Sat, 26 Oct 2013 13:31:24 +0400
Message-Id: <1382779887-15971-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1382779887-15971-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1382779887-15971-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 4/7] qapi: fix documentation example
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
X-List-Received-Date: Sat, 26 Oct 2013 09:32:51 -0000

From: Eric Blake <eblake@redhat.com>

The QMP wire format uses "", not '', around strings.

* docs/qapi-code-gen.txt: Fix typo.

Signed-off-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 docs/qapi-code-gen.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/qapi-code-gen.txt b/docs/qapi-code-gen.txt
index 91f44d0..0728f36 100644
--- a/docs/qapi-code-gen.txt
+++ b/docs/qapi-code-gen.txt
@@ -164,7 +164,7 @@ This example allows using both of the following example objects:
  { "file": "my_existing_block_device_id" }
  { "file": { "driver": "file",
              "readonly": false,
-             'filename': "/tmp/mydisk.qcow2" } }
+             "filename": "/tmp/mydisk.qcow2" } }
 
 
 === Commands ===
-- 
1.7.10.4


