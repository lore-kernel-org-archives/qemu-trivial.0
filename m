Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ynj41-0007CC-8h
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 03:39:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Ynj3y-00075o-6x
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 03:39:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Ynj3x-0007IT-GF
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 03:39:14 -0400
Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d]:33729)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1Ynj3s-0007Hg-Si; Thu, 30 Apr 2015 03:39:09 -0400
Received: by pacwv17 with SMTP id wv17so52087077pac.0;
	Thu, 30 Apr 2015 00:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UGp5k5RvdwR7U3RKzLYYEli5n70lVjYxyAhQpcyXsTQ=;
	b=JB9+4UZ0D2tW4zZ+K6jz93hQ/nk7QaiEAc8r/Ox6mEiqNUoypsHI0PMIKmEmjzPLQh
	b5wYDILOvsIzOdqc/ddXwSt8F7kiC1AQWDovLLi5Bv2ySFmPbvDoD8gphGsk/mx+nmDT
	XxhCEJFmsHjkzd6GxGSmIfNmdFpullnsoWov17i6Lt7P517to7N4t8LRmdbD+51UELPg
	Bra6wepvuz/ro7NkvOw1lRwSoaLdmJ5ghIXLhvqxc3nwY2up0fQcNbhbxxoO0djq1khQ
	KGfhdRYGRFTzuHLrfAmqjCoatv2lxRkFsjEUBRGMRKI3E/4RgcQMoIxhGuLczpfjf22S
	IzKQ==
X-Received: by 10.66.119.238 with SMTP id kx14mr5851679pab.2.1430379548080;
	Thu, 30 Apr 2015 00:39:08 -0700 (PDT)
Received: from pcrost-laptop.hsd1.ca.comcast.net
	(c-24-5-157-48.hsd1.ca.comcast.net. [24.5.157.48])
	by mx.google.com with ESMTPSA id
	ef15sm1267926pad.38.2015.04.30.00.39.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Apr 2015 00:39:06 -0700 (PDT)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 00:38:52 -0700
Message-Id: <1430379532-7300-1-git-send-email-crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22d
Cc: qemu-trivial@nongnu.org, proljc@gmail.com,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PATCH] openrisc: cpu: Remove unused cpu_get_pc
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
X-List-Received-Date: Thu, 30 Apr 2015 07:39:15 -0000

This function is not used by anything. Remove.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 target-openrisc/cpu.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target-openrisc/cpu.h b/target-openrisc/cpu.h
index b25324b..9e23cd0 100644
--- a/target-openrisc/cpu.h
+++ b/target-openrisc/cpu.h
@@ -415,9 +415,4 @@ static inline int cpu_mmu_index(CPUOpenRISCState *env)
 
 #include "exec/exec-all.h"
 
-static inline target_ulong cpu_get_pc(CPUOpenRISCState *env)
-{
-    return env->pc;
-}
-
 #endif /* CPU_OPENRISC_H */
-- 
1.9.1


