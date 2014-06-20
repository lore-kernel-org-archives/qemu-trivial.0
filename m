Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wxz3v-0003cz-GN
	for mharc-qemu-trivial@gnu.org; Fri, 20 Jun 2014 09:41:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hunterlaux@gmail.com>) id 1Wxuv4-0003ci-IR
	for qemu-trivial@nongnu.org; Fri, 20 Jun 2014 05:15:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hunterlaux@gmail.com>) id 1Wxuuv-0007am-A4
	for qemu-trivial@nongnu.org; Fri, 20 Jun 2014 05:15:38 -0400
Received: from mail-pb0-x230.google.com ([2607:f8b0:400e:c01::230]:48288)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hunterlaux@gmail.com>)
	id 1Wxuuc-0007Wr-T5; Fri, 20 Jun 2014 05:15:11 -0400
Received: by mail-pb0-f48.google.com with SMTP id rq2so2912613pbb.21
	for <multiple recipients>; Fri, 20 Jun 2014 02:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/52YxBdl1HxFhTO/c5V3A2nDruXfIQEXF7XHHuaADD4=;
	b=LQDHa2NCCE/hwXzWAgJBgVu1BQPrM9/fvkEFvM+T+iQokgkT9my+UYPp1evj5YbS0p
	sz0AifJTf2PX3/fw7yu06L9322AwUP5Y5XMqWU+ID5j9Sq+b+SQV0xAZQxpGTbXPqsow
	ndJLKYtk126sMn0BKGJWLAogtsu9PSNo5h9D6QEg0wWY1I9GXlI3w9txMFjOe8w+Ol9B
	ViMRziNtlpjhzvyKpAg6/4iyLpbtM7r0DhXzsU0LQx3WaR/JJpzcxwDlJ3OONyVn0p18
	p2k3kmVVIDSMKjqlNGbRA0wSJrJ5SozN9P25BVzTCp4FpIhfVuxdsRN3yClRHhpjjLPx
	C22w==
X-Received: by 10.68.239.137 with SMTP id vs9mr2946892pbc.84.1403255709711;
	Fri, 20 Jun 2014 02:15:09 -0700 (PDT)
Received: from HunterLaux-Aspire-V3-771 (ip98-171-191-77.sb.sd.cox.net.
	[98.171.191.77]) by mx.google.com with ESMTPSA id
	fe2sm12480908pbc.68.2014.06.20.02.15.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jun 2014 02:15:09 -0700 (PDT)
Received: from HunterLaux-Aspire-V3-771 (localhost [127.0.0.1])
	by HunterLaux-Aspire-V3-771 (8.14.4/8.14.4/Debian-4.1ubuntu1) with
	ESMTP id s5K9F6Ld016916; Fri, 20 Jun 2014 02:15:06 -0700
Received: (from hlaux@localhost)
	by HunterLaux-Aspire-V3-771 (8.14.4/8.14.4/Submit) id s5K9F596016911;
	Fri, 20 Jun 2014 02:15:05 -0700
From: Hunter Laux <hunterlaux@gmail.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 20 Jun 2014 02:14:04 -0700
Message-Id: <1403255644-16868-1-git-send-email-hunterlaux@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::230
X-Mailman-Approved-At: Fri, 20 Jun 2014 09:41:01 -0400
Cc: Hunter Laux <hunterlaux@gmail.com>
Subject: [Qemu-trivial] [PATCH] Add support for the arm breakpoint syscall.
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
X-List-Received-Date: Fri, 20 Jun 2014 09:15:47 -0000

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


