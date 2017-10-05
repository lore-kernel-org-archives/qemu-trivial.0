Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e06cx-0002rh-Jg
	for mharc-qemu-trivial@gnu.org; Thu, 05 Oct 2017 09:55:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <malbarbo@gmail.com>) id 1e06cr-0002mT-46
	for qemu-trivial@nongnu.org; Thu, 05 Oct 2017 09:55:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <malbarbo@gmail.com>) id 1e06cn-0003pl-Ft
	for qemu-trivial@nongnu.org; Thu, 05 Oct 2017 09:55:45 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:34297)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <malbarbo@gmail.com>) id 1e06cn-0003pK-C4
	for qemu-trivial@nongnu.org; Thu, 05 Oct 2017 09:55:41 -0400
Received: by mail-qk0-x241.google.com with SMTP id b124so7427830qke.1
	for <qemu-trivial@nongnu.org>; Thu, 05 Oct 2017 06:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=2gMevbE/C9bhtM8ndBBvT72fTz/3/Lz1vEZPIis37Bo=;
	b=WwIIEaYbljbvo0k1awaZNRK8RhSmgcocpBYQeJYXWgyIxb1/fz3D2eIWf8u5j8SiQL
	3PHIegMl1nxtT3M8+U3gEhQ6nYfDYrEKjxNn8ABUBJnL20bSOkiMVydjQ1X0vLEE1Gql
	jjQvwg+CEzBPZvq2NUVlFq6CjU+kS5li28Uq2hTz57GAJykj0Sg7p0eeJyzUa1qOTQlw
	Yh0B5b/cdSl3DrWQDdV8qAGERoegrgt3wzFAM2bNvagMGaZl9d7hVE5k9fAzCDbCR2h9
	weoDvqDRH/i/2AdgJc8LSsuYPRyc2rpu88bWsiOtqKzTmEkzeHhchSN7O0Ges3Y1Ors6
	AyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=2gMevbE/C9bhtM8ndBBvT72fTz/3/Lz1vEZPIis37Bo=;
	b=BACWoBMBfOqLxUXMDgXJuHMx6KytIMz+ie3PIqdauD0SKFC4MyGXjaZ+5FW/mrg5jv
	1IshnMqMnTjmQI4sxLcDJ409H1nzhFXabt872BMZpj1W+w89nK9F1eQp1MkRUMQjv9tQ
	ToSaQoaR85HHcAm4GHDMKTVXUWS5gwIUnajVfqhfeX+66nZlLy4/4TPf8zJwE0RseRs3
	CURjjxgJYtwejMb7aecRhGIC/8XiLmeniBf62OmtwmJujgHBBGtUhcfbpg6H0i2etEB/
	2FYto7AFk4nTo25EGwGT53etDQENBlDqV5+Kf8bNwX0rYvEYsIrl/JCdcfkjxW9ZZYkD
	OG4g==
X-Gm-Message-State: AMCzsaWMnx6B2n+hHqoMKJO+h27pHO6DLLR15l29vDHcJ4V7SNeCtuWN
	Kb3XRJgjrBw3/EuJ9VX7CcHISw==
X-Google-Smtp-Source: AOwi7QA61KYo/wSE88KQpg2a+f3j137kYRb9DN58XPwiFhuyIABhCP3pDjVNTBHQTOQ5awp0aTerUg==
X-Received: by 10.55.217.203 with SMTP id q72mr31505621qkl.245.1507211740238; 
	Thu, 05 Oct 2017 06:55:40 -0700 (PDT)
Received: from localhost.localdomain ([168.181.48.170])
	by smtp.googlemail.com with ESMTPSA id
	x39sm8057638qtc.56.2017.10.05.06.55.38 for <qemu-trivial@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 06:55:39 -0700 (PDT)
From: Marco A L Barbosa <malbarbo@gmail.com>
To: qemu-trivial@nongnu.org
Date: Thu,  5 Oct 2017 10:55:30 -0300
Message-Id: <20171005135530.837-1-malbarbo@gmail.com>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH] linux-user: Add some random ioctls
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
X-List-Received-Date: Thu, 05 Oct 2017 13:55:49 -0000

Signed-off-by: Marco A L Barbosa <malbarbo@gmail.com>
---
 linux-user/ioctls.h       | 5 +++++
 linux-user/syscall.c      | 1 +
 linux-user/syscall_defs.h | 7 +++++++
 3 files changed, 13 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index e6997ff230..35cad6f944 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -173,6 +173,11 @@
   IOCTL(SIOCGSTAMP, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timeval)))
   IOCTL(SIOCGSTAMPNS, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timespec)))
 
+  IOCTL(RNDGETENTCNT, IOC_R, MK_PTR(TYPE_INT))
+  IOCTL(RNDADDTOENTCNT, IOC_W, MK_PTR(TYPE_INT))
+  IOCTL(RNDZAPENTCNT, 0, TYPE_NULL)
+  IOCTL(RNDCLEARPOOL, 0, TYPE_NULL)
+
   IOCTL(CDROMPAUSE, 0, TYPE_NULL)
   IOCTL(CDROMSTART, 0, TYPE_NULL)
   IOCTL(CDROMSTOP, 0, TYPE_NULL)
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 9b6364a266..d4c21a557c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -59,6 +59,7 @@ int __clone2(int (*fn)(void *), void *child_stack_base,
 #include <linux/icmp.h>
 #include <linux/icmpv6.h>
 #include <linux/errqueue.h>
+#include <linux/random.h>
 #include "qemu-common.h"
 #ifdef CONFIG_TIMERFD
 #include <sys/timerfd.h>
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 40c5027e93..b3d55e35ac 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1060,6 +1060,13 @@ struct target_pollfd {
 
 #define TARGET_SIOCGIWNAME     0x8B01          /* get name == wireless protocol */
 
+/* From <linux/random.h> */
+
+#define TARGET_RNDGETENTCNT    TARGET_IOR('R', 0x00, int)
+#define TARGET_RNDADDTOENTCNT  TARGET_IOW('R', 0x01, int)
+#define TARGET_RNDZAPENTCNT    TARGET_IO('R', 0x04)
+#define TARGET_RNDCLEARPOOL    TARGET_IO('R', 0x06)
+
 /* From <linux/fs.h> */
 
 #define TARGET_BLKROSET   TARGET_IO(0x12,93) /* set device read-only (0 = read-write) */
-- 
2.11.0


