Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SQdMF-0006kH-RD
	for mharc-qemu-trivial@gnu.org; Sat, 05 May 2012 07:41:03 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SQdMC-0006aC-Ie
	for qemu-trivial@nongnu.org; Sat, 05 May 2012 07:41:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SQdMA-0000zo-V2
	for qemu-trivial@nongnu.org; Sat, 05 May 2012 07:41:00 -0400
Received: from cantor2.suse.de ([195.135.220.15]:34719 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1SQdM7-0000z3-QC; Sat, 05 May 2012 07:40:55 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 0A1D499430;
	Sat,  5 May 2012 13:40:53 +0200 (CEST)
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To: qemu-devel@nongnu.org
Date: Sat,  5 May 2012 13:40:47 +0200
Message-Id: <1336218047-8906-1-git-send-email-afaerber@suse.de>
X-Mailer: git-send-email 1.7.7
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Qemu-trivial] [PATCH for-1.1] target-mips: Remove commented-out
	function declaration
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
X-List-Received-Date: Sat, 05 May 2012 11:41:02 -0000

There is no function cpu_mips_get_clock(), so drop it.

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
Cc: Stefan Weil <sw@weilnetz.de>
---
 target-mips/cpu.h |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/target-mips/cpu.h b/target-mips/cpu.h
index c0f8826..44c1152 100644
--- a/target-mips/cpu.h
+++ b/target-mips/cpu.h
@@ -627,7 +627,6 @@ enum {
=20
 int cpu_mips_exec(CPUMIPSState *s);
 CPUMIPSState *cpu_mips_init(const char *cpu_model);
-//~ uint32_t cpu_mips_get_clock (void);
 int cpu_mips_signal_handler(int host_signum, void *pinfo, void *puc);
=20
 /* mips_timer.c */
--=20
1.7.7


