Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fx5MX-0006zV-JA
	for mharc-qemu-trivial@gnu.org; Tue, 04 Sep 2018 03:02:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fx5MQ-0006ic-To
	for qemu-trivial@nongnu.org; Tue, 04 Sep 2018 03:02:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fx5ML-0004QZ-Q6
	for qemu-trivial@nongnu.org; Tue, 04 Sep 2018 03:02:50 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44706 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fx5Lz-0003uO-Us; Tue, 04 Sep 2018 03:02:24 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B59940216E5;
	Tue,  4 Sep 2018 07:02:22 +0000 (UTC)
Received: from thuth.com (ovpn-116-20.ams2.redhat.com [10.36.116.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC2C210EE6C6;
	Tue,  4 Sep 2018 07:02:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>,
	qemu-trivial@nongnu.org
Date: Tue,  4 Sep 2018 09:02:18 +0200
Message-Id: <1536044538-22507-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 04 Sep 2018 07:02:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 04 Sep 2018 07:02:22 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] configure: Save PKG_CONFIG_LIBDIR and
 WINDRES in config.status
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
X-List-Received-Date: Tue, 04 Sep 2018 07:02:56 -0000

When cross-compiling QEMU for a target that significantly differs from
the host, the current information in config.status is not enough to
properly re-create the configuration. For example when I try to test
my build with the mingw32 cross-compiler, I regularly get this error
after the build system tried to re-create the configuration with the
config.status file:

ERROR: sizeof(size_t) doesn't match GLIB_SIZEOF_SIZE_T.
       You probably need to set PKG_CONFIG_LIBDIR
       to point to the right pkg-config files for your
       build target

A similar problem exists for the "windres" tool, where you have to
set the WINDRES variable in case it has a different name.
So let's fix these issues by storing the configuration for these
variables in the config.status file, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/configure b/configure
index 58862d2..4d8888f 100755
--- a/configure
+++ b/configure
@@ -7534,6 +7534,12 @@ cat <<EOD >config.status
 # Compiler output produced by configure, useful for debugging
 # configure, is in config.log if it exists.
 EOD
+if [ -n "$PKG_CONFIG_LIBDIR" ]; then
+    echo "export PKG_CONFIG_LIBDIR=\"$PKG_CONFIG_LIBDIR\"" >>config.status
+fi
+if [ -n "$WINDRES" ]; then
+    echo "export WINDRES=\"$WINDRES\"" >>config.status
+fi
 printf "exec" >>config.status
 printf " '%s'" "$0" "$@" >>config.status
 echo ' "$@"' >>config.status
-- 
1.8.3.1


