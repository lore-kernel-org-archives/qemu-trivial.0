Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLtA-0002LI-W4
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:21:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLt6-0002GO-8r
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLt5-0001eL-IZ
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:40 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:33313)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLt5-0001e0-ED; Tue, 18 Jul 2017 02:21:39 -0400
Received: by mail-qt0-x244.google.com with SMTP id 50so293470qtz.0;
	Mon, 17 Jul 2017 23:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GPbs8lZhhK+HpXP5dlaoxGcOxo2B7O86EO/itUyPrEs=;
	b=PmHqxPOspHFrGIF/9pMzRAj0viAgx6AG6pHORbeM3f+l2coRiiDL68abDkuVxCyo0P
	RsnC6MXLHb+GjKZOMX0bF3ktscV47Yok+LUIiUO1cULyZ37PytxMeMf4FSq7lPz7rf6m
	qVx8VPZnH6dw6CEezJY9tjN+N5HlNY5D7hr2BRLFcMGVHpJsIDRqnVih5u75Sl/8yJDY
	dH/YhiAJyqpmeRt9AtVwVniSRWuhVBVrD2OOyvOvQA7kT82Tu5QCSj77dI7bpAXIUrKr
	06+ztrY00eigyd3USsFwSy4UGkDdO60AJUKUVmEsurVKcwSto7KTSVn2mS4fQZ6rqbGa
	jxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=GPbs8lZhhK+HpXP5dlaoxGcOxo2B7O86EO/itUyPrEs=;
	b=sT46l/kf5wWTn23MAFCY7la4A6uTzxSDOSmLOADi5jqsu3eAa1vtze048bkX0SHvmH
	iFbdX+jX3GPwzsfaw0Zsh5jbpimghCub+fjrECocWnnmVCSQsPkkv5W2ijaUtLVcq9Qk
	fXkQK4w6MrUPKEOOQIcCcj4+htQEEXgmmZpU7hjHuVGetNtCi9WcFM81CH73KlqaXhzt
	wMa0Wm9m2XSNcNxMRvp+gAlGUsy7m9Y12egqdb9T2whTUMJnBUskXPY0qR22As7X9YHI
	TvPwHIRu2dkBEpJDxCKTsBNRteTfa2zSgiE3OCa9Mdy/XQL47ZFmd48bHelaGwkJXkKD
	ptog==
X-Gm-Message-State: AIVw112f8bd8cNx6HNSDBi+HuTD+32MQXou8a1XZJXP/log77j5G6+aQ
	Kxnpke2aZPoXNHE8ExXSNg==
X-Received: by 10.237.42.125 with SMTP id k58mr159559qtf.58.1500358898818;
	Mon, 17 Jul 2017 23:21:38 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.21.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:21:38 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:10:01 -0300
Message-Id: <20170718061005.29518-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 25/29] libqos: use ARRAY_SIZE macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:21:43 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

No entry in MAINTAINERS for tests/libqos/* does it deserve it's own entry?

 tests/libqos/libqos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/libqos/libqos.c b/tests/libqos/libqos.c
index 6226546c28..0edb7e99ba 100644
--- a/tests/libqos/libqos.c
+++ b/tests/libqos/libqos.c
@@ -258,7 +258,7 @@ void generate_pattern(void *buffer, size_t len, size_t cycle_len)
     p = rand() % 256;
     for (i = 0; i < len; i++) {
         tx[i] = p++ % 256;
-        if (i % cycle_len == 0) {
+        if (QEMU_IS_ALIGNED(i, cycle_len)) {
             p = rand() % 256;
         }
     }
-- 
2.13.2


