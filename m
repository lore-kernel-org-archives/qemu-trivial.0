Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V0A-0001kA-VX
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:45:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V08-0001hi-R8
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V07-0003Gm-SK
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:56 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:52471)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V02-0003Dv-Mi; Tue, 17 Oct 2017 12:45:50 -0400
Received: by mail-qt0-x242.google.com with SMTP id 31so4901845qtz.9;
	Tue, 17 Oct 2017 09:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=J9aT2Hl6tKhle6hN5N610lF8T02xsLKn3ookgGfaaYI=;
	b=O0VfcOeDUqf7FAIjoOnCuqA5Swsfww/fD0zB5oLsGO4n8AuCEdsDPOWyC/dFy0o8XL
	YF7TwTNtRLWUjkMG1VPRaZ4o0lcy94OpsFDIIkl+osa0ZRsPPP+JL+XQDEy65MeTcdRN
	6rxJFSCZ43zUvcLm/PR5m4YcgQjU3HPMlmowpW7OT/nie1SuLxbikO0u1kqY92ncA9AQ
	qp9EcOTmYRZOxE7Mnpo9wOf1JkGfnr4dZn1n03hDgTFOGCopfXVy/MOW8pjN2pPKx0/r
	C3NJTtEJlmy2R2Tlgibe8x+KYG3DfzRj5nBpDLpMpx2PHQqF5YUBU+w5CF6qCo2ui5w3
	REKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=J9aT2Hl6tKhle6hN5N610lF8T02xsLKn3ookgGfaaYI=;
	b=bP6pW63psAwbWyzDgfgAX8syGT4Osd6D4B5FnszeZ7RTpOB8gOHIzC8e4sFwZB8WME
	cbLC4Hgt9ZnY1tgnptqFYJasjhZ+0F4h5iY1j32NfauMPjvE63NUdKj76vySE9wDLcTa
	iC4uXZSSskwk8uAFONO7+JcsVhZNfHjx1bqD0sRMDeQYrmY5Am8zMpHgWdieUUZ2Kwr0
	eveKE6ohtGrJWoPVLvVt6jVUf/+ba2OePSy7fpDB6f3pdyaNfVYB54YO92+RADUpdouw
	Bzgj40FguhYHW3gsKHzyviv0EYDO3M4W4TS0gXilPt0iwEPe+yF3kLRKP0NLBKYa651h
	20Kw==
X-Gm-Message-State: AMCzsaUhjrP+EWx0xbad6OK07qr7fd9gEWRTriqA3sXOjOF9gH5LZlvb
	0wQuVWQfKhDhZ+sQhBPs5h9I9ZIJ
X-Google-Smtp-Source: ABhQp+Ql1YmufW01v9NBMH9ZYOaNM1+qliaQaLzmQRM2uodPI3/ZgPA2prq9zc85qpbmLRb90sxSkw==
X-Received: by 10.237.33.186 with SMTP id l55mr20965208qtc.71.1508258750170;
	Tue, 17 Oct 2017 09:45:50 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.45.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:45:49 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:43:56 -0300
Message-Id: <20171017164426.25277-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v3 12/42] misc: remove headers implicitly
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
X-List-Received-Date: Tue, 17 Oct 2017 16:45:58 -0000

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


