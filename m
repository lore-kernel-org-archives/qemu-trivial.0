Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgif-0002Jh-6a
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:31:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgic-0002GK-9r
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgib-0004dA-5j
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:26 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:43808)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgiY-0004We-VL; Thu, 14 Dec 2017 22:31:23 -0500
Received: by mail-qk0-x241.google.com with SMTP id j207so8863648qke.10;
	Thu, 14 Dec 2017 19:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ud2cfL6BDP/tdlluUdEjOU/Dj1d9b1xVKOh72vNyZ1I=;
	b=obgN4ypQxlNdfgemESlIWekNL/oiQ8+Fv6k2sGobHZa09Czv0fytZzqhIUlFR6rgHo
	vDSpwjDJBEY57RyuVnRe/FIIL/SoTPYOftx5xwfB4B1lWQ+8YhXwN08VebdC1d4ZKrxI
	+xUxNg9DgF2Njr5rv9+i+Xmo0R6XlP4k1WIzi303XMmC7BrvgxnFsk3djRcJcKriBkat
	Yj+zvkvDy4UcIlE5oJzHnq3pc0n+S9JKLQ6hwmRb2gelfQSWK3NUUcKE7efNQIXjGM7p
	ygAfdWkkayZ6zObGo1F5kH5EH4g4koOcOI7qQ/Jzu8A9PVlsxvZOBOl9Muy0BLa2HZC5
	WmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ud2cfL6BDP/tdlluUdEjOU/Dj1d9b1xVKOh72vNyZ1I=;
	b=EWyDOXHiz39Qdi2BJnv+84i9yQXKN25eNArmREKD0iCEhh5eocqz8KitF2kgLBOxFy
	tLZ9swF0e0lmmsF8ZiNZgqw/pcrAgKdoa8PCdsj2mNdNnDo5JvXGo+KbOHiBhnaHTuFG
	I3Mq2a41+1sU6iEzXdw7YodzfhyCJjnBrkYGnJREihg8/po4Lka/XNk6YoJOqlPqecU2
	qwm4Mq44IMf43UP38WMKMWMMOD8Yr9bvaTVnQDVySMKmF93wwz04BbBdrnnie51+sG/5
	q2MJMP7uT+ArWP8J9K0t7kMLofS1Tj51/OI9PSTzbgrFnoNc4/54pBOSHkIW2DVbzVDB
	C8Vw==
X-Gm-Message-State: AKGB3mKxC0u4k/eO7Kr0M+XEX9MR/2+Va6MwcN69scrw+85OQbsTYZV9
	KZgYIGvDgXMGj9unH0doy9c=
X-Google-Smtp-Source: ACJfBosRJ0STErERc94Li5wwUFBrHMevg3w7Zn96RGaGxpvZ+pveJUdTzoh5UiiZWOhgp45FQS20gA==
X-Received: by 10.55.181.66 with SMTP id e63mr19275432qkf.130.1513308682496;
	Thu, 14 Dec 2017 19:31:22 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.31.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:31:22 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Date: Fri, 15 Dec 2017 00:29:47 -0300
Message-Id: <20171215033015.738-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v4 15/43] i386/hax: remove duplicated includes
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
X-List-Received-Date: Fri, 15 Dec 2017 03:31:27 -0000

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
2.15.1


