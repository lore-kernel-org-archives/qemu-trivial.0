Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLt2-0002DP-LO
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:21:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLt0-0002B1-NM
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsz-0001XR-S6
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:34 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:33874)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsz-0001WO-Nm; Tue, 18 Jul 2017 02:21:33 -0400
Received: by mail-qt0-x244.google.com with SMTP id 19so1352454qty.1;
	Mon, 17 Jul 2017 23:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=j+TFNxNyAZQBtr8t7Z4o0l0BiUgv/VW7d5QtEyKdIUU=;
	b=maE5xu3xO6Z5rMgIzD0WjxKsehbnK2Y5/lhneF0hn9kDPHHhfAgtOzYVqfc6UN8lfp
	lUIZmR9xxwm2RBiSs2aNRDvua6u+UiSFGpw/knQYtP31YgJ9Qqy6jc2JJex5kwL8V5PP
	gyxtayBZUsswejSg6DhPLdGoZNGy5waU1HiJtqunjsAmTZHL5tNHDcDVAiuI0yV+paXY
	JxkdAOurlelLxiTndJKc/iah37pSybItqzoR5Pdd/QCn3cY0gu0XcvgjBwEDq4gPEa7N
	Iv6rXhW0JZ++ClaV7CrzrSKNlBn+6oq5gZbSxYdpUVt0z66Bso4jx+c4catwIAQgDLkt
	TyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=j+TFNxNyAZQBtr8t7Z4o0l0BiUgv/VW7d5QtEyKdIUU=;
	b=hNDu1S6yePhYSywhTkj1WLtrj/eUEGYxmLMEQYDKXx87bzusTBNASRviXYsyAqs8xH
	2KVrk5sgfXeeqn/ocfixMu2NOoLPME0gs1CLmBDKCF0yJ6ro7Q3gt81QbYQ4C4i2e9a1
	2afbW78Lk/yXlJxQpNV45eUAwBufQCFMyY+aKpGzbz/iwWJ7eBO9C7p2lQqXgIMByd1u
	+YpQl8vMSGVPEhzfGwM1lx/htPKOgo54h6GhE61vynEgzTWNxEPI26JPPHckOt/BJQ+d
	pM8dGOa4fWb9s9V2uuChSSe6znjzbSfSwGv5Xwpr21ReOtuUbNqFdK6gvO9rxaSEXqGf
	Vubw==
X-Gm-Message-State: AIVw112xzhrSFWL/RV1Lbt2P35mpXHE1jd5AFUBe9oAUzkmBCdlYkcXc
	lbpzUs8jcHuE2sXNmTMEdw==
X-Received: by 10.237.39.97 with SMTP id n88mr133165qtd.78.1500358893142;
	Mon, 17 Jul 2017 23:21:33 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.21.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:21:32 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Fam Zheng <famz@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-block@nongnu.org,
	Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:09:59 -0300
Message-Id: <20170718061005.29518-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 23/29] async: use ARRAY_SIZE macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:21:35 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 util/aio-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/aio-posix.c b/util/aio-posix.c
index 2d51239ec6..e89fd7024a 100644
--- a/util/aio-posix.c
+++ b/util/aio-posix.c
@@ -119,7 +119,7 @@ static int aio_epoll(AioContext *ctx, GPollFD *pfds,
     }
     if (timeout <= 0 || ret > 0) {
         ret = epoll_wait(ctx->epollfd, events,
-                         sizeof(events) / sizeof(events[0]),
+                         ARRAY_SIZE(events),
                          timeout);
         if (ret <= 0) {
             goto out;
-- 
2.13.2


