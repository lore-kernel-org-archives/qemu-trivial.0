Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxy3-0004zv-Mp
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxy2-0004xr-2p
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxy1-0004Lv-Dz
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:42 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33957)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxz-0004IF-8i; Fri, 28 Jul 2017 01:37:39 -0400
Received: by mail-qt0-x242.google.com with SMTP id i19so11808795qte.1;
	Thu, 27 Jul 2017 22:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ayg+cKxKZ1hbfGhRweKK0eD6RZlA9YE2DFk2Foi3FmI=;
	b=IqOD+8HanGYgYwWdpWzs4qDZdJQCfjpmzFIlC/j72A3oe1UbrdOpuAso6Z/Y5tVSv7
	wo3vwHQgdSm//1xEBA8wpYWRVV1IAzHOTJw0kpfcC0DJPILnox8dwuuih+XA9sirpTFD
	pUhOQXfqlPGd0FwIVuEBjQTIxgSHeCLhQ+HtHvt3cPojy+fecIbMVIpArn6xgJbXVirJ
	uMJCjFbIoswoDoRt7YCzDx0XbLFmlBBT9QQxSYUG+yolWK/PNmJBSC6I3NLQ2lcAFHlI
	MzKGvI2gC3I4wlsOUqnVs6SW9GihQ9xDmll8XzTi1/SVO7Pz/0iRPmzCMwqzUCnNOMKq
	Esvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Ayg+cKxKZ1hbfGhRweKK0eD6RZlA9YE2DFk2Foi3FmI=;
	b=i+ldPjaPqhtsfyiTO0bqZd/LoLDZ2V6huq/1Jh2hQqiDaslFLN9jXnRIXW32sKOflK
	wImSDF+JD3t3Hx3pbHC5rjuIVV497grwtfE/oKRp7xcUQhcE91KA80M0lkugH6Ls0aW3
	HEr/BFCc4prsJvt1YXC1ynOB3zqYkb+NCGybojBBwbyfP1G7Eu4j0arcfAiCF/dobCW9
	+CMFrulHNwEiZETc4td3FriFgAn75uD1Cew5dz7R+3U5xQ1hDLhKhlZ10W11cgHrReTn
	BxJJcGIOBP+Uz3MJoAO86hbFYnEUAtsc20T6Jbp0KcFvRzp3e5b9x6G0NRJXV2oS1Hrb
	3nIw==
X-Gm-Message-State: AIVw110xa1Fd84oZmaVK4gnkZKKhannqb4pXDW3RObDpGKk6ws0s1/uu
	CacoTJQqsfVhFFuKH3H6HQ==
X-Received: by 10.237.41.135 with SMTP id o7mr9758073qtd.75.1501220258849;
	Thu, 27 Jul 2017 22:37:38 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:38 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:56 -0300
Message-Id: <20170728053610.15770-34-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 33/47] MAINTAINERS: add missing Xtensa entry
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:43 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6d805b081d..b2c9945299 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -271,6 +271,7 @@ S: Maintained
 F: target/xtensa/
 F: hw/xtensa/
 F: tests/tcg/xtensa/
+F: default-configs/xtensa*-softmmu.mak
 
 TriCore
 M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
-- 
2.13.3


