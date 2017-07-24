Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi5v-00004t-O8
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:28:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5t-0008TW-7d
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5s-0004oJ-CK
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:37 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:37438)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5n-0004mt-UB; Mon, 24 Jul 2017 14:28:31 -0400
Received: by mail-qt0-x244.google.com with SMTP id d10so1058825qtb.4;
	Mon, 24 Jul 2017 11:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vPG4/DR3PkvmHSx+GehJ9J4lEg0BZ/0dnKyPC4P7YvU=;
	b=fVzKGmTfkYTWTHig7J3ZpHX9siB6X8g2HZALQ7puS9YhQEfdcw/oTd2GGqYNvplmE9
	syREaHtf/EB4q4wYYdRxUPGEFwzImSU5esU5KHcLwDYWVkcwA0nr+AN6Gq16DFATrkl1
	zhpY4AwkMCIdg+dYlJlEsnHO+z5WvYiT3kh3XiLkCpz2D3tMxBWAz7B94/2USuMwSgc2
	EmyqnaH/BL9rApE9mYOIF8eghHSO81N/ni9xMXgf58JnMRExt5p+3E4WDC+dgrFLLo6q
	c8HGtU7OKwyPIVJ8ExPyfRnxOT9yS1SUbqWczNqxGfMQMt8TTPSQVs9SxNbUwK+cZnrG
	HoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=vPG4/DR3PkvmHSx+GehJ9J4lEg0BZ/0dnKyPC4P7YvU=;
	b=V8I47JMVnGiuV3pX9Nz4eqpZY5opz1/WISLavZgDETsXF15RuBofl6KU2mb3wM56u6
	adAMnVmz8oaleQHNwueMhk7hO25rl/YJKc54IEsbT5GYf3qimtHO5yVs4Xr7zkQ5P/nE
	SDHmn9Qfp4xVXnEwUPNiJ2GupawVk4sGqj3Hb7pk/1fSvI9MVWM18NKVv92wEkd9LoDu
	1zyqb0hiAL0LGrSLO1iQXvIEiGA0jCKfGIJF+d2+zA7qTmsVTXm+9QgAJ3hNSuVuu01G
	LuYqhq2SMcGicdvwQ3MFUMhR+1kJHQHXU4QxZZuTb74HpEsvw3ysKixbjqi2NMsDs0UE
	puFA==
X-Gm-Message-State: AIVw113oiRR88UOZC+qsK8+c9czNTST4k3o/4q6eG6RRAw+WRUAMAi9C
	5Fim2rb2Fl1tKg==
X-Received: by 10.200.35.47 with SMTP id a44mr20554367qta.262.1500920911374;
	Mon, 24 Jul 2017 11:28:31 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.28.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:28:30 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Date: Mon, 24 Jul 2017 15:27:23 -0300
Message-Id: <20170724182751.18261-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH for 2.10 07/35] qcow2: fix null pointer
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
X-List-Received-Date: Mon, 24 Jul 2017 18:28:38 -0000

If find_bitmap_by_name() fails we have bm=NULL and go to the 'fail' label, then
call bitmap_free(bm) which does g_free(bm->name) with bm=NULL...

Clang's scan-build-5.0 output:
block/qcow2-bitmap.c:492:12: warning: Access to field 'name' results in a dereference of a null pointer (loaded from variable 'bm')
    g_free(bm->name);
           ^~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 block/qcow2-bitmap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index fe72df5057..2fd75781ce 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1259,7 +1259,7 @@ void qcow2_remove_persistent_dirty_bitmap(BlockDriverState *bs,
 
     bm = find_bitmap_by_name(bm_list, name);
     if (bm == NULL) {
-        goto fail;
+        goto fail_list;
     }
 
     QSIMPLEQ_REMOVE(bm_list, bm, Qcow2Bitmap, entry);
@@ -1274,6 +1274,7 @@ void qcow2_remove_persistent_dirty_bitmap(BlockDriverState *bs,
 
 fail:
     bitmap_free(bm);
+fail_list:
     bitmap_list_free(bm_list);
 }
 
-- 
2.13.3


