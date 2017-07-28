Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxxv-0004qQ-6X
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxq-0004mU-IE
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxp-00045r-Pd
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:30 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:37174)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxl-000421-Ib; Fri, 28 Jul 2017 01:37:25 -0400
Received: by mail-qt0-x241.google.com with SMTP id d10so10618904qtb.4;
	Thu, 27 Jul 2017 22:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2dZBT2dox/qTi5bnBexbIq1MjTRLQ7D4tfIllCc2M7w=;
	b=h9lC3gKogRtd3Lq5ekqLNy6Zo+gLzZdP6QdwBkITp/7HNGrr1VZ01NT/WGGTMAnc89
	P6LiOjgou9C3KNP1JhGFW+stTLC5Npx9ngZwv1fVMJQMiDB970Tk8UNHAedjf+l7Ld6J
	RnZvMwFZBSoMNVlEG/5Q+J40Ti+z536uNe45oXeqADbMIdQ6er5yO6bEas/B2b9F+Vzj
	sVNze2LxkRCIkfTOj7TMUaRJk/M80a8sXSayWLD6alGgkVlzVIl1RkBm936m0vZdSpaa
	mwEHIVuVWWgzdTEoDhFwtgRvC20hbVQYMpRlFFzX7htVU+VSyrXvVuJ0mHWDlcQav72I
	LMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=2dZBT2dox/qTi5bnBexbIq1MjTRLQ7D4tfIllCc2M7w=;
	b=UhBWPIUfBn2Jb25rEUcxUVjNgLPUVw5nfau/dzsUu8JjgI7CfR62dle/ftjQIlHsqB
	A4S/BRbOi/1G6qUv6lHEz6t57uSkYGNl0GCS7Wq66LaBwrFxu+fHTc+PFpF2TPxP5ry/
	pgrwu2OBuK/Et3TF7IANEXqFYr3xEDFyIq/UijT7vL1R12IYHvXN6EyFeUpvNv/d9dVs
	C8vnSNvsabH1tH0EKH97MFk/mUmrI4nMQ2zOYIuDM6+vrCg7luK7uFDhRXT/lYNBUG9r
	ZNuoTn0Prv6fZtLy9RbDB0Kq7GvQlA1TDGnFgItDQmUiFLWEYxudXCQNkzpRXfMgIMop
	yUyg==
X-Gm-Message-State: AIVw113058HCbY32/cNGQr3bMgnH3CV1vc+ZewiM6CpMxr7bOVJ/8Yzd
	89u9WtdOa0mITQ==
X-Received: by 10.237.46.38 with SMTP id j35mr9584453qtd.285.1501220245162;
	Thu, 27 Jul 2017 22:37:25 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:24 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Stafford Horne <shorne@gmail.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:50 -0300
Message-Id: <20170728053610.15770-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 27/47] MAINTAINERS: add missing OpenRISC entry
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:31 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a4df19d304..35a7253e22 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -207,6 +207,7 @@ S: Odd Fixes
 F: target/openrisc/
 F: hw/openrisc/
 F: tests/tcg/openrisc/
+F: default-configs/or1k-softmmu.mak
 
 PowerPC
 M: David Gibson <david@gibson.dropbear.id.au>
-- 
2.13.3


