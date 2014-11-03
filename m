Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlH4I-0005eR-ED
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 07:49:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52415)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XlH4C-0005Q7-0U
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 07:49:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XlH47-0001Be-TK
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 07:49:03 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:7511)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XlH47-0001AP-3R; Mon, 03 Nov 2014 07:48:59 -0500
Received: from 172.24.2.119 (EHLO szxeml405-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CBU27344; Mon, 03 Nov 2014 20:48:54 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml405-hub.china.huawei.com
	(10.82.67.60) with Microsoft SMTP Server id 14.3.158.1; Mon, 3 Nov 2014
	20:48:46 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 3 Nov 2014 20:48:30 +0800
Message-ID: <1415018910-11600-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH] qemu-doc.texi: fix typos for x509 examples
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
X-List-Received-Date: Mon, 03 Nov 2014 12:49:08 -0000

From: Gonglei <arei.gonglei@huawei.com>

Fix typos made people confuesd:
1)
$ certtool --generate-certificate \
           --load-ca-certificate ca-cert.pem \
           --load-ca-privkey ca-key.pem \
           --load-privkey server server-key.pem \
           --template server.info \
           --outfile server-cert.pem
Too many arguments
Try `certtool --help' for more information.
2)
$ certtool --generate-certificate \
           --load-ca-certificate ca-cert.pem \
           --load-ca-privkey ca-key.pem \
           --load-privkey client-key.pem \
           --template client.info \
           --outfile client-cert.pem
error parsing command line: client.info: unknown option 'organiazation'
at position 67 in config file

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 qemu-doc.texi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 9973090..ad418f8 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -1631,7 +1631,7 @@ EOF
 # certtool --generate-certificate \
            --load-ca-certificate ca-cert.pem \
            --load-ca-privkey ca-key.pem \
-           --load-privkey server server-key.pem \
+           --load-privkey server-key.pem \
            --template server.info \
            --outfile server-cert.pem
 @end example
@@ -1654,7 +1654,7 @@ the secure CA private key:
 country = GB
 state = London
 locality = London
-organiazation = Name of your organization
+organization = Name of your organization
 cn = client.foo.example.com
 tls_www_client
 encryption_key
-- 
1.7.12.4



