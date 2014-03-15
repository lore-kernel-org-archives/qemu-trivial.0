Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOlLQ-0002eU-EJ
	for mharc-qemu-trivial@gnu.org; Sat, 15 Mar 2014 05:57:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlLK-0002Nt-GO
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 05:57:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlLG-0004TT-5h
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 05:57:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47258)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WOlKz-0004QA-7E; Sat, 15 Mar 2014 05:57:05 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3E21441D95;
	Sat, 15 Mar 2014 13:57:04 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2950D665;
	Sat, 15 Mar 2014 13:57:04 +0400 (MSK)
Received: (nullmailer pid 20010 invoked by uid 1000);
	Sat, 15 Mar 2014 09:57:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Mar 2014 13:56:49 +0400
Message-Id: <1394877419-19949-4-git-send-email-mjt@msgid.tls.msk.ru>
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
Subject: [Qemu-trivial] [PULL 03/13] .travis.yml: re-enable lttng user space
	trace test
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
X-List-Received-Date: Sat, 15 Mar 2014 09:57:31 -0000

From: Alex Benn=C3=A9e <alex.bennee@linaro.org>

This build was disabled while the lttng tracing was broken. Stefan has
recently submitted a pull request with it re-enabled.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .travis.yml |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 286cf62..1d78421 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -69,8 +69,7 @@ matrix:
            EXTRA_CONFIG=3D"--enable-trace-backend=3Dftrace"
            TEST_CMD=3D""
       compiler: gcc
-    # This disabled make check for the ftrace backend which needs more s=
etting up
-    # Currently broken on 12.04 due to mis-packaged liburcu and changed =
API, will be pulled.
-    #- env: TARGETS=3Di386-softmmu,x86_64-softmmu
-    #       EXTRA_PKGS=3D"liblttng-ust-dev liburcu-dev"
-    #       EXTRA_CONFIG=3D"--enable-trace-backend=3Dust"
+    - env: TARGETS=3Di386-softmmu,x86_64-softmmu
+          EXTRA_PKGS=3D"liblttng-ust-dev liburcu-dev"
+          EXTRA_CONFIG=3D"--enable-trace-backend=3Dust"
+      compiler: gcc
--=20
1.7.10.4


