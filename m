Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmY0N-0003nG-4H
	for mharc-qemu-trivial@gnu.org; Sun, 26 Apr 2015 21:38:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YmY0J-0003f2-A0
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 21:38:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YmY0I-0000Vg-FP
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 21:38:35 -0400
Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229]:35408)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1YmY0F-0000U3-SY; Sun, 26 Apr 2015 21:38:32 -0400
Received: by pdbqd1 with SMTP id qd1so111518256pdb.2;
	Sun, 26 Apr 2015 18:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=peVlPZpchyoUnG09NIe2JqQ1CXtYvhLKcViiVwwnVFk=;
	b=ACmvJ9wHXnimLT1Q4bW6OzInsQ7xgWlpC6IKjA928pOS8MArgGA44fsDoOLQyOXW20
	CWn6anEQfNtLaQ6BiP1aUAMPIqlES8/c4mPa0hokC1rih1lq+z5R6B6/QqxITihnAP5+
	0+zw42IUTwJqiPPlet5kn6Qk6ZNkBJQSy3NjbnrWR4nandTBEBRCeUDP1VTzeXDElgsH
	F1TQbyruHKcjcFPxx/8quotoVhYGoL0QyrUsgVxUaCYiUh4FjLIm/lxzwVxajubNPGWE
	41Oja2lSGAHNplSgKZauOIMnwT3DmPQj1b8TVCYxWWc8OjmwvMnPdCzMueJQRWGGHBm3
	mN6Q==
X-Received: by 10.70.55.199 with SMTP id u7mr17650588pdp.42.1430098711283;
	Sun, 26 Apr 2015 18:38:31 -0700 (PDT)
Received: from pcrost-laptop.hsd1.ca.comcast.net
	(c-24-5-157-48.hsd1.ca.comcast.net. [24.5.157.48])
	by mx.google.com with ESMTPSA id
	bx6sm14872844pdb.39.2015.04.26.18.38.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Apr 2015 18:38:30 -0700 (PDT)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 26 Apr 2015 18:38:19 -0700
Message-Id: <a07c62df4232de834d97e01a981281c68d97fbbc.1430096379.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430096379.git.crosthwaite.peter@gmail.com>
References: <cover.1430096379.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1430096379.git.crosthwaite.peter@gmail.com>
References: <cover.1430096379.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::229
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PATCH target-arm 2/2] arm: cpu.h: Delete unused
	cpu_pc_from_tb()
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
X-List-Received-Date: Mon, 27 Apr 2015 01:38:36 -0000

No code uses the cpu_pc_from_tb() function. Delete.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 target-arm/cpu.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 7069103..c9c5d30 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1874,15 +1874,6 @@ static inline void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
 
 #include "exec/exec-all.h"
 
-static inline void cpu_pc_from_tb(CPUARMState *env, TranslationBlock *tb)
-{
-    if (ARM_TBFLAG_AARCH64_STATE(tb->flags)) {
-        env->pc = tb->pc;
-    } else {
-        env->regs[15] = tb->pc;
-    }
-}
-
 enum {
     QEMU_PSCI_CONDUIT_DISABLED = 0,
     QEMU_PSCI_CONDUIT_SMC = 1,
-- 
1.9.1


