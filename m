Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gTl77-0003fU-7x
	for mharc-qemu-trivial@gnu.org; Mon, 03 Dec 2018 05:06:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <r.bolshakov@yadro.com>) id 1gTl75-0003eL-Bj
	for qemu-trivial@nongnu.org; Mon, 03 Dec 2018 05:06:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <r.bolshakov@yadro.com>) id 1gTl74-0004Go-LI
	for qemu-trivial@nongnu.org; Mon, 03 Dec 2018 05:06:03 -0500
Received: from mta-01.yadro.com ([89.207.88.251]:37876)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <r.bolshakov@yadro.com>)
	id 1gTl6y-0004Ca-6u; Mon, 03 Dec 2018 05:05:56 -0500
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id 1B0E841950;
	Mon,  3 Dec 2018 10:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-type:content-type:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received:received; s=mta-01; t=1543831554; x=
	1545645955; bh=Y4SGpGOqHvXCxyBy/9uIiuKoVibld/sX5EAhQF54QCs=; b=e
	SWB/Tn5Yt3UgnAdvkgtCin6iI4HfyXyA4p8o+XQswMrC7Jiheum3enX92UFAP0l+
	SRl3wTxqY63xlk8lZxMWi8nXCCqZ5gVAQ5CqPIxboaPxeJLBsUJsr6aoxkaOKhlO
	lyncrBfA25P6LMGbpJP7gFbpKGekzyMryh8SxQ2XuA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hZjh5Tr5xPqr; Mon,  3 Dec 2018 13:05:54 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
	[172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id 55CE54194D;
	Mon,  3 Dec 2018 13:05:54 +0300 (MSK)
Received: from localhost (172.17.128.60) by T-EXCH-02.corp.yadro.com
	(172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32;
	Mon, 3 Dec 2018 13:05:54 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-trivial@nongnu.org>, Roman Bolshakov <r.bolshakov@yadro.com>, Paolo
	Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, Eduardo
	Habkost <ehabkost@redhat.com>
Date: Mon, 3 Dec 2018 13:04:15 +0300
Message-ID: <20181203100415.53027-2-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20181203100415.53027-1-r.bolshakov@yadro.com>
References: <20181203100415.53027-1-r.bolshakov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.17.128.60]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
	T-EXCH-02.corp.yadro.com (172.17.10.102)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 89.207.88.251
Subject: [Qemu-trivial] [PATCH for-3.1 2/2] i386: hvf: drop debug printf in
 decode_sldtgroup
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
X-List-Received-Date: Mon, 03 Dec 2018 10:06:04 -0000

It's going to clutter QEMU logs if 0x0f00 is trapped.

Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
 target/i386/hvf/x86_decode.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/i386/hvf/x86_decode.c b/target/i386/hvf/x86_decode.c
index d125a6ef83..5f513c5563 100644
--- a/target/i386/hvf/x86_decode.c
+++ b/target/i386/hvf/x86_decode.c
@@ -525,8 +525,6 @@ static void decode_sldtgroup(CPUX86State *env, struct x86_decode *decode)
         X86_DECODE_CMD_INVL
     };
     decode->cmd = group[decode->modrm.reg];
-    printf("%llx: decode_sldtgroup: %d\n", env->hvf_emul->fetch_rip,
-            decode->modrm.reg);
 }
 
 static void decode_lidtgroup(CPUX86State *env, struct x86_decode *decode)
-- 
2.17.2 (Apple Git-113)


