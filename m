Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V0L-0001vd-6a
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:46:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0I-0001sm-OO
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0G-0003LC-E8
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:06 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:50272)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0B-0003Ir-NQ; Tue, 17 Oct 2017 12:45:59 -0400
Received: by mail-qt0-x242.google.com with SMTP id f15so4900795qtf.7;
	Tue, 17 Oct 2017 09:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZTkofEvEm4lN4E56aFN1R3Z7Y2LlaxOcI2xcwOQWAj8=;
	b=iXtdE+eFtqGJ1t2zEXv+XQ8HC8As/g7mnutZ5W44a1ysEtCJY+SKNhDfd5P7Gdnp5j
	1xRn8h6YqB3kvZhRtmkvq3Gi51e1/n9n5UR9cAR998bNDrcXxTp37mrZx+7TUj6CE6A9
	BpO8wrYAtABKzmAlxukcBGjIKsSTLjGI7Ch/Zwa3zyNinYs1/rreZ4ya1kMj90qUzvcw
	4RRkUsMR8HK5baANxQNpH5cGHnwMxIRVvLC3nKsXkl6CbAwCetC0LK/BT6CoOeKo5nRC
	Ny6gfTz6yf4lxpAnef4UKVHv6DcHChOn6PHsbIhcow6QJuUfmQJrlGFqkHW2x9cZFvpf
	D9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ZTkofEvEm4lN4E56aFN1R3Z7Y2LlaxOcI2xcwOQWAj8=;
	b=CaFl99+XFEs3qO1t1iqAaM0JrHx6vjBOlT+zpcmHwRGJMKY3gXmfaLmAaTB24kfMPN
	v5y6kQ9vY+Ea88GbKAnU3J8L/iKJH+YqtmxoraKgK7lxhiPQHi0knTjUu50GtftILOH6
	SDfxZ2/km9FoQEPTyiZGCA0whQC12vIBDyxbu3wLP/DVsWDyXUz/94n6xblMhUQC1mPa
	AK5KpcyAQmri4kiofwB8Jno2r/GMDHSYz3YJpI1r9g+uNCmhdMGxmeabczfk4Xxg8X7v
	M497wLjaMdbRQHauSr0iBgB0BpWZxp1jp7w34V/bh4nHliV9VOgv5cEdNnCcdrXfa0zt
	wdOQ==
X-Gm-Message-State: AMCzsaWEOzFvi0eHFajNralrf3euFE/2h1N5mVmLCrniiKxLB5nyPTw6
	NyERbSLT9NcHSHmU9eST+PQ=
X-Google-Smtp-Source: ABhQp+RR0ee/lAcwVlDh5DS/vCl2YzAKDA1djFRkxLIV7Sz+YHRDxVFiN7rkq6l+AHzOQQOiP2Oggg==
X-Received: by 10.237.42.97 with SMTP id k30mr21063862qtf.184.1508258759133;
	Tue, 17 Oct 2017 09:45:59 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.45.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:45:58 -0700 (PDT)
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
Date: Tue, 17 Oct 2017 13:43:59 -0300
Message-Id: <20171017164426.25277-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v3 15/42] i386/hax: remove duplicated includes
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
X-List-Received-Date: Tue, 17 Oct 2017 16:46:07 -0000

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


