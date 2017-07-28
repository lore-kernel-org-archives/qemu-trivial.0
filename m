Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxxJ-0004Hu-WE
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:36:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxG-0004DK-Qx
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxG-0003KR-2X
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:54 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:34075)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxx8-0003Cd-Qi; Fri, 28 Jul 2017 01:36:46 -0400
Received: by mail-qk0-x244.google.com with SMTP id q66so20241702qki.1;
	Thu, 27 Jul 2017 22:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Mg1FwSUgZ6XyHNfIsEdN+xH+j438u9WTJmT4maPtZ0U=;
	b=oFgP4NIZPnt5il+dMXZicWIfGHsHzt9aQxUOXJfJlcyLMf5XZDOU3ypdcWqNin53eg
	D+wCyUU80BvrbQWxWdgaOUBqpitsS/QYx93P35vH5VeFGk1MxmyXP8PPitTgLTxe40Tl
	hUr7Brv5HRK9A47kbdZdyUqG8tmsMoxhVRAthQknmW4BXm8xpt5ZPrKyi/VGBS5sAMN2
	NW+pFxqoPiS5cwfnSeP7HwKc4UONPe3SNzBpMMfK/HAhQjPx3G6JY1ZGeu63it2onMpR
	Wib7bbyMhlhMeTKSiijkiOTuEbkv680mDMYkcC6fNe1q++7bOEDYcR8pyvQaMKnTTMBq
	NoTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Mg1FwSUgZ6XyHNfIsEdN+xH+j438u9WTJmT4maPtZ0U=;
	b=IXO/mgoSRLy+8yfn3tAScdsNsLWRzi51lxt8a0hWPETxiHBHEEIoH1tmOXQdGzn+WS
	qAEye4p16wtA3qCg3hYcAkyv9JQxFsogNIxxp0dLQqWVPRPCfyw6t49/wZQm/++SyYQK
	pdqi9zyde5o+UsyzYcKfZzqnaD74iSGxUDJx3J6LZ3ElaupJurGaR06Jvb/+JipXJttO
	IgIknjAwlIGj9x4QJ1QGYYy+tnLqVQ+nFrshsEl6SM4615DaQq3C3/mTUWUsJZTmGJqn
	n2pxJh3mBHJiONkTlFlcO1mYxcbZ6rSKmTzgGMfsh5I6JFrF3k8gQ+00bLkxQywSQsvd
	Xp/w==
X-Gm-Message-State: AIVw113fsqZdfPvJWp5A6q9NPvORDs0KyeCBdCtwvAsT9ae3J+h/DbDE
	EhGDHSFCcPkmdA==
X-Received: by 10.55.25.41 with SMTP id k41mr9069255qkh.354.1501220206377;
	Thu, 27 Jul 2017 22:36:46 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.36.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:36:45 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Date: Fri, 28 Jul 2017 02:35:33 -0300
Message-Id: <20170728053610.15770-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 10/47] MAINTAINERS: add missing entry for
 virtio/blk
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
X-List-Received-Date: Fri, 28 Jul 2017 05:36:55 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4f9ce6e686..2958dd2479 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1067,6 +1067,7 @@ S: Supported
 F: hw/block/virtio-blk.c
 F: hw/block/dataplane/*
 F: tests/virtio-blk-test.c
+F: include/standard-headers/linux/virtio_blk.h
 T: git git://github.com/stefanha/qemu.git block
 
 virtio-ccw
-- 
2.13.3


