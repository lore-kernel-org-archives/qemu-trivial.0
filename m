Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQgk6-0004tf-Ma
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 16:45:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQgk1-0004n5-78
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 16:45:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQgk0-0006GN-Ig
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 16:45:01 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:38659)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eQgjv-0006Ck-UT; Sun, 17 Dec 2017 16:44:56 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 43BFF41172;
	Mon, 18 Dec 2017 00:44:55 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id A867DCD1;
	Mon, 18 Dec 2017 00:25:46 +0300 (MSK)
Received: (nullmailer pid 30899 invoked by uid 1000);
	Sun, 17 Dec 2017 21:28:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 18 Dec 2017 00:27:13 +0300
Message-Id: <443a26d223b2451de74bbc10947c880af4c72cec.1513545944.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 08/61] .gitignore: remove vscclient
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
X-List-Received-Date: Sun, 17 Dec 2017 21:45:02 -0000

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

It was removed with libcacard, since:

commit 7b02f5447c64d1854468f758398c9f6fe9e5721f
Author: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Date:   Sun Aug 30 11:48:40 2015 +0200

    libcacard: use the standalone project

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .gitignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index 588769b250..433f64f429 100644
--- a/.gitignore
+++ b/.gitignore
@@ -53,7 +53,6 @@
 /qemu-version.h.tmp
 /module_block.h
 /scsi/qemu-pr-helper
-/vscclient
 /vhost-user-scsi
 /fsdev/virtfs-proxy-helper
 *.tmp
--=20
2.11.0


