Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y8XaW-0005RL-WA
	for mharc-qemu-trivial@gnu.org; Tue, 06 Jan 2015 12:06:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39466)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmorrison@invlim.com>) id 1Y8XaU-0005Oa-CP
	for qemu-trivial@nongnu.org; Tue, 06 Jan 2015 12:06:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dmorrison@invlim.com>) id 1Y8XaT-0006Te-Hd
	for qemu-trivial@nongnu.org; Tue, 06 Jan 2015 12:06:34 -0500
Received: from fofx.invlim.com ([71.6.153.225]:52381)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmorrison@invlim.com>)
	id 1Y8XaN-0006Qb-VF; Tue, 06 Jan 2015 12:06:28 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by fofx.invlim.com (Postfix) with ESMTP id 172AF248288;
	Tue,  6 Jan 2015 08:56:20 -0800 (PST)
X-Virus-Scanned: amavisd-new at example.com
Received: from fofx.invlim.com ([127.0.0.1])
	by localhost (fofx.invlim.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jN0-PWGt3TAp; Tue,  6 Jan 2015 08:56:18 -0800 (PST)
Received: from monster337-linux.localdomain (unknown [10.240.0.46])
	by fofx.invlim.com (Postfix) with ESMTP id DC7B324827F;
	Tue,  6 Jan 2015 08:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=invlim.com;
	s=default; t=1420563378;
	bh=a8D5+mTW2Br/COLZF8C0O4haBN8KM+1huP0LqX7Iqqc=;
	h=From:To:Cc:Subject:Date;
	b=QDK+yjXLbOGz3cTS+BA2HuRWlbqewHhfxUb7KSst8ALb3lulYoxLqd2BgdR9vYOJs
	i46SV/TqbbLgvkbTDOISoYwXXbc2+nDe1IvsPmUaqQF9bwLOMLkguEZYNk0po8QK37
	aC5Z31q23PFdrYPixprqZeU+5ayHs/hb3FODGtG8=
From: David Morrison <dmorrison@invlim.com>
To: famz@redhat.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	proljc@gmail.com, peter.maydell@linaro.org
Date: Tue,  6 Jan 2015 09:06:18 -0800
Message-Id: <1420563978-19101-1-git-send-email-dmorrison@invlim.com>
X-Mailer: git-send-email 2.2.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 71.6.153.225
Cc: David Morrison <dmorrison@invlim.com>
Subject: [Qemu-trivial] [PATCH v2] target-openrisc: bugfix for dec_sys to
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
X-List-Received-Date: Tue, 06 Jan 2015 17:06:35 -0000

Fixed the decoding of "system" instructions (starting with 0x2)
in dec_sys() in translate.c.  In particular, the l.trap instruction
is now correctly decoded, which enables for singlestepping and
breakpoints to be set in GDB.

Signed-off-by: David R. Morrison <dmorrison@invlim.com>
---
 target-openrisc/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Changes since previous version:
  * Added 'signed-off-by' line; sorry to forget this before!

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


