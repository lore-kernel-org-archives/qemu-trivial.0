Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daYlI-0005Mz-U4
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 22:42:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlG-0005KY-L8
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:42:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlF-0007mX-Pi
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:42:50 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:33254)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYl8-0007fp-LZ; Wed, 26 Jul 2017 22:42:42 -0400
Received: by mail-qk0-x242.google.com with SMTP id d145so14633905qkc.0;
	Wed, 26 Jul 2017 19:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9brdrZycglw+yImoxaQzb73jyPyOdLlYGgd7f0CjgF0=;
	b=mv4BwLj4kLOrZmQBFUjyOkoN+FCG/0hjx/H5udr1NgFMQ40s6XsI0VfllagCDUBlF8
	7IiThyecl+z4RvQTqoHBsMSbFGZJlFESY0dlV2vcOR0d/pWBluP0STWVmoesl3RSul18
	sJ1aysxirRHuQ2rF+CBTOkW9aSCy7rifnlBQne8/JlD0+r9kCb/Waa800uGrmAt8GpNg
	ZI8O0i37Ia/fyiiUVRWTV529/zK8TZDXfG3jQSLoXZP0E6O6TnipjibZr6OGmdYKmU3s
	3dUVJPHyn2bCAK80dZdyR4O45Qvp6NkqYrMbq8cUTKFDhk7J9/avMXxS52Zgkeo7IGMs
	YpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=9brdrZycglw+yImoxaQzb73jyPyOdLlYGgd7f0CjgF0=;
	b=eadTPY8uYQyJu+xEOmUaxxZeO+vPi8f719v3R8N2zyb8pigIV2bDBhZrPrth63yFmC
	aXHdkcnCy6kSCWeg6CyrRK3AcSxwDapVWcqyWVpakv9uM65pVCYDgJ4veIae0Azf6047
	JMYLQoqOi7hSO1kVLK/HqOtw5yVdheXDN5yyFXg/DccJibTjfo0pguAFTufGQsecLqPm
	LraYsL+x9TT2VtmySoZAlHd2EU2DoL8vJHuR76d8woYLfkw6vUdrNKtd30A2lBWgyxJZ
	DKnuiQF9Lj/LLmrq5JbyhMdGoD7Ro/GA8RFjWu7adKyOrAoXx2tCf9drawxMXQ0pNFus
	SBEQ==
X-Gm-Message-State: AIVw11334Ymk/Qj9Fne0oTlKlYTlx6m8DL0918Pgy4oSOxmhRojVlApa
	CKQxHoRMXzJmANIygIq/xQ==
X-Received: by 10.55.107.134 with SMTP id g128mr3700302qkc.166.1501123362073; 
	Wed, 26 Jul 2017 19:42:42 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	g27sm13221147qtg.84.2017.07.26.19.42.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 19:42:41 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 26 Jul 2017 23:42:08 -0300
Message-Id: <20170727024224.22900-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170727024224.22900-1-f4bug@amsat.org>
References: <20170727024224.22900-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH for 2.10 v2 03/20] ivshmem: fix incorrect
 error handling in ivshmem_recv_msg()
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
X-List-Received-Date: Thu, 27 Jul 2017 02:42:51 -0000

Screwed up in commit 3a55fc0f, v2.6.0.

If qemu_chr_fe_read_all() returns -EINTR the do {} statement continues and the
n accumulator used to complete reads upto sizeof(msg) is decremented by 4 (the
value of EINTR on Linux).
To avoid that, use simpler if() statements and continue if EINTR occured.

hw/misc/ivshmem.c:650:14: warning: Loss of sign in implicit conversion
    } while (n < sizeof(msg));
             ^

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 hw/misc/ivshmem.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index a58f9ee579..47a015f072 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -642,7 +642,10 @@ static int64_t ivshmem_recv_msg(IVShmemState *s, int *pfd, Error **errp)
     do {
         ret = qemu_chr_fe_read_all(&s->server_chr, (uint8_t *)&msg + n,
                                    sizeof(msg) - n);
-        if (ret < 0 && ret != -EINTR) {
+        if (ret < 0) {
+            if (ret == -EINTR) {
+                continue;
+            }
             error_setg_errno(errp, -ret, "read from server failed");
             return INT64_MIN;
         }
-- 
2.13.3


