Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLtE-0002P8-54
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:21:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLtC-0002Md-5j
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLtB-0001mv-BW
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:46 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:35787)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLtB-0001mL-7e; Tue, 18 Jul 2017 02:21:45 -0400
Received: by mail-qt0-x244.google.com with SMTP id p25so254448qtp.2;
	Mon, 17 Jul 2017 23:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=IbkxpTU7G0oDGKtfpuT/XpAt9MPGGmUjbkgw4PUm3gg=;
	b=qDn4RJKAxJMD/3FmnY6iaR/tLUli1ctuvv81WvN66RHHVdlLLv2dxbbv4PM++av0Tt
	Lcx3+zO5mCTSiK53iIjuZX8z+R2X8tP8eaMEKMinOrBqef4k8sGbboDoaTmVFcUreS71
	pbARKJmJ9yTfm0H+O5c71j1QX2YXekYdizAlto8q7ZtEhhc++6IgMd0S1xWQmrhJRd64
	lTsvUbXLoj9lM+H4lsf3qyR40HmUcqDb2R5BXx3yEFFC/Rq8PxAJ1t168dqoi08ThwED
	PHfoxaViCWdiOw61lY8ius7pXwhaMyhQptwQF3cKiIB+Xbl0cXxqNKsfWPAxTtch48ff
	v1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=IbkxpTU7G0oDGKtfpuT/XpAt9MPGGmUjbkgw4PUm3gg=;
	b=dctTCZgcNCHcu88K1wCXhyp/Wl2CE8ra/jC5K9UPUXoEtnzy1DLAVph5VSyNmuuJu2
	gGf6GZ47FCU/VMt5mAgqY+AHs7LPTzqGmdTEihs08FKvTH1fsvrcSNflCLIyzWbvTa0y
	UTTR+MKBhe9QeDRunDxYrBjpmkwDN9kzTFhqchHzDatPXKs61wjj0Ub+2kGWZLleI3+v
	I0R8zC+c9KohaixXA8zdjLMvN6m6m7yjDa5jG+EAD5DK7tqDbxk1/6VTEKbQWiFEDyo7
	6I+FcMMIpFUTW+EMEXNuhKaP0b2BSz+2vxkwVNPWf5BhM3h5hYjZLm+/z1iLWHs/npdJ
	+0RQ==
X-Gm-Message-State: AIVw113tYqu4u2MtBtvOAZs03OlBhM3NESacVRhKj8j4Nbd8+YdON5XZ
	YDzrJXbdxWYzgDb5h00W0w==
X-Received: by 10.237.45.135 with SMTP id i7mr116719qtd.194.1500358904543;
	Mon, 17 Jul 2017 23:21:44 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.21.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:21:43 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org, Fam Zheng <famz@redhat.com>,
	John Snow <jsnow@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-block@nongnu.org,
	Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:10:03 -0300
Message-Id: <20170718061005.29518-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 27/29] tests/hbitmap: use ARRAY_SIZE macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:21:47 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/test-hbitmap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/test-hbitmap.c b/tests/test-hbitmap.c
index 1acb353889..628e72122b 100644
--- a/tests/test-hbitmap.c
+++ b/tests/test-hbitmap.c
@@ -813,7 +813,7 @@ static void test_hbitmap_serialize_basic(TestHBitmapData *data,
     size_t buf_size;
     uint8_t *buf;
     uint64_t positions[] = { 0, 1, L1 - 1, L1, L2 - 1, L2, L2 + 1, L3 - 1 };
-    int num_positions = sizeof(positions) / sizeof(positions[0]);
+    int num_positions = ARRAY_SIZE(positions);
 
     hbitmap_test_init(data, L3, 0);
     g_assert(hbitmap_is_serializable(data->hb));
@@ -838,7 +838,7 @@ static void test_hbitmap_serialize_part(TestHBitmapData *data,
     size_t buf_size;
     uint8_t *buf;
     uint64_t positions[] = { 0, 1, L1 - 1, L1, L2 - 1, L2, L2 + 1, L3 - 1 };
-    int num_positions = sizeof(positions) / sizeof(positions[0]);
+    int num_positions = ARRAY_SIZE(positions);
 
     hbitmap_test_init(data, L3, 0);
     buf_size = L2;
@@ -880,7 +880,7 @@ static void test_hbitmap_serialize_zeroes(TestHBitmapData *data,
     int64_t next;
     uint64_t min_l1 = MAX(L1, 64);
     uint64_t positions[] = { 0, min_l1, L2, L3 - min_l1};
-    int num_positions = sizeof(positions) / sizeof(positions[0]);
+    int num_positions = ARRAY_SIZE(positions);
 
     hbitmap_test_init(data, L3, 0);
 
-- 
2.13.2


