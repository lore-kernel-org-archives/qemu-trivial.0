Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yt8Ft-0006Dp-TA
	for mharc-qemu-trivial@gnu.org; Fri, 15 May 2015 01:33:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Yt8Fr-0006DF-3I
	for qemu-trivial@nongnu.org; Fri, 15 May 2015 01:33:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Yt8Fn-0007rS-TC
	for qemu-trivial@nongnu.org; Fri, 15 May 2015 01:33:51 -0400
Received: from mail-ig0-x231.google.com ([2607:f8b0:4001:c05::231]:37512)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Yt8Fn-0007rK-N3
	for qemu-trivial@nongnu.org; Fri, 15 May 2015 01:33:47 -0400
Received: by igbsb11 with SMTP id sb11so105543432igb.0
	for <qemu-trivial@nongnu.org>; Thu, 14 May 2015 22:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=uATYGoaMclGjdq5COf5wa7UJRarJzGPHLdRGObzYVjw=;
	b=mErEslZ8CQUlGsCO0I9aZYRLqH0B1D6/qvv2DgSuivMXEfbnuU/3NnpoO0jc9Fa3wW
	Ynmklq8W8bcnb/juejKkdi+gZwAldHlkoDibovhvj4uBpVGXlENw8+ErxjWwIQYB2/+o
	Cgwt7Ul7wyjpXulzPrWs9efa9nyZbZlEiSBNeCr+JIJZNibkGZbJ+HT7x04nIC2ox/9a
	bOVDZOnJJX8BWxrQj+K+3vMkkk3zGVyYpQrAw8eR1cgblyNQAhLUNzsWu326kJg3q0kk
	yUSs0FrPZoPKvXwtUCs26pkZ3MMvdw+sHAgwkr6FIrJnLiBswMb/ITSd3TSjzUG0KSAg
	1H3Q==
X-Received: by 10.42.206.9 with SMTP id fs9mr18537809icb.19.1431668027197;
	Thu, 14 May 2015 22:33:47 -0700 (PDT)
Received: from pcrost-laptop.hsd1.ca.comcast.net
	(c-24-5-157-48.hsd1.ca.comcast.net. [24.5.157.48])
	by mx.google.com with ESMTPSA id j20sm684649igt.16.2015.05.14.22.33.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 May 2015 22:33:46 -0700 (PDT)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.oorg
Date: Thu, 14 May 2015 22:33:39 -0700
Message-Id: <1431668019-6987-1-git-send-email-crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4001:c05::231
Cc: qemu-trivial@nongnu.org, edgari@xilinx.com,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PATCH] microblaze: cpu: Delete MMAP_SHIFT definition
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 15 May 2015 05:33:52 -0000

From: Peter Crosthwaite <crosthwaitepeter@gmail.com>

Just fallback on the default of 12 like other architectures. This
allows changing the system-mode-affecting definition of
TARGET_PAGE_BITS without affecting microblaze linux-user.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 target-microblaze/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target-microblaze/cpu.h b/target-microblaze/cpu.h
index 4ea04ac..d73e1c7 100644
--- a/target-microblaze/cpu.h
+++ b/target-microblaze/cpu.h
@@ -285,7 +285,6 @@ int cpu_mb_signal_handler(int host_signum, void *pinfo,
 
 /* FIXME: MB uses variable pages down to 1K but linux only uses 4k.  */
 #define TARGET_PAGE_BITS 12
-#define MMAP_SHIFT TARGET_PAGE_BITS
 
 #define TARGET_PHYS_ADDR_SPACE_BITS 32
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
-- 
1.9.1


