Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dKq7d-0002yN-6I
	for mharc-qemu-trivial@gnu.org; Tue, 13 Jun 2017 14:00:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dKq7a-0002wa-OT
	for qemu-trivial@nongnu.org; Tue, 13 Jun 2017 14:00:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dKq7Z-00065d-PK
	for qemu-trivial@nongnu.org; Tue, 13 Jun 2017 14:00:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50896)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dKq7V-00064J-6p; Tue, 13 Jun 2017 14:00:49 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 350CD8553C;
	Tue, 13 Jun 2017 18:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 350CD8553C
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 350CD8553C
Received: from thh440s.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B1998B7A9;
	Tue, 13 Jun 2017 18:00:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org
Date: Tue, 13 Jun 2017 20:00:44 +0200
Message-Id: <1497376844-26561-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 13 Jun 2017 18:00:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] configure: Fix build with pkg-config and
 --static --enable-sdl
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
X-List-Received-Date: Tue, 13 Jun 2017 18:00:56 -0000

The configure script prefers pkg-config over sdl-config, but
the "--static-libs" parameter only exists for the latter. With
pkg-config, "--static --libs" have to be used instead.

Buglink: https://bugs.launchpad.net/qemu/+bug/984516
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 13e040d..3b89de6 100755
--- a/configure
+++ b/configure
@@ -2671,7 +2671,11 @@ int main( void ) { return SDL_Init (SDL_INIT_VIDEO); }
 EOF
   sdl_cflags=$($sdlconfig --cflags 2>/dev/null)
   if test "$static" = "yes" ; then
-    sdl_libs=$($sdlconfig --static-libs 2>/dev/null)
+    if $pkg_config $sdlname --exists; then
+      sdl_libs=$($pkg_config $sdlname --static --libs 2>/dev/null)
+    else
+      sdl_libs=$($sdlconfig --static-libs 2>/dev/null)
+    fi
   else
     sdl_libs=$($sdlconfig --libs 2>/dev/null)
   fi
-- 
1.8.3.1


