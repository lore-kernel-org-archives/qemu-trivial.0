Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi73-0001Pv-Uj
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:29:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6z-0001Lc-6Z
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6y-0005x8-AP
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:45 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35818)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6w-0005tV-E5; Mon, 24 Jul 2017 14:29:42 -0400
Received: by mail-qk0-x241.google.com with SMTP id k2so3228145qkf.2;
	Mon, 24 Jul 2017 11:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=UWSw22TstASCCRnAWr2GpU6Rn4GTeYUkN+RAWv+QDZY=;
	b=loSK60Ke2HcwAgqEWTQ7pZLTTBkf4FFUadFqC2Z6sHrU4fEJrBNsI+jtUmgVgjKZWt
	1ZwLs1PO8n58sI0EHr9W/N4avxmgdVHnImwqbXZgNlc2eVwxnh6hjaj98/chZlEcqdL8
	Fkbm6evBvFgS07QeVO5xttDNr5mKh36WNszn4IdLotdnBzGcmu+Xz0Yjao4n/tQlEora
	kbMIgwgTWfY7p6sOAgYh6vybT5ZlCKYX+oYlAxdq1l4CYBoCD1CKJ3caJctqfCUtWYup
	ZHGSvFUf7JBy6JgvIz/tRCWQQnagfMY9GMaLhk4BTgVfmngwrkQ7KDb2kzUjj99+N9LI
	srcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=UWSw22TstASCCRnAWr2GpU6Rn4GTeYUkN+RAWv+QDZY=;
	b=LQ9m7romUSdnd9CcbwBP/YtBQx4+YRRE73SQSjx881sj8BccY7wQ5jju6+wJVBDeNE
	u0mJoRfsyD7wz2KSZZrqOXOd3YQjbGBgMzmYbAfUzbe858c/+ZAaUywwLCBeCvupMTbr
	u4pmlEoWUeAby/4JC+6qPdcAaR/fcQgFH69+KpoZWsSn2qy8NXfvMaRprBqaN7dA2Yjk
	pQekIaKx/CccnA+wpWPuIx85lnahM4jt/rynGd/t5HYYn2w/5etPETLLxDxWbPwmAhR5
	0eVhmNbCKjxBHm6rHu+w50LrSOelHv6Ed57Njalss81nkCNxqdjFzhLVQqJ3nImMuntp
	DREg==
X-Gm-Message-State: AIVw113brsE5SxGm++QZez353XkZ5hKqAg9Puc4mBp2lJ3KvksTaYwsk
	09Vv28WGer/Igw==
X-Received: by 10.55.27.145 with SMTP id m17mr22091361qkh.298.1500920981978;
	Mon, 24 Jul 2017 11:29:41 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.29.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:29:41 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Mon, 24 Jul 2017 15:27:48 -0300
Message-Id: <20170724182751.18261-33-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH for 2.10 32/35] timer/pxa2xx: silent warning
 about out-of-bound memory access
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
X-List-Received-Date: Mon, 24 Jul 2017 18:29:48 -0000

Unlikely to happen.

hw/timer/pxa2xx_timer.c:145:19: warning: Out of bound memory access (accessed memory precedes memory block)
        counter = counters[n];
                  ^~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/pxa2xx_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
index 68ba5a70b3..d47f463636 100644
--- a/hw/timer/pxa2xx_timer.c
+++ b/hw/timer/pxa2xx_timer.c
@@ -139,7 +139,7 @@ static void pxa2xx_timer_update4(void *opaque, uint64_t now_qemu, int n)
     if (s->tm4[n].control & (1 << 7))
         counter = n;
     else
-        counter = counters[n];
+        counter = counters[n & 7];
 
     if (!s->tm4[counter].freq) {
         timer_del(s->tm4[n].tm.qtimer);
-- 
2.13.3


