Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bB4EQ-0000Yp-Dl
	for mharc-qemu-trivial@gnu.org; Thu, 09 Jun 2016 13:59:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1bB4EJ-0000ST-JP
	for qemu-trivial@nongnu.org; Thu, 09 Jun 2016 13:59:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1bB4ED-0004kF-7M
	for qemu-trivial@nongnu.org; Thu, 09 Jun 2016 13:58:54 -0400
Received: from mail-lf0-x22f.google.com ([2a00:1450:4010:c07::22f]:34795)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1bB4ED-0004js-0b
	for qemu-trivial@nongnu.org; Thu, 09 Jun 2016 13:58:49 -0400
Received: by mail-lf0-x22f.google.com with SMTP id j7so7618911lfg.1
	for <qemu-trivial@nongnu.org>; Thu, 09 Jun 2016 10:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=4t1+1p1e2Nd6Kv0Lx3BVXTeiEaUyMXXmE2jbWYwKYCE=;
	b=fPwB30nPgGZXrNvYpPlVKF3v5Cl4TMcUq9ajtELZDTDS1R30uRXEW6PGwNoovfREW+
	xkgUHXFytXuHm7AwoCcHyxrmd1aXiT8J/hmSFvU9oGofuCUWHKN1iTwZAebqSODg7G0i
	lTmO0Bpw1a2gMglCyW/AmLZoN1L6q8qt2P18s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4t1+1p1e2Nd6Kv0Lx3BVXTeiEaUyMXXmE2jbWYwKYCE=;
	b=WFxJN3U7t1OJ7cA169YhuFTIcVNjHG/svCHgabpfqXTawtMqEGtgWG/UOx8NhcQn7t
	EJqwAD/F+FlSIQREdUHqVvbzG/98xOk84F0cx611DlX4Rkds+8S01uwOqhxYMa+lJ9Eo
	W/5Bc7mSH2hj43aIfbtvcfb0M+nm14nDdq5gHA9DrtURDH7q9JTJfk50f4mN7oNAp5gh
	qWnykKVGGsnc7vl/pP5k5IkIA4J3nwxV/bwFrEnYSN0QAHxwlFfwmxlzuS9dYavlU4nI
	YkO7612k1r3YbwYmaswknRHv5uSxAm0GL3Cu2YLQ/G2OctIWitIZOWG/x/6BTIQszzxj
	WMwA==
X-Gm-Message-State: ALyK8tJ2EaB5RlXZg3eLltbpxTvpK1FDTiw+WBEa0zOiux7kQOgy+Axw7cjXQ742UeDHb8bZ
X-Received: by 10.25.161.83 with SMTP id k80mr1104329lfe.60.1465495126637;
	Thu, 09 Jun 2016 10:58:46 -0700 (PDT)
Received: from localhost.localdomain ([195.91.132.170])
	by smtp.gmail.com with ESMTPSA id
	g101sm810574lji.26.2016.06.09.10.58.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Jun 2016 10:58:45 -0700 (PDT)
From: Sergey Fedorov <sergey.fedorov@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, patches@linaro.org,
	Sergey Fedorov <serge.fdrv@gmail.com>,
	Sergey Fedorov <sergey.fedorov@linaro.org>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Thu,  9 Jun 2016 20:58:35 +0300
Message-Id: <1465495115-24665-1-git-send-email-sergey.fedorov@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::22f
Subject: [Qemu-trivial] [PATCH] Makefile: Fix tag file generation targets
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
X-List-Received-Date: Thu, 09 Jun 2016 17:59:01 -0000

From: Sergey Fedorov <serge.fdrv@gmail.com>

"ctags" produces a file named "tags", not "ctags". It doesn't look
reasonable to use phony target name as a file name to remove. Just use
exact file names to remove in "ctags" and "TAGS" target receipts.

Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index b8563db68677..61bf1bf9e2bb 100644
--- a/Makefile
+++ b/Makefile
@@ -478,12 +478,12 @@ test speed: all
 
 .PHONY: ctags
 ctags:
-	rm -f $@
+	rm -f tags
 	find "$(SRC_PATH)" -name '*.[hc]' -exec ctags --append {} +
 
 .PHONY: TAGS
 TAGS:
-	rm -f $@
+	rm -f TAGS
 	find "$(SRC_PATH)" -name '*.[hc]' -exec etags --append {} +
 
 cscope:
-- 
1.9.1


