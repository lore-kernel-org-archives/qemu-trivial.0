Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOlLL-0002Pt-9C
	for mharc-qemu-trivial@gnu.org; Sat, 15 Mar 2014 05:57:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlLD-00026I-Rg
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 05:57:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlL9-0004S5-Hg
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 05:57:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45822)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WOlL0-0004Qq-0h; Sat, 15 Mar 2014 05:57:06 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 75CC441D97;
	Sat, 15 Mar 2014 13:57:04 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 591C6668;
	Sat, 15 Mar 2014 13:57:04 +0400 (MSK)
Received: (nullmailer pid 20015 invoked by uid 1000);
	Sat, 15 Mar 2014 09:57:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Mar 2014 13:56:51 +0400
Message-Id: <1394877419-19949-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1394877419-19949-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1394877419-19949-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [Qemu-trivial] [PULL 05/13] .travis.yml: add IRC notifications for
	build failures
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
X-List-Received-Date: Sat, 15 Mar 2014 09:57:24 -0000

From: Alex Benn=C3=A9e <alex.bennee@linaro.org>

I'm trying to avoid spamming the IRC channel (not overly likely as
builds take a while). So failure will always be reported but if the
build continues to work then the IRC notifications will be quiet.

Note any GitHub based repository with Travis enabled will use this
notification. If it proves to be too spammy we may want to ask users not
to use Travis themselves although this seems sub-optimal.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .travis.yml |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index 0dbf2da..04da973 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -4,6 +4,12 @@ python:
 compiler:
   - gcc
   - clang
+notifications:
+  irc:
+    channels:
+      - "irc.oftc.net#qemu"
+    on_success: change
+    on_failure: always
 env:
   global:
     - TEST_CMD=3D"make check"
--=20
1.7.10.4


