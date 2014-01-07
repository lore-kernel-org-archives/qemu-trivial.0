Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W0WAZ-0007GB-45
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jan 2014 07:54:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33780)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <namhyung@gmail.com>) id 1W0WAR-00076a-Q6
	for qemu-trivial@nongnu.org; Tue, 07 Jan 2014 07:54:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <namhyung@gmail.com>) id 1W0WAL-0007i2-VK
	for qemu-trivial@nongnu.org; Tue, 07 Jan 2014 07:53:59 -0500
Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f]:56939)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <namhyung@gmail.com>)
	id 1W0WA9-0007gZ-M3; Tue, 07 Jan 2014 07:53:41 -0500
Received: by mail-pa0-f47.google.com with SMTP id kq14so347788pab.6
	for <multiple recipients>; Tue, 07 Jan 2014 04:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5readS89oFvroTLTA1cPc5wWCPJotKxf90ShwNcsSaE=;
	b=gW3DkdtoJM3X+XaRwm2baqjTo6ljC96PCxSr5GZ3Z49NA4BhTPwWp5cTk0NpVXdpEJ
	69VSPxhEwbNZoYm1WfsnrKLvfswxxAhWvmSRMM6ufeGowAwtEvGYSuXvmCKLmLh0zyAS
	awtRVDkMDhGXEeUawn5VvvV/eIoAvF3zfaZv3KuYhCT1yFwzlKb8piuJjKbgVRJyvGlJ
	fpsq3dLhIwO0ZYHRqoPe8i1j5MLLLknRzn4t3hdruUaMZYlDpQl8KstSUZBsOQmc5YNU
	z4A4XZvwdMjnNYrMbsj46ixWwh32NpdDohIto6ay5ZY1zLJ0X2tmQRgYGQN87PZhxmPp
	XI+Q==
X-Received: by 10.68.195.4 with SMTP id ia4mr15397208pbc.142.1389099220287;
	Tue, 07 Jan 2014 04:53:40 -0800 (PST)
Received: from localhost.localdomain ([180.230.0.113])
	by mx.google.com with ESMTPSA id yz5sm93916896pac.9.2014.01.07.04.53.38
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 07 Jan 2014 04:53:39 -0800 (PST)
From: Namhyung Kim <namhyung@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 Jan 2014 21:53:51 +0900
Message-Id: <1389099231-3389-1-git-send-email-namhyung@gmail.com>
X-Mailer: git-send-email 1.7.9.2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22f
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] docs: Fix typo in QMP WAKEUP example
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
X-List-Received-Date: Tue, 07 Jan 2014 12:54:05 -0000

Cc: qemu-trivial@nongnu.org
Signed-off-by: Namhyung Kim <namhyung@gmail.com>
---
 docs/qmp/qmp-events.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/qmp/qmp-events.txt b/docs/qmp/qmp-events.txt
index 6b87e97..a378c87 100644
--- a/docs/qmp/qmp-events.txt
+++ b/docs/qmp/qmp-events.txt
@@ -479,7 +479,7 @@ Data: None.
 
 Example:
 
-{ "event": "WATCHDOG",
+{ "event": "WAKEUP",
      "timestamp": { "seconds": 1344522075, "microseconds": 745528 } }
 
 WATCHDOG
-- 
1.7.9.2


