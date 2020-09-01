Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kD6zK-0005PG-49
	for mharc-qemu-trivial@gnu.org; Tue, 01 Sep 2020 10:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kD6zG-0005FU-FA; Tue, 01 Sep 2020 10:10:14 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:49511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kD6zD-0003kv-Ck; Tue, 01 Sep 2020 10:10:14 -0400
Received: from localhost.localdomain ([82.252.135.186]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MyseA-1kYbuO0Vko-00vzY7; Tue, 01 Sep 2020 16:10:06 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>
Subject: [PULL 13/44] stubs/cmos: Use correct include
Date: Tue,  1 Sep 2020 16:09:23 +0200
Message-Id: <20200901140954.889743-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901140954.889743-1-laurent@vivier.eu>
References: <20200901140954.889743-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dS20v3gw2u2mvJ4hZkS/ZTB7063+qvvt1jXg6HhuBk2JPnF3+RB
 8sjbueW+jPeuKyTAVWgpNloTrtJ1ocBy7hKQjczZt44JafwLl/l8pLoXu/cseaa8N0SGZAF
 K6naJDOMnj3Pb/4CmOZsslC+UYKt/Tc2224O/bOa3kK7khbd7jlZF4IEIyfwYW2I7AVr0MY
 Y1zoE/w5/j/9iFUWv1zyA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wYgD4GoZcuU=:9zM3pFHSZ7J6EkcLFwQnQj
 NlL1BiPLP8tBj3m2QYeh8tnr+tmiBoJvt456nmBnojNOcJsA8PSZ7voTk7ohvC/hRWcAyg2sK
 OnKwzVHmkXQHqUOChdbRHU8D4IOdEYZInhyRj4bFqoM/MtSE91gICtfUHIrqA9wIsVho1RcpT
 WitmRXET3IVDQAXptC+LXi9jXH/tcqGTHM24QzJmKrRyBFB8JhGYKhpz+jhM2rgOipkSwaI5m
 iCAq+4ZwCKe3eA7qbFVLsFUJq9dSEZeVFk3r+VugwnLM3pxyyt3Y5kvTyJ7eW/xZ2fR8k43R7
 vAbT7h2ESHWn5hRZ8Zop1wOEmWuK0oihOP+Eon/4tSpKkukkzh7y39pgltN0XJSwaqkDfVJAs
 Irt78zkeu+zNW7Y14950Zp3ErzyfUeahy2SqFhKQgNBg2/78IgXsFneEgxmBS5lWKYNKtsI0I
 /5yynxqxq4aEF8lQMd8zuVWtW+JCIvWwk0yTcG9m/2eGrdNzCMcts13DQYY3JSUhghtMd0xVz
 iWbw/+8h+b/V5nh5pflFLHrS3yhxEPQX57RgbCBDM3wWamaa8T2F7/vZ4bOrF4Xf4D17kIN/X
 08VdC7T069L8NJY9p6n0pLHsLsjc1FPnATEHL5B+slS7E7WSuK24ijNYogoy5Hxo7ssFcGhR9
 PvrX4KPpv7AEqj5pNGHEBITAzcv2dZJWag3xzfrxhqSj31tfHuOYSLoTHXoFfWFFnUq3YyJ5i
 TLrOULmHxtTjb51goLrSOzdvo+e+MHy7c+z9LKmZ0e8+t1T5cnhXAsNDaCz2yFRQ/CnvGBsml
 JvtbiwqU2S3wjVFFYrcJ3+JOmn5mxSU0R43dCpq85zeksCy40HNhoXirUmXhK75WIGGMtbl
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 10:10:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 01 Sep 2020 14:10:15 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

cmos_get_fd_drive_type() is declared in "hw/block/fdc.h".
This currently works because "hw/i386/pc.h" happens to
include it. Simplify including the correct header.

Fixes: 2055dbc1c9 ("acpi: move aml builder code for floppy device")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-Id: <20200724084315.1606-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 stubs/cmos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubs/cmos.c b/stubs/cmos.c
index 416cbe4055ff..3fdbae2c69e8 100644
--- a/stubs/cmos.c
+++ b/stubs/cmos.c
@@ -1,5 +1,5 @@
 #include "qemu/osdep.h"
-#include "hw/i386/pc.h"
+#include "hw/block/fdc.h"
 
 int cmos_get_fd_drive_type(FloppyDriveType fd0)
 {
-- 
2.26.2


