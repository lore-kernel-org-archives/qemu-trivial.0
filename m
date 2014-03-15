Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOtPj-0001Aq-G0
	for mharc-qemu-trivial@gnu.org; Sat, 15 Mar 2014 14:34:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WOtPZ-0000yN-Ox
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 14:34:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WOtPR-0005KL-Bl
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 14:34:21 -0400
Received: from mail-qa0-x236.google.com ([2607:f8b0:400d:c00::236]:38927)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WOtPA-0005Il-As; Sat, 15 Mar 2014 14:33:56 -0400
Received: by mail-qa0-f54.google.com with SMTP id w8so3781497qac.41
	for <multiple recipients>; Sat, 15 Mar 2014 11:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=hlvyV1SJED4a179Egn+NY21QBWsHkpvcnpMKSt097OU=;
	b=u350jXyweGte/X6F/uI88YVWiS8pBIo1A311RKHBiEq09Y09wQd5antSoyKXj9O7RV
	oUVp3Jru5Vuz5KSVp/x97uvNpSBI8PJz7AUkLFkYaH3GhYN3UPG+YOqNgCyT96vr8XzR
	na8CiqG0P22J/fKLkYy/sqH9aPYMWeJTHHnlyHqugghYeEU58BeRDAi1braIkHS3H2Ta
	i7nfL4dwM71hyhULYw1Pyjd9REWG+BTnF6i5++KYK0r1VjNEX/Hhs5amWHeCtPS7ftwi
	JkWeQgLRwILotKcJPbpjGsp4EB3/p3Hu5xU1iX9eiGPZH0JIf1+Yx3XIcyWGymPLeEbU
	XanA==
X-Received: by 10.140.83.47 with SMTP id i44mr2541865qgd.100.1394908435349;
	Sat, 15 Mar 2014 11:33:55 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-117-154-249.cust.vodafonedsl.it. [37.117.154.249])
	by mx.google.com with ESMTPSA id f48sm13517056qge.5.2014.03.15.11.33.53
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Mar 2014 11:33:54 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 15 Mar 2014 19:33:40 +0100
Message-Id: <1394908420-6981-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.5.3
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c00::236
Cc: qemu-trivial@nongnu.org, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH] target-alpha: fix subl and s8subl indentation
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
X-List-Received-Date: Sat, 15 Mar 2014 18:34:30 -0000

Two missing braces, one close and one open, fabulously let the code
compile.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target-alpha/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target-alpha/translate.c b/target-alpha/translate.c
index a9ef1a7..e7e319b 100644
--- a/target-alpha/translate.c
+++ b/target-alpha/translate.c
@@ -1927,6 +1927,7 @@ static ExitStatus translate_one(DisasContext *ctx, uint32_t insn)
                     else {
                         tcg_gen_neg_i64(cpu_ir[rc], cpu_ir[rb]);
                         tcg_gen_ext32s_i64(cpu_ir[rc], cpu_ir[rc]);
+                    }
                 }
             }
             break;
@@ -1991,7 +1992,7 @@ static ExitStatus translate_one(DisasContext *ctx, uint32_t insn)
                 } else {
                     if (islit)
                         tcg_gen_movi_i64(cpu_ir[rc], -lit);
-                    else
+                    else {
                         tcg_gen_neg_i64(cpu_ir[rc], cpu_ir[rb]);
                         tcg_gen_ext32s_i64(cpu_ir[rc], cpu_ir[rc]);
                     }
-- 
1.8.5.3


