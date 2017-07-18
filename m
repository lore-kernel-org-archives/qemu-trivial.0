Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLsJ-0001US-GJ
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:20:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59991)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsH-0001T9-Am
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:20:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsE-0000XL-18
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:20:49 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33153)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsD-0000X7-T1; Tue, 18 Jul 2017 02:20:45 -0400
Received: by mail-qk0-x244.google.com with SMTP id u126so448040qka.0;
	Mon, 17 Jul 2017 23:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QvvWyP0RNQsQjmSScRHNiRd8YE2KtGJJCQl1XJa/BBM=;
	b=vDY25imBxofOxt90gcFiU7V7XLgDsODru4pivBE55BGDLSEeXDVyuyipVArvbJjZuY
	fazB65dcztNMYIP367HSAX1WxyHh7VD6Wk9uNC+46fgayDDC921k52rs6obTlRmnnQ0b
	ayvkgXjkcl7Lkyyxdv2s9nAowkZLkZtWy1ibOHT6X6Cb9+xVypKEzoQRoKhODZJT+7EZ
	TYI7q2fkElTyjeIPmVy6XDPFXwK8LnYfo55WlMI2lioqf3aN/wN2ikbomY4jplNus05+
	AdO5mBq5l2UYaS4hAbyhg1dJFVWncKLlZ+JuHN70+JRY/qpOQvu88pDndr84H+Oued5N
	61pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=QvvWyP0RNQsQjmSScRHNiRd8YE2KtGJJCQl1XJa/BBM=;
	b=YQJ5Huvko6ZP25x9YD0GxUTsuArLt0O/4vNAJ7acfYoQ7B7q4xaHBU1lJK7N5Y0HDz
	5kFlcI2oATITKGW0XkEAwdBRAlzSnrX5D8rEg5nQjDEKz7MfsQIar3zS4Vw+3IDq/Nre
	BoO8dFCf1Wj2Y456Fpk6M2+FyC2uLPmfHlTg+rf9pZQ9uWT6rugkeykNP3+/hYN5wVFZ
	Hn7e11LQsqyGjKnTMSvCQKgsHzjgTYg8mE6rAUgmuUkM/UdOmv9r8H5adzXVEq7M4iHp
	sO4JTfPwzotmuLNcQbU41968igXTUAUOw5QsTYo2MvW+8jA4Bf2gY8AG7PsarZYj4w7H
	7Xig==
X-Gm-Message-State: AIVw110eWAvLKHZV5G1QnsUKhm/6QKRS7KLg3vrQucl5pJ6oKAm/RnEi
	CMsixlROizEAdZQOZ0wDCw==
X-Received: by 10.55.140.71 with SMTP id o68mr129266qkd.18.1500358845145;
	Mon, 17 Jul 2017 23:20:45 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.20.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:20:44 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Fam Zheng <famz@redhat.com>, Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-block@nongnu.org,
	Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:09:42 -0300
Message-Id: <20170718061005.29518-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 06/29] migration/block: use QEMU_IS_ALIGNED
 macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:20:50 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 migration/block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/block.c b/migration/block.c
index 9171f60028..498c72ad59 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -933,7 +933,7 @@ static int block_load(QEMUFile *f, void *opaque, int version_id)
                 ret = bdrv_get_info(blk_bs(blk), &bdi);
                 if (ret == 0 && bdi.cluster_size > 0 &&
                     bdi.cluster_size <= BLOCK_SIZE &&
-                    BLOCK_SIZE % bdi.cluster_size == 0) {
+                    QEMU_IS_ALIGNED(BLOCK_SIZE, bdi.cluster_size)) {
                     cluster_size = bdi.cluster_size;
                 } else {
                     cluster_size = BLOCK_SIZE;
-- 
2.13.2


