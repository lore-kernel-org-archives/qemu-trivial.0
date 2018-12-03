Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gTl7H-0003mD-IN
	for mharc-qemu-trivial@gnu.org; Mon, 03 Dec 2018 05:06:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <r.bolshakov@yadro.com>) id 1gTl7F-0003kr-Bt
	for qemu-trivial@nongnu.org; Mon, 03 Dec 2018 05:06:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <r.bolshakov@yadro.com>) id 1gTl79-0004Iz-L8
	for qemu-trivial@nongnu.org; Mon, 03 Dec 2018 05:06:13 -0500
Received: from mta-01.yadro.com ([89.207.88.251]:37864)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <r.bolshakov@yadro.com>)
	id 1gTl6x-0004Bi-87; Mon, 03 Dec 2018 05:05:55 -0500
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id 58FA04194F;
	Mon,  3 Dec 2018 10:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-type:content-type:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received:received; s=
	mta-01; t=1543831552; x=1545645953; bh=ZvvJ4BQXqXmafltvUVBAGwAQY
	KmPeaIvMXBoo8ll3ZU=; b=u98JpKKDqYvus0pm1QiU11BR5+ooFVbD7BEhkdNWU
	vdsB87zrqVuyNBc+7gGBYLmbvCG5exWP+10GNwk94GZ7mpvzyuxEwNOPUPuUjBmM
	10w7pb/AhoGcYwmHg6+mDQoSboHF3YstsC3MRs9mKUQ8uVF7Vp/7MwY8UFMFd+Hz
	ms=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 538s4iMJt3SU; Mon,  3 Dec 2018 13:05:52 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
	[172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id 049214194D;
	Mon,  3 Dec 2018 13:05:51 +0300 (MSK)
Received: from localhost (172.17.128.60) by T-EXCH-02.corp.yadro.com
	(172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32;
	Mon, 3 Dec 2018 13:05:50 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-trivial@nongnu.org>, Roman Bolshakov <r.bolshakov@yadro.com>, Paolo
	Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, Eduardo
	Habkost <ehabkost@redhat.com>
Date: Mon, 3 Dec 2018 13:04:14 +0300
Message-ID: <20181203100415.53027-1-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.17.128.60]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
	T-EXCH-02.corp.yadro.com (172.17.10.102)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 89.207.88.251
Subject: [Qemu-trivial] [PATCH for-3.1 1/2] i386: hvf: Fix overrun of
 _decode_tbl1
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
X-List-Received-Date: Mon, 03 Dec 2018 10:06:14 -0000

Single opcode instructions in ff group were incorrectly processed
because an overrun of _decode_tbl1[0xff] resulted in access of
_decode_tbl2[0x0]. Thus, decode_sldtgroup was called instead of
decode_ffgroup:
  7d71: decode_sldtgroup: 1
  Unimplemented handler (7d71) for 108 (ff 0)

While at it correct maximum length for _decode_tbl2 and _decode_tbl3.

Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
 target/i386/hvf/x86_decode.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/i386/hvf/x86_decode.c b/target/i386/hvf/x86_decode.c
index 2e33b69541..d125a6ef83 100644
--- a/target/i386/hvf/x86_decode.c
+++ b/target/i386/hvf/x86_decode.c
@@ -454,9 +454,9 @@ struct decode_x87_tbl {
 struct decode_tbl invl_inst = {0x0, 0, 0, false, NULL, NULL, NULL, NULL,
                                decode_invalid};
 
-struct decode_tbl _decode_tbl1[255];
-struct decode_tbl _decode_tbl2[255];
-struct decode_x87_tbl _decode_tbl3[255];
+struct decode_tbl _decode_tbl1[256];
+struct decode_tbl _decode_tbl2[256];
+struct decode_x87_tbl _decode_tbl3[256];
 
 static void decode_x87_ins(CPUX86State *env, struct x86_decode *decode)
 {
-- 
2.17.2 (Apple Git-113)


