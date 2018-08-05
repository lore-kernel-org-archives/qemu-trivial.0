Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fmNmI-0006GU-6V
	for mharc-qemu-trivial@gnu.org; Sun, 05 Aug 2018 14:29:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1fmNmF-0006Cj-0O
	for qemu-trivial@nongnu.org; Sun, 05 Aug 2018 14:29:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1fmNmA-0005PL-2V
	for qemu-trivial@nongnu.org; Sun, 05 Aug 2018 14:29:14 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:36491)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pavel.zbitskiy@gmail.com>)
	id 1fmNm8-0005NT-3F; Sun, 05 Aug 2018 14:29:08 -0400
Received: by mail-qt0-x243.google.com with SMTP id t5-v6so11517184qtn.3;
	Sun, 05 Aug 2018 11:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ONCGhK3cISoK+xkij5LWkorBj4hdHejynu5QRtlwveY=;
	b=spFKZOQ9HbL1sZ2DGkUuEwvAoIEL1tjSvcBA3VTGwD755V2qjPIb8sCgjCX+sskTLs
	vltX4ihMei/bp5HR4eH9kZSWxR/ORyK2ptD5M5rA8Pah6Sqh14XOlkvrR+Q1G+1E9xTq
	3CZJ8xXDHVmauJYK7NFvsbgKujjRYraWSGmYMlqepOYoYp3IEtTZPWVvdXPFN6EosaIB
	30npquZfOjRhsuOqN3Sg7WtDk+THVoAINRvVvtIRluTUv+9dSMsQoHJ7z6kAMno5N+p7
	aG0oKlKqV/0mXFnIUR4Yrv1htJ8lO8lsyrTFZZhYp9p4DzSo4ksslmrxxk6nwfh6gwFQ
	r87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ONCGhK3cISoK+xkij5LWkorBj4hdHejynu5QRtlwveY=;
	b=K9sbWKAvFkJraRRqaY5M32jkLJEos8eRJzLBu7msu9dPxIBZ0QBgeFrT5zycKnGU/B
	T4GnpDGohesODhQlhMyR8i9Ig6l3jqG71uiaF64ZFzkcXOg5XgBO3LWS5e4HAaPLoBtt
	9u8bzIDVhZUt8rZDd6c0QfZ8zN7fq3IjtVBPES/9JgEO8LKw0fpiqIcqDBC7igB7clVB
	59RX/Rn5PP490kFBi8qIWK8qQCvfki3qjiie8l7CnDL5k9oWwEb9ubtDONrZZ/XTion7
	ZklkLmIpj/xthhS3/4HU1MtLBzf2zn84jotZrVS1IaY+MH8qmR+HQEjv6byAAGZ/PdLR
	tRGA==
X-Gm-Message-State: AOUpUlE5FgKZDLGTR+N1shLwNdvFlPAwsfKO4qgVhIA3WxcAc7NEMaCR
	9HnNGqtw8WUIl5sxP76fvvyavqIEf1k=
X-Google-Smtp-Source: AAOMgpeAzUSDGfiasumOy9lBI57MoDbpz6qVExYwmSOAmm+wqj8PhzMMPKOaAhDtxyUmfhtBxtQ5uQ==
X-Received: by 2002:ac8:32c1:: with SMTP id
	a1-v6mr10063584qtb.73.1533493747420; 
	Sun, 05 Aug 2018 11:29:07 -0700 (PDT)
Received: from WAL-L-PZ01.rocketsoftware.com
	(inet-64-112-177-9.bos.netblazr.com. [64.112.177.9])
	by smtp.gmail.com with ESMTPSA id
	j86-v6sm12842786qkh.60.2018.08.05.11.29.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Aug 2018 11:29:06 -0700 (PDT)
From: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Pavel Zbitskiy <pavel.zbitskiy@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Alexander Graf <agraf@suse.de>, David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org (open list:S390)
Date: Sun,  5 Aug 2018 14:28:28 -0400
Message-Id: <20180805182832.3012-4-pavel.zbitskiy@gmail.com>
In-Reply-To: <20180805182832.3012-1-pavel.zbitskiy@gmail.com>
References: <20180805182832.3012-1-pavel.zbitskiy@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 3/6] target/s390x: fix ipm polluting
 irrelevant bits
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
X-List-Received-Date: Sun, 05 Aug 2018 18:29:16 -0000

Suppose psw.mask=0x0000000080000000, cc=2, r1=0 and we do "ipm 1".
This command must touch only bits 32-39, so the expected output
is r1=0x20000000. However, currently qemu yields r1=0x20008000,
because irrelevant parts of PSW leak into r1 during program mask
transfer.

Signed-off-by: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
---
 target/s390x/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index f318fb6e4e..05442dff36 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -2442,8 +2442,8 @@ static DisasJumpType op_ipm(DisasContext *s, DisasOps *o)
     tcg_gen_andi_i64(o->out, o->out, ~0xff000000ull);
 
     t1 = tcg_temp_new_i64();
-    tcg_gen_shli_i64(t1, psw_mask, 20);
-    tcg_gen_shri_i64(t1, t1, 36);
+    tcg_gen_andi_i64(t1, psw_mask, 0x00000f0000000000);
+    tcg_gen_shri_i64(t1, t1, 16);
     tcg_gen_or_i64(o->out, o->out, t1);
 
     tcg_gen_extu_i32_i64(t1, cc_op);
-- 
2.16.2.windows.1


