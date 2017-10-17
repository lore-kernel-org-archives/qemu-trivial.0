Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FVQ-0006Ck-I1
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:13:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVN-00069l-Gw
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVM-00041f-Ak
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:09 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:46395)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVH-0003zE-Km; Mon, 16 Oct 2017 20:13:03 -0400
Received: by mail-qt0-x244.google.com with SMTP id 1so67120qtn.3;
	Mon, 16 Oct 2017 17:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=J9aT2Hl6tKhle6hN5N610lF8T02xsLKn3ookgGfaaYI=;
	b=aDyEJAr4cSF+04PBR+Ww1vYEJ7VU82vEUbOkDn+pVJd3AUwNFh085jq+p6CGcakDGf
	RW2Z00qRSpptj8KaZScV1kVKrtbiIPpyxdud+jcy7pW6pX0GgliQsE/8nEplaUjVkovX
	2/yeNvDj/3eEMNUUg/vbmuqTxnbHSfvbLdWQBc5cCfnbrmlGqQIwjvFkZq1AFdxxTr0p
	SVlcEKC1cOk6GM02KF0y7sWtjDXUORqtWn07CfmNA3INIZRySGbyQOfhDkRJuFdf9+f+
	vS7u6KpYfwYtOQqEDehCbshEEzMP3pyl0ALR2/hl27+uQs1mgaTRWs4a7ukpPPVJphQE
	x+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=J9aT2Hl6tKhle6hN5N610lF8T02xsLKn3ookgGfaaYI=;
	b=Fv449WSn8xqWhvQLh9mpffLox9fGgB3jsu5ASu2N6s2SpR3W9JSlq4wMut05d+qcOm
	uqPLH6AxXYlUgfJxdNaxgnAwl6At+X6ukLiMVdS/0dqOchl7xiXmuIswj3/o7xsbTRZs
	n1yJ0Cocntd7T9R5WSkFd2NpkJ0UI8PvHctqS0CKBX+vqNd59Nw33mk5vCaRayB1dw74
	s14zfeH4MzBtxq/nBYhqXWc0zZaC5v7rsuX/48G2yi5nDw6I3KSh93JfXfGqrccXgwzM
	fbFMzL7LUGrXWR7zpY6+gGoSK1J6o5wNo5Amy3Vw2djmJx5Vnuc48IzTYLI9gI3Czi2q
	c8LA==
X-Gm-Message-State: AMCzsaUjdjJSWqkWjJi2QuBWF4IIW82FFooAVVr0SwWAaI+WMXsTzg92
	w9gXGb409QgmuYKgCx5yhLw=
X-Google-Smtp-Source: AOwi7QCzycgmDC9CnN1chD4xdySYav9P/KwyASY9dBHLKI5ErBZx5XT2bWoeCOx1CG5hA52+Rjos9w==
X-Received: by 10.200.23.153 with SMTP id o25mr17402080qtj.119.1508199183220; 
	Mon, 16 Oct 2017 17:13:03 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.13.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:13:02 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:41 -0300
Message-Id: <20171017001209.32276-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v2 11/39] misc: remove headers implicitly
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
X-List-Received-Date: Tue, 17 Oct 2017 00:13:10 -0000

applied using ./scripts/clean-includes

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
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
2.15.0.rc0


