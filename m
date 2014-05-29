Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wq7bc-0007Kt-C0
	for mharc-qemu-trivial@gnu.org; Thu, 29 May 2014 17:11:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ARistovski@qnx.com>) id 1Wq4CF-0001M2-Ry
	for qemu-trivial@nongnu.org; Thu, 29 May 2014 13:33:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ARistovski@qnx.com>) id 1Wq4CA-0004f0-Oz
	for qemu-trivial@nongnu.org; Thu, 29 May 2014 13:32:55 -0400
Received: from mxa.qnx.com ([72.1.200.108]:47276)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ARistovski@qnx.com>) id 1Wq4CA-0004eK-GY
	for qemu-trivial@nongnu.org; Thu, 29 May 2014 13:32:50 -0400
X-ASG-Debug-ID: 1401385814-0721885f5c16470001-p2Yte8
Received: from exhts.ott.qnx.com (exch1.ott.qnx.com [10.222.2.137]) by
	MXA.qnx.com with ESMTP id xbVaON2ZFWbjlGU5 (version=TLSv1
	cipher=AES128-SHA bits=128 verify=NO) for
	<qemu-trivial@nongnu.org>; Thu, 29 May 2014 13:50:14 -0400 (EDT)
X-Barracuda-Envelope-From: ARistovski@qnx.com
Received: from [10.222.97.169] (10.222.2.5) by EXCH1.ott.qnx.com
	(10.222.2.137) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 29 May 2014 13:32:47 -0400
Message-ID: <53876F3F.1060704@qnx.com>
Date: Thu, 29 May 2014 13:32:47 -0400
From: Aleksandar Ristovski <aristovski@qnx.com>
Organization: QNX Software Systems
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: <qemu-trivial@nongnu.org>
Content-Type: multipart/mixed; boundary="------------090603080908020706030300"
X-ASG-Orig-Subj: DBGAUTHSTATUS register
X-Originating-IP: [10.222.2.5]
X-Barracuda-Connect: exch1.ott.qnx.com[10.222.2.137]
X-Barracuda-Start-Time: 1401385814
X-Barracuda-Encrypted: AES128-SHA
X-Barracuda-URL: http://qnx-spam.ott.qnx.com:80/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at qnx.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.6216
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 72.1.200.108
X-Mailman-Approved-At: Thu, 29 May 2014 17:11:18 -0400
Subject: [Qemu-trivial] DBGAUTHSTATUS register
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
X-List-Received-Date: Thu, 29 May 2014 17:33:01 -0000

--------------090603080908020706030300
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hello,


This is not a big issue: DBGAUTHSTATUS, according to the docs, should 
exist. According to "ARM Architecture Reference Manual, ARMv7-A and 
ARMv7-R edition" (DDI0406C_b_arm_architecture_reference_manual.pdf), 
DBGAUTHSTATUS is required in all implementations. Reading it should be 
permitted, even if as RAZ only (implying no features are 
implemented/enabled).

This trivial patch defines cp14 register DBGAUTHSTATUS.


Thank you,

---
Aleksandar Ristovski
QNX Software Systems



--------------090603080908020706030300
Content-Type: text/x-patch;
	name="0001-Author-Aleksandar-Ristovski-ARistovski-qnx.com.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-Author-Aleksandar-Ristovski-ARistovski-qnx.com.patch"

From 88e2c564e8a17c0494024d773db4b6c4a0646342 Mon Sep 17 00:00:00 2001
From: Aleksandar Ristovski <ARistovski@qnx.com>
Date: Thu, 29 May 2014 13:20:45 -0400
Subject: [PATCH] Author: Aleksandar Ristovski <ARistovski@qnx.com> Date:   Thu
 May 29 13:03:28 2014 -0400

    * target-arm/helper.c: Define DBGAUTHSTATUS register as RAZ.
---
 target-arm/helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index ec031f5..ce1f0aa 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -395,6 +395,8 @@ static const ARMCPRegInfo cp_reginfo[] = {
      */
     { .name = "DBGDIDR", .cp = 14, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 0,
       .access = PL0_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "DBGAUTHSTATUS", .cp = 14, .crn = 7, .crm = 14, .opc1 = 0,
+      .opc2 = 6, .access = PL0_R, .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "FCSEIDR", .cp = 15, .crn = 13, .crm = 0, .opc1 = 0, .opc2 = 0,
       .access = PL1_RW, .fieldoffset = offsetof(CPUARMState, cp15.c13_fcse),
       .resetvalue = 0, .writefn = fcse_write, .raw_writefn = raw_write, },
-- 
1.9.1


--------------090603080908020706030300--

