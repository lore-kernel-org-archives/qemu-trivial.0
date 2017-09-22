Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQ4V-0004SN-D1
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 11:40:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4T-0004QN-4j
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:40:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4P-00034d-RH
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:40:52 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:36945)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4L-0002zD-2S; Fri, 22 Sep 2017 11:40:45 -0400
Received: by mail-qk0-x241.google.com with SMTP id r66so870078qke.4;
	Fri, 22 Sep 2017 08:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kT3txj6YEcj2XVKiaMO833m4DPEXsDKuUiQZlan6y4E=;
	b=alUkk61RBoKcaSR13kxRKwC9oyAX/LVdVCuVwzBdEGzpAyx4d5HqYCa0A+8Q4AKsQp
	GgHy9iVrniK90gyO+eU9CtkPBkUMxyfRmG/Ap7B8tk2buoufdHqYu1mdsHo7Niolz9+4
	JBe20S6DUEEMKFPfQmEGR2DjOE6A8cytgL79WO4e9riGv5O8dEq9V5sv8cfMXLtI73ch
	lffz+AbLoKl08UWtYet3oqWWzxre65VmY66enqMOQDFXWa3UAT4UW3jLhAvYa8Of0q43
	aDf71k71cBSRnVXKZoFCyg4U5n6pqXkTtnC5JS0V70PrGmHyddhz+Tf3A0Pgdea6mCSU
	iy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=kT3txj6YEcj2XVKiaMO833m4DPEXsDKuUiQZlan6y4E=;
	b=nz19jdshujT0us92YgvYcjg0nH8i6iaWt1K7+fkLkwSeA8drDuocv6xsLxsZvmFHhZ
	CKbeX/A9nlT6QjYdUHDPhaAT4D9GkBTW7F9QGJiuI7hjc1vPJ7JmrKNxWwRCaK4BoOtJ
	tWgZsZ06Rj9PWnZbrWMr7NvlGmNwUN7mzBF2oWKFNwCMi/4AS7Ne5uU2duMSzsugpR3F
	9Tollt+aM7pntT6X4SVWcAPd8NeCytlk8RMk8n0gZdSqJpFCEaP2yQACOYNSIRbglrn/
	MD/AyQSeC3V1IrAkkr2Bv0YbHGdY5ZxF6iKkVkFQ1OX/3+Yr1aorqGMv91akdcWqE1L5
	MZ5w==
X-Gm-Message-State: AHPjjUj4jRdeJ1+BuBHzU//v+r13lTNSALMjQ037or3BfvcQ4BkBWNwl
	JljvxIfpbyc83w08SdOOkJptkF6A8sU=
X-Google-Smtp-Source: AOwi7QC0xJtOgocVLz69K9k2aNy85qpWitpIxAAA2uqfrMJi6815VbJLCdIcvi0uEKnEPeY6ZYbOMQ==
X-Received: by 10.55.124.71 with SMTP id x68mr7710735qkc.10.1506094844480;
	Fri, 22 Sep 2017 08:40:44 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id z75sm71742qkb.71.2017.09.22.08.40.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 08:40:43 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Ben Warren <ben@skyportsystems.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 12:39:44 -0300
Message-Id: <20170922154014.29350-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH 04/34] misc: remove headers implicitly
 included
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
X-List-Received-Date: Fri, 22 Sep 2017 15:40:54 -0000

applied using ./scripts/clean-includes

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/audio/fmopl.h             | 1 -
 bsd-user/main.c              | 1 -
 chardev/wctablet.c           | 4 ----
 hw/scsi/vhost-user-scsi.c    | 1 -
 linux-user/main.c            | 1 -
 net/colo-compare.c           | 1 -
 tests/test-aio-multithread.c | 1 -
 tests/test-clone-visitor.c   | 1 -
 tests/vmgenid-test.c         | 3 ---
 9 files changed, 14 deletions(-)

diff --git a/hw/audio/fmopl.h b/hw/audio/fmopl.h
index f4065f425c..e7e578a48e 100644
--- a/hw/audio/fmopl.h
+++ b/hw/audio/fmopl.h
@@ -1,7 +1,6 @@
 #ifndef FMOPL_H
 #define FMOPL_H
 
-#include <stdint.h>
 
 typedef void (*OPL_TIMERHANDLER)(void *param, int channel, double interval_Sec);
 
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 836daac15c..bf27a5b44f 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -32,7 +32,6 @@
 #include "qemu/envlist.h"
 #include "exec/log.h"
 #include "trace/control.h"
-#include "glib-compat.h"
 
 int singlestep;
 unsigned long mmap_min_addr;
diff --git a/chardev/wctablet.c b/chardev/wctablet.c
index 6c13c2c58a..969d014574 100644
--- a/chardev/wctablet.c
+++ b/chardev/wctablet.c
@@ -25,10 +25,6 @@
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  * THE SOFTWARE.
  */
-#include <stdlib.h>
-#include <string.h>
-#include <sys/time.h>
-#include <time.h>
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
index 500fa6a067..9efa26da7d 100644
--- a/hw/scsi/vhost-user-scsi.c
+++ b/hw/scsi/vhost-user-scsi.c
@@ -18,7 +18,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
-#include "qemu/typedefs.h"
 #include "qom/object.h"
 #include "hw/fw-path-provider.h"
 #include "hw/qdev-core.h"
diff --git a/linux-user/main.c b/linux-user/main.c
index 829f974662..85d7f6d3f7 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -35,7 +35,6 @@
 #include "elf.h"
 #include "exec/log.h"
 #include "trace/control.h"
-#include "glib-compat.h"
 
 char *exec_path;
 
diff --git a/net/colo-compare.c b/net/colo-compare.c
index b3f35d729a..27ea7d4de9 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -23,7 +23,6 @@
 #include "qom/object_interfaces.h"
 #include "qemu/iov.h"
 #include "qom/object.h"
-#include "qemu/typedefs.h"
 #include "net/queue.h"
 #include "chardev/char-fe.h"
 #include "qemu/sockets.h"
diff --git a/tests/test-aio-multithread.c b/tests/test-aio-multithread.c
index 549d784915..ad78c6b28b 100644
--- a/tests/test-aio-multithread.c
+++ b/tests/test-aio-multithread.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "block/aio.h"
 #include "qapi/error.h"
 #include "qemu/coroutine.h"
diff --git a/tests/test-clone-visitor.c b/tests/test-clone-visitor.c
index 96982163e4..ac6afc562e 100644
--- a/tests/test-clone-visitor.c
+++ b/tests/test-clone-visitor.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qemu-common.h"
 #include "qapi/clone-visitor.h"
diff --git a/tests/vmgenid-test.c b/tests/vmgenid-test.c
index 918c82c82a..2f96ad453e 100644
--- a/tests/vmgenid-test.c
+++ b/tests/vmgenid-test.c
@@ -8,9 +8,6 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
-#include <unistd.h>
 #include "qemu/osdep.h"
 #include "qemu/bitmap.h"
 #include "qemu/uuid.h"
-- 
2.14.1


