Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fmNmJ-0006IR-Sv
	for mharc-qemu-trivial@gnu.org; Sun, 05 Aug 2018 14:29:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1fmNmH-0006Ey-0C
	for qemu-trivial@nongnu.org; Sun, 05 Aug 2018 14:29:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1fmNmG-0005Xy-50
	for qemu-trivial@nongnu.org; Sun, 05 Aug 2018 14:29:16 -0400
Received: from mail-qt0-x231.google.com ([2607:f8b0:400d:c0d::231]:38911)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pavel.zbitskiy@gmail.com>)
	id 1fmNmA-0005Pc-FR; Sun, 05 Aug 2018 14:29:10 -0400
Received: by mail-qt0-x231.google.com with SMTP id y19-v6so11511250qto.5;
	Sun, 05 Aug 2018 11:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+VKhO36koDNkSBGKp1QnGAwedkdPu0J9zdxDeaLOCms=;
	b=aD3LgUoAdk9Y619/LEecTPIbBZqc6moTJhBQfHQ73Gdj3KijKg1dybYCpyrvbRK/F1
	hIWWm3nB2+iZrRcq0nKjh9rHnwgOIyeF8EcAPSPScm1UBYuW1lvPukxXWZ/N246T94zk
	XKMPJqxaeg9fxrOGKq+mS66PzCGbu5PvXnZKREQb41nfAFfCwN/6P1wSpA4CmStwF/3l
	FHSA1Wcz59aqXE36lqs5UxhQZWSHa1CGCOYUd6YDPqks4clHJXtvuzz9+SW03VlE5lFY
	hHxcuZcQUFBD3cTXp9Hd8PF9tB+Vr3+qXfD3DUWOPwd85jCDW3B2cr8KLzJRLA9ZpVAm
	CXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+VKhO36koDNkSBGKp1QnGAwedkdPu0J9zdxDeaLOCms=;
	b=AEeGgZrFlD5eUuWAjG76srr9wGP5hrAuthtNN73llrb+dp9o6kGcFWFhc9z8nDpdLa
	8NXi8Fln53Ok7H4NyWfRKV2u41r9Hkp+GWVIi9IpYsget1g9Qv5FRgvhAuK62Ne5RA99
	baqvUZWzsw65QKWwlXxmnmGh6RIf5x6x7AGsMB4IGcsiTuB2eEEohDzDpK4zzk4fLuIm
	N9Op3BiO8BWlbHtwy/Y4vOBdZqkG7pfQJummMlnuu6rrGxX75ldEjvYldqClDXRRl2hN
	FnFUDIyKnjnKHH20WdgNlr7CYwr7QGN3056InejgiHzjPEQQIGjZTdzENHXrv4CD/cyN
	IjWg==
X-Gm-Message-State: AOUpUlFUTUwECIkMo01A1ZxUymlAs3qG8xzDST0R7cxrSwgkcoAsGo1x
	YwQppY4TYLfH3/VUfkxanVrt4dqbNag=
X-Google-Smtp-Source: AAOMgpdTbnZTMOcr7Hp2pto8Y7Hcn9CY/I5fpPvOe+adJMw5EbHC9wWGT/eEple2H4ZiT81CkNhAjQ==
X-Received: by 2002:ac8:2bea:: with SMTP id
	n39-v6mr11974887qtn.292.1533493749827; 
	Sun, 05 Aug 2018 11:29:09 -0700 (PDT)
Received: from WAL-L-PZ01.rocketsoftware.com
	(inet-64-112-177-9.bos.netblazr.com. [64.112.177.9])
	by smtp.gmail.com with ESMTPSA id
	j86-v6sm12842786qkh.60.2018.08.05.11.29.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Aug 2018 11:29:09 -0700 (PDT)
From: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Pavel Zbitskiy <pavel.zbitskiy@gmail.com>,
	Richard Henderson <rth@twiddle.net>, Alexander Graf <agraf@suse.de>,
	David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	qemu-s390x@nongnu.org (open list:S390)
Date: Sun,  5 Aug 2018 14:28:30 -0400
Message-Id: <20180805182832.3012-6-pavel.zbitskiy@gmail.com>
In-Reply-To: <20180805182832.3012-1-pavel.zbitskiy@gmail.com>
References: <20180805182832.3012-1-pavel.zbitskiy@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::231
Subject: [Qemu-trivial] [PATCH 5/6] target/s390x: fix PACK reading 1 byte
 less and writing 1 byte more
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
X-List-Received-Date: Sun, 05 Aug 2018 18:29:18 -0000

PACK fails on the test from the Principles of Operation: F1F2F3F4
becomes 0000234C instead of 0001234C due to an off-by-one error.
Furthermore, it overwrites one extra byte to the left of F1.

Signed-off-by: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
---
 target/s390x/mem_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 704d0193b5..bacae4f503 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -1019,15 +1019,15 @@ void HELPER(pack)(CPUS390XState *env, uint32_t len, uint64_t dest, uint64_t src)
     len_src--;
 
     /* now pack every value */
-    while (len_dest >= 0) {
+    while (len_dest > 0) {
         b = 0;
 
-        if (len_src > 0) {
+        if (len_src >= 0) {
             b = cpu_ldub_data_ra(env, src, ra) & 0x0f;
             src--;
             len_src--;
         }
-        if (len_src > 0) {
+        if (len_src >= 0) {
             b |= cpu_ldub_data_ra(env, src, ra) << 4;
             src--;
             len_src--;
-- 
2.16.2.windows.1


