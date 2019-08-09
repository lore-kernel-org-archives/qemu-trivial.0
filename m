Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hw4AN-0005oK-In
	for mharc-qemu-trivial@gnu.org; Fri, 09 Aug 2019 08:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55127)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rebecca@bsdio.com>) id 1hvwNv-0007NQ-J4
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2019 00:20:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rebecca@bsdio.com>) id 1hvwNu-0007ML-G1
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2019 00:20:11 -0400
Received: from muon.bsdio.com ([65.103.231.193]:63720)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <rebecca@bsdio.com>)
 id 1hvwNs-0007Kb-HX; Fri, 09 Aug 2019 00:20:08 -0400
Received: from muon.bsdio.com (localhost [127.0.0.1])
 by muon.bsdio.com (Postfix) with ESMTP id B3D7681CB1;
 Thu,  8 Aug 2019 22:20:06 -0600 (MDT)
Received: from muon.bsdio.com ([127.0.0.1])
 by muon.bsdio.com (muon.bsdio.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id NrDJ8IcaDSgT; Thu,  8 Aug 2019 22:20:03 -0600 (MDT)
Received: from photon.int.bluestop.org (unknown [10.0.10.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by muon.bsdio.com (Postfix) with ESMTPSA;
 Thu,  8 Aug 2019 22:20:03 -0600 (MDT)
From: Rebecca Cran <rebecca@bsdio.com>
To: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
Cc: Rebecca Cran <rebecca@bsdio.com>
Date: Thu,  8 Aug 2019 22:19:52 -0600
Message-Id: <20190809041952.57302-1-rebecca@bsdio.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 65.103.231.193
X-Mailman-Approved-At: Fri, 09 Aug 2019 08:38:42 -0400
Subject: [Qemu-trivial] [PATCH] Update the avx2 configure test to be
 compatible with clang
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Aug 2019 04:20:12 -0000

clang doesn't support the GCC pragma to enable AVX2, but instead
requires the command line option -mavx2. Since GCC also supports that,
remove the pragma lines and add the -mavx2 option when building the
test.

Signed-off-by: Rebecca Cran <rebecca@bsdio.com>
---
 configure | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/configure b/configure
index 714e7fb6a1..30d6c02ab4 100755
--- a/configure
+++ b/configure
@@ -5392,8 +5392,6 @@ fi
=20
 if test "$cpuid_h" =3D "yes" && test "$avx2_opt" !=3D "no"; then
   cat > $TMPC << EOF
-#pragma GCC push_options
-#pragma GCC target("avx2")
 #include <cpuid.h>
 #include <immintrin.h>
 static int bar(void *a) {
@@ -5402,7 +5400,7 @@ static int bar(void *a) {
 }
 int main(int argc, char *argv[]) { return bar(argv[0]); }
 EOF
-  if compile_object "" ; then
+  if compile_object "-mavx2" ; then
     avx2_opt=3D"yes"
   else
     avx2_opt=3D"no"
--=20
2.22.0


