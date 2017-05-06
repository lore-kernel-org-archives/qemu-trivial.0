Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d6nmp-0004SX-Qf
	for mharc-qemu-trivial@gnu.org; Fri, 05 May 2017 20:41:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d6nmn-0004SD-N6
	for qemu-trivial@nongnu.org; Fri, 05 May 2017 20:41:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d6nmk-000309-Jj
	for qemu-trivial@nongnu.org; Fri, 05 May 2017 20:41:25 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:34958)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d6nmk-0002z4-E6; Fri, 05 May 2017 20:41:22 -0400
Received: by mail-qt0-x244.google.com with SMTP id r58so2906175qtb.2;
	Fri, 05 May 2017 17:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wk+ZwY/w7oX323eqXLrNQVzxKBSjRzTX0Y3KlsdeX8Q=;
	b=d37qC1mtTSQ7eze4alSRn+UNu8DcLkdLWVZ22EO8jw8T0c3N5xZUROOTuatP1Da6OQ
	79sRlBXY1MUASpLCRfxeIo8PKmXj08UiacSiUUSvzUYZg0JEdICi4xasQDWX1sH/P5ZP
	whFqI03P/uKr2KUMpiG7L8SOV2WWX3SfdVpI05V6fdPpnhZ8GrtjAtVvUTwanLglETUZ
	VAmPSCtJ7/JruScAT3lwNfAEG/A74ogWl9koVLIzz9Uu3tWLvIBHptL4vfjkPncjZruh
	Ltu2FJQw2gFuIxBZGg2X80XLOCimlJ93y7R/fmyrVcwu8C3n5WiquiAwY+NMQT+1FHkW
	mO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=wk+ZwY/w7oX323eqXLrNQVzxKBSjRzTX0Y3KlsdeX8Q=;
	b=Vl86HLq0ob0vRc6z3m9bc7+5qhPIJIy6fGiq6JZgloU/u/Hac0blpYukx98F8oWONm
	jTJy8lkVUAWv9a1tbg/Y3IOaTngVG30lYGE2hVeyf1j+jpCn9Ntq95cpHVjK/NTk+Md8
	oBL0GjsrwIvqpKZaWJH8c4uMofToO+tRZsoRK+oP1MglU59QkhYne7RrJ1vKS+iqHokp
	Tkvi2Yche2qsjIWhgHK2j5zB49FSracjImyX40TP1c7douUp7nWIV6FTPNXrc4zZloC3
	gyyUYY0hcaAymB1DOzZ+A44tjA017IM8HQ3oC02j8L7PZq4TgNmNHi76P2yWDBu0RT1q
	seGg==
X-Gm-Message-State: AN3rC/7qLc5FHkpvyS6oip431qjQmcWuDSJNgVcIrKudobfwHHksBs3P
	A0IeLkCOd1SPbg==
X-Received: by 10.237.56.135 with SMTP id k7mr9886061qte.121.1494031281456;
	Fri, 05 May 2017 17:41:21 -0700 (PDT)
Received: from localhost.localdomain ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	r19sm4471745qkl.54.2017.05.05.17.41.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 May 2017 17:41:20 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Riku Voipio <riku.voipio@iki.fi>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Fri,  5 May 2017 21:41:06 -0300
Message-Id: <20170506004106.3291-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH] syscall: fix compiler warnings (clang 5)
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
X-List-Received-Date: Sat, 06 May 2017 00:41:26 -0000

static code analyzer complain:

linux-user/syscall.c:5575:9: warning: Dereference of undefined pointer value
    if (*host_rt_dev_ptr != 0) {
        ^~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/syscall.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index cec8428589..c541e22693 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -5526,7 +5526,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie, uint8_t *buf_temp,
     int target_size;
     void *argptr;
     abi_ulong *target_rt_dev_ptr;
-    unsigned long *host_rt_dev_ptr;
+    unsigned long *host_rt_dev_ptr = NULL;
     abi_long ret;
     int i;
 
@@ -5572,7 +5572,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie, uint8_t *buf_temp,
     unlock_user(argptr, arg, 0);
 
     ret = get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
-    if (*host_rt_dev_ptr != 0) {
+    if (host_rt_dev_ptr != NULL && *host_rt_dev_ptr != 0) {
         unlock_user((void *)*host_rt_dev_ptr,
                     *target_rt_dev_ptr, 0);
     }
-- 
2.11.0


