Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cQw-0000oI-3r
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:53:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQu-0000mO-EL
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQt-0006eD-Kw
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:32 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:56009)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQr-0006dA-Ld; Fri, 06 Oct 2017 19:53:29 -0400
Received: by mail-qt0-x241.google.com with SMTP id x54so34278818qth.12;
	Fri, 06 Oct 2017 16:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=49NwupevJ+PbpOKOE8EAPS+cws/gv4+UP3rDgHzT8C8=;
	b=sxgNEOzfmVkWD4Nm/dTGf5Q71vO9ej4bPGh6pMyfcHEyStSZRnwoDZe5YEvSOOShm8
	Y+n1HQZBlEDBaD7xv+5KWduCdg42rkTwJTCZs7F2jup1kXXsz89u5ESldPdLswus4L0i
	7ZVkKMSg/sINgqakHNdZhp8/LKV58eWf1+Fjuef0LITDbbxUZ6cviHQyvBfYiRKJHBxn
	X9i7KpUi2dPyT7EhZNfzm0BaLTAxZJO5zchcjZTv53Vs7CDKQV//4eWQYLMS71ZrikOh
	qI0c2Axv4csO/RZFHVcmvr+i5DnLHw0KzBkmlp0h7xAO8QKZCJTvTBHlfP8+No3m9jzC
	gClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=49NwupevJ+PbpOKOE8EAPS+cws/gv4+UP3rDgHzT8C8=;
	b=emZC0RU+5aAHNhF59KBXEVJcAhBETYGX2283nSL6T+hvYLX+lwugJGZucjgzCDqDgp
	kPHRtPQbKS1JYP1RdLaEWYwiZ/ZLkt8kyJGF4bsrPmTt/4PB7B8YJwC0zb3xSIt72EgK
	2N9tmYk2OMod/yoww9dZkWCNo2uhPAPjKEj8wEh8jRRSM16tRPTo14+AoqLxM45o48Ez
	4Eaq/McpvhUKHHNNxKjqPzg5ISiK9/6A+0y+xVCUmA9xomN891JbOYyCD+K0B/7w4f/J
	sftKHTB164kHrv7qxyfx1ScfZBnsyeovfMGqAANxTudllWaWJxhPdsfWhnmoek6WWNc+
	XpWw==
X-Gm-Message-State: AMCzsaVI3XQY1sULqxE6RRQHg7lh7+MeAsvpowN4QM+TRocb/Mes2HZm
	FsKSlGz42K14hsi5e5O3mBs=
X-Google-Smtp-Source: AOwi7QDk3xnjHPwZejU+usFgEmI6PIryWoUVDvAqChw0RaC/CN+5sGnRAwjUaRU7r6lU0KztPYPO/g==
X-Received: by 10.200.52.56 with SMTP id u53mr5498990qtb.16.1507334009152;
	Fri, 06 Oct 2017 16:53:29 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.53.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:53:28 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	xiaoqiang zhao <zxq_yx_007@163.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:49:46 -0300
Message-Id: <20171006235023.11952-52-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 51/88] hw/timer: use g_new() family of
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
X-List-Received-Date: Fri, 06 Oct 2017 23:53:33 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/timer/slavio_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
index a8cc9c0148..6d0282a788 100644
--- a/hw/timer/slavio_timer.c
+++ b/hw/timer/slavio_timer.c
@@ -385,7 +385,7 @@ static void slavio_timer_init(Object *obj)
         uint64_t size;
         char timer_name[20];
 
-        tc = g_malloc0(sizeof(TimerContext));
+        tc = g_new0(TimerContext, 1);
         tc->s = s;
         tc->timer_index = i;
 
-- 
2.14.2


