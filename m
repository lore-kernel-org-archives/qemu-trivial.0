Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi5n-0008L1-6X
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:28:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5k-0008IR-Pa
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5j-0004ld-VC
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:28 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:35759)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5i-0004kw-02; Mon, 24 Jul 2017 14:28:26 -0400
Received: by mail-qt0-x241.google.com with SMTP id 21so5054782qtx.2;
	Mon, 24 Jul 2017 11:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qnqayY1OfO+/Z508AN/ruOaC+dXZeWF4ND8GXK1J/7M=;
	b=MybyyFKdvs7o/2QBBDxMqA7YL5+aBXRIfNYwigsfmKQb4IvjL/hRzJtEXWhrI73EQO
	rBfmGAwX9AeWYlz1a5h0gi21eVxMMFlLSy7O7JPrIUs5N7D6SSrFfbE1ilILuva9zu14
	G/n+CI7pwsOOVNZwn6w2lTdklziuXCpio4GYfwJBXqdq0VAML7J/flzrGnNZHaRynXsL
	20kacQRccL+AXt6pTJFLTwZH0lPN1LgDXe31ZrVmputXkGTHEdklCFyem0PvXSkKFQd1
	7b9MiPiefJa0qSXhdlGw4uGxUgctIk7880XoT8f52FENmsydVytS2xRuA/b7MjIB8hs9
	b3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=qnqayY1OfO+/Z508AN/ruOaC+dXZeWF4ND8GXK1J/7M=;
	b=ZDWU3rOUnS1MfuH4zCGPDipyh3OgWHAwEGI8WhTn3jrwucQLNyJpW5A/170HmuCETh
	1XvwzrwfZ7VZBaODomiC8dD1gysqNlgpHHcnFG8YlH3mLDGiou04pR5y578DkmijzhGJ
	ONjMzJLRibnNz0zu/awFOTSS4EFgl+CeuLVWXUN2ffeHVX/8497EtmvHfX2Lm3z/pkuH
	hyZO/iOnz0VCs9PJ0TwB/wf3OhQdD2CYi2vDhZxdaJYq2oTFLQwi00Yiy7tM/db6t1/w
	DIX4pP2ZCtYLW8JUD4BNSyJ+fnpT+XrGV8dw7ukLiNt6MQxjdqcF1uFsBgZVqyjTDsWC
	ui6A==
X-Gm-Message-State: AIVw113raHc3R8Qcbv5xOcoD5fRK3Cpw5gmZ+m3Rwwcdiu8lBVKVYqFA
	4MdXfUUkM5MTD5mimDU=
X-Received: by 10.200.34.43 with SMTP id o40mr6687914qto.131.1500920905572;
	Mon, 24 Jul 2017 11:28:25 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.28.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:28:25 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Date: Mon, 24 Jul 2017 15:27:21 -0300
Message-Id: <20170724182751.18261-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH for 2.10 05/35] nbd: fix memory leak in
 nbd_opt_go()
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
X-List-Received-Date: Mon, 24 Jul 2017 18:28:29 -0000

nbd/client.c:385:12: warning: Potential leak of memory pointed to by 'buf'

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 nbd/client.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/nbd/client.c b/nbd/client.c
index 509ed5e4ba..0a17de80b5 100644
--- a/nbd/client.c
+++ b/nbd/client.c
@@ -376,9 +376,11 @@ static int nbd_opt_go(QIOChannel *ioc, const char *wantname,
     if (info->request_sizes) {
         stw_be_p(buf + 4 + len + 2, NBD_INFO_BLOCK_SIZE);
     }
-    if (nbd_send_option_request(ioc, NBD_OPT_GO,
-                                4 + len + 2 + 2 * info->request_sizes, buf,
-                                errp) < 0) {
+    error = nbd_send_option_request(ioc, NBD_OPT_GO,
+                                    4 + len + 2 + 2 * info->request_sizes,
+                                    buf, errp);
+    g_free(buf);
+    if (error < 0) {
         return -1;
     }
 
-- 
2.13.3


