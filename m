Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi6h-000120-3g
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:29:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50728)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6e-0000yQ-Sz
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6e-0005dE-2Y
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:24 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:37496)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6c-0005bs-0g; Mon, 24 Jul 2017 14:29:22 -0400
Received: by mail-qt0-x243.google.com with SMTP id d10so1061665qtb.4;
	Mon, 24 Jul 2017 11:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=eEsb9d9DMMsDb+v07eFkn9KBT980rxhrErx0C5zR0yA=;
	b=AXCYkYpepPVATDgst+C9tImmyI+CkUinrkAP8RowrpDl6LBVYXs/DM7mINigp8A9Ns
	4N98fL+TDoyvYO3gtNRpcTKyhHkgfSAIAOlTDUD9wd58UY45zS3VvxCxSBLN5pzo+pBg
	Ucgh5tFzAwxTOQvOQNv/+JCOYeTtehIyB3G9bvVaKkhdsZOxOzmng6twEGZSws1inoX2
	Hs+UfIBXcrJVPtLu6x0aJ/thAyAnHlKQxucBUgxXh/EXtE+oyOklu6UiG1Jew2cLEC2Y
	7l89a+qvOM/2XKuzFpon2eDFTpM188YJgBt70AHpvFo0rASuV5a2THyPH7m9pD71sEmB
	pNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=eEsb9d9DMMsDb+v07eFkn9KBT980rxhrErx0C5zR0yA=;
	b=PyDk6ffD8PumnPpyJ6TGjHaOvu7Gqmo0W28FmhpKWgXaUwBEAFLKCrxuLcNRiJpMbR
	KKHj/jEyBD2F5Iqn6wPjaoFnlaqG/34FyQ1AA+XZHSEnXgZe0xT5S7dHwn+tFprP1wnd
	eD0c+h5/1WzlRl9hjdC0ymJyHIYEfGbe0p7Gf2T1bycKJbIeYAR+68tDnaMu3PP3IN/P
	SAE1MDow320loikJKKQkkDXAnTFReWuihv7MWWBLeCT/YFphw036Rui0bUjkaf0NF8TD
	J1YwIVByWUqwK2kKKKfYLCR5hsL3FrOYDGGVXncknTi1YSZGTGWakQu0EyW7QZxSaK0Z
	Rj4w==
X-Gm-Message-State: AIVw113P9rlEW9cmCbhbU3TDXsWn6NPnDzsRyp0Jt1ZFDeIZhRuBQf3U
	PBKLjWW0qMMmdg==
X-Received: by 10.200.46.19 with SMTP id r19mr4610684qta.24.1500920961580;
	Mon, 24 Jul 2017 11:29:21 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.29.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:29:21 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 24 Jul 2017 15:27:41 -0300
Message-Id: <20170724182751.18261-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH for 2.10 25/35] linux-user: extract
 is_error() out of syscall.c
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
X-List-Received-Date: Mon, 24 Jul 2017 18:29:25 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/qemu.h    | 5 +++++
 linux-user/syscall.c | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 4edd7d0c08..97b7cfdb63 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -614,6 +614,11 @@ static inline void *lock_user_string(abi_ulong guest_addr)
 
 #include <pthread.h>
 
+static inline int is_error(abi_long ret)
+{
+    return (abi_ulong)ret >= (abi_ulong)(-4096);
+}
+
 /* Include target-specific struct and function definitions;
  * they may need access to the target-independent structures
  * above, so include them last.
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 003943b736..fcd20fa276 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -837,11 +837,6 @@ static inline abi_long get_errno(abi_long ret)
         return ret;
 }
 
-static inline int is_error(abi_long ret)
-{
-    return (abi_ulong)ret >= (abi_ulong)(-4096);
-}
-
 const char *target_strerror(int err)
 {
     if (err == TARGET_ERESTARTSYS) {
-- 
2.13.3


