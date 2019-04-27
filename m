Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hKPWS-0003bW-0n
	for mharc-qemu-trivial@gnu.org; Sat, 27 Apr 2019 11:45:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hKPWP-0003Zj-GG
	for qemu-trivial@nongnu.org; Sat, 27 Apr 2019 11:45:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hKPWO-0002St-IG
	for qemu-trivial@nongnu.org; Sat, 27 Apr 2019 11:45:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44838)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hKPWL-0002PN-QV; Sat, 27 Apr 2019 11:45:45 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B31C368E3;
	Sat, 27 Apr 2019 15:45:44 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CE3B04BC;
	Sat, 27 Apr 2019 15:45:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <rth@twiddle.net>, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
Date: Sat, 27 Apr 2019 17:45:39 +0200
Message-Id: <20190427154539.11336-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Sat, 27 Apr 2019 15:45:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] configure: Add -Wno-typedef-redefinition to
 CFLAGS (for Clang)
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
X-List-Received-Date: Sat, 27 Apr 2019 15:45:50 -0000

Without the -Wno-typedef-redefinition option, clang complains if a typede=
f
gets redefined in gnu99 mode (since this is officially a C11 feature). Th=
is
used to also happen with older versions of GCC, but since we've bumped ou=
r
minimum GCC version to 4.8, all versions of GCC that we support do not se=
em
to issue this warning in gnu99 mode anymore. So this has become a common
problem for people who only test their code with GCC - they do not notice
the issue until they submit their patches and suddenly patchew or a
maintainer complains.

Now that we do not urgently need to keep the code clean from typedef
redefintions anymore with recent versions of GCC, we can ease the
situation with clang, too, and simply shut these warnings off for good.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 2cc365be51..8e15dc9870 100755
--- a/configure
+++ b/configure
@@ -1917,7 +1917,7 @@ gcc_flags=3D"-Wformat-security -Wformat-y2k -Winit-=
self -Wignored-qualifiers $gcc_
 gcc_flags=3D"-Wno-missing-include-dirs -Wempty-body -Wnested-externs $gc=
c_flags"
 gcc_flags=3D"-Wendif-labels -Wno-shift-negative-value $gcc_flags"
 gcc_flags=3D"-Wno-initializer-overrides -Wexpansion-to-defined $gcc_flag=
s"
-gcc_flags=3D"-Wno-string-plus-int $gcc_flags"
+gcc_flags=3D"-Wno-string-plus-int -Wno-typedef-redefinition $gcc_flags"
 # Note that we do not add -Werror to gcc_flags here, because that would
 # enable it for all configure tests. If a configure test failed due
 # to -Werror this would just silently disable some features,
--=20
2.21.0


