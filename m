Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmSkv-0007dd-9A
	for mharc-qemu-trivial@gnu.org; Sun, 26 Apr 2015 16:02:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YmRxA-0002Kd-Bd
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 15:10:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YmRx6-0006vZ-RV
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 15:10:56 -0400
Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d]:34754)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1YmRx4-0006v3-Qa; Sun, 26 Apr 2015 15:10:50 -0400
Received: by pdbqa5 with SMTP id qa5so104784732pdb.1;
	Sun, 26 Apr 2015 12:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=srsAR3ptt1XM7APwQYL6PTdE6wI1F2a+5S3tT0CSVeE=;
	b=Erkl2V9etNyIoDhz0Ji2XS2KNJCP75zjV37yHM+Y9Kh5njjAsDvdNROOZsLDoQK0oq
	IvW4FfCgF4SRa+S/71fmIjdCRwGxvY5sm2GzqYDzn4STBOWBYFSpLbKNA61iLua6QciT
	Gf2XJCvPwY23qljHU3loH2RN9W44GePwHqjy8g1FZ8XNDuWunx2N7+zsKqRbkifp+RUf
	iEJ6TQKvuz+DrJeT8Bsjmls+l/T27BHutXTnTkaRZCCwzFHbWPl8AHnmDjq137YOARcx
	vntGtrxoDhg4aFqsLRaVms9tPzA3ZxW4rqPdZ6PH+HXnlho/8NAR0dBFmB1kvosFmEr0
	US4w==
X-Received: by 10.68.87.196 with SMTP id ba4mr4131650pbb.153.1430075450253;
	Sun, 26 Apr 2015 12:10:50 -0700 (PDT)
Received: from pcrost-laptop.hsd1.ca.comcast.net
	(c-24-5-157-48.hsd1.ca.comcast.net. [24.5.157.48])
	by mx.google.com with ESMTPSA id
	ux4sm16997226pbc.61.2015.04.26.12.10.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Apr 2015 12:10:49 -0700 (PDT)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 26 Apr 2015 12:10:24 -0700
Message-Id: <1430075424-25975-7-git-send-email-crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430075424-25975-1-git-send-email-crosthwaite.peter@gmail.com>
References: <1430075424-25975-1-git-send-email-crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22d
X-Mailman-Approved-At: Sun, 26 Apr 2015 16:02:16 -0400
Cc: qemu-trivial@nongnu.org, edgari@xilinx.com,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PATCH microblaze v1 6/6] mb: cpu: delete unused
	cpu_interrupts_enabled
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
X-List-Received-Date: Sun, 26 Apr 2015 19:10:57 -0000

This function is unused. Remove.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 target-microblaze/cpu.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target-microblaze/cpu.h b/target-microblaze/cpu.h
index 6522af7..56d3403 100644
--- a/target-microblaze/cpu.h
+++ b/target-microblaze/cpu.h
@@ -319,11 +319,6 @@ static inline int cpu_mmu_index (CPUMBState *env)
 int mb_cpu_handle_mmu_fault(CPUState *cpu, vaddr address, int rw,
                             int mmu_idx);
 
-static inline int cpu_interrupts_enabled(CPUMBState *env)
-{
-    return env->sregs[SR_MSR] & MSR_IE;
-}
-
 #include "exec/cpu-all.h"
 
 static inline void cpu_get_tb_cpu_state(CPUMBState *env, target_ulong *pc,
-- 
1.9.1


