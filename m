Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi5q-0008P3-Cv
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:28:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5n-0008LT-Im
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5m-0004mc-MS
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:31 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:36227)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5k-0004lv-Uv; Mon, 24 Jul 2017 14:28:29 -0400
Received: by mail-qt0-x243.google.com with SMTP id l55so12883333qtl.3;
	Mon, 24 Jul 2017 11:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=oC29Xthh5htKicMmTdacTWVlYUt0HacjYrnWbEybAyU=;
	b=B1SoFQBIxILsSvlNIlj09hcY4MJWmMXE9KT0po20l0iIgp9xuy42YcjGluHqsH0OHb
	HFuAJyPR2iotNmPTKXb0t7z4Yw82VMux+ERNHS+8tSwaqGmA+7QMynSFM/raKf3/Tduz
	0X5Gr+KqgmCffgKaYaZR5NZ1tVtKrmQt5H45ls8oeYq7i0sRJN5Xap+WtgtdV/GrJVHK
	riPz8IzImNOmm+FlzIL8o6p0PZFMIpzEIcpK1pxbWF79f+i00RIK76aN8ldswIbwUv9Y
	fRQlN3Pwn5HW3ucNgHpwIRfeu0raADBLZWlFKNSFeQyr7ydrP6gY4bn4wtrzE25aqmMz
	6bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=oC29Xthh5htKicMmTdacTWVlYUt0HacjYrnWbEybAyU=;
	b=tovvv7il+6EuLqda3RhI2UHT4g7WaS1huMEWbGVBw55n0jEFdJ2XckkMKhcVJXXf0g
	XYcGUTcna4oj0j8GudOA2NSZLA6k1Fu1qe430EOR2lo0vNiJyQN3zLrkZwFxtwhBtxk1
	t43Eiuw+RNQHC4CAJimZrBjAMAtLhPUaWBaTPdi4EoWKvCzyX30q5XepdUmun/jFEvsw
	E4J7y0cYgNCxVqiFQRUPS1hql4o3qozxfe9jm31PMgPldBgCS/zjnxvzKn6VKxU8ldjH
	6a4EEP3kCYgg24WxjCXWGudWXYFZHPZQJsbbaOvIkWLIOOPB5emVbBLmxhbQbY7hTv9r
	M2aQ==
X-Gm-Message-State: AIVw112AnZx9Vd9bMwLNy/rQXBRe9HH9UNIrSUJBhZ5n4mn4YRc/wpZq
	Gkp/rZA7wxjeWg==
X-Received: by 10.237.37.70 with SMTP id w6mr2464337qtc.215.1500920908397;
	Mon, 24 Jul 2017 11:28:28 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.28.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:28:27 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Date: Mon, 24 Jul 2017 15:27:22 -0300
Message-Id: <20170724182751.18261-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH for 2.10 06/35] qcow2: remove inconsistent
 check
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
X-List-Received-Date: Mon, 24 Jul 2017 18:28:32 -0000

This is equivalent to assert(russian roulette) so better remove it.

block/qcow2-bitmap.c:259:29: warning: The left operand of '==' is a garbage value
        assert(bitmap_table == NULL);
               ~~~~~~~~~~~~ ^

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 block/qcow2-bitmap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 3e8735a20d..fe72df5057 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -254,7 +254,6 @@ static int free_bitmap_clusters(BlockDriverState *bs, Qcow2BitmapTable *tb)
 
     ret = bitmap_table_load(bs, tb, &bitmap_table);
     if (ret < 0) {
-        assert(bitmap_table == NULL);
         return ret;
     }
 
-- 
2.13.3


