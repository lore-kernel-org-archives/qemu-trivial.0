Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e03xM-0008Nw-IN
	for mharc-qemu-trivial@gnu.org; Thu, 05 Oct 2017 07:04:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <malbarbo@gmail.com>) id 1e03xG-0008NZ-IO
	for qemu-trivial@nongnu.org; Thu, 05 Oct 2017 07:04:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <malbarbo@gmail.com>) id 1e03xD-0006YL-Ad
	for qemu-trivial@nongnu.org; Thu, 05 Oct 2017 07:04:38 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33335)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <malbarbo@gmail.com>) id 1e03xD-0006YB-7A
	for qemu-trivial@nongnu.org; Thu, 05 Oct 2017 07:04:35 -0400
Received: by mail-qk0-x244.google.com with SMTP id z12so6586713qkb.0
	for <qemu-trivial@nongnu.org>; Thu, 05 Oct 2017 04:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=2bMbqBeUveo+IsgMV+W59vqRkaedJRgEIwsETq9/sMo=;
	b=rL+tNcb9g3WffD9fTxJuQLGVa53mlQgxs7Cr4OSbmS1gxSzjrmXjzuLzqZl+LUXMkc
	AhWm4aLNTz3tsIkdALfbkeftG0r6i52YXhsZVRK+npDPsmY4sUP6bbiLmBodlaj7JORM
	npOEyfgtyAgOXxTek9hS6JgmWImYT/pEjk8AjZ/tXTvUm4FdMnhDyxb/XmaIDQ8G0XEz
	DQqVXGpO/IMAejYtpW6RcZDJz1AZVp9DFtXBGSd7t2ILtdRe42AAgUuR33TSoG4LJYH/
	o1YhhcYYkORJ0fkVKhPfMW/23NH0/as2XJ8DJ/DwmfZme0l7S7uZGhRhUa541Wyux+8P
	RRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=2bMbqBeUveo+IsgMV+W59vqRkaedJRgEIwsETq9/sMo=;
	b=nU/glOeysyHVh26+ytfHOccH7OM18HhBFHQenUhcflaEuEWKmV3fIGIERmy+0bYp1w
	mu/FrQRbev0Cm3FgKEY0z8ThsM4kZhlhNRNrpQeRmem1UczdRXtWU/ij/NZghghE37jp
	Xn+Q27bHgs1ji3MTtPHpnBAcNZMe29dnrvswyvgEJyz1OjC7Zl9WC47wmzuqxYVHrjaf
	ajNSW/+Diuvj/XJPJb5eXwb8zSWUqEnggyZf8S1pURJ8ZL38IqDdZrvQqeNPph7Mo/bm
	TbDPZZGeOv8OttD/yoP7wqR9ORKnkO+dVOTAJbTXdzPCl/Ys3Q2mNuPxWQQU9tA+cdkg
	Xu/A==
X-Gm-Message-State: AMCzsaXdJvqRFtSNyR0qEPhY6BavTGE6tq8CoWxDzRdTz2lDAyOoqbMb
	DtqrSomO1AwuQ/eCyKVOln+w4Q==
X-Google-Smtp-Source: AOwi7QAstUedX+RYrlKqoI+ePl09oPTp6Qsp97hqE7WeWxu1oQQvAZZZ1/eYEECqnjt0hWi8AFYIQQ==
X-Received: by 10.55.217.203 with SMTP id q72mr30734946qkl.245.1507201474278; 
	Thu, 05 Oct 2017 04:04:34 -0700 (PDT)
Received: from localhost.localdomain ([168.181.48.170])
	by smtp.googlemail.com with ESMTPSA id
	d205sm11174575qke.56.2017.10.05.04.04.32
	for <qemu-trivial@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 04:04:33 -0700 (PDT)
From: Marco A L Barbosa <malbarbo@gmail.com>
To: qemu-trivial@nongnu.org
Date: Thu,  5 Oct 2017 08:04:25 -0300
Message-Id: <20171005110425.25522-1-malbarbo@gmail.com>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH] linux-user: Add RNDGETENTCNT ioctl
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
X-List-Received-Date: Thu, 05 Oct 2017 11:04:44 -0000

I'm using qemu with this patch (and another one) to run android ndk
applications.

Signed-off-by: Marco A L Barbosa <malbarbo@gmail.com>
---
 linux-user/ioctls.h       | 2 ++
 linux-user/syscall.c      | 1 +
 linux-user/syscall_defs.h | 4 ++++
 3 files changed, 7 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index e6997ff230..18127288cc 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -173,6 +173,8 @@
   IOCTL(SIOCGSTAMP, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timeval)))
   IOCTL(SIOCGSTAMPNS, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timespec)))
 
+  IOCTL(RNDGETENTCNT, IOC_R, MK_PTR(TYPE_INT))
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
index 40c5027e93..2b27786dae 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1060,6 +1060,10 @@ struct target_pollfd {
 
 #define TARGET_SIOCGIWNAME     0x8B01          /* get name == wireless protocol */
 
+/* From <linux/random.h> */
+
+#define TARGET_RNDGETENTCNT    TARGET_IOR('R', 0x00, int)
+
 /* From <linux/fs.h> */
 
 #define TARGET_BLKROSET   TARGET_IO(0x12,93) /* set device read-only (0 = read-write) */
-- 
2.11.0


