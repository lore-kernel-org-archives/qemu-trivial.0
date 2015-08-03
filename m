Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMBqF-000619-2d
	for mharc-qemu-trivial@gnu.org; Mon, 03 Aug 2015 05:15:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpw-0005Rh-0g
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpp-0003DB-GW
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:11 -0400
Received: from mail-wi0-f180.google.com ([209.85.212.180]:38564)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpp-0003Br-6B
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:05 -0400
Received: by wibxm9 with SMTP id xm9so105250126wib.1
	for <qemu-trivial@nongnu.org>; Mon, 03 Aug 2015 02:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=Ppbh8qtfboKmKByk3eYnZ4+cNRLePfrLt6MO97F70Dw=;
	b=W8QlzaHh1tzREZS8RPtPSOZLgKQcM/IGcQOfZwxziOFTaIsCugUx1YcmTdlmhTJ0/N
	QjV3saELVCRUIt3P9K3lGyqpRekWQmoG1j6bYWoB3A8n5VjnF3aUTD3VxaoVxORo8ErB
	gU/NALJS9YalEpOBEHk3MJMm4V00vL3PKJgozXOq28oGzveNXl2Mp8skrcQUa4FrrJlV
	zr2Nk3zpOofyobvj14eHD3Ta9+ZYvMNgm2I3QxnS+mRK87Bb5U3Ut3SHwUxyMQk9dIHX
	ivHmw6rgcMPT8rDYs4yiIgeZkayyF2wNMtEdzjLOgI4xoKPsT+SVYvgyRGDWmQmnGXrd
	stqg==
X-Gm-Message-State: ALoCoQl/N+Wz+8LaurrJytWxMtUrzu/2zXGe0BiNUTpIiR0PMKUaTfpR3oZ6FfxT3wJcTSEvGkaZ
X-Received: by 10.180.206.211 with SMTP id lq19mr33320318wic.81.1438593304754; 
	Mon, 03 Aug 2015 02:15:04 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	hd6sm12510441wib.19.2015.08.03.02.15.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Aug 2015 02:15:03 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 61C043E0779;
	Mon,  3 Aug 2015 10:15:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  3 Aug 2015 10:14:43 +0100
Message-Id: <1438593291-27109-4-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.180
Cc: qemu-trivial@nongnu.org, crosthwaitepeter@gmail.com, pbonzini@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH v4 03/11] qemu-log: correct help text for -d
	cpu
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Aug 2015 09:15:16 -0000

This doesn't just dump CPU state on translation but on every block
entrance.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Andreas Färber <afaerber@suse.de>

---
v4
  - add r-b tag
---
 qemu-log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-log.c b/qemu-log.c
index 13f3813..be8405e 100644
--- a/qemu-log.c
+++ b/qemu-log.c
@@ -105,7 +105,7 @@ const QEMULogItem qemu_log_items[] = {
     { CPU_LOG_EXEC, "exec",
       "show trace before each executed TB (lots of logs)" },
     { CPU_LOG_TB_CPU, "cpu",
-      "show CPU state before block translation" },
+      "show CPU registers before each executed TB (lots of logs)" },
     { CPU_LOG_MMU, "mmu",
       "log MMU-related activities" },
     { CPU_LOG_PCALL, "pcall",
-- 
2.5.0


