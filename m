Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7sFo-00053E-JI
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 19:39:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFm-00050y-JM
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:39:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFl-0002IH-Va
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:39:46 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:33997)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFh-0002Hb-Es; Mon, 08 May 2017 19:39:41 -0400
Received: by mail-qk0-x241.google.com with SMTP id u75so12344303qka.1;
	Mon, 08 May 2017 16:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=T+AgYi1EOWMNi5EivG1zCxjDeleo7kNsyz7SWy9ZMIQ=;
	b=fV30t2tzUM6oehsO31jAKFUB9GiKrrXedg3XYC6NSFnueBgZLQ/+hySrK2dhYlKc6v
	kWmzyWJU4yLBh8U/LmZrnqiqBMuriIxVdPuEn9LOFUkyOMT89RUQxAnV+1K0h/qECADZ
	CwyppX/lp0belND7zyZiqG9MzUkGG0VqTQugufQor0/WcThOOaGhHo5G7p1W2QJfCbio
	UMuG4dSlJdHiP/3ZZkMIRkXhbfv9/ivlpUF131xxs+6TMCKOKF9IMVFC/GgUUVW//hzO
	zGxEyy4hJnF2LuVZDANw22kl7F1vKENGixa6yPnW+w41GzkstVFkgmrxtHVIbyhwz7ak
	Z5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=T+AgYi1EOWMNi5EivG1zCxjDeleo7kNsyz7SWy9ZMIQ=;
	b=BaMwZGeqxRX9b+JyHspDLw9ad/LS888QdKgx37z+B63rJRS8mJgKJXDA+8fJmihiPw
	ys8V1JTGx5UsjJ4qeWA2BYfDoRLJv83fMpbbic/rP9zFQKjO4pg1FXwH10sa1xOobgve
	BNVdcigHRy3Ffy0kZxI/VIA5qCztWVOHCICIelUQypmmT3u3meS72B4UZiIw/FehGMSn
	rmkkXWPNWETfErGiE/l+gdiy2AFTedp+Qs1AsUPIydpvE+fNdRC77y0rFbN45hr6sQ73
	+QYyqW9ak2g3NMq89J2KL/VIJdrdAowUcDzxNk77NCFOi4sXkAmtRfSSSE3efGjJ12Ck
	1EZA==
X-Gm-Message-State: AODbwcA9I/CKisKbh2CW2f550q1Gf2M3mtRfC6TV1wJ6gXyoUO10BvVW
	G6ZiPBpHJtKMZQ==
X-Received: by 10.55.71.139 with SMTP id u133mr994481qka.317.1494286781017;
	Mon, 08 May 2017 16:39:41 -0700 (PDT)
Received: from localhost.localdomain ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	v64sm13556099qkg.38.2017.05.08.16.39.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 May 2017 16:39:40 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>, Yongbok Kim <yongbok.kim@imgtec.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Mon,  8 May 2017 20:39:12 -0300
Message-Id: <20170508233918.9043-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170508233918.9043-1-f4bug@amsat.org>
References: <20170508233918.9043-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH 05/11] hw/mips: add missing include
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
X-List-Received-Date: Mon, 08 May 2017 23:39:47 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/mips/mips.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/mips/mips.h b/include/hw/mips/mips.h
index e0065ce808..16412dc150 100644
--- a/include/hw/mips/mips.h
+++ b/include/hw/mips/mips.h
@@ -6,6 +6,7 @@
 #define INITRD_PAGE_MASK (~((1 << 16) - 1))
 
 #include "exec/memory.h"
+#include "hw/irq.h"
 
 /* gt64xxx.c */
 PCIBus *gt64120_register(qemu_irq *pic);
-- 
2.11.0


