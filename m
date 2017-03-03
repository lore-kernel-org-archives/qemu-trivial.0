Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjtjW-0001ZZ-WE
	for mharc-qemu-trivial@gnu.org; Fri, 03 Mar 2017 15:23:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shah.suramya@gmail.com>) id 1cjtjV-0001Yt-0y
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 15:23:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shah.suramya@gmail.com>) id 1cjtjU-0007KP-BI
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 15:23:21 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:34193)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shah.suramya@gmail.com>)
	id 1cjtjP-0007Ib-88; Fri, 03 Mar 2017 15:23:15 -0500
Received: by mail-pf0-x243.google.com with SMTP id x66so10738342pfb.1;
	Fri, 03 Mar 2017 12:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=F1UKdYNboqUj7ACm+B24kIiMZH55nnF1PkSLFoqWZaY=;
	b=BVdKicvt6dq1kEKlwsjt3KfqCb0BaHob8JNCehtJHlEzgmGOsqRaa4AH854AW+pDM+
	mcO2My/99xmJLYG4tvtg86YHl2JdlNLRcw2p7q+56BMHYex0xZVoAFFbL0dHTG4l4KUG
	v3kbYW2KaGD6/ALIuk217dYHvWtggSnzxJcItvtyoFSSDXOBfnCQ9AvyOhlmBeXV1qSs
	fnpzXrjm3r+B/H/Gwmvf6IQuBXVAoEcrPE4QOEZL/snIao79pYqyvZ/i7uxX5YA/bUyO
	OrssAiKC8QYmxLh7FieTUti//vOCkJUYdPxVrNk/WHhBjTRfyjKxNRkmTKVFRvIToGbB
	yo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=F1UKdYNboqUj7ACm+B24kIiMZH55nnF1PkSLFoqWZaY=;
	b=S6zN5cSct9I3rajfe9Uj64JgsdX0mxzFryJZnK6ZNHztgCv4kicQR83SR/WgxARX0p
	ICPPymOviG3TbPNN7GA+XHLA6hHJ/dpUKYOxkr5yCf9Al6jTG/O9K2ViERN7VqcwKa20
	TIG34xWvtmMiSNiFMr+jauHG1kdrgsgytSP9PrwZrVLNWIBPE9dO2Mz/J/DsTx3pVzC5
	QANbZfSYK6f+4XJy7FYAdFCayBllo1lw2jg/9ws7Ff2hiDR9B98hYE5MgacKngANA6me
	XN8Rda6G5khKmYDCXQnfsWdl0hRzMglVzkQQRlNk6fqA0O4E4CvfT06UWcYFAe1btSVw
	x/lg==
X-Gm-Message-State: AMke39lAjgNLH99eYyUPg1oOKTsSmUD7kWR5EvauK3vpZLu2jjUwhv53TnI6pc7Z6AwIbg==
X-Received: by 10.84.173.4 with SMTP id o4mr6995600plb.106.1488572594262;
	Fri, 03 Mar 2017 12:23:14 -0800 (PST)
Received: from localhost.localdomain.com ([117.210.162.83])
	by smtp.gmail.com with ESMTPSA id
	v9sm24991312pfl.102.2017.03.03.12.23.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Mar 2017 12:23:13 -0800 (PST)
From: Suramya Shah <shah.suramya@gmail.com>
To: qemu-devel@nongnu.org
Cc: marcel@redhat.com, armbru@redhat.com, eblake@redhat.com,
	qemu-trivial@nongnu.org, Suramya Shah <shah.suramya@gmail.com>
Date: Sat,  4 Mar 2017 01:52:27 +0530
Message-Id: <20170303202227.1950-1-shah.suramya@gmail.com>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-trivial] [PATCH v2]util:Removed header qemu-common.h from
 path.c
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
X-List-Received-Date: Fri, 03 Mar 2017 20:23:22 -0000

Signed-off-by: Suramya Shah <shah.suramya@gmail.com>
--- fix of typo in v1 that broke compilation
 util/path.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/util/path.c b/util/path.c
index 5479f76..7f9fc27 100644
--- a/util/path.c
+++ b/util/path.c
@@ -6,7 +6,6 @@
 #include "qemu/osdep.h"
 #include <sys/param.h>
 #include <dirent.h>
-#include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "qemu/path.h"
 
-- 
2.9.3


