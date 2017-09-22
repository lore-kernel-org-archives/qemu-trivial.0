Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQ4f-0004dB-Tq
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 11:41:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4d-0004a6-9l
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4c-0003Bg-AM
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:03 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:34159)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4X-000394-R8; Fri, 22 Sep 2017 11:40:57 -0400
Received: by mail-qt0-x244.google.com with SMTP id q8so891231qtb.1;
	Fri, 22 Sep 2017 08:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/GsZPzAQSV9WLZFoszDzAxGfHJtoqzJiRa5WqWPVRFA=;
	b=Oe/TMG3selt2lv/HFMHUGO6kniSgT3G1MPptuYjH5J8cZp6Fpn4xrHlfbyELgfc/21
	hqjfuK74mZTfMNpkn6+T1gEiPvM9o/QZA20qOOTWxPdw8q3wCCeutHhAmoW0IpjKiS19
	3s5qKcTP7GJUiLYzhiTPH+dNa9d9/B03gds0/hQZH7dUkSsFjgAnhmPt2dXVY3fssZlF
	S/oogZcTL2OGzVujfqWcKojcgonsWW6khvAvllHplxA4ojm2kF4AS7BI4+K8SiFtArQ6
	jq8ARAcIP9rQ6uJum4c0WgPTYRxj6OSEYr9ilkfbj1Ztk+Cwd0qmIKPSmi6+QOr2vUx5
	5Y9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=/GsZPzAQSV9WLZFoszDzAxGfHJtoqzJiRa5WqWPVRFA=;
	b=hP85xI1Nkrqa2x/gZDaDX63zmJPZUUcP+VhDhJbTv9xWs8VefykXtnNjnYOYWyUrjJ
	DIOwYPPXAfY0687tRf8Alyu9nEHP3RaR0v+0zLhpCQe+wmF5fLq9ON3koyDgYgbBmqxY
	ZyBI2R75Rhi3t9VMsNiV8bByuXQ4i5a/3kqR7IX0x0PVDI8Ay+ECnnUlRWuCRwI1TX8o
	OarkCbMwRHiXNSf1AVZxWk13hzx2qEOGHSiyKH2iFkQXp5fMOQlS5NrdtzUx4+5WbmAj
	trywnhEW8rCz0EJAdov8fikoNaka7XAt+kiNbWR5lekv6u/7zFK/38lhyWk4jfZOex0i
	kyJg==
X-Gm-Message-State: AHPjjUhZZ/7v4RH6XjZiDcWHnKoFTl2DNfVUUlEXgjs50WD8aO50hXk8
	FzjjVQ/EDOCrzpbQVf2PKcI=
X-Google-Smtp-Source: AOwi7QD0em1woJtyilNEr/YinN6h/sUXrHPi7Ho+3R6ouhdv3aFMHzykQkzROMjADEA7dOr/o30Izg==
X-Received: by 10.200.27.235 with SMTP id m40mr9096505qtk.228.1506094857224;
	Fri, 22 Sep 2017 08:40:57 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id z75sm71742qkb.71.2017.09.22.08.40.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 08:40:56 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Yu Ning <yu.ning@linux.intel.com>,
	Vincent Palatin <vpalatin@chromium.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 12:39:47 -0300
Message-Id: <20170922154014.29350-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 07/34] i386/hax: remove duplicated includes
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
X-List-Received-Date: Fri, 22 Sep 2017 15:41:04 -0000

applied using ./scripts/clean-includes

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/hax.h      | 1 -
 target/i386/hax-darwin.h  | 3 ---
 target/i386/hax-windows.h | 2 --
 target/i386/hax-darwin.c  | 8 ++------
 4 files changed, 2 insertions(+), 12 deletions(-)

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
-#include <sys/ioctl.h>
-
 #include "qemu/osdep.h"
+#include <sys/ioctl.h>
+
 #include "target/i386/hax-i386.h"
 
 hax_fd hax_mod_open(void)
-- 
2.14.1


