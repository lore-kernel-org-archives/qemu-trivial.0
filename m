Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxy2-0004xn-0C
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48634)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxz-0004v3-Ca
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxy-0004Hl-LG
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:39 -0400
Received: from mail-qt0-x22a.google.com ([2607:f8b0:400d:c0d::22a]:33824)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxu-0004C5-QK; Fri, 28 Jul 2017 01:37:34 -0400
Received: by mail-qt0-x22a.google.com with SMTP id s6so83855760qtc.1;
	Thu, 27 Jul 2017 22:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4C/lN/rBMy8o7HA9vfGzMy7ormLQvUUSouVhQQpcFZI=;
	b=ogUJMEibQtD47/wrMfi9KJ0Bu2NQ2CebDTLsjVzK5fgRAbMs/6+h1yd8NQZSVTzTQx
	MhTgZId8LhHNIb7QTINd2CoMTDiGGASd3yHQ5/JvhtaWpBM8vH2je5e70evy/VA2qCuu
	Y3CJ/MxDukASTMfeDzpi6YJZdy38Y2tMwWrMfjh5sfyaEeaeDnwbs5YmzqUEtqanGWPz
	FdJM0sDPjDwiK5ArMPiqoPoIBpK373/8Vyx9fK5VdltbCzhHH8mYQQsnt8Mh4/M7EOGm
	MTc2x8gcRLA3jiDrsMDxc1e6cWl9MA1jBOmICLrdGfQc+AVdg4LQE7sjf3Uu2qoMpMhT
	UH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=4C/lN/rBMy8o7HA9vfGzMy7ormLQvUUSouVhQQpcFZI=;
	b=FCCqUiDTvCxJs9Pjm6cvvsgwzg1B46aYjsmpiovpJzihE2Df4tMe4vyET1X9EGxFos
	WhVHhPFKa+81C4qYNfpXPQ+KUGOHF6trHnnMxXMrpsoomEC47FjWSQFOzOQq2KrNKilA
	loVfw4j83tRBfkuVj0mtATo25PJDKyDu6KO6l9Jkbv2txX+S3zfLiuMdQHJqwMC7ODK2
	+ysXZDhasyEwhwrQXa+Uu0az84AblzvZquRBtDgr7yo9EbdDUyVKDApSCsNp6HGQWW2r
	gQB+WVdRNFW0VK8sU9myLtgk6rQM9Ccb3dT0ZKMNkYf173JTdVFfvVHmK0hhpUqegv6+
	MKxA==
X-Gm-Message-State: AIVw113mH+CWKf3Ih9cgqXeeSCnHtYP1P4KjVyUqZhnww31nIewPx1n9
	rCPrQ4YLdnLQfQ==
X-Received: by 10.237.60.247 with SMTP id e52mr9362788qtf.106.1501220254303;
	Thu, 27 Jul 2017 22:37:34 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:33 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Guan Xuetao <gxt@mprc.pku.edu.cn>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:54 -0300
Message-Id: <20170728053610.15770-32-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22a
Subject: [Qemu-trivial] [PATCH 31/47] MAINTAINERS: add missing TriCore entry
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:40 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e363a18631..7997c90be8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -277,6 +277,7 @@ S: Maintained
 F: target/tricore/
 F: hw/tricore/
 F: include/hw/tricore/
+F: default-configs/tricore-softmmu.mak
 
 Guest CPU Cores (KVM):
 ----------------------
-- 
2.13.3


