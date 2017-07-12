Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVHqV-0000BW-Do
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jul 2017 09:38:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVHqP-0008WP-M2
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:38:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVHqO-0005Oq-LT
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:38:21 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38811)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dVHqJ-0005Jo-6m; Wed, 12 Jul 2017 09:38:15 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7E91F40F65;
	Wed, 12 Jul 2017 16:38:13 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 06F09ACF;
	Wed, 12 Jul 2017 16:38:13 +0300 (MSK)
Received: (nullmailer pid 29042 invoked by uid 1000);
	Wed, 12 Jul 2017 13:38:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 12 Jul 2017 16:38:02 +0300
Message-Id: <e189091fba4481fa4c9d760f0bf9037620a51989.1499866676.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
References: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
References: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 06/13] configure: Handle having no c++
 compiler in FORTIFY_SOURCE check
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
X-List-Received-Date: Wed, 12 Jul 2017 13:38:23 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Our FORTIFY_SOURCE check assumes that $cxx refers to a working C++
compiler, with the result that if you don't happen to have one
then configure will spuriously print
  configure: line 4685: c++: command not found

Fix this by adding a 'has $cxx' check.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index ce7e8aa842..08ef54103e 100755
--- a/configure
+++ b/configure
@@ -4771,7 +4771,7 @@ fi
 if test "$fortify_source" !=3D "no"; then
   if echo | $cc -dM -E - | grep __clang__ > /dev/null 2>&1 ; then
     fortify_source=3D"no";
-  elif test -n "$cxx" &&
+  elif test -n "$cxx" && has $cxx &&
        echo | $cxx -dM -E - | grep __clang__ >/dev/null 2>&1 ; then
     fortify_source=3D"no";
   else
--=20
2.11.0


