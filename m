Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1em0uU-0003en-PG
	for mharc-qemu-trivial@gnu.org; Wed, 14 Feb 2018 12:31:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1em0uS-0003aK-Ml
	for qemu-trivial@nongnu.org; Wed, 14 Feb 2018 12:31:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1em0uR-0002Nw-Nc
	for qemu-trivial@nongnu.org; Wed, 14 Feb 2018 12:31:56 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43248 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1em0uJ-0002GR-Eg; Wed, 14 Feb 2018 12:31:47 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 07DB4408501B;
	Wed, 14 Feb 2018 17:31:47 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-136.ams2.redhat.com
	[10.36.116.136])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0BAB2024CA4;
	Wed, 14 Feb 2018 17:31:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 14 Feb 2018 18:31:45 +0100
Message-Id: <1518629505-22480-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 14 Feb 2018 17:31:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 14 Feb 2018 17:31:47 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] configure: Add missing space when using
 --with-pkgversion
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
X-List-Received-Date: Wed, 14 Feb 2018 17:31:57 -0000

When running configure with --with-pkgversion=foo there is no
space anymore between the version number and the parentheses:

$ m68k-softmmu/qemu-system-m68k -version
QEMU emulator version 2.11.50(foo)

Fix it by moving the space from the configure script to the Makefile.

Fixes: 67a1de0d195a6185c39b436159c9ffc7720bf979
Buglink: https://bugs.launchpad.net/qemu/+bug/1673373
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Makefile  | 2 +-
 configure | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 4ec7a3c..41adbc9 100644
--- a/Makefile
+++ b/Makefile
@@ -369,7 +369,7 @@ qemu-version.h: FORCE
 		(cd $(SRC_PATH); \
 		printf '#define QEMU_PKGVERSION '; \
 		if test -n "$(PKGVERSION)"; then \
-			printf '"$(PKGVERSION)"\n'; \
+			printf '" ($(PKGVERSION))"\n'; \
 		else \
 			if test -d .git; then \
 				printf '" ('; \
diff --git a/configure b/configure
index fe9eea9..1fc687c 100755
--- a/configure
+++ b/configure
@@ -1162,7 +1162,7 @@ for opt do
   ;;
   --disable-blobs) blobs="no"
   ;;
-  --with-pkgversion=*) pkgversion=" ($optarg)"
+  --with-pkgversion=*) pkgversion="$optarg"
   ;;
   --with-coroutine=*) coroutine="$optarg"
   ;;
-- 
1.8.3.1


