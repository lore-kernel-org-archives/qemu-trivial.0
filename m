Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnAyB-0005n6-FI
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 17:56:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAy9-0005m0-WC
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAy7-0007vM-GX
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:18 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:36867)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAy5-0007su-Ln; Wed, 30 Aug 2017 17:56:13 -0400
Received: by mail-qk0-x241.google.com with SMTP id m4so6405993qke.4;
	Wed, 30 Aug 2017 14:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1mwyFpET8ySkyg1hq7x7Vdyq61uqNKBfDPklo1nQ4KI=;
	b=QjPaxl/dgt4hLnobsZFyvkHatyWJvU5qyibwhLj6Op3jS/uzPl8/1VHiFXGxfaUVxe
	5QmlULcJG/7C1EWTAhV67hs940IdAuOfQzfSiGNJowO/74uc16MxuhZkuBaU4X4uj9In
	nEdX96cO1sll2DhbJy10BHRDbFlAMz/BmLdVpaS5pXDqYyBO3cgsbRLJye63cpP2cbwK
	DSCCC73OmvWhby4qJvOt+dLV4/AN6esOgNxPD1SjCVb+gi2DaHIDVDn8FRz1gYVdV+Sv
	LqbY2JBr0lgJG+EhyivoovAMB5pEQbc5m4AqGZshOkAgk3N2YbCYGP3DYLoOhh4D1nJk
	sDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=1mwyFpET8ySkyg1hq7x7Vdyq61uqNKBfDPklo1nQ4KI=;
	b=eJEgWH8ZpoHZ9JLXXVjSNphqsm/LFgjdqZJgj91zyZC2lAvRydhMYcMwn0oPt/Qz4X
	djY/Rv7VvY1Cfbomf4UFXDZacbNUxG2vbv5VuBujKXxCQGFCqrt3iNMmS6ZEDUhZ2Bew
	SXywIaAgZV1uDJN3+NlDjbrVJyU0YBPdH7SOCJUHpLV6v+Zlbn9feB2ruoLYCX1MjHid
	+4c+tD6b4bmu9j2S2/HbMsSj/cJSW0JKA8hGVhuIBXhBRjIKjrd/SDFdGMrXW7Bjd0vU
	6ZbIH7xSIa8fCXvucmVcb/7R8nmf5mMIN3i9RPRQ3cgf0iJsaa08JrExs4yFvmvLxPTI
	ixwA==
X-Gm-Message-State: AHYfb5hGJ1WEEJwvVqBJBR5JEfw0VZ0dxtXY/G+ND37CrDjcs6qbL+C+
	GOr+LzkkCOX5pw==
X-Received: by 10.55.131.7 with SMTP id f7mr1164449qkd.4.1504130173143;
	Wed, 30 Aug 2017 14:56:13 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	w131sm4298690qkb.85.2017.08.30.14.56.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 14:56:12 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	Fam Zheng <famz@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Date: Wed, 30 Aug 2017 18:55:19 -0300
Message-Id: <20170830215523.25278-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170830215523.25278-1-f4bug@amsat.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v2 13/17] MAINTAINERS: add missing AIO entry
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
X-List-Received-Date: Wed, 30 Aug 2017 21:56:19 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Fam Zheng <famz@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20d65dca73..a48f633cad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1225,6 +1225,7 @@ F: util/aio-*.c
 F: block/io.c
 F: migration/block*
 F: include/block/aio.h
+F: scripts/qemugdb/aio.py
 T: git git://github.com/stefanha/qemu.git block
 
 Block Jobs
-- 
2.14.1


