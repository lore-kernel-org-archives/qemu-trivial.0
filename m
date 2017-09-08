Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dqNEJ-0007Sz-TB
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2017 13:38:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNEI-0007R1-EP
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:38:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNEB-0007Wa-6W
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:38:09 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:38745)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNEB-0007WK-2N; Fri, 08 Sep 2017 13:38:03 -0400
Received: by mail-qt0-x242.google.com with SMTP id k2so1940211qte.5;
	Fri, 08 Sep 2017 10:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:mime-version:content-transfer-encoding;
	bh=kgYv8JvrRxEZPC2hAUtY+7wSoyqshmAzrLATYGFL9b0=;
	b=i+rupmM4Ni1tL5mAmwVWZur+mRvWOeuxq1xg8HMBa6MhLCHEwUovSUl2G9fAFinlra
	aIjPevKCPQC3Zaqhgn4QhJIkxwNH6tTt4+bzwlMkUl+j9WUfGlKCObvcSQTnsbX/GFbC
	scojnG+hdHzD9veMWB4CaiF7MDHX6goN7yIKcGfSEFdCAWB3/TKU9xjAbtZ8YGxZJ5PD
	qbXMnaTncKofzdAuQPIR/7SQKE3UzgZkFopygrw3rLCTFSpOoWfqCTfFYvAdIkHcU1d1
	2e4sGCJq6blQwPYt+M0ZF9HAPttRnhE9gUWRPRyIOApw64tASPYPamEArmA70+35BUDK
	M1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:mime-version
	:content-transfer-encoding;
	bh=kgYv8JvrRxEZPC2hAUtY+7wSoyqshmAzrLATYGFL9b0=;
	b=pAb1QF6oqJRG815EJfKyX7Pp1ld5YgIlsBpxPza4bmCFF9eUppgfdz1HAUINOazOVJ
	Z/BR6m82avM1JrVETM+Wdgiz5KQRV45nlKgz8CvQkJJwdJH0fb65gTWgkwp5oFuES8nz
	WWEa8xIJ3EbnubNrSZwzv8IxP/gYRSGE5IqT1/uCjanC3n/qlWYfbQ3HwMjLmLkBfczo
	SVCOMy6khAjECQCxSnJcUha80sgSxlUSNFQJR3viVoJS5IW2RsyV1exHZpBjKvvV2y+9
	2ej0OWzN1f9tXcQtNckCfrpSYumXPUzX09UqA+4Z+eIDgbLLiR2aawlGwO1IMSfG2NSA
	bYoA==
X-Gm-Message-State: AHPjjUj3GwH6HRU9CHWlQx4RyXFzfhX+DirMr7LK7Uk/qPOe52Q3ztWL
	FUctg5fRVhWP9SHoQnG1vQ==
X-Google-Smtp-Source: AOwi7QCxyDD6adwIwt203zI5bp+KsMPT2KP8ikkvxxgKExXBAIt0NCiPHttOBtiP0H/ysE0Jf2VwmA==
X-Received: by 10.200.39.252 with SMTP id x57mr5601880qtx.22.1504892282306;
	Fri, 08 Sep 2017 10:38:02 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id f4sm1605859qtg.35.2017.09.08.10.37.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 10:38:01 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <famz@redhat.com>,
	qemu-block@nongnu.org
Date: Fri,  8 Sep 2017 14:36:28 -0300
Message-Id: <20170908173632.6711-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908173632.6711-1-f4bug@amsat.org>
References: <20170908173632.6711-1-f4bug@amsat.org>
In-Reply-To: <20170908173146.6446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v3 11/15] MAINTAINERS: add missing AIO entry
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
X-List-Received-Date: Fri, 08 Sep 2017 17:38:11 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Fam Zheng <famz@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4e05831bda..98b7edc8b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1224,6 +1224,7 @@ F: util/aio-*.c
 F: block/io.c
 F: migration/block*
 F: include/block/aio.h
+F: scripts/qemugdb/aio.py
 T: git git://github.com/stefanha/qemu.git block
 
 Block Jobs
-- 
2.14.1


