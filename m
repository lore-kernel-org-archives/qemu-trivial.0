Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4Uzh-0001Ga-JP
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:45:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzf-0001BM-PP
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uze-00032F-Vx
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:27 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:48342)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4UzX-0002yt-HK; Tue, 17 Oct 2017 12:45:19 -0400
Received: by mail-qk0-x243.google.com with SMTP id d67so2843513qkg.5;
	Tue, 17 Oct 2017 09:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GNG6lPxow5POZreNwO2ghqugC0ouul2u9Zvj9geqPUg=;
	b=K+gsEU4dE1Txesjb30xmYLI+iSW9inmxiP+HtlpvwQDsKvXGbrLx+oGqBvNOgImr7c
	UQ5VkizR42MA+J/DC+FCn1a2ouuBt0Gq2J1zvY65FRRRnuanUt5txTpx4hgspdXGEo0D
	C+Jx6XNUYzLZka5H5Wj31wsE6t3SaoyaCXW6TKgVzqSnE6KfWXi26mkHI1TAcgzeWt/V
	o32mNgLiP399h864izPVM4WGat46ttsuRq3qAYpJeyXrvo/5Lu/sMgE4i7ECdxAKk5VS
	Or7vbpa6tLjmjDFmMOeebYz87BhSKCKPeZ7VmRMu1lDLujvSdyh7+4VZ5D3x8aYItDRz
	o+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=GNG6lPxow5POZreNwO2ghqugC0ouul2u9Zvj9geqPUg=;
	b=dAzFMpnAVdwjEWcJK+RBl3AH64RF1BdhkVLliNypC0F6VkJ+C+wD9ea072yW0LrLmI
	8W5w8Z25wddIGPzD4rYaTUfKpKMByg7xkduW76OmdxvKakHpKOsKLt23Z4D1GR4x0+7X
	Zk3uTXUiTVI5wWxEoYe2pDxWgTlZV+CHQFHoPTDqOj5dJpeKqU9P4yvF3wLcwYX4l2Jj
	EMjfcVLJ4izV5XR0YdkG6q8AFeELk9w28TvLVjIaI+drJpIFqZ6f/+9U8/RdU+K5bPCs
	PVgLGCSPiwTs8h88ECzYfQbX90MDnAEFOmz4QHOKrbHClayHcy0FnMC/cQ49Eb+mCzpL
	8vLA==
X-Gm-Message-State: AMCzsaXH9QeBQLj4X8er0Kc5kAIQ2Q9bfs7i7ZFBAcA9QNCdmHv0vfQX
	zArwSVs0TCHR3ofvV/nsg0m3xVcV
X-Google-Smtp-Source: ABhQp+Rcj3wx5TcPWrm+9jF6JaRdTcXzqlTHWLnNUuDUJh/7M1kAogGQISIrpx0zDS2kRjMr2LWGNQ==
X-Received: by 10.55.20.72 with SMTP id e69mr18088739qkh.194.1508258718920;
	Tue, 17 Oct 2017 09:45:18 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.45.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:45:18 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>,
	Alexander Graf <agraf@suse.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:43:45 -0300
Message-Id: <20171017164426.25277-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v3 01/42] MAINTAINERS: add entries for
 i2c/ppc4xx
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
X-List-Received-Date: Tue, 17 Oct 2017 16:45:28 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Corey Minyard <cminyard@mvista.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9cff9737d3..6f56c1349b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -954,7 +954,9 @@ M: Alexander Graf <agraf@suse.de>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
 F: hw/ppc/ppc4*.c
+F: hw/i2c/ppc4xx_i2c.c
 F: include/hw/ppc/ppc4xx.h
+F: include/hw/i2c/ppc4xx_i2c.h
 
 ppce500
 M: Alexander Graf <agraf@suse.de>
-- 
2.15.0.rc0


