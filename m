Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLtK-0002VT-4Q
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:21:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLtE-0002Pq-Se
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLtE-0001sy-2m
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:48 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:33883)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLtD-0001sU-UX; Tue, 18 Jul 2017 02:21:48 -0400
Received: by mail-qt0-x244.google.com with SMTP id 19so1352847qty.1;
	Mon, 17 Jul 2017 23:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=k0QN5HgGI+IlTWNg+p9h59ALBvhBq6h99J53rIPqqd8=;
	b=ONycszQyS2XQFOLPw8ZqktcU/tiwFpZHNGq1v5qC9TUhj6SXy3BF5+d/q4ohHPygKf
	D+T4y7+i0X36dYI7wLJ0pRcZFOWusaAYlRHF25iy9lm0Fh9OSXpq4lXW00Xn9RlqdSHL
	g71UxSPVyXBXgVJFtXLoMgm2a5MH0XWyOIIfd8rHNXS7CFyd54ckpWtG15h9F/wTIc4M
	b3iPp4pSpiVCg33rF6v5q0G9nC+gIJMZwHk8BnAaGiNVX6eOfth7drtWqrlmfctMIpPd
	bZ0kzgWrBhEEm7TgwjP7b10ErGuvsXjvO7lCp+wXYXYUzoxTD/IJK2cyRJIU3GXAMxWa
	UFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=k0QN5HgGI+IlTWNg+p9h59ALBvhBq6h99J53rIPqqd8=;
	b=VxQrrpj2n8JSDp71Jbyhb2gi/GQeFZm/IQ1QdQBzB1kSbKu5Tu4Q1Up9PRMhdvstNe
	A/g/fOIPhfwET6uCZtNg34BulvgTd0jTYKO1m3KFvwqCkUEa3LQ2evg+I2pFkzoiua/O
	eeFE+006sWPb0RO+Kzs0H7raPsauMbJ8Sglcg0U3RL5u4OGQMc6UPYFAu+VU4HkDeFVs
	GWHUx41a0Z1PvTLJGHyZmy7p1Vy6hy8S1hGCk2m9WM2Zif/bjso+Dg+e6jyiywxOP8iK
	SGT6ZOw5XwhMjffOsHtzRkSC2cZSIqKZpCFVsAfkCi1qdLTzsffZV/EoOhTEVgY4AkK/
	j/Yw==
X-Gm-Message-State: AIVw112rQcKsz0lXGq9TbrntjgmMNR+XgDTeGah/bOZBCEIu8JzYNGV1
	IvLWmJsNtNbnp28/TdWoiQ==
X-Received: by 10.200.50.2 with SMTP id x2mr95211qta.23.1500358907361;
	Mon, 17 Jul 2017 23:21:47 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.21.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:21:46 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:10:04 -0300
Message-Id: <20170718061005.29518-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 28/29] tests/qapi: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:21:52 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/test-qobject-output-visitor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/test-qobject-output-visitor.c b/tests/test-qobject-output-visitor.c
index 749c54065f..121ee181a0 100644
--- a/tests/test-qobject-output-visitor.c
+++ b/tests/test-qobject-output-visitor.c
@@ -558,7 +558,7 @@ static void init_native_list(UserDefNativeListUnion *cvalue)
         boolList **list = &cvalue->u.boolean.data;
         for (i = 0; i < 32; i++) {
             *list = g_new0(boolList, 1);
-            (*list)->value = (i % 3 == 0);
+            (*list)->value = QEMU_IS_ALIGNED(i, 3);
             (*list)->next = NULL;
             list = &(*list)->next;
         }
-- 
2.13.2


