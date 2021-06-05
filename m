Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lpaQw-00010r-HH
	for mharc-qemu-trivial@gnu.org; Sat, 05 Jun 2021 13:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <email@aabouzied.com>)
 id 1lpaQu-00010X-32
 for qemu-trivial@nongnu.org; Sat, 05 Jun 2021 13:50:04 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <email@aabouzied.com>)
 id 1lpaQo-0007Hf-CO
 for qemu-trivial@nongnu.org; Sat, 05 Jun 2021 13:50:03 -0400
Received: by mail-wr1-x42a.google.com with SMTP id c5so12498687wrq.9
 for <qemu-trivial@nongnu.org>; Sat, 05 Jun 2021 10:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aabouzied-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BWHGYOMOGXj9Bfk4fh/SWSYr0ToL9M8g89Z+9rCbxeM=;
 b=YzIWl2fH+v0S2yTE4CbLSMe/uEu0pnSn1qS0m6eg9dRiDJDFLdv/xc0CJ+1l0u/3LZ
 S+8pYRUlCxfwX5Tg6bCOwUZIQSLmCWJ9Hu7i3xV5tYsbs9lONUs2qiR1C3erXT0f5ATR
 mfMuh4envN29I1jzjn5o2qMdSahrHzfB842BCu3Vb8kN/jdr5t2Jma1Y8giOgjHcuRKJ
 +0/vj4o1ArIoJYt7LAwai88lULK5O4cPxbV23rBzC7F6t1kWcAjZX1eP9a2L8caOZGUy
 1Icl4KVeLXB5pInQf8q5IbJ5LuUkpqQRFtslRMgsx4Avpe96j3PQh+szvmrL3r+Ldpla
 4WAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BWHGYOMOGXj9Bfk4fh/SWSYr0ToL9M8g89Z+9rCbxeM=;
 b=CJk2Wkh2qo027FzgpMhEX3gOxBOiCAOH8+EEmUikdEJOQ/p+YdBDR12eGzr9lYlrje
 goAteoML5THt3zl87KoX1idvwd5rWa+YjVT/WqbJJd4KvRm2Pzm2MwqoWU0gY0yO9rGc
 p3lBYDWnVKD1TRuaoE6v2/KE7p42xuBKIk/JHrUnsfxsTrXc/6c6FLkcIp8ZXHpsTZic
 0m0W05K34VAEQQZNJj/CqZX6TMyl5zKFuFJs3xAVD+116x73uz9gr/CGmhcqIVDXjWhy
 IhFg1G4IBBMcTFmulQPiB5yLB+vt6MT9uX3p53G7e+HH4QuHripRt00YSF71s4AZug0H
 H83w==
X-Gm-Message-State: AOAM530wSzizWGwLhZPQnYkD4u97EOS72Oa17JYwFAbgnzZ/dSSJw+LQ
 lS2aVQbBohIveL23MkwHcdK7Lw==
X-Google-Smtp-Source: ABdhPJyLdFZY4iLJe6qFfgEn9hpxjPzJ5SZkGpzBo8cyujiffDmhln829v7+1ZhVcj+UWFCtS1exiw==
X-Received: by 2002:a5d:6952:: with SMTP id r18mr9285115wrw.392.1622915395742; 
 Sat, 05 Jun 2021 10:49:55 -0700 (PDT)
Received: from pythagoras.localdomain ([154.177.90.187])
 by smtp.gmail.com with ESMTPSA id v7sm11812056wrf.82.2021.06.05.10.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jun 2021 10:49:55 -0700 (PDT)
From: Ahmed Abouzied <email@aabouzied.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, thuth@redhat.com,
 Ahmed Abouzied <email@aabouzied.com>
Subject: [PATCH 1/2] Remove leading underscores from QEMU defines
Date: Sat,  5 Jun 2021 19:49:38 +0200
Message-Id: <20210605174938.13782-1-email@aabouzied.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::42a;
 envelope-from=email@aabouzied.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Jun 2021 17:50:04 -0000

Leading underscores followed by a capital letter or underscore are
reserved by the C standard.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/369

Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
---
 include/fpu/softfloat-helpers.h             | 4 ++--
 include/hw/usb/dwc2-regs.h                  | 4 ++--
 include/hw/usb/xlnx-usb-subsystem.h         | 4 ++--
 include/hw/usb/xlnx-versal-usb2-ctrl-regs.h | 4 ++--
 include/qemu/plugin-memory.h                | 4 ++--
 include/qemu/selfmap.h                      | 4 ++--
 include/user/syscall-trace.h                | 4 ++--
 plugins/plugin.h                            | 4 ++--
 tests/qtest/fuzz/qos_fuzz.h                 | 4 ++--
 tests/tcg/minilib/minilib.h                 | 4 ++--
 10 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/include/fpu/softfloat-helpers.h b/include/fpu/softfloat-helpers.h
index 34f4cf92ae..a98d759cd3 100644
--- a/include/fpu/softfloat-helpers.h
+++ b/include/fpu/softfloat-helpers.h
@@ -48,8 +48,8 @@ this code that are retained.
 ===============================================================================
 */
 
-#ifndef _SOFTFLOAT_HELPERS_H_
-#define _SOFTFLOAT_HELPERS_H_
+#ifndef SOFTFLOAT_HELPERS_H
+#define SOFTFLOAT_HELPERS_H
 
 #include "fpu/softfloat-types.h"
 
