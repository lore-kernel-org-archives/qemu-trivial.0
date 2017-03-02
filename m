Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjSBs-0006qu-7j
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 09:58:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shah.suramya@gmail.com>) id 1cjOHr-00069N-5d
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 05:48:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shah.suramya@gmail.com>) id 1cjOHm-0004yW-B2
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 05:48:43 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:33095)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shah.suramya@gmail.com>)
	id 1cjOHm-0004yS-3g
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 05:48:38 -0500
Received: by mail-pg0-x244.google.com with SMTP id 16so497067pga.0
	for <qemu-trivial@nongnu.org>; Thu, 02 Mar 2017 02:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ImhZYhb6O3xSL9qcnN5GzVm4Rd5nVBEoP7HO/UKt394=;
	b=vXKMw8wIdpVnPIul8z/v3Oz5NobC6yCfb6Un0ck+Ibap8x+yHkOKrwVOB6ICw2ca9f
	gwuQUYh4vIe4c1354mvr/aoMD2ScHUsOKxkrMaO7DdXSvE2+k/NnrAvyBIIF5OCPtnP+
	nk9O1LIqGX490a3UnGKG6y/8kd4qzZvw3u6CKRa4DvPI9/qFN5sT9pb1aStD7/H8aWJZ
	dk0tets6hz6NXt6yml2BtBb8mEMqttILopDZ3z2qhEQLU04ZiA8WZtjCF3+XBJKIg/s0
	FPOcTaCfF+v/0XcgmagnhWtDApp1kbTD+B/4/xOov0hFa+rsH6QFeUpUaAvxtDsBbc50
	uotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ImhZYhb6O3xSL9qcnN5GzVm4Rd5nVBEoP7HO/UKt394=;
	b=P0biioylZ+sdj7i3BBVsNlofoXWAOkaerXAZ16G6SZevHGI+RUzulOCPqexB0uNE/2
	6aYKy4wYMheN8+I3D0bQF0c+55TLIROaI0PaNF4O2YQA21EbEqUr+NpMQSoKngOhqgQu
	ZPKdl+Mda1zSlOOQH9DXGkFk8Qf9NhAUaNb3L7Fyuldvd5fGQeYUEGcQAAB+MZEC+UnP
	Z3dHqd6ejbETg48gJkC8me2HKkNvM1dvcHOTm059kwjD23TfjOBslnonR/hHVTIQBLpD
	PVP7KP9cZTnjK26YXSpTxLNQpYnEQkWzsx0BkPdRJ2kM71la1i6oAZfL+bnQpjVn/0zk
	1prQ==
X-Gm-Message-State: AMke39l0KnzJmYFaeOU36PePSx3HBgl07nahPCLMzkRUBZbVyhvie1BGSZ0pq2Tlmqgr6w==
X-Received: by 10.84.218.1 with SMTP id q1mr17809616pli.104.1488451716954;
	Thu, 02 Mar 2017 02:48:36 -0800 (PST)
Received: from localhost.localdomain.com ([61.1.17.27])
	by smtp.gmail.com with ESMTPSA id 90sm3852550pfl.24.2017.03.02.02.48.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Mar 2017 02:48:36 -0800 (PST)
From: Suramya Shah <shah.suramya@gmail.com>
To: qemu-trivial@nongnu.org
Cc: Suramya Shah <shah.suramya@gmail.com>
Date: Thu,  2 Mar 2017 16:17:50 +0530
Message-Id: <20170302104750.23029-1-shah.suramya@gmail.com>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
X-Mailman-Approved-At: Thu, 02 Mar 2017 09:58:46 -0500
Subject: [Qemu-trivial] [PATCH] Removed header qemu-common.h from path.c
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
X-List-Received-Date: Thu, 02 Mar 2017 10:48:44 -0000

Signed-off-by: Suramya Shah <shah.suramya@gmail.com>
---
 util/path.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/path.c b/util/path.c
index 46a6098..7f9fc27 100644
--- a/util/path.c
+++ b/util/path.c
@@ -6,7 +6,7 @@
 #include "qemu/osdep.h"
 #include <sys/param.h>
 #include <dirent.h>
-:#include "qemu/cutils.h"
+#include "qemu/cutils.h"
 #include "qemu/path.h"
 
 struct pathelem
-- 
2.9.3


