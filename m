Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YBfxR-00062n-As
	for mharc-qemu-trivial@gnu.org; Thu, 15 Jan 2015 03:39:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBfxM-0005xO-Tn
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:39:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBfxL-0002JO-V3
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:39:08 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46059)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YBfx8-0002EO-U0; Thu, 15 Jan 2015 03:38:55 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 12BB040DB6;
	Thu, 15 Jan 2015 11:38:54 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2CC0F8CC;
	Thu, 15 Jan 2015 11:30:54 +0300 (MSK)
Received: (nullmailer pid 31345 invoked by uid 1000);
	Thu, 15 Jan 2015 08:30:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 15 Jan 2015 11:30:41 +0300
Message-Id: <2d8ac5eb7a7e72e0877cca2b3705eebeaf5526e7.1421310394.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
References: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>, SeokYeon Hwang <syeon.hwang@samsung.com>
Subject: [Qemu-trivial] [PULL 03/12] translate-all: Mark map_exec() with the
	'unused' attribute
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
X-List-Received-Date: Thu, 15 Jan 2015 08:39:09 -0000

From: SeokYeon Hwang <syeon.hwang@samsung.com>

Mark map_exec() with the 'unused' attribute to avoid '-Wunused-function'
warnings on clang 3.4 or later. This means we don't need to mark it
'inline', which is what we were previously using to suppress the warning
(a trick which only works with gcc, not clang).

Signed-off-by: SeokYeon Hwang <syeon.hwang@samsung.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
[PMM: tweaked comment message a little]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 translate-all.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/translate-all.c b/translate-all.c
index 8fa4378..687ba7d 100644
--- a/translate-all.c
+++ b/translate-all.c
@@ -276,14 +276,14 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t retaddr)
 }
 
 #ifdef _WIN32
-static inline void map_exec(void *addr, long size)
+static __attribute__((unused)) void map_exec(void *addr, long size)
 {
     DWORD old_protect;
     VirtualProtect(addr, size,
                    PAGE_EXECUTE_READWRITE, &old_protect);
 }
 #else
-static inline void map_exec(void *addr, long size)
+static __attribute__((unused)) void map_exec(void *addr, long size)
 {
     unsigned long start, end, page_size;
 
-- 
2.1.4


