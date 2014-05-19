Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WmREe-0001TA-T7
	for mharc-qemu-trivial@gnu.org; Mon, 19 May 2014 13:20:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WmREZ-0001NX-PM
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 13:20:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WmREY-0002MW-KW
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 13:20:19 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:48177)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WmRES-0001fL-5O; Mon, 19 May 2014 13:20:12 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WmRDy-0002Pt-Ux; Mon, 19 May 2014 18:19:42 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 May 2014 18:19:42 +0100
Message-Id: <1400519982-9264-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Eric Blake <eblake@redhat.com>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] configure: Put tempfiles in a subdir of the
	build directory
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
X-List-Received-Date: Mon, 19 May 2014 17:20:20 -0000

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
---
If we really wanted to run a cleanup handler then to cope
with dash bugs I think this has to be:
trap 'exit $?' INT QUIT TERM
trap 'ret=$?; cleanup here; exit $?' EXIT
(and even then this doesn't work if you run with -ex...)

 .gitignore |  1 +
 configure  | 28 +++++++++++++++-------------
 2 files changed, 16 insertions(+), 13 deletions(-)

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
index 605a0ec..e06386a 100755
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
-- 
1.9.2


