Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fDVlL-0003Tg-PI
	for mharc-qemu-trivial@gnu.org; Tue, 01 May 2018 09:56:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44035)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fDVlJ-0003Qs-DC
	for qemu-trivial@nongnu.org; Tue, 01 May 2018 09:56:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fDVlI-000815-Kw
	for qemu-trivial@nongnu.org; Tue, 01 May 2018 09:56:09 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:47141)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1fDVlC-0007vQ-V3; Tue, 01 May 2018 09:56:03 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue007 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 0M4xAo-1eQd8N3IuU-00zClH; Tue, 01 May 2018 15:55:58 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <huth@tuxfamily.org>, Michael Tokarev <mjt@tls.msk.ru>,
	Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
Date: Tue,  1 May 2018 15:55:44 +0200
Message-Id: <20180501135547.12414-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180501135547.12414-1-laurent@vivier.eu>
References: <20180501135547.12414-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:gO8KtUgiDaXaomxdHb/T6sq2AA1u8rkvM3YpB+k1jTmB9u/lFah
	lIVgm8FJmLmrtpjpfZcr9LvdAm05Q1r5GgYJSpIEhlqNiIWZCYZFPFebyuaE4p0EJ6dqeDC
	J9aa7HCRIq8mB6SFQdJTJKTqPcbZug4dnPhPkwQuiYdPjyeD1WyQMuFGn52k1c61ezQuC+x
	LSqeYSpl0Egf4Ao9QB3Zg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:qtpq9Cqa/mw=:3DDnD4txp7IdAfy6ADtzXg
	HJsHRIz5JV5B7df+JZpPkNwXymljA+BlJPIqTElE2saYv7tiMXLFNO1OAeh2cWYKhrk5p/dGj
	8GoI5PNAwlpQvrKYVDGUJPhVRjVtl1juG9Ub34l9uEcfnozUdnQWgMYIvtUKq25CsV7sa6tRf
	Uo3Rs8mXOmQqC0koayBvFckucG7lVbFOxTs1swdm/P5CT/fZf2g1/4CttKgW6ZpuTGWcHcifP
	qr55WIGmNM8I5bLZsQKrb0XMxWevTrgZJERGdvL55JUDwTAuDy8DybxNgUEhGyI5+5p2P5qOe
	x6z0SWAdqamSNGO7m+YTXNIOzMpZPA0m/WxnWqb/DcGSmXkzWYKmOZjgOPo+1WM0KDmqr+BnX
	YRU8FkRQUmh+bF8w44AbXprnnacE33RZjrYGE2uE5rD/4IpPMagwCReQ2Tq3HLGdbgeasHMlf
	OpzHNlTXl/5s7PVOV50S1joU5Ja48Fs3xRiueqT8YrN0h9NFrwPr5hsQ3f09/vC5J1lFuKWi4
	Xb0O2hD9zaAeFASIgv3wa6nlZqF/3xaj8UcD9KIM5N9ZmDQtAt9XUeiUZxgChZ9YXqY9XzZUW
	fVKsNr/PEov7J1f13/LqM7l6zOXuVV/rZJ5G1MDh8QVzr48X027gsff59GqvX7z0DiSzxwTyU
	fORhh103g8SkTkyfeRNpx47hu9XUSvylw+0BkFTJQvgRKQ31RkEyyPOyb0Cn1hiEMoEQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL 1/4] m68k: fix subx mem, mem instruction
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
X-List-Received-Date: Tue, 01 May 2018 13:56:10 -0000

From: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>

This patch fixes decrement of the pointers for subx mem, mem instructions.
Without the patch pointers are decremented by OS_* constant value instead of
retrieving the corresponding data size and using it as a decrement.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20180418064152.24606.71975.stgit@pasha-VirtualBox>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 6beaf9ed66..e407ba2db3 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -3166,11 +3166,11 @@ DISAS_INSN(subx_mem)
     opsize = insn_opsize(insn);
 
     addr_src = AREG(insn, 0);
-    tcg_gen_subi_i32(addr_src, addr_src, opsize);
+    tcg_gen_subi_i32(addr_src, addr_src, opsize_bytes(opsize));
     src = gen_load(s, opsize, addr_src, 1, IS_USER(s));
 
     addr_dest = AREG(insn, 9);
-    tcg_gen_subi_i32(addr_dest, addr_dest, opsize);
+    tcg_gen_subi_i32(addr_dest, addr_dest, opsize_bytes(opsize));
     dest = gen_load(s, opsize, addr_dest, 1, IS_USER(s));
 
     gen_subx(s, src, dest, opsize);
-- 
2.14.3


