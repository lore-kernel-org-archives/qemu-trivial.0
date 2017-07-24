Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi6p-0001AN-6s
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:29:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6m-00017O-JA
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6l-0005iV-PI
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:32 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:34356)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6i-0005f6-6o; Mon, 24 Jul 2017 14:29:28 -0400
Received: by mail-qk0-x241.google.com with SMTP id q66so10664119qki.1;
	Mon, 24 Jul 2017 11:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=K2EV1ph+x6Th5Q8AnH30/ZlAelSrWZ4P64n3I0W12cc=;
	b=FekGyQtLYl8qxAkMTkk80Xm+jjzJGFUCemVDtuTFEMQgDFZpaGHbBm5y5ITi64tfMS
	dvTydf2374W7+4kPs+iQKSI6GBHNj0xMuInneNO/CvSmFJOz7sPtE9CwJjGncDrJu8i3
	5+hPdHa12Cwbnm/WokAcgCOBHPQPWF82coZXPcDR+vMi0sbAzHGuLXbQdUd4JWD7oGTs
	BQ+LiEa4RgySuEIEQog5rcsU5Kq+ldh05oeZXJhO+XA1UlUQYmz2tcCMGvZuNFgk3Ayv
	7jOWH74MQRakqcBW0tR6gKJI27fgQ7xjflHcGain08O0gAv3n4q6BJWUi3+6FZMyO5ar
	Jzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=K2EV1ph+x6Th5Q8AnH30/ZlAelSrWZ4P64n3I0W12cc=;
	b=EfFe+OBvkTuQMoNPQDeS6yjUVEGcM9QbaWFO9u4wXMNbmdEJKhtheaTPbmZO3eZt7U
	dpUmWevbjxch/iwzbr2uEHbilj6falqX/duZH4XFbKr6S752lVc0A4ymCOGGgoZYPA/9
	7FjqnaJsOKhCJm2KsvDSLYSSJTva0YJ0rFivYMuRzn2Css9io6QRtOn8ERZaVnttgydH
	C3PE/Xv4Rss1yYvcbKZMQnfKy1Q0+HSY5G+NciSQMBHRkjEKgQQX11A/nb1lH0MpIKAb
	Oa4ezPqToKHRauRimuxWbSvCfpqTVZJBAOTpO7MJlTr+30zM7BCOGmoyoZhP34IKA7t4
	SJWA==
X-Gm-Message-State: AIVw113UsIhzssGV1xnpfs/IWhXCfci9713BdLWG8Ge6Yg/MwfYLT3En
	57ehTfO1R7ei8A==
X-Received: by 10.55.33.77 with SMTP id h74mr22983735qkh.353.1500920967749;
	Mon, 24 Jul 2017 11:29:27 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.29.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:29:27 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 24 Jul 2017 15:27:43 -0300
Message-Id: <20170724182751.18261-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH for 2.10 27/35] syscall: fix dereference of
 undefined pointer
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
X-List-Received-Date: Mon, 24 Jul 2017 18:29:33 -0000

Clang's scan-build-5.0 reports:

linux-user/syscall.c:5581:9: warning: Dereference of undefined pointer value
    if (*host_rt_dev_ptr != 0) {
        ^~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Suggested-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/syscall.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index fcd20fa276..e79b5baec4 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -5524,7 +5524,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie, uint8_t *buf_temp,
     int target_size;
     void *argptr;
     abi_ulong *target_rt_dev_ptr;
-    unsigned long *host_rt_dev_ptr;
+    unsigned long *host_rt_dev_ptr = NULL;
     abi_long ret;
     int i;
 
@@ -5570,6 +5570,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie, uint8_t *buf_temp,
     unlock_user(argptr, arg, 0);
 
     ret = get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
+    assert(host_rt_dev_ptr);
     if (*host_rt_dev_ptr != 0) {
         unlock_user((void *)*host_rt_dev_ptr,
                     *target_rt_dev_ptr, 0);
-- 
2.13.3


