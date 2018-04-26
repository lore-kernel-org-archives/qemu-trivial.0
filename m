Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fBhUV-0006Wd-Ot
	for mharc-qemu-trivial@gnu.org; Thu, 26 Apr 2018 10:03:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fBhUQ-0006Sy-1i
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 10:03:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fBhUJ-0008HF-8T
	for qemu-trivial@nongnu.org; Thu, 26 Apr 2018 10:03:13 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:41160)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fBhU9-00088x-U7; Thu, 26 Apr 2018 10:02:58 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fBhU6-0005sq-Gt; Thu, 26 Apr 2018 15:02:54 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 26 Apr 2018 15:02:53 +0100
Message-Id: <20180426140253.3918-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH] vl.c: Don't zero-initialize statics for
 serial_hds
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
X-List-Received-Date: Thu, 26 Apr 2018 14:03:18 -0000

checkpatch reminds us that statics shouldn't be zero-initialized:

ERROR: do not initialise statics to 0 or NULL
#35: FILE: vl.c:157:
+static int num_serial_hds = 0;

ERROR: do not initialise statics to 0 or NULL
#36: FILE: vl.c:158:
+static Chardev **serial_hds = NULL;

I forgot to fix this in 6af2692e86f9fdfb3d; do so now.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I wouldn't bother with this except that I forgot to fold
it in when applying the serial-limits patchset.

 vl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/vl.c b/vl.c
index 616956adf1..6d8b869dad 100644
--- a/vl.c
+++ b/vl.c
@@ -154,8 +154,8 @@ QEMUClockType rtc_clock;
 int vga_interface_type = VGA_NONE;
 static DisplayOptions dpy;
 int no_frame;
-static int num_serial_hds = 0;
-static Chardev **serial_hds = NULL;
+static int num_serial_hds;
+static Chardev **serial_hds;
 Chardev *parallel_hds[MAX_PARALLEL_PORTS];
 Chardev *virtcon_hds[MAX_VIRTIO_CONSOLES];
 Chardev *sclp_hds[MAX_SCLP_CONSOLES];
-- 
2.17.0


