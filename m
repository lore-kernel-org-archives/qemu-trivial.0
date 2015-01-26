Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFhb4-0004pP-Ik
	for mharc-qemu-trivial@gnu.org; Mon, 26 Jan 2015 06:12:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YFhb0-0004jr-Kd
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 06:12:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YFhay-0001aZ-SN
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 06:12:42 -0500
Received: from mail-wg0-x233.google.com ([2a00:1450:400c:c00::233]:40673)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YFhav-0001Rj-3q; Mon, 26 Jan 2015 06:12:37 -0500
Received: by mail-wg0-f51.google.com with SMTP id k14so8312389wgh.10;
	Mon, 26 Jan 2015 03:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UekadpKl+OoAbrnijcGb/AFNKfVQbMzz4YN4O7eCxCI=;
	b=sjrsu4o6KCwQespBx1fXKzoGAHRaYuueF9OgMx6J2uASxb1Y2Mzpx3+4ZGZScZX2xd
	qt5Oc51HKDyr3WsOMpvlwvzN4T8ZkFCtE0Eur1x1YEoNb81eK0D4EtqUw2bpbmFa6n7h
	JyYdUzBwf4oRtAL6j+DoStNZF+mbZ2UVKWCvMB/AA9ppIeSZTuLlU/l+U4Frk+oOX+iV
	qnpRlXpuYbWHHW8C9ObToROBw3hTSPVFoVBwsUNL8oHmmu9m34eeymYv0k7/XBZoEl7z
	WDVBLVXx2MBndp/vxexqxtOXAKaKBNp7nnnKXprxh+r7llPr6Qdloxbwrqd4JUP/1MUW
	RJ7A==
X-Received: by 10.194.63.206 with SMTP id i14mr43379283wjs.107.1422270756584; 
	Mon, 26 Jan 2015 03:12:36 -0800 (PST)
Received: from playground.station (net-2-35-193-154.cust.vodafonedsl.it.
	[2.35.193.154])
	by mx.google.com with ESMTPSA id fp2sm13476390wib.8.2015.01.26.03.12.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jan 2015 03:12:35 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Jan 2015 12:12:22 +0100
Message-Id: <1422270747-23994-3-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1422270747-23994-1-git-send-email-pbonzini@redhat.com>
References: <1422270747-23994-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::233
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Subject: [Qemu-trivial] [PATCH 2/7] cpu-exec: simplify icount code
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
X-List-Received-Date: Mon, 26 Jan 2015 11:12:43 -0000

Use MIN instead of an "if" statement.  Move "tb" assignment where
the value is actually used.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 cpu-exec.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/cpu-exec.c b/cpu-exec.c
index 7aab86d..af56a34 100644
--- a/cpu-exec.c
+++ b/cpu-exec.c
@@ -502,22 +502,17 @@ int cpu_exec(CPUArchState *env)
                     case TB_EXIT_ICOUNT_EXPIRED:
                     {
                         /* Instruction counter expired.  */
-                        int insns_left;
-                        tb = (TranslationBlock *)(next_tb & ~TB_EXIT_MASK);
-                        insns_left = cpu->icount_decr.u32;
+                        int insns_left = cpu->icount_decr.u32;
                         if (cpu->icount_extra && insns_left >= 0) {
                             /* Refill decrementer and continue execution.  */
                             cpu->icount_extra += insns_left;
-                            if (cpu->icount_extra > 0xffff) {
-                                insns_left = 0xffff;
-                            } else {
-                                insns_left = cpu->icount_extra;
-                            }
+                            insns_left = MIN(0xffff, cpu->icount_extra);
                             cpu->icount_extra -= insns_left;
                             cpu->icount_decr.u16.low = insns_left;
                         } else {
                             if (insns_left > 0) {
                                 /* Execute remaining instructions.  */
+                                tb = (TranslationBlock *)(next_tb & ~TB_EXIT_MASK);
                                 cpu_exec_nocache(env, insns_left, tb);
                                 align_clocks(&sc, cpu);
                             }
-- 
1.8.3.1



