Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfOWR-0005jw-Qa
	for mharc-qemu-trivial@gnu.org; Fri, 25 Sep 2015 04:38:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shraddha.6596@gmail.com>) id 1ZfOWP-0005ib-4e
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 04:38:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shraddha.6596@gmail.com>) id 1ZfOWL-0003Ng-UG
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 04:38:25 -0400
Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232]:35603)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shraddha.6596@gmail.com>)
	id 1ZfOWL-0003MQ-Oe; Fri, 25 Sep 2015 04:38:21 -0400
Received: by pacfv12 with SMTP id fv12so101731378pac.2;
	Fri, 25 Sep 2015 01:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0h5S3r96IW6jXVPMiANzkGT/MwLHcjTcf/KAtfySVmo=;
	b=0fJxY4lESfI0ud9rceq1uFvqCr+C8k1u+YnnLEzx4lMT4RNFrzKq76KtKGFkMKBuuB
	so2bGGDkv/yNDo5VvHpJXY4pNa5Lk57rkgU2/lI/dENEeQH1r/jmV/FLH7M5mG2YVnv6
	YAuQhR3Jhd0u+NIuZAxy1pOgphBzkC6/X6TaaKEJKcSHgV1a46Jb66vKIMeSeSFc/CKv
	eHEA9smpvTeakTMsFmXhjUKZGnd36DE27KYWHaQdVYH6HTHpysrldzGeYKqb7aVDqqUM
	aIuq0zmzdAJ/HFe8TinPSv38QRLQg3fANA+iV18yQUiEo8/qEyvrXgfcko978QNksl1I
	cmxA==
X-Received: by 10.68.94.3 with SMTP id cy3mr5480489pbb.113.1443170301276;
	Fri, 25 Sep 2015 01:38:21 -0700 (PDT)
Received: from shraddha-370R4E-370R4V-370R5E-3570RE-370R5V.bits-goa.ac.in
	([103.225.100.51])
	by smtp.gmail.com with ESMTPSA id w5sm2619014pbs.31.2015.09.25.01.38.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Sep 2015 01:38:20 -0700 (PDT)
From: Shraddha Barke <shraddha.6596@gmail.com>
To: kvm@vger.kernel.org, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 25 Sep 2015 14:07:58 +0530
Message-Id: <1443170278-9318-3-git-send-email-shraddha.6596@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1443170278-9318-1-git-send-email-shraddha.6596@gmail.com>
References: <1443170278-9318-1-git-send-email-shraddha.6596@gmail.com>
X-Cyberoam-smtpxy-version: 1.0.6.3
X-Cyberoam-AV-Policy: default
X-CTCH-PVer: 0000001
X-CTCH-Spam: Unknown
X-CTCH-VOD: Unknown
X-CTCH-Flags: 0
X-CTCH-RefID: str=0001.0A150207.560507FC.003B, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-CTCH-Score: 0.000
X-CTCH-ScoreCust: 0.000
X-CTCH-Rules: 
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::232
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
	Shraddha Barke <shraddha.6596@gmail.com>
Subject: [Qemu-trivial] [PATCH 3/3] Target-ppc: Remove unnecessary variable
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
X-List-Received-Date: Fri, 25 Sep 2015 08:38:26 -0000

Compress lines and remove the variable.

Change made using Coccinelle script

@@
expression ret;
@@
- if (ret) return ret;
- return 0;
+ return ret;
@@
local idexpression ret;
expression e;
@@
- ret = e;
- return ret;
+ return e;
@@
type T; identifier i;
@@
- T i;
... when != i

Signed-off-by: Shraddha Barke <shraddha.6596@gmail.com>
---
 target-ppc/kvm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target-ppc/kvm.c b/target-ppc/kvm.c
index 110436d..a3fb4c0 100644
--- a/target-ppc/kvm.c
+++ b/target-ppc/kvm.c
@@ -1782,8 +1782,7 @@ uint32_t kvmppc_get_tbfreq(void)
 
     ns++;
 
-    retval = atoi(ns);
-    return retval;
+    return atoi(ns);
 }
 
 bool kvmppc_get_host_serial(char **value)
-- 
2.1.4