diff --git a/include/hw/usb/dwc2-regs.h b/include/hw/usb/dwc2-regs.h
index 40af23a0ba..a7eb531485 100644
--- a/include/hw/usb/dwc2-regs.h
+++ b/include/hw/usb/dwc2-regs.h
@@ -39,8 +39,8 @@
  * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 
-#ifndef __DWC2_HW_H__
-#define __DWC2_HW_H__
+#ifndef DWC2_HW_H
+#define DWC2_HW_H
 
 #define HSOTG_REG(x)	(x)
 
diff --git a/include/hw/usb/xlnx-usb-subsystem.h b/include/hw/usb/xlnx-usb-subsystem.h
index 739bef7f45..999e423951 100644
--- a/include/hw/usb/xlnx-usb-subsystem.h
+++ b/include/hw/usb/xlnx-usb-subsystem.h
@@ -22,8 +22,8 @@
  * THE SOFTWARE.
  */
 
-#ifndef _XLNX_VERSAL_USB_SUBSYSTEM_H_
-#define _XLNX_VERSAL_USB_SUBSYSTEM_H_
+#ifndef XLNX_VERSAL_USB_SUBSYSTEM_H
+#define XLNX_VERSAL_USB_SUBSYSTEM_H
 
 #include "hw/usb/xlnx-versal-usb2-ctrl-regs.h"
 #include "hw/usb/hcd-dwc3.h"
diff --git a/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h b/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
index 975a717627..b76dce0419 100644
--- a/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
+++ b/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
@@ -23,8 +23,8 @@
  * THE SOFTWARE.
  */
 
-#ifndef _XLNX_USB2_REGS_H_
-#define _XLNX_USB2_REGS_H_
+#ifndef XLNX_USB2_REGS_H
+#define XLNX_USB2_REGS_H
 
 #define TYPE_XILINX_VERSAL_USB2_CTRL_REGS "xlnx.versal-usb2-ctrl-regs"
 
diff --git a/include/qemu/plugin-memory.h b/include/qemu/plugin-memory.h
index fbbe99474b..b36def27d7 100644
--- a/include/qemu/plugin-memory.h
+++ b/include/qemu/plugin-memory.h
@@ -6,8 +6,8 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef _PLUGIN_MEMORY_H_
-#define _PLUGIN_MEMORY_H_
+#ifndef PLUGIN_MEMORY_H
+#define PLUGIN_MEMORY_H
 
 struct qemu_plugin_hwaddr {
     bool is_io;
diff --git a/include/qemu/selfmap.h b/include/qemu/selfmap.h
index 8382c4c779..80cf920fba 100644
--- a/include/qemu/selfmap.h
+++ b/include/qemu/selfmap.h
@@ -6,8 +6,8 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef _SELFMAP_H_
-#define _SELFMAP_H_
+#ifndef SELFMAP_H
+#define SELFMAP_H
 
 typedef struct {
     unsigned long start;
diff --git a/include/user/syscall-trace.h b/include/user/syscall-trace.h
index 42e3b48b03..614cfacfa5 100644
--- a/include/user/syscall-trace.h
+++ b/include/user/syscall-trace.h
@@ -7,8 +7,8 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef _SYSCALL_TRACE_H_
-#define _SYSCALL_TRACE_H_
+#ifndef SYSCALL_TRACE_H
+#define SYSCALL_TRACE_H
 
 #include "trace/trace-root.h"
 
diff --git a/plugins/plugin.h b/plugins/plugin.h
index 55017e3581..b13677d0dc 100644
--- a/plugins/plugin.h
+++ b/plugins/plugin.h
@@ -9,8 +9,8 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#ifndef _PLUGIN_INTERNAL_H_
-#define _PLUGIN_INTERNAL_H_
+#ifndef PLUGIN_INTERNAL_H
+#define PLUGIN_INTERNAL_H
 
 #include <gmodule.h>
 #include "qemu/qht.h"
diff --git a/tests/qtest/fuzz/qos_fuzz.h b/tests/qtest/fuzz/qos_fuzz.h
index 477f11b02b..63d8459b71 100644
--- a/tests/qtest/fuzz/qos_fuzz.h
+++ b/tests/qtest/fuzz/qos_fuzz.h
@@ -10,8 +10,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#ifndef _QOS_FUZZ_H_
-#define _QOS_FUZZ_H_
+#ifndef QOS_FUZZ_H
+#define QOS_FUZZ_H
 
 #include "tests/qtest/fuzz/fuzz.h"
 #include "tests/qtest/libqos/qgraph.h"
diff --git a/tests/tcg/minilib/minilib.h b/tests/tcg/minilib/minilib.h
index e23361380a..17d0f2f314 100644
--- a/tests/tcg/minilib/minilib.h
+++ b/tests/tcg/minilib/minilib.h
@@ -9,8 +9,8 @@
  * SPDX-License-Identifier: GPL-2.0-only
  */
 
-#ifndef _MINILIB_H_
-#define _MINILIB_H_
+#ifndef MINILIB_H
+#define MINILIB_H
 
 /*
  * Provided by the individual arch
-- 
2.25.1


