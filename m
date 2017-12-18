Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQlGt-0004nT-20
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 21:35:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lists@eitanadler.com>) id 1eQjov-0003dK-1F
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 20:02:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lists@eitanadler.com>) id 1eQjor-0005BB-VU
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 20:02:17 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:41101)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <lists@eitanadler.com>)
	id 1eQjor-0005Av-PW
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 20:02:13 -0500
Received: by mail-pf0-x244.google.com with SMTP id j28so9010098pfk.8
	for <qemu-trivial@nongnu.org>; Sun, 17 Dec 2017 17:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=eitanadler.com; s=0xdeadbeef;
	h=from:to:cc:subject:date:message-id;
	bh=6Rj5bgFf0pRxiqPF8Svr6nwOOaw+Y9a0/CNryeER1dk=;
	b=nqQ1I9C51bt9AWi7TF79nVsuecTVs8ln0GUO0E087okUiCJZJDVeWUjrHTfuHvPg0e
	sXGO3r4JgSoNygbS5ZCS57bzvXnnbysufp1/QTWP1bwctugqpmAeRosT8qCIbNhEN6a4
	Bo5VjZhDG0V1Zj1AqdfMVWtsLRblKIuY1+/40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6Rj5bgFf0pRxiqPF8Svr6nwOOaw+Y9a0/CNryeER1dk=;
	b=kyZdq1V3R5NO1S4R0G3Rv0lnit4WWKYkXgMFjEH8P6RVi7oSVs1Q3jnVmPqYOyzQVE
	PThXtxXfpZ5Rv3zw1kwV6s0gfChRQXi9OgVeA0GXTPfdD6cTUnF05oAH5uz3tUj+USCI
	biRDT65vrN7dvvqjiplkMcK3uiDcA5zorrbkL3VgSMMkQAUw0dhRGNP6tE/tIeOihsJ+
	9krMASUhHDbOkD4wR/QQtdOStCvT2TSMZwtnrMIm+rw2kTTDa6uAGjvMBGkQ+fCp0MGM
	LRBUci1NuSmdXcvaVpUfLf4Fk0nYD6136jGddaLcfrzwftA+JQn38TcyKEH5aoqKaAKg
	7kog==
X-Gm-Message-State: AKGB3mKXoQpAckBKZzsaSXsVsQMzk2kRVmWQqQmq2SPaiiqPGmFwWzZ0
	daNyWJqvx3higNOuNC6P8BoCH+td
X-Google-Smtp-Source: ACJfBos5LZuUJkMsxEeYC+Sc8V+bqgaw7JJww1FY2dTzooS6CeGQekkN3jiYeyYv/agg8ddwIJsAnQ==
X-Received: by 10.98.69.209 with SMTP id n78mr20414495pfi.28.1513558932273;
	Sun, 17 Dec 2017 17:02:12 -0800 (PST)
Received: from localhost.localdomain (c-67-188-9-244.hsd1.ca.comcast.net.
	[67.188.9.244]) by smtp.gmail.com with ESMTPSA id
	w5sm22226641pfi.74.2017.12.17.17.02.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Dec 2017 17:02:11 -0800 (PST)
From: Eitan Adler <lists@eitanadler.com>
To: qemu-trivial@nongnu.org
Cc: Eitan Adler <lists@eitanadler.com>
Date: Sun, 17 Dec 2017 17:02:09 -0800
Message-Id: <20171218010209.98713-1-lists@eitanadler.com>
X-Mailer: git-send-email 2.15.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
X-Mailman-Approved-At: Sun, 17 Dec 2017 21:35:13 -0500
Subject: [Qemu-trivial] [qemu-web PATCH] Explain how to install QEMU via
 macports
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
X-List-Received-Date: Mon, 18 Dec 2017 01:02:18 -0000

Signed-off-by: Eitan Adler <lists@eitanadler.com>
---
 _download/macos.md | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/_download/macos.md b/_download/macos.md
index dbb312c..e5b9983 100644
--- a/_download/macos.md
+++ b/_download/macos.md
@@ -1,4 +1,8 @@
-QEMU can be installed from Homebrew:
+QEMU can be installed via MacPorts or Homebrew:
+
+<pre>port install qemu</pre>
+
+or
 
 <pre>brew install qemu</pre>
 
-- 
2.15.1


