Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTClc-0006Fs-8A
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 12:07:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTClV-000629-M9
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:07:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTClP-0005kB-4x
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:07:20 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40356)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTClG-0005hZ-A3; Wed, 04 Mar 2015 12:07:06 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C9C954089E;
	Wed,  4 Mar 2015 20:07:05 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 969AE930;
	Wed,  4 Mar 2015 20:07:05 +0300 (MSK)
Received: (nullmailer pid 17491 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:21 +0300
Message-Id: <8e27844ea031fe7e2dfc19a8fa580a55e64c14b2.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Borislav Petkov <bp@suse.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 04/47] memsave: Improve and disambiguate error
	message
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
X-List-Received-Date: Wed, 04 Mar 2015 17:07:26 -0000

From: Borislav Petkov <bp@suse.de>

When requesting a size which cannot be read, the error message shows
a different address which is misleading to the user and it looks like
something's wrong with the address parsing. This is because the input
@addr variable is incremented in the memory dumping loop:

(qemu) memsave 0xffffffff8418069c 0xb00000 mem
Invalid addr 0xffffffff849ffe9c specified

Fix that by saving the original address and size and use them in the
error message:

(qemu) memsave 0xffffffff8418069c 0xb00000 mem
Invalid addr 0xffffffff8418069c/size 11534336 specified

Signed-off-by: Borislav Petkov <bp@suse.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 cpus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/cpus.c b/cpus.c
index 0fac143..1ce90a1 100644
--- a/cpus.c
+++ b/cpus.c
@@ -1474,6 +1474,7 @@ void qmp_memsave(int64_t addr, int64_t size, const char *filename,
     uint32_t l;
     CPUState *cpu;
     uint8_t buf[1024];
+    int64_t orig_addr = addr, orig_size = size;
 
     if (!has_cpu) {
         cpu_index = 0;
@@ -1497,7 +1498,8 @@ void qmp_memsave(int64_t addr, int64_t size, const char *filename,
         if (l > size)
             l = size;
         if (cpu_memory_rw_debug(cpu, addr, buf, l, 0) != 0) {
-            error_setg(errp, "Invalid addr 0x%016" PRIx64 "specified", addr);
+            error_setg(errp, "Invalid addr 0x%016" PRIx64 "/size %" PRId64
+                             " specified", orig_addr, orig_size);
             goto exit;
         }
         if (fwrite(buf, 1, l, f) != l) {
-- 
2.1.4


