Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dbE1a-00058d-7L
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 18:46:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1Y-00057H-EE
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 18:46:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1X-0002Du-Fh
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 18:46:24 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:35358)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1V-0002B3-6w; Fri, 28 Jul 2017 18:46:21 -0400
Received: by mail-qt0-x244.google.com with SMTP id t37so10914126qtg.2;
	Fri, 28 Jul 2017 15:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WwDvcJqdNqtvNAt0GTe4y7Z2tEfqXzHS1Euh7hAlY8A=;
	b=WLiBiKRg/kGccnpoZv3X0Ad9GtiLdIm7nUE8vzuF3RxElgRq02X4a0qadIG1vaE4E5
	xpQOUkVDGNbyZ3cE9PuZh3ey23GAfOUVU0hjMkU9XG8XGUpwhw98GTNDDX01WtGnSFoV
	G63qFZZnZ1G8X2z0EZ/bjlZo8f5vmqwmux3e/JAt1fREatctM5GYRKcdEGbL85R6tGSB
	SJrdR2hc9PFv/03YY7w/NWh60KFD41Y51ijUpFthKoSimOPPGODukPndj7BKdqG2iz9a
	FStZviIW8MTHd/aVwIdcshYUP2JvMeXL86EqRIcCpKiOXmQwBw10zN1MG9TfSY8OoSNx
	Eniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=WwDvcJqdNqtvNAt0GTe4y7Z2tEfqXzHS1Euh7hAlY8A=;
	b=K+wxzm9xRQ2EecqWrpR8zG3xWMJf+hYiAxlTGBR+IQJR0rn2f4Vscrt6r4pt1cHjrS
	iAjgjBXMbkUAp4hF1K6RrDgl2vTvCdHe1zWyCdG9lmppUWlYOOTmExJoED6HgIib2am8
	M+t7CDmJCWC/eIC1c0KZVFcYcmxLty/BqVr7jisWVRBSGnuqnrKwvydPZMzjv21HfYf5
	0U7XwndVp8h6wiu+tPJI6xjWlRB2J5oa73X7PoppQdMVOiGsDhIgpPbXwQh2bOJPUvWD
	7re3diGc95P21aQtGOtv9tIO7iT0V+HdpGEIkmwwX/XUBxwAWKvb9qZOEK80tRnAyVcN
	9Q7A==
X-Gm-Message-State: AIVw111YjFqfFy0GdW3yEnrnyMkTuJrfqssG1HP3/yvHHVhHFo00PN6P
	Hfv3bpcAY9XunQ==
X-Received: by 10.200.42.176 with SMTP id b45mr13385904qta.76.1501281980619;
	Fri, 28 Jul 2017 15:46:20 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	m129sm15831970qkc.2.2017.07.28.15.46.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jul 2017 15:46:19 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alberto Garcia <berto@igalia.com>, Max Reitz <mreitz@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Date: Fri, 28 Jul 2017 19:46:02 -0300
Message-Id: <20170728224608.3598-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728224608.3598-1-f4bug@amsat.org>
References: <20170728224608.3598-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v2 for 2.10 2/8] docs: fix broken paths to
 docs/interop/qcow2.txt
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
X-List-Received-Date: Fri, 28 Jul 2017 22:46:25 -0000

With the move of some docs to docs/interop on d59157ea05, a reference path
was not updated.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/qcow2-cache.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/qcow2-cache.txt b/docs/qcow2-cache.txt
index 1fdd6f9ce7..b0571de4b8 100644
--- a/docs/qcow2-cache.txt
+++ b/docs/qcow2-cache.txt
@@ -15,7 +15,7 @@ not a straightforward operation.
 This document attempts to give an overview of the L2 and refcount
 caches, and how to configure them.
 
-Please refer to the docs/specs/qcow2.txt file for an in-depth
+Please refer to the docs/interop/qcow2.txt file for an in-depth
 technical description of the qcow2 file format.
 
 
-- 
2.13.3


