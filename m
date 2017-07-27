Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daYlL-0005Pa-DH
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 22:42:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlH-0005L3-8b
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:42:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlG-0007o6-Kg
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:42:51 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:38128)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlB-0007hs-UA; Wed, 26 Jul 2017 22:42:45 -0400
Received: by mail-qt0-x243.google.com with SMTP id p3so8854644qtg.5;
	Wed, 26 Jul 2017 19:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KNNMAc78LwnNK/5KU3VsZMnyW62jdqbL+rBjt0SGc3k=;
	b=vNO/VoRdZ4ZJg+RvahpMwGpDAbp+Jb2kGK+AdAUONuxHrKqQ9gMUpmuckSn04pdZa3
	3Lr68gW0RRYMqJlq39JL4H3jeDklrrzKApCc3lylI5uxfTs3ZkUKPfS1oXk7yhY+uzZ/
	o/hiMxSZuE6wIb91x6XsvjxoakNt+a+1FIXHsOFkrXdp8q0wRtjjozslkEBn3D3JlxAS
	BissXCkn2t9HeD0TX5Nid9X1ulHnZxoqxqjBNYqtXEl6hqDkqMxfp3jACD1ki6HQKAhQ
	hWuGOZK/TtO6ys9ycM8ZlgtcPmFh1wJDmnF3OMIvptC3JyWT3BTUf/5BnhFhYu4DF541
	3BKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=KNNMAc78LwnNK/5KU3VsZMnyW62jdqbL+rBjt0SGc3k=;
	b=flCMuPgILnXfD8uvuXZgfKv8qeElt4aN6Y+MRqWe/vl5Okte3WGjK1vGlYn6r4u1/8
	LxCN2W2aLcp03QVGS7XgeglPuqd4SM6FiJlr9Bc2PIT38dbAf1q4gV2N9mvQApYGO/I2
	/cRF4UEnyuRwBRCPPbhA9CyDuPK8e7+S6GQxdFFpsPt5TOOzttL9VHdg1F+mwujMFiqD
	77FFlXrcSygciQ32HUQQwoMEFz5wMjD7dTqoueWAWMbIrE6rU+xwgs8vAuVsEii4bGYd
	QwIgeWVa21g36fDDNttmlePXtlsbJp6NdgCxthgyxNA4f7nuqMNUZyOwxJ/IDv6wNxpX
	UxZA==
X-Gm-Message-State: AIVw113dzEBX7GR/f6O0tKFNmWZYRnQ2wi13320rKOUdhp085fcoG3hx
	Hog6nAETksVuM73vGxUReg==
X-Received: by 10.200.55.147 with SMTP id d19mr3840515qtc.94.1501123365345;
	Wed, 26 Jul 2017 19:42:45 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	g27sm13221147qtg.84.2017.07.26.19.42.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 19:42:44 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Date: Wed, 26 Jul 2017 23:42:09 -0300
Message-Id: <20170727024224.22900-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170727024224.22900-1-f4bug@amsat.org>
References: <20170727024224.22900-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH for 2.10 v2 04/20] nbd: fix memory leak in
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
X-List-Received-Date: Thu, 27 Jul 2017 02:42:52 -0000

nbd/client.c:385:12: warning: Potential leak of memory pointed to by 'buf'

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
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


