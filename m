Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WoqPS-0000D4-D0
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 04:37:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WoqPM-0008W8-7R
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 04:37:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WoqPH-0007RO-N5
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 04:37:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57142)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WoqP8-0007LX-CD; Mon, 26 May 2014 04:37:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3638542FAC;
	Mon, 26 May 2014 12:37:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 19DF56B1;
	Mon, 26 May 2014 11:20:15 +0400 (MSK)
Received: (nullmailer pid 23010 invoked by uid 1000);
	Mon, 26 May 2014 07:20:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 11:19:59 +0400
Message-Id: <1401088811-22923-12-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 11/23] configure: Put tempfiles in a subdir of
	the build directory
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
X-List-Received-Date: Mon, 26 May 2014 08:37:29 -0000

From: Peter Maydell <peter.maydell@linaro.org>

When libtool support was added to configure, the new temporary files
were left out of the list of files cleaned up on exit; this results
in a lot of stale .lo files being left around in /tmp. Worse, libtool
creates a /tmp/.libs directory which we can't easily clean up.

Put all our temporary files in a single temporary directory created
as a subdirectory of the build directory, so we can easily clean it up,
and don't need fragile or complicated code for creation to avoid it
clashing with temporary directories from other instances of QEMU
configure or being subject to attack from adversaries who can write
to /tmp.

Since the temporaries now live in the build tree, we have no
need to jump through hoops with a trap handler to try to remove
them when configure exits; this fixes some weird bugs where hitting
^C during a configure run wouldn't actually make it stop, because
we would run the trap handler but then not stop. (It is possible
to get the trap handler semantics right but it is convoluted largely
because of bugs in dash, so it is simpler to just avoid it.)

Note that "temporary files go in the build directory, not /tmp" is
the way autoconf behaves.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .gitignore |    1 +
 configure  |   29 ++++++++++++++++-------------
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/.gitignore b/.gitignore
index 8a52709..c658613 100644
--- a/.gitignore
+++ b/.gitignore
@@ -4,6 +4,7 @@
 /config-host.*
 /config-target.*
 /config.status
+/config-temp
 /trace/generated-tracers.h
 /trace/generated-tracers.c
 /trace/generated-tracers-dtrace.h
diff --git a/configure b/configure
index 678a106..cde4325 100755
--- a/configure
+++ b/configure
@@ -2,26 +2,28 @@
 #
 # qemu configure script (c) 2003 Fabrice Bellard
 #
-# set temporary file name
-if test ! -z "$TMPDIR" ; then
-    TMPDIR1="${TMPDIR}"
-elif test ! -z "$TEMPDIR" ; then
-    TMPDIR1="${TEMPDIR}"
-else
-    TMPDIR1="/tmp"
+
+# Temporary directory used for files created while
+# configure runs. Since it is in the build directory
+# we can safely blow away any previous version of it
+# (and we need not jump through hoops to try to delete
+# it when configure exits.)
+TMPDIR1="config-temp"
+rm -rf "${TMPDIR1}"
+mkdir -p "${TMPDIR1}"
+if [ $? -ne 0 ]; then
+    echo "ERROR: failed to create temporary directory"
+    exit 1
 fi
 
-TMPC="${TMPDIR1}/qemu-conf-${RANDOM}-$$-${RANDOM}.c"
-TMPB="qemu-conf-${RANDOM}-$$-${RANDOM}"
+TMPB="qemu-conf"
+TMPC="${TMPDIR1}/${TMPB}.c"
 TMPO="${TMPDIR1}/${TMPB}.o"
 TMPCXX="${TMPDIR1}/${TMPB}.cxx"
 TMPL="${TMPDIR1}/${TMPB}.lo"
 TMPA="${TMPDIR1}/lib${TMPB}.la"
-TMPE="${TMPDIR1}/qemu-conf-${RANDOM}-$$-${RANDOM}.exe"
+TMPE="${TMPDIR1}/${TMPB}.exe"
 
-# NB: do not call "exit" in the trap handler; this is buggy with some shells;
-# see <1285349658-3122-1-git-send-email-loic.minier@linaro.org>
-trap "rm -f $TMPC $TMPO $TMPCXX $TMPE" EXIT INT QUIT TERM
 rm -f config.log
 
 # Print a helpful header at the top of config.log
@@ -5235,3 +5237,4 @@ printf " '%s'" "$0" "$@" >>config.status
 echo >>config.status
 chmod +x config.status
 
+rm -r "$TMPDIR1"
-- 
1.7.10.4


