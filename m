Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FVY-0006LH-Te
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:13:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVW-0006IL-9r
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVV-00047J-C8
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:18 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:50945)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVR-00043z-4r; Mon, 16 Oct 2017 20:13:13 -0400
Received: by mail-qt0-x244.google.com with SMTP id f15so53563qtf.7;
	Mon, 16 Oct 2017 17:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZTkofEvEm4lN4E56aFN1R3Z7Y2LlaxOcI2xcwOQWAj8=;
	b=kZGx1lW2rCfVD9zq9WiE5sI3LDrRywc+5qMfPBUsfT/+Uva67mnTayUbTab3VmLkLm
	Iv9MWfWv3eHvgxCnW8lrx8CSLbFbIZ6PIx3yU7/ayKsE2sxVNWfQgVNyE2HsXrc47PaG
	lqeJzR443FtAyzCs1saXWJ/yY3OZstV/FRva8RrKczR8ZBb1F9juZDG7Q7AnUmGPd+cO
	DAxjJlhU4QBJIIDz0j66kcY8acKiTwz4Z/KZViuB/bEd1gfG6mcuQg2egkJtZtozG/ei
	9o4dqSOha3FDMXR5/rcGSPjFBVWfqtCZ2Vz/cFDI2fKu/FnGl6TK/YOFyQdbufNnMx6U
	WqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ZTkofEvEm4lN4E56aFN1R3Z7Y2LlaxOcI2xcwOQWAj8=;
	b=CNUUhiYPg8XChfTVqd2Xk5JiuEaNUS9WpTOIIAO33zSBbeYn5GFHYKx9hR9H4bXVsG
	9B1VlpxDCge6woFjzTy4ZBsmkNRBbZP33JAF13EUDODozWTyZ+i2C9YlR7dLzx0TzDPk
	+LHXSBXJ6IF/1ZnyXh8d8kgHkjzxRBtw8wcASQeEdjoc5OUJMEf3DcODh6axJZ+8zOAk
	xPZ/Q+9De6GnRE2+7gMeMf9bMirFw7Vlvn6HQM8MzXN9nvsauWn4Q4tgk6KVJfAljm0I
	fO8KbwNFfqC/+cZ7SWqdcRd8+JhjQNdMblYmE/b+VSBeB8Mmf+lKM78m9nHaa1BHpAgv
	Oiog==
X-Gm-Message-State: AMCzsaUbywseIOd91ZJ1hPV/zRE0rf7DWnQSjIj+EeOpwS9y4LhH2ZNv
	6nEB1v7rUBI3hpNDGSAiBh0=
X-Google-Smtp-Source: ABhQp+TxG34H3UIH4agpb6BwR+lCTielPedhJhS3XSC3lbCMDOBwnwcJshwnqoJ8gmtf2Z/KHu15Jg==
X-Received: by 10.200.41.90 with SMTP id z26mr14449245qtz.47.1508199192778;
	Mon, 16 Oct 2017 17:13:12 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.13.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:13:12 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
	Yu Ning <yu.ning@linux.intel.com>, Vincent Palatin <vpalatin@chromium.org>,
	Corey Minyard <cminyard@mvista.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:44 -0300
Message-Id: <20171017001209.32276-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v2 14/39] i386/hax: remove duplicated includes
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
X-List-Received-Date: Tue, 17 Oct 2017 00:13:19 -0000

applied using ./scripts/clean-includes

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/sysemu/hax.h      | 1 -
 target/i386/hax-darwin.h  | 3 ---
 target/i386/hax-windows.h | 2 --
 target/i386/hax-darwin.c  | 6 +-----
 4 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/include/sysemu/hax.h b/include/sysemu/hax.h
index 232a68ab1b..f252399623 100644
--- a/include/sysemu/hax.h
+++ b/include/sysemu/hax.h
@@ -22,7 +22,6 @@
 #ifndef QEMU_HAX_H
 #define QEMU_HAX_H
 
-#include "config-host.h"
 #include "qemu-common.h"
 
 int hax_sync_vcpus(void);
diff --git a/target/i386/hax-darwin.h b/target/i386/hax-darwin.h
index 0c0968b77d..fb8e25a096 100644
--- a/target/i386/hax-darwin.h
+++ b/target/i386/hax-darwin.h
@@ -15,10 +15,7 @@
 #ifndef TARGET_I386_HAX_DARWIN_H
 #define TARGET_I386_HAX_DARWIN_H
 
-#include <sys/types.h>
 #include <sys/ioctl.h>
-#include <sys/mman.h>
-#include <stdarg.h>
 
 #define HAX_INVALID_FD  (-1)
 static inline int hax_invalid_fd(hax_fd fd)
diff --git a/target/i386/hax-windows.h b/target/i386/hax-windows.h
index 1d8f68de91..f7c3e99246 100644
--- a/target/i386/hax-windows.h
+++ b/target/i386/hax-windows.h
@@ -24,8 +24,6 @@
 #include <memory.h>
 #include <malloc.h>
 #include <winioctl.h>
-#include <string.h>
-#include <stdio.h>
 #include <windef.h>
 
 #define HAX_INVALID_FD INVALID_HANDLE_VALUE
diff --git a/target/i386/hax-darwin.c b/target/i386/hax-darwin.c
index 1c5bbd0a2d..ee9417454c 100644
--- a/target/i386/hax-darwin.c
+++ b/target/i386/hax-darwin.c
@@ -11,13 +11,9 @@
  */
 
 /* HAX module interface - darwin version */
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <errno.h>
+#include "qemu/osdep.h"
 #include <sys/ioctl.h>
 
-#include "qemu/osdep.h"
 #include "target/i386/hax-i386.h"
 
 hax_fd hax_mod_open(void)
-- 
2.15.0.rc0


