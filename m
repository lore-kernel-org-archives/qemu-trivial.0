Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dORBO-0003Mh-7J
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jun 2017 12:11:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dORBM-0003LJ-F4
	for qemu-trivial@nongnu.org; Fri, 23 Jun 2017 12:11:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dORBL-0002ca-NY
	for qemu-trivial@nongnu.org; Fri, 23 Jun 2017 12:11:40 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:36455)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dORBH-0002as-Sm; Fri, 23 Jun 2017 12:11:35 -0400
Received: by mail-qt0-x242.google.com with SMTP id v31so1908140qtb.3;
	Fri, 23 Jun 2017 09:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WbNxAw9Srev5pzfDe8RKNYQ9Eq4+odUVSjP/ne56Hwo=;
	b=fmGTI5401CQui90YouBvOR9b4mSyNAvQFcy4SIjFUTT31LRs/N/MFmh+aEW3NtNNWs
	dQcMuoqK3JdOfebQGLXxT+Cb3ReJNJyM4TOkW47ScHBcuS51Qm20ut/vf0dCHPFK4PZh
	5aNsH1Y3723vRPpjQVBB5Kk3uvn+dSztbMqGnEusFTp9Ya3sp+WyaROwc4oh2cqURbA8
	EV2ZDnvYx3NAW+XDxG/Q/bdoqr9VCFOpjxifiOeHZbS3fR2ijCtcuSWkriBJLAWPIyaZ
	lE1v9HbU7s+10K4pi4BMdczvsESSDPa/h1x3FdBtXFBSlENsDTYvYPwUetuXr2Yt/4Ro
	37Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=WbNxAw9Srev5pzfDe8RKNYQ9Eq4+odUVSjP/ne56Hwo=;
	b=qTLxSzU6k5qRfEX/gATicXsZ1lxe7+VoHbDguv0t/rRVln9chxyToRS1+cHmE2TWcL
	LMWTOzsF6LW9pq5/2SqbM9ni5dZtmcp4acCG3hWzZk/7PLloHfGiQC0LqrVjVcmupUT2
	qTbW5aLOHQFvswP/EDa5uS9zw+0Dn4MOqHJvp+cpGyLQEP+uBP2x7qRwUjscseo4Q22G
	5ARZUb+Uk6lxhWiCptvSHTJjF9Cvc9AzG2L7e+/hUWMVPx9AeoAw7gvBtVEXp1w5nqCc
	7myyTlClbeoleMZCISy5x8cYFyo8lIaGKOBybJ9VZicmKGKl48M84UA8DpM2izS9bLzW
	mujA==
X-Gm-Message-State: AKS2vOycvdqZiOqbXz7wTrAACIYusVeJokI0kQ4xQTk+NTM00miJ8PLd
	2HoK6XyDe8X0g1ajNkg=
X-Received: by 10.200.40.251 with SMTP id j56mr10893746qtj.186.1498234295271; 
	Fri, 23 Jun 2017 09:11:35 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id m4sm3853599qkm.9.2017.06.23.09.11.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Jun 2017 09:11:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 23 Jun 2017 13:11:20 -0300
Message-Id: <20170623161121.8047-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170623161121.8047-1-f4bug@amsat.org>
References: <20170623161121.8047-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v3 1/2] hw/unimp: add missing include
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
X-List-Received-Date: Fri, 23 Jun 2017 16:11:41 -0000

inlined create_unimplemented_device() calls sysbus_mmio_map_overlap().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/hw/misc/unimp.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/hw/misc/unimp.h b/include/hw/misc/unimp.h
index 3462d85836..52e068ec3e 100644
--- a/include/hw/misc/unimp.h
+++ b/include/hw/misc/unimp.h
@@ -8,6 +8,8 @@
 #ifndef HW_MISC_UNIMP_H
 #define HW_MISC_UNIMP_H
 
+#include "hw/sysbus.h"
+
 #define TYPE_UNIMPLEMENTED_DEVICE "unimplemented-device"
 
 /**
-- 
2.13.1


