Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fmNmI-0006H7-Om
	for mharc-qemu-trivial@gnu.org; Sun, 05 Aug 2018 14:29:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40150)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1fmNmG-0006Dr-48
	for qemu-trivial@nongnu.org; Sun, 05 Aug 2018 14:29:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1fmNmF-0005VW-4v
	for qemu-trivial@nongnu.org; Sun, 05 Aug 2018 14:29:16 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35640)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pavel.zbitskiy@gmail.com>)
	id 1fmNm9-0005OV-7V; Sun, 05 Aug 2018 14:29:09 -0400
Received: by mail-qt0-x243.google.com with SMTP id a5-v6so11535372qtp.2;
	Sun, 05 Aug 2018 11:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MELa9Ot7tmPh7QmfhDd+ogHTkQkGQj/WtxKFWZq3b1E=;
	b=COF7OK7Xgy5JS99xwkvojqmlL11O+Ut6+GNouPrt2wDamfkQJpv0jAzeoDoXvH1H+n
	uFjeG9lToTzSA0dRgGxecgwaed7vRspU1dgknl8uuVYqaaoomPbwof9gHetdIph7V7L5
	ZxPLhp0Z2JgRPWWtKa6ny4J1zCNekEMFjabo2/kCyQ2Ahg1vtbbt569jTWoZ9iVRBRbi
	3aCjAC2dmduoS/tOyssn4GsGmP4+PojYbHNiZH+UIztt8IsTnavXzwlyM31xBB9W+Lc4
	VNosen2w43AKeclL3+O1pX/SJKn5EIu3Sl5617NVXbsIMg4gC/b6486RSphCwZ4qY5Ua
	YqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MELa9Ot7tmPh7QmfhDd+ogHTkQkGQj/WtxKFWZq3b1E=;
	b=kAacLuDoCHr4IFHas3xILaBVweIGyojBIvpsveUKNmOmGsvMcjWZ9472uEgcGm7snh
	lJOFut1uMaS1ngSRwS/8QTtBEC6RDxDDjA8AxuN4qqOd7v58M015mBZ1Cklk50Ubqmjl
	YB+SBndO/3i6jKTHzvr6flAN5kc1Gx3n85JoYUzF+WE1lmxXfS3pYhg5C0QF8wpbLIRN
	sOsgC+Cyoo3600ki329fbYFWK0khV6u/AcNfI2IyvLOnOA/pqvgcUfwWlpUk203JMrLk
	2sUW2HNyJaSugKehMuZW+mhwY9Jkvr6jx7Fa+fni45ZzmRzlwadOCtmzRy+o8guhfxx9
	kvng==
X-Gm-Message-State: AOUpUlEzpxR83LpZq+lMAxsuvL8gTUEhof9pPwIR83VkXzGsPdUXZQsI
	a8nR5+CaqlKBQMjbfzp5E2dutd3bgDs=
X-Google-Smtp-Source: AAOMgpd6hPgIj5kMR4IwbVQhc+TwyiVDLZ1oq+y/VtlAofnbT7e05q9w59q8XKrvsQXSXmcgZjZ6Cg==
X-Received: by 2002:aed:3c8c:: with SMTP id
	d12-v6mr11844173qtf.203.1533493748634; 
	Sun, 05 Aug 2018 11:29:08 -0700 (PDT)
Received: from WAL-L-PZ01.rocketsoftware.com
	(inet-64-112-177-9.bos.netblazr.com. [64.112.177.9])
	by smtp.gmail.com with ESMTPSA id
	j86-v6sm12842786qkh.60.2018.08.05.11.29.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Aug 2018 11:29:08 -0700 (PDT)
From: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Pavel Zbitskiy <pavel.zbitskiy@gmail.com>,
	Richard Henderson <rth@twiddle.net>, Alexander Graf <agraf@suse.de>,
	David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	qemu-s390x@nongnu.org (open list:S390)
Date: Sun,  5 Aug 2018 14:28:29 -0400
Message-Id: <20180805182832.3012-5-pavel.zbitskiy@gmail.com>
In-Reply-To: <20180805182832.3012-1-pavel.zbitskiy@gmail.com>
References: <20180805182832.3012-1-pavel.zbitskiy@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 4/6] target/s390x: add EX support for TRT and
 TRTR
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
X-List-Received-Date: Sun, 05 Aug 2018 18:29:17 -0000

Improves "b213c9f5: target/s390x: Implement TRTR" by introducing the
intermediate functions, which are compatible with dx_helper type.

Signed-off-by: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
---
 target/s390x/mem_helper.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index c94dbf3fcb..704d0193b5 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -1299,12 +1299,26 @@ static inline uint32_t do_helper_trt(CPUS390XState *env, int len,
     return 0;
 }
 
+static uint32_t do_helper_trt_fwd(CPUS390XState *env, uint32_t len,
+                                  uint64_t array, uint64_t trans,
+                                  uintptr_t ra)
+{
+    return do_helper_trt(env, len, array, trans, 1, ra);
+}
+
 uint32_t HELPER(trt)(CPUS390XState *env, uint32_t len, uint64_t array,
                      uint64_t trans)
 {
     return do_helper_trt(env, len, array, trans, 1, GETPC());
 }
 
+static uint32_t do_helper_trt_bkwd(CPUS390XState *env, uint32_t len,
+                                   uint64_t array, uint64_t trans,
+                                   uintptr_t ra)
+{
+    return do_helper_trt(env, len, array, trans, -1, ra);
+}
+
 uint32_t HELPER(trtr)(CPUS390XState *env, uint32_t len, uint64_t array,
                       uint64_t trans)
 {
@@ -2193,12 +2207,14 @@ void HELPER(ex)(CPUS390XState *env, uint32_t ilen, uint64_t r1, uint64_t addr)
         typedef uint32_t (*dx_helper)(CPUS390XState *, uint32_t, uint64_t,
                                       uint64_t, uintptr_t);
         static const dx_helper dx[16] = {
+            [0x0] = do_helper_trt_bkwd,
             [0x2] = do_helper_mvc,
             [0x4] = do_helper_nc,
             [0x5] = do_helper_clc,
             [0x6] = do_helper_oc,
             [0x7] = do_helper_xc,
             [0xc] = do_helper_tr,
+            [0xd] = do_helper_trt_fwd,
         };
         dx_helper helper = dx[opc & 0xf];
 
-- 
2.16.2.windows.1


