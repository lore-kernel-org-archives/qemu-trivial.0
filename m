Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wxz3w-0003da-0g
	for mharc-qemu-trivial@gnu.org; Fri, 20 Jun 2014 09:41:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hunterlaux@gmail.com>) id 1WxvIC-0003wm-Ga
	for qemu-trivial@nongnu.org; Fri, 20 Jun 2014 05:39:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hunterlaux@gmail.com>) id 1WxvI3-0007Cp-FF
	for qemu-trivial@nongnu.org; Fri, 20 Jun 2014 05:39:32 -0400
Received: from mail-pb0-x234.google.com ([2607:f8b0:400e:c01::234]:47578)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hunterlaux@gmail.com>)
	id 1WxvHk-00078P-W8; Fri, 20 Jun 2014 05:39:05 -0400
Received: by mail-pb0-f52.google.com with SMTP id rq2so2945516pbb.11
	for <multiple recipients>; Fri, 20 Jun 2014 02:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lCdVoO8nzjxPDkJXmaq1qHiRSMQWvSfaxqVpASP6GIw=;
	b=senNTBedou3lozYRJlnA28xu+0MrPQF6sDeFerT6HM58fqtc2pqIE4SR4kPctfPe3k
	UCYB+5JqdKSBXcmNa4XsEmfM5jgS5HkmfYk9El9zy5ivY8MrrRXUGnIKJCa1GfIN9bHZ
	p1/JT4nTEtJPhI5iZmpGp164UKL/MaOuJvo7ez6BEyIlIqEBsc0rdTWLoZdGRRNTX2N6
	1EgVF0mgP6nFO9ZrdgqM3QNHJKXZ5WaJhhQxQKd0xlMmM8XMHeHH1I7IarVBAejz9ZOR
	wQ88cxTAyX8tyvm/HQSUxs2tn5a5n5nRRvMSuQudsCboCawYwu34cAC0MTQaXlGDrSk+
	oxKg==
X-Received: by 10.68.189.68 with SMTP id gg4mr3059790pbc.42.1403257143936;
	Fri, 20 Jun 2014 02:39:03 -0700 (PDT)
Received: from HunterLaux-Aspire-V3-771 (ip98-171-191-77.sb.sd.cox.net.
	[98.171.191.77]) by mx.google.com with ESMTPSA id
	sv10sm40691484pab.32.2014.06.20.02.39.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jun 2014 02:39:03 -0700 (PDT)
Received: from HunterLaux-Aspire-V3-771 (localhost [127.0.0.1])
	by HunterLaux-Aspire-V3-771 (8.14.4/8.14.4/Debian-4.1ubuntu1) with
	ESMTP id s5K9d0nS017412; Fri, 20 Jun 2014 02:39:00 -0700
Received: (from hlaux@localhost)
	by HunterLaux-Aspire-V3-771 (8.14.4/8.14.4/Submit) id s5K9cxwh017405;
	Fri, 20 Jun 2014 02:38:59 -0700
From: Hunter Laux <hunterlaux@gmail.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, peter.maydell@linaro.org, 
	riku.voipio@iki.fi
Date: Fri, 20 Jun 2014 02:37:58 -0700
Message-Id: <1403257078-17220-1-git-send-email-hunterlaux@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::234
X-Mailman-Approved-At: Fri, 20 Jun 2014 09:41:01 -0400
Cc: Hunter Laux <hunterlaux@gmail.com>
Subject: [Qemu-trivial] [PATCH] Add support for the arm breakpoint syscall
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
X-List-Received-Date: Fri, 20 Jun 2014 09:39:41 -0000

Signed-off-by: Hunter Laux <hunterlaux@gmail.com>
---
 linux-user/arm/syscall.h | 1 +
 linux-user/main.c        | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/linux-user/arm/syscall.h b/linux-user/arm/syscall.h
index ce2c2a8..e0d2cc3 100644
--- a/linux-user/arm/syscall.h
+++ b/linux-user/arm/syscall.h
@@ -29,6 +29,7 @@ struct target_pt_regs {
 #define ARM_THUMB_SYSCALL	0
 
 #define ARM_NR_BASE	  0xf0000
+#define ARM_NR_breakpoint (ARM_NR_BASE + 1)
 #define ARM_NR_cacheflush (ARM_NR_BASE + 2)
 #define ARM_NR_set_tls	  (ARM_NR_BASE + 5)
 
diff --git a/linux-user/main.c b/linux-user/main.c
index a87c6f7..831b363 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -807,6 +807,9 @@ void cpu_loop(CPUARMState *env)
                             cpu_set_tls(env, env->regs[0]);
                             env->regs[0] = 0;
                             break;
+                        case ARM_NR_breakpoint:
+                            env->regs[15] -= env->thumb ? 2 : 4;
+                            goto excp_debug;
                         default:
                             gemu_log("qemu: Unsupported ARM syscall: 0x%x\n",
                                      n);
@@ -850,6 +853,7 @@ void cpu_loop(CPUARMState *env)
             }
             break;
         case EXCP_DEBUG:
+            excp_debug:
             {
                 int sig;
 
-- 
1.9.1


