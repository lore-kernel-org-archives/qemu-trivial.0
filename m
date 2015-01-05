Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y8EU4-0000LW-FK
	for mharc-qemu-trivial@gnu.org; Mon, 05 Jan 2015 15:42:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmorrison@invlim.com>) id 1Y8EU1-0000Fw-Uk
	for qemu-trivial@nongnu.org; Mon, 05 Jan 2015 15:42:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dmorrison@invlim.com>) id 1Y8EU0-0008JR-HU
	for qemu-trivial@nongnu.org; Mon, 05 Jan 2015 15:42:37 -0500
Received: from fofx.invlim.com ([71.6.153.225]:52171)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmorrison@invlim.com>)
	id 1Y8ETw-0008Ie-27; Mon, 05 Jan 2015 15:42:32 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by fofx.invlim.com (Postfix) with ESMTP id 7DC50248288;
	Mon,  5 Jan 2015 12:32:25 -0800 (PST)
X-Virus-Scanned: amavisd-new at example.com
Received: from fofx.invlim.com ([127.0.0.1])
	by localhost (fofx.invlim.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2vZ09-6YnaSH; Mon,  5 Jan 2015 12:32:24 -0800 (PST)
Received: from monster337-linux.localdomain (unknown [10.240.0.46])
	by fofx.invlim.com (Postfix) with ESMTP id BF0B8248286;
	Mon,  5 Jan 2015 12:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=invlim.com;
	s=default; t=1420489944;
	bh=siNrA+6aQYO+SPG4CbKF92F3i52hUVdLREGGLQ7rUJA=;
	h=From:To:Cc:Subject:Date;
	b=DXD9PAUogMRU1WYyD/DXSl5H7S6qjYC1kIEnwXK/LvBBoIQ2DZkcEuYNWvbzWDJq2
	cPuZl9s2zAvNYWjx/SyVSaiLKb3aKRfFDlOBP34dGwn8EEZq3sRZE3M+rSBlhjqN//
	gmPhXdG8lhKQTJjRMezi3j6MzO9bbWJoy8Vz1lGQ=
From: David Morrison <dmorrison@invlim.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, proljc@gmail.com,
	peter.maydell@linaro.org
Date: Mon,  5 Jan 2015 12:42:06 -0800
Message-Id: <1420490526-6997-1-git-send-email-dmorrison@invlim.com>
X-Mailer: git-send-email 2.2.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 71.6.153.225
Cc: David Morrison <dmorrison@invlim.com>
Subject: [Qemu-trivial] [PATCH] target-openrisc: bugfix for dec_sys to
	decode instructions correctly
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
X-List-Received-Date: Mon, 05 Jan 2015 20:42:38 -0000

Fixed the decoding of "system" instructions (starting with 0x2)
in dec_sys() in translate.c.  In particular, the l.trap instruction
is now correctly decoded, which enables for singlestepping and
breakpoints to be set in GDB.
---
 target-openrisc/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-openrisc/translate.c b/target-openrisc/translate.c
index 407bd97..d36278f 100644
--- a/target-openrisc/translate.c
+++ b/target-openrisc/translate.c
@@ -1320,7 +1320,7 @@ static void dec_sys(DisasContext *dc, uint32_t insn)
 #ifdef OPENRISC_DISAS
     uint32_t K16;
 #endif
-    op0 = extract32(insn, 16, 8);
+    op0 = extract32(insn, 16, 10);
 #ifdef OPENRISC_DISAS
     K16 = extract32(insn, 0, 16);
 #endif
-- 
2.2.1


