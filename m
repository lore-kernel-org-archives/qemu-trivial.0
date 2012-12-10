Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Thwda-0005Rf-Vr
	for mharc-qemu-trivial@gnu.org; Mon, 10 Dec 2012 01:14:46 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>) id 1ThwdX-0005RT-JH
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 01:14:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>) id 1ThwdU-0001yh-V5
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 01:14:43 -0500
Received: from furnace.wzff.de ([176.9.216.40]:53134)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>)
	id 1ThwdU-0001yc-OQ; Mon, 10 Dec 2012 01:14:40 -0500
Received: from xdsl-188-155-204-150.adslplus.ch ([188.155.204.150]
	helo=[10.1.1.4])
	by furnace.wzff.de with esmtpsa (TLSv1:DHE-RSA-CAMELLIA256-SHA:256)
	(Exim 4.80.1 (FreeBSD)) (envelope-from <maillist-qemu@barfooze.de>)
	id 1ThwdS-000Jio-CG; Mon, 10 Dec 2012 07:14:39 +0100
Message-ID: <50C57DE4.5050304@barfooze.de>
Date: Mon, 10 Dec 2012 07:15:00 +0100
From: John Spencer <maillist-qemu@barfooze.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110221 SUSE/3.1.8 Mail/1.0
MIME-Version: 1.0
To: qemu-trivial@nongnu.org
Content-Type: multipart/mixed; boundary="------------080209030703090209070005"
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 176.9.216.40
Cc: qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH 2/4] fix build error on ARM due to wrong
	glibc check
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
X-List-Received-Date: Mon, 10 Dec 2012 06:14:46 -0000

This is a multi-part message in MIME format.
--------------080209030703090209070005
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------080209030703090209070005
Content-Type: text/x-patch;
 name="0002-fix-build-error-on-ARM-due-to-wrong-glibc-check.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0002-fix-build-error-on-ARM-due-to-wrong-glibc-check.patch"

From ae02bfc600bf8c4c8502e70bdf8dfcd332ebef02 Mon Sep 17 00:00:00 2001
From: John Spencer <maillist-qemu@barfooze.de>
Date: Mon, 10 Dec 2012 06:54:03 +0100
Subject: [PATCH 2/4] fix build error on ARM due to wrong glibc check

the test for glibc < 2 "succeeds" wrongly for any non-glibc C library,
and breaks the build on musl libc.
we must first test if __GLIBC__ is defined at all, before using it
unconditionally.

Signed-off-by: John Spencer <maillist-qemu@barfooze.de>

---
 user-exec.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/user-exec.c b/user-exec.c
index ef9b172..cccc145 100644
--- a/user-exec.c
+++ b/user-exec.c
@@ -442,7 +442,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
     unsigned long pc;
     int is_write;
 
-#if (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
+#if defined(__GLIBC__) && (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
     pc = uc->uc_mcontext.gregs[R15];
 #else
     pc = uc->uc_mcontext.arm_pc;
-- 
1.7.3.4


--------------080209030703090209070005--

