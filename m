Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XoCie-0002c1-GB
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 09:46:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCiY-0002PA-0R
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:46:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCiT-00081X-Uv
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:46:49 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:32986)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XoCiK-0007zE-MT; Tue, 11 Nov 2014 09:46:36 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3DF3D41DF6;
	Tue, 11 Nov 2014 17:46:35 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1DAB2705;
	Tue, 11 Nov 2014 17:46:35 +0300 (MSK)
Received: (nullmailer pid 14561 invoked by uid 1000);
	Tue, 11 Nov 2014 14:46:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 11 Nov 2014 17:46:24 +0300
Message-Id: <63c693f8d0182fddc411572916e460144ac71689.1415716845.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
References: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 02/11] qemu-doc.texi: fix typos in x509
	examples
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
X-List-Received-Date: Tue, 11 Nov 2014 14:46:54 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-doc.texi |    4 ++--
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
1.7.10.4


