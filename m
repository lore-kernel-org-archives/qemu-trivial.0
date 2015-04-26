Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmSku-0007at-7N
	for mharc-qemu-trivial@gnu.org; Sun, 26 Apr 2015 16:02:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YmRx2-00023C-99
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 15:10:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YmRx1-0006ts-GL
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 15:10:48 -0400
Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f]:35403)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1YmRwz-0006sX-Fc; Sun, 26 Apr 2015 15:10:45 -0400
Received: by pabtp1 with SMTP id tp1so105432589pab.2;
	Sun, 26 Apr 2015 12:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xgKhn8ifnAwCXsI7m3c30CqPT/VH1NT3nmMh2ZxDCUc=;
	b=FQ/h++D9rBKDDtf5sMyYDfd5f7PQjwP0Lq7gCpvZmgHuKZDmciabZkDNhpMPvNsK6W
	dd9jeX7/+6gqC4fSgtAEGvVTnBhXq+YT1tUNKud0mK0PCS5qHy9Z1X8OyWfxMZzTqHKK
	88lEm+vCLE8LJnArZjvr8TXNqcGpAyEA+R5FZbud1YSE0CLV3LUHbNlTL5DKqY3YryJc
	a9NYtVEHKlp36bhLbfcxD6K+mNa2nGMQ9eZIlBGPuOOWZFs37Go76ossLcjG/xaso950
	M5IVDwC5fWHe/5X2SgGpLe7MQxWKrG/w59i8W9FItP++KNQ2WIWW4LUWQDY4boNS6NJS
	5uMw==
X-Received: by 10.68.210.46 with SMTP id mr14mr15589162pbc.73.1430075444571;
	Sun, 26 Apr 2015 12:10:44 -0700 (PDT)
Received: from pcrost-laptop.hsd1.ca.comcast.net
	(c-24-5-157-48.hsd1.ca.comcast.net. [24.5.157.48])
	by mx.google.com with ESMTPSA id
	ux4sm16997226pbc.61.2015.04.26.12.10.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Apr 2015 12:10:43 -0700 (PDT)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 26 Apr 2015 12:10:21 -0700
Message-Id: <1430075424-25975-4-git-send-email-crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430075424-25975-1-git-send-email-crosthwaite.peter@gmail.com>
References: <1430075424-25975-1-git-send-email-crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22f
X-Mailman-Approved-At: Sun, 26 Apr 2015 16:02:16 -0400
Cc: qemu-trivial@nongnu.org, edgari@xilinx.com,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PATCH microblaze v1 3/6] mb: cpu: Remote unused
	cpu_get_pc
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
X-List-Received-Date: Sun, 26 Apr 2015 19:10:49 -0000

This function is not used by anything. Remove.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 target-microblaze/cpu.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target-microblaze/cpu.h b/target-microblaze/cpu.h
index 7d06227..2c18b49 100644
--- a/target-microblaze/cpu.h
+++ b/target-microblaze/cpu.h
@@ -333,11 +333,6 @@ static inline int cpu_interrupts_enabled(CPUMBState *env)
 
 #include "exec/cpu-all.h"
 
-static inline target_ulong cpu_get_pc(CPUMBState *env)
-{
-    return env->sregs[SR_PC];
-}
-
 static inline void cpu_get_tb_cpu_state(CPUMBState *env, target_ulong *pc,
                                         target_ulong *cs_base, int *flags)
 {
-- 
1.9.1


