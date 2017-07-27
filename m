Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daYli-0005l7-R3
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 22:43:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54892)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlg-0005jH-RD
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYld-00087l-Lo
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:16 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:35747)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlb-00085w-Oq; Wed, 26 Jul 2017 22:43:11 -0400
Received: by mail-qk0-x244.google.com with SMTP id k2so9706707qkf.2;
	Wed, 26 Jul 2017 19:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Jm9KVQN1EQgrWTyjd2EVOLfIC9IQy/8UySAlPsFv75U=;
	b=CTLRlVDaPjRJYEcyNzzeRZQm6LmA4kqVdzY9YefmZpFw/ePeVcTkVK5zRqRunItNPQ
	0kYg782/ZyIDPiFMLKHnA5Bzc7axnyWHWdlSP5PsDxLBsXoFDbAVuXvYBmb+idUIJhv+
	DKGRr/Ni3HP1TttVm93XK6zMpMMHnPQcyWQSimYSmGe8IPKwiyA83UyljAdM5DUZvrB7
	yYN4FS0E8NCs5HTbGo2mPWX/Mjhngs9ZwA19PMXN23cu2tak1fTM7bUZ6BVgpar8bQtT
	+TyuRE9BUy2fvoaHM5jC+55OkHOewJuE5urbKuhbG6CSRXDbU5ZWQ9SuG/8UY/o0qvBo
	hdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Jm9KVQN1EQgrWTyjd2EVOLfIC9IQy/8UySAlPsFv75U=;
	b=AyiR942hjOMBVkxGhDwnpZ9rv1I26NSWFRl+Gnj50agduD9ZbfxXtQlgrS57NPYXek
	vgaNL8IvDHB/3e+CgC90gUuZtgRroYTAdyvcIGcFPkeO+KS9SsgkCWu3HAFBTaK5IZeL
	XdP3JucrulIRbbwWKs0+XrQ6cgc35XMMNHoswqBvlaxKZWzOtph6tJROcBBnKagFXF8w
	zLnjwNX1QLyUxgJFR3WbikSXOR/rH6ut2lTxSiLtoRgWVlzr9PUHPT8tlDjLdZ/haLM7
	eD3AyaSNzkIVnjyA+ovq35D8ALy0l//KM7pAK0uoxbSoGUPSvomimqMtexBKuV7RPMA8
	+8LQ==
X-Gm-Message-State: AIVw110Dmp/u0I4g/n/+UCdiuwMNxs9oRQEcyEd0yDaiLr7nzB3GxQXI
	vZgYTrrXgmdA+JpDTkk/DQ==
X-Received: by 10.55.167.211 with SMTP id q202mr3818651qke.77.1501123391208;
	Wed, 26 Jul 2017 19:43:11 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	g27sm13221147qtg.84.2017.07.26.19.43.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 19:43:10 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 26 Jul 2017 23:42:17 -0300
Message-Id: <20170727024224.22900-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170727024224.22900-1-f4bug@amsat.org>
References: <20170727024224.22900-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH for 2.10 v2 12/20] syscall: fix dereference
 of undefined pointer
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
X-List-Received-Date: Thu, 27 Jul 2017 02:43:17 -0000

linux-user/syscall.c:5581:9: warning: Dereference of undefined pointer value
    if (*host_rt_dev_ptr != 0) {
        ^~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Suggested-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/syscall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 003943b736..71d45a9963 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -5573,6 +5573,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie, uint8_t *buf_temp,
                                     field_types, THUNK_HOST);
     }
     unlock_user(argptr, arg, 0);
+    assert(host_rt_dev_ptr);
 
     ret = get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
     if (*host_rt_dev_ptr != 0) {
-- 
2.13.3


