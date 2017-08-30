Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnAyP-000648-1K
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 17:56:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAyK-0005yr-TE
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAyK-0007ze-2O
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:28 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:36593)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAyG-0007yI-AM; Wed, 30 Aug 2017 17:56:24 -0400
Received: by mail-qt0-x241.google.com with SMTP id e2so6265622qta.3;
	Wed, 30 Aug 2017 14:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3jljlzuMfNOJU01CCjIx3Xu/p4POYhX1s6V9mA/7rDs=;
	b=BL8d0wT7j8T8ccZllQwlBVaST5e13ZlmIG5cv/OJ5qe06S8Wjg2Nz6lMKZiS8wgntl
	AlAM9gzEtS2EbBZ7McCVd71dYs2YYCv7dKe5V4lQQZ4Z1Ef1n2Xmgcof+V0AUJpPQdFC
	o8sxnIZTA3fqyTbC2uOt9AKeNlw9sqHaJzN5jnk7AhjyYOiEf7e6IcdQk6DNFwWD9uEd
	FWdGLANqnebZdAVSamJffPjEcejtx9D+//HQ3QsQjck+dCmseAoYK4luOtxuuVUYGygI
	vfm7k7hHNZg82jGhtOLgvj62HJCeZ0uqnqSOlHNuqM6mpKjJV/Gq/5ve9Mx/GAmsCkd3
	QKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=3jljlzuMfNOJU01CCjIx3Xu/p4POYhX1s6V9mA/7rDs=;
	b=LiHOlvl0p2eQ/WgBi9n84boTg5tpEum5wKiZYbweG9cdwHeiay3HxDCiroHabVUpcY
	NtZZc0GSxgHod/jC8zpOP5VQMFGlHkfDc7LI6VDu5MNpeavc1FJlE8nmQNcUalQA9ro+
	62bfkMxkEm3N44kkLumljHBF/CJzWuT3cw7OlCTPLvElk+Lj9R98M600AE89XqKjUtDy
	NySnt17V8cfQSpOihLMTSYluk7lqb0Da8lyZ2j3kHVFvLPVJ3tyVMINOh3CLxter5WB5
	EigyhrFsbzta+4JGaaxHZy+LkfFza0TRrDSxppU2ElCoHJ6oU6mFkmSQUH8r5rY2DfVx
	3cxw==
X-Gm-Message-State: AHYfb5igFOEtO33iFMUJ2gdVnCUdAavvL2AgroinMjCxbpero84HsITA
	MOyrivVdhcKy2w==
X-Received: by 10.200.23.37 with SMTP id w34mr4447515qtj.164.1504130183782;
	Wed, 30 Aug 2017 14:56:23 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	w131sm4298690qkb.85.2017.08.30.14.56.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 14:56:23 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Fam Zheng <famz@redhat.com>,
	John Snow <jsnow@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Date: Wed, 30 Aug 2017 18:55:23 -0300
Message-Id: <20170830215523.25278-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170830215523.25278-1-f4bug@amsat.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v2 17/17] MAINTAINERS: update docs/interop/
 entries
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
X-List-Received-Date: Wed, 30 Aug 2017 21:56:30 -0000

moved in commit 7746cf8aab68

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Fam Zheng <famz@redhat.com>
Acked-by: John Snow <jsnow@redhat.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 452ccd71b4..833a7a6778 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1259,7 +1259,7 @@ F: block/dirty-bitmap.c
 F: include/qemu/hbitmap.h
 F: include/block/dirty-bitmap.h
 F: tests/test-hbitmap.c
-F: docs/bitmaps.md
+F: docs/interop/bitmaps.rst
 T: git git://github.com/famz/qemu.git bitmaps
 T: git git://github.com/jnsnow/qemu.git bitmaps
 
@@ -1828,7 +1828,7 @@ M: Denis V. Lunev <den@openvz.org>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/parallels.c
-F: docs/specs/parallels.txt
+F: docs/interop/parallels.txt
 
 qed
 M: Stefan Hajnoczi <stefanha@redhat.com>
-- 
2.14.1


