Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cOo-0007H0-5M
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:51:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOm-0007Ez-LG
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOl-00053d-Ug
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:20 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:51461)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOk-00051X-0N; Fri, 06 Oct 2017 19:51:18 -0400
Received: by mail-qt0-x242.google.com with SMTP id q4so34327951qtq.8;
	Fri, 06 Oct 2017 16:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FdXnoS+y/hCwRoyew4V+7q+PEQBUX8fAjxIoGZsfD8Y=;
	b=QFjtF8oYQRetC+NQuduqiHAAHAHU48jwk1k6Zwmy4hTujdzEz7CSV6w629Cj8rTZ1Y
	fk2s0gDJoA51FbIFDwB4LmrytJcdfhkM/zuJKz7t6EuLiHOrzbxKWpvpE0ASyy0TqoxI
	hTXUlClzxYsyCV7f2Kok+B4/BNJYNP0LWB9dz8uDATv/eEcgkNVwxZY69+JlxZ9n3Por
	ZRq9ruWhSGDSNidYrF2oeIWWDlCv6wnkfdWOlrWpck8cpLyco67z2sk7y9VEGZr2oDy4
	N25lJOf/06Ty8Cu+1Boj80HigDTcY9LHnQKm35jb5bHJqx2AFA0Rw99a2ttnqIEd++77
	HATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=FdXnoS+y/hCwRoyew4V+7q+PEQBUX8fAjxIoGZsfD8Y=;
	b=CmF0LZhB6l7jbUv0rm2GCrAx1Wd21Yz1R25r6BurM90oUWNLsNLxuz2ZUqJdU+LeoS
	c8uwJRfL3lR+9dxMNJf8snqr1Upkz+Arqr6uTvdFdJY6+krQHJLHkDyCDRVv8Ck+7aFT
	CEVoBj6MHWRzt+1+cOn9SzK1yA/W3PqsxfWEh1YONXyu8JpdrI4XZ2J29af0NAr4Itpg
	+mtP9AaLpIek7S5j/OWnqX3odITA9TMOYbehr4/g748txSBURDEpmbTGjUMhXrSePvi1
	YTbM+SXRjNVjkFD4HyGjHkVByYumSnQnP62tTqx3jS8+OpJtFMIP2p7JGls6V43jrBYi
	gJUA==
X-Gm-Message-State: AMCzsaVvlEGpDrXhJUwiWQIgivmgMvwjP+dh8tRLsUk+Q9kOqAXDQ1+1
	cSz0/6flFCSXcjMnQNSQGGM=
X-Google-Smtp-Source: AOwi7QCEdH1+GzBDAtD5s6PxF9jBHaN/+gutHYwbtrMT1Ur6FdQvdJ+UohDVHa+6OnGrXPeIVJXlwA==
X-Received: by 10.200.27.163 with SMTP id z32mr1004959qtj.8.1507333877497;
	Fri, 06 Oct 2017 16:51:17 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.51.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:51:16 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Fam Zheng <famz@redhat.com>, John Snow <jsnow@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>, qemu-block@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:08 -0300
Message-Id: <20171006235023.11952-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 13/88] Dirty Bitmaps: use g_new() family of
 functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:51:21 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: squashed tests/test-hbitmap.c changes]
---
 tests/test-hbitmap.c | 2 +-
 util/hbitmap.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/test-hbitmap.c b/tests/test-hbitmap.c
index af41642346..fea3a64712 100644
--- a/tests/test-hbitmap.c
+++ b/tests/test-hbitmap.c
@@ -122,7 +122,7 @@ static void hbitmap_test_truncate_impl(TestHBitmapData *data,
 
     n = hbitmap_test_array_size(size);
     m = hbitmap_test_array_size(data->old_size);
-    data->bits = g_realloc(data->bits, sizeof(unsigned long) * n);
+    data->bits = g_renew(unsigned long, data->bits, n);
     if (n > m) {
         memset(&data->bits[m], 0x00, sizeof(unsigned long) * (n - m));
     }
diff --git a/util/hbitmap.c b/util/hbitmap.c
index 2f9d0fdbd0..4eb0188836 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -668,7 +668,7 @@ void hbitmap_truncate(HBitmap *hb, uint64_t size)
         }
         old = hb->sizes[i];
         hb->sizes[i] = size;
-        hb->levels[i] = g_realloc(hb->levels[i], size * sizeof(unsigned long));
+        hb->levels[i] = g_renew(unsigned long, hb->levels[i], size);
         if (!shrink) {
             memset(&hb->levels[i][old], 0x00,
                    (size - old) * sizeof(*hb->levels[i]));
-- 
2.14.2


