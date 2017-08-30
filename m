Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnAy5-0005ii-If
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 17:56:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAy3-0005fj-8N
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAy2-0007rB-J4
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:11 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:38360)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAy0-0007q4-LM; Wed, 30 Aug 2017 17:56:08 -0400
Received: by mail-qt0-x242.google.com with SMTP id d15so6268214qta.5;
	Wed, 30 Aug 2017 14:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OZEnj2ZWkuG1/KbAb5pfqUHL/Y5N6QmLAaNPDdDLWZI=;
	b=p8F0xoMIdDjxLy7yOk6oT8jr6eNMpSz1v/G9dGdTvkNO1sYYrxEmo0d0ap8dinm9Zy
	1d4WgWq7QzatPKFYZ4CG0/sEwthqjkb37DFXG0e0Zh+2QIZ4VoWegIxlIEXo3XbnIo9F
	1CHj8YF5WFDRqglpE6Kw6av7Gj2iFggor0x4wdOeX8rMnVO0w89PrslNB8yd8uLwIxnH
	u/MDvkGJkTXRPT6IQ/LanFbKUsGx1kiQJp1cNPxyvGCdgfQGdxGwHcpMYceEvcid8vhl
	AgSl/U/Ihacvfkho+7n8/H30CivoYHdCnSbt63vIabEIKrguPjgjuprWVwgdKmaHIZT5
	znlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=OZEnj2ZWkuG1/KbAb5pfqUHL/Y5N6QmLAaNPDdDLWZI=;
	b=bITwyaP0PBZOsHdgPKYURWpbgwtbkN4wsAYSk1VbHB8zwYhoW/0EmSpwLeJdeYbqPu
	BWfhJX6asL1yRPKoGV6YmAGvINIxJk4tpHUJGj4PkjPDsEF1dB8wxjuXwR9Cj3gnY2WV
	CCfQ9gHOjfb9VL1ygcTctSy2ZYpVTMZ0D1xLSJQs/orT2bt6VsIUoUoWkCJkmMZL2o1V
	7BXsfCC0fX/pxVb3n6on0mFVq46aOlg59l2F68XowkY+RXE9SzRC+O62TclvP7xb9jeD
	qu7fNbPH4VYWbO+m3nYXspL+yFCBeAl+qJFM2vBuuYOuSyH9B9qov5yuMZDwWi1oN2aL
	e+bA==
X-Gm-Message-State: AHPjjUhPyqhP0Alse6cyDxj0MwDkQri6KpXIZWDEJf8JatjVYPJTXLHz
	xJWrb7gnVYl+jg==
X-Received: by 10.200.53.38 with SMTP id y35mr4160208qtb.108.1504130168136;
	Wed, 30 Aug 2017 14:56:08 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	w131sm4298690qkb.85.2017.08.30.14.56.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 14:56:07 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alberto Garcia <berto@igalia.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 30 Aug 2017 18:55:17 -0300
Message-Id: <20170830215523.25278-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170830215523.25278-1-f4bug@amsat.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v2 11/17] MAINTAINERS: add missing entries
 for throttling infra
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
X-List-Received-Date: Wed, 30 Aug 2017 21:56:12 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0a3a50aa25..fa74b7254b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1558,8 +1558,10 @@ M: Alberto Garcia <berto@igalia.com>
 S: Supported
 F: block/throttle-groups.c
 F: include/block/throttle-groups.h
-F: include/qemu/throttle.h
+F: include/qemu/throttle*.h
 F: util/throttle.c
+F: docs/throttle.txt
+F: tests/test-throttle.c
 L: qemu-block@nongnu.org
 
 UUID
-- 
2.14.1


