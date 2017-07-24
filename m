Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi6u-0001GK-Hw
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:29:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6q-0001C1-Ff
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6p-0005kq-LO
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:36 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:34260)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6n-0005ji-Pj; Mon, 24 Jul 2017 14:29:33 -0400
Received: by mail-qt0-x244.google.com with SMTP id i19so2264078qte.1;
	Mon, 24 Jul 2017 11:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kd4Jew/zJE3yP4ur0TokL0/ky6LGLlhd6inO/dzDM28=;
	b=famKsP+PO3aWXmIOU62g/LjKDBT64fMK/kUS8vvcEm3dWAtIc8K3N325aRylqKlVQp
	yii9Xud/krcwisLTpDDejUWuv8WqRSoe2jgqpb4Tf0UNr67g7I8AJq1oDuSXQ4GSlivC
	XeU+JfDt3lunmASIOUtQ5IFTe4xxUaYda6uwTYoq6ImefkcktTiSSCbpBTRFnud145Lh
	iJlsFWQ/U3mHsF3fo/tz1orj55PZchd8pu5uR5idkoTcDfcnuTsrOPWSuX8y0uptmMoe
	X1Zvix437NJO7fwuX4ktRP/uWWue6T5sv9vjOqJJTSNzobve0V4tO40ZQHdArfyifKey
	K2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=kd4Jew/zJE3yP4ur0TokL0/ky6LGLlhd6inO/dzDM28=;
	b=fAkwglibbiqwfr/HNcvUmCTInig+c/ztk9QxQjodd6GA/w9iL2rXSFQbeDFjyguj6v
	hKG4aLcwVwOAJ9LPUa3Zz2dfZC1JuAjV+T3lMxE9LASj3xs67DyLovp8fdKxCZO6Xqqs
	M+i8lW9FpBZnwu0PyWl4h0aT5MCEwAotDpWI9lBZTqDDMclmO/0N4wrkOG7hhKMt7nOo
	TiqRAFlbWw9yFFj7AESl5hOHDtj4mGIYBrnnQZYZe/dy/6wRITUNoUU/dk8FDJ6xbLUy
	TRhU82H46UVgW3wlNQJpdFbB/QVuQGbmg2jaBQ/e20WFbHVOs1q85g7xotQq1pJOJPzV
	EV4w==
X-Gm-Message-State: AIVw110780E1KRGgSj6WND2N+EwOrV2rHo2VsYA52amjjtYuM9XlvMo1
	m3PHqoZItLmU0Q==
X-Received: by 10.200.54.210 with SMTP id b18mr23441921qtc.145.1500920973331; 
	Mon, 24 Jul 2017 11:29:33 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.29.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:29:32 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 24 Jul 2017 15:27:45 -0300
Message-Id: <20170724182751.18261-30-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH for 2.10 29/35] syscall: fix out-of-bound
 memory access
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
X-List-Received-Date: Mon, 24 Jul 2017 18:29:39 -0000

linux-user/syscall.c:555:25: warning: Out of bound memory access (accessed memory precedes memory block)
    target_fd_trans[fd] = trans;
    ~~~~~~~~~~~~~~~~~~~~^~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/syscall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 637270a02d..26450d235f 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -544,6 +544,7 @@ static void fd_trans_register(int fd, TargetFdTrans *trans)
 {
     unsigned int oldmax;
 
+    assert(fd >= 0);
     if (fd >= target_fd_max) {
         oldmax = target_fd_max;
         target_fd_max = ((fd >> 6) + 1) << 6; /* by slice of 64 entries */
-- 
2.13.3


