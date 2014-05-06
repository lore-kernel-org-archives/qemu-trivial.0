Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhfFb-00082M-6R
	for mharc-qemu-trivial@gnu.org; Tue, 06 May 2014 09:17:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WhfFZ-0007yz-8E
	for qemu-trivial@nongnu.org; Tue, 06 May 2014 09:17:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WhfFY-0002b3-6H
	for qemu-trivial@nongnu.org; Tue, 06 May 2014 09:17:37 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:48025)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WhfFV-0002Dv-RC; Tue, 06 May 2014 09:17:33 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WhfEy-0003sN-80; Tue, 06 May 2014 14:17:00 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  6 May 2014 14:17:00 +0100
Message-Id: <1399382220-14874-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Don Slutz <dslutz@verizon.com>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] configure: Put tempfiles in subdir so we can
	clean up libtool files
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
X-List-Received-Date: Tue, 06 May 2014 13:17:38 -0000

When libtool support was added to configure, the new temporary files
were left out of the list of files cleaned up on exit; this results
in a lot of stale .lo files being left around in /tmp. Worse, libtool
creates a /tmp/.libs directory which we can't easily clean up.

Put all our temporary files in a single temporary directory created
via mktemp -d, so we can easily clean it up. This has the bonus
result that we no longer use $RANDOM (which silently expands to the
empty string if your shell is not bash, and so is pretty useless).

Note that because we now use mktemp's tempdir-finding logic rather
than handrolling it, we no longer honour TEMPDIR (only TMPDIR).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I don't know why we were looking at TEMPDIR; that code was
in there from the initial commit by Fabrice back in 2003...

 configure | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 870c939..84c600f 100755
--- a/configure
+++ b/configure
@@ -2,26 +2,25 @@
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
+TMPDIR1=$(mktemp -t -d)
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
 
 # NB: do not call "exit" in the trap handler; this is buggy with some shells;
 # see <1285349658-3122-1-git-send-email-loic.minier@linaro.org>
-trap "rm -f $TMPC $TMPO $TMPCXX $TMPE" EXIT INT QUIT TERM
+trap "rm -rf ${TMPDIR1}" EXIT INT QUIT TERM
+
 rm -f config.log
 
 # Print a helpful header at the top of config.log
-- 
1.9.2


