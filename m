Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fmNmG-0006ES-Fc
	for mharc-qemu-trivial@gnu.org; Sun, 05 Aug 2018 14:29:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1fmNm9-00067y-V2
	for qemu-trivial@nongnu.org; Sun, 05 Aug 2018 14:29:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1fmNm8-0005OO-W9
	for qemu-trivial@nongnu.org; Sun, 05 Aug 2018 14:29:09 -0400
Received: from mail-qk0-x22a.google.com ([2607:f8b0:400d:c09::22a]:40684)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pavel.zbitskiy@gmail.com>)
	id 1fmNm6-0005MJ-ML; Sun, 05 Aug 2018 14:29:06 -0400
Received: by mail-qk0-x22a.google.com with SMTP id c126-v6so7431940qkd.7;
	Sun, 05 Aug 2018 11:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QSdeksk5KZp0zoSqpymTMvZVcIg7UjuSDx5IpR+bAOE=;
	b=dnPn62XyurPddCWn1lD6Aa4SChmWQLelgY+9caTKQvlOFXeT5bs3e9PV0CDJ8lc+C+
	MkbC2gwP8ZhFILl9Ko1tYq4qLLpnFO9DRYxYJVbF5qDH7rASMiS00EfnQYbxjdoTajAj
	LsFcwqS9KHGJxi+uEyFB4Lmb1LME077Cl1yl83n4VTIKf3QhDafBP87Jr6gAc7CUPkWO
	YeX59+mKxkiOwcT8eHlbO0ZCZ05NhU64zaH6r5rLHvA+/sbA113MAxUbQDpF8HrSDGeX
	T/vZDei9KlORFWf3S9kDaFLqeZphTI8zdXn7OHp0Voyj22t+XiSX0F8bJXWP8YpZ0OuE
	x1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QSdeksk5KZp0zoSqpymTMvZVcIg7UjuSDx5IpR+bAOE=;
	b=E1OqKo+6ZnRlUQNWM5jQozxJg4LVCAUH8GDK3xtqwTIYFNXlLsdV6v4GOGzn6wRTde
	xognEBT57ksHm0wTBuwhCTG1gv9xFBjyuMAdsN9TSgacByQCuVp/ZWcaPctdZ08zokDS
	TSsgXbmPpQjixWywNJwl1CThSABjIcQOtA8e5bpQi8HTQ1lCuK/w6wiTWObiZtdi4yvk
	qWvQJEy3za7jkkgOtSZ7EYzmJ59rxbq6rSSGG4EkwleWjek/BQ6HQs2Q0SaUu+quWeAN
	fOTJSxOLw4nhy4kvpbQNF11Bb4f0MK6ichVH9ev1dN9tyTqWyDI/+v7+hMoUhd/hUSqR
	f8NA==
X-Gm-Message-State: AOUpUlFtoCTyt+ixNv+5boXi2WSNzekJHpkdIim22/gYPKkTY0Gsnrqm
	M+V0g9LwmJb2QXhSAnIiaQmpLAnYvhs=
X-Google-Smtp-Source: AAOMgpf3SHCunwZXlzIxiFJX1jMz2/DqjUEYf5aYn9eTTbeHiO02eufrxUjE56ZSxEEBXGQIwTxyrA==
X-Received: by 2002:a37:a98e:: with SMTP id
	s136-v6mr10916060qke.407.1533493746000; 
	Sun, 05 Aug 2018 11:29:06 -0700 (PDT)
Received: from WAL-L-PZ01.rocketsoftware.com
	(inet-64-112-177-9.bos.netblazr.com. [64.112.177.9])
	by smtp.gmail.com with ESMTPSA id
	j86-v6sm12842786qkh.60.2018.08.05.11.29.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Aug 2018 11:29:05 -0700 (PDT)
From: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Pavel Zbitskiy <pavel.zbitskiy@gmail.com>,
	Richard Henderson <rth@twiddle.net>, Alexander Graf <agraf@suse.de>,
	David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	qemu-s390x@nongnu.org (open list:S390)
Date: Sun,  5 Aug 2018 14:28:27 -0400
Message-Id: <20180805182832.3012-3-pavel.zbitskiy@gmail.com>
In-Reply-To: <20180805182832.3012-1-pavel.zbitskiy@gmail.com>
References: <20180805182832.3012-1-pavel.zbitskiy@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22a
Subject: [Qemu-trivial] [PATCH 2/6] target/s390x: fix CSST decoding and
 runtime alignment check
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
X-List-Received-Date: Sun, 05 Aug 2018 18:29:15 -0000

CSST is defined as:

    C(0xc802, CSST,    SSF,   CASS, la1, a2, 0, 0, csst, 0)

It means that the first parameter is handled by in1_la1().
in1_la1() fills addr1 field, and not in1.

Furthermore, when extract32() is used for the alignment check, the
third parameter should specify the number of trailing bits that must
be 0. For FC these numbers are:

    FC=0: 2
    FC=1: 3
    FC=2: 4

For SC these numbers are:

    SC=0: 0
    SC=1: 1
    SC=2: 2
    SC=3: 3
    SC=4: 4

Signed-off-by: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
---
 target/s390x/mem_helper.c | 2 +-
 target/s390x/translate.c  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index e21a47fb4d..c94dbf3fcb 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -1442,7 +1442,7 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
     }
 
     /* Sanity check the alignments.  */
-    if (extract32(a1, 0, 4 << fc) || extract32(a2, 0, 1 << sc)) {
+    if (extract32(a1, 0, fc + 2) || extract32(a2, 0, sc)) {
         goto spec_exception;
     }
 
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index efdc88e227..f318fb6e4e 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -2050,9 +2050,9 @@ static DisasJumpType op_csst(DisasContext *s, DisasOps *o)
     TCGv_i32 t_r3 = tcg_const_i32(r3);
 
     if (tb_cflags(s->base.tb) & CF_PARALLEL) {
-        gen_helper_csst_parallel(cc_op, cpu_env, t_r3, o->in1, o->in2);
+        gen_helper_csst_parallel(cc_op, cpu_env, t_r3, o->addr1, o->in2);
     } else {
-        gen_helper_csst(cc_op, cpu_env, t_r3, o->in1, o->in2);
+        gen_helper_csst(cc_op, cpu_env, t_r3, o->addr1, o->in2);
     }
     tcg_temp_free_i32(t_r3);
 
-- 
2.16.2.windows.1


