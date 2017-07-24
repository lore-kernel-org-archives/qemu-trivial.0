Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi5w-000065-U1
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:28:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5t-0008US-Uh
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5t-0004ob-54
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:37 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:37797)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5r-0004nj-40; Mon, 24 Jul 2017 14:28:35 -0400
Received: by mail-qk0-x244.google.com with SMTP id q130so10663473qka.4;
	Mon, 24 Jul 2017 11:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1YRdkNwqoguRAYwqKV9yS5uo8kBBb/VJVwiVO0tuvzo=;
	b=LaPnFQ+IIzOChHfwgsNXDslKFzp6P6jNQcVWyjAx/OHCYm4vZW0XdBXq9RRHX/Y7To
	cl9qP+PbIvexP5wvhTWjwuAe4YMZBkBWY26049LFimFZJtN29ttIlSzmYhx6Ts0Q3jFx
	atN882cN2OKn1kGG9T8+K5+SbaFYqrCQn03Tocd98ugp8w4lCln0qO5XMQh3b6CUgjuw
	hlYNhnwmLBXhydo3+UJlAucNXPQL3melkcyR/wggLw75seonQJPZBAraP0Dux6GU/Bzt
	0WErYdL6oAaN80KzW0HBQLuycXLYRtlXavBsduFTolwrWrA4LijWPw0B80M7kJaOBMbd
	U9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=1YRdkNwqoguRAYwqKV9yS5uo8kBBb/VJVwiVO0tuvzo=;
	b=o3J7gdRHpqA2KcCLAD3MQaPTlv+A3JcghshvQLJuM0Kvl3RMeMfNBNzJutpUusbfv6
	0e5FGt+g1WISgxlMgrTMj0En2HJs6/3g3UwWFpXvDUU5NDKokG2fcKHaAiPHQcLHL7i8
	o9wqeGxcWV138xkM2Pr0Phqow2a/1nJJQEPPt2Vklha999BI9XD2FvIU5PjXg4dpGUQy
	4Fsw1gsW4B/p2covdXqoNgJpSj5GcagiFGEWbPXob4A8tosruq270Dl3le6QF9uQSaml
	DPf3JeCRT4z3iL8UilGrtu1e5BE7dgNwedyDVKyFnCn50OCBZB4CGXvy5vD0Hopzh/04
	2qHw==
X-Gm-Message-State: AIVw112VIpRihycgh0RuI03u9rG9ikKTyeEDowILydAH1VvwKcgYuXsC
	ROwXQgkU3bJ/2A==
X-Received: by 10.55.64.81 with SMTP id n78mr20321939qka.36.1500920914476;
	Mon, 24 Jul 2017 11:28:34 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.28.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:28:33 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Date: Mon, 24 Jul 2017 15:27:24 -0300
Message-Id: <20170724182751.18261-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH for 2.10 08/35] qcow2: fix null pointer
 dereference
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
X-List-Received-Date: Mon, 24 Jul 2017 18:28:39 -0000

It seems this assert() was somehow misplaced.

block/qcow2-refcount.c:2193:42: warning: Array access (from variable 'on_disk_reftable') results in a null pointer dereference
        on_disk_reftable[refblock_index] = refblock_offset;
        ~~~~~~~~~~~~~~~~                 ^

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 block/qcow2-refcount.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index c9b0dcb4f3..168fc32e7b 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -2189,6 +2189,8 @@ write_refblocks:
              * this will leak that range, but we can easily fix that by running
              * a leak-fixing check after this rebuild operation */
             reftable_offset = -1;
+        } else {
+            assert(on_disk_reftable);
         }
         on_disk_reftable[refblock_index] = refblock_offset;
 
@@ -2258,8 +2260,6 @@ write_refblocks:
         goto write_refblocks;
     }
 
-    assert(on_disk_reftable);
-
     for (refblock_index = 0; refblock_index < reftable_size; refblock_index++) {
         cpu_to_be64s(&on_disk_reftable[refblock_index]);
     }
-- 
2.13.3


