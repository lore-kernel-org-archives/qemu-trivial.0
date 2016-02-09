Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aT96M-0003kD-3c
	for mharc-qemu-trivial@gnu.org; Tue, 09 Feb 2016 09:17:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aT96J-0003ii-Q1
	for qemu-trivial@nongnu.org; Tue, 09 Feb 2016 09:17:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aT96I-00021d-SE
	for qemu-trivial@nongnu.org; Tue, 09 Feb 2016 09:17:07 -0500
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:34953)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1aT96C-0001uB-M7; Tue, 09 Feb 2016 09:17:00 -0500
Received: by mail-wm0-x22f.google.com with SMTP id c200so62217732wme.0;
	Tue, 09 Feb 2016 06:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=R+GBcpU7pMw74LI+BhyTUaomPu7l0hUz4EgmPRyZwt4=;
	b=Ia8GDx4ri3jycmKY/OhuOUCP+wuqShZF0PfjgeKDwGQv019wWgU58ndaWRi1XZuNyE
	92UMJ5hVehsat8zgatP2AdpBwcA0D/TdgjJbXqBSx76KCtrlDhJvFCiDUHaxzDESIhi9
	YzNMqBOIrwTT8n+H+sSjgPyNF/j8XL8YRq7fXQs+Cb09uSFW0c/jfWsP3/mgycFskich
	C4kYJgKXOIKzmV7Wf98gFQOqxOU0+il8RCE33U5xImd7e9zBfBO7RUdDjOD8FAiJjfko
	RPMAowkQt8Sy/dRp356VRCLH/Sp4/diHCLDAvaE0HP/aAkX6QUCscrwSsy6hyad+olOm
	/d+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=R+GBcpU7pMw74LI+BhyTUaomPu7l0hUz4EgmPRyZwt4=;
	b=DodXYGTRmCK+Sb2ImT1dPJLCfZviijA35TD/PyzFPakFvDVuzmzE8UQQdEE+iM2Aq4
	71T3MSYDt9JLf53shuFqH3NG2wZFe4nD29jh45s8f5c0Tq9UQcgyRvRNEheuI6hL/22A
	IKxNu1/nEI8H8DGJU/eTXD+lmOvWkIVJ3i8SeGB6WjtwIuinExmi2UiFPVUKaSGtVgs+
	47Sk8Ahl7MHgj6aP3wHibPcWIfo7GceyrVnIUzoZcxkWeast7TZWF3d6MlIF4JuX8ws9
	OGoOKh/G1vI92aHnAXAnJebiWgxuOfwKvVQT9sXY8+qeBKDg28afL8D45SCHuWlKrRyk
	QYNA==
X-Gm-Message-State: AG10YOSgw08QSt3HMjEH9L2FFvPMbWdEa9hLLHqvfsrT7/2hRbSdBj3kGzMSePDUA105mg==
X-Received: by 10.28.50.137 with SMTP id y131mr5474293wmy.102.1455027420117;
	Tue, 09 Feb 2016 06:17:00 -0800 (PST)
Received: from donizetti.lan (94-39-141-130.adsl-ull.clienti.tiscali.it.
	[94.39.141.130])
	by smtp.gmail.com with ESMTPSA id g1sm23122786wmc.0.2016.02.09.06.16.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Feb 2016 06:16:58 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  9 Feb 2016 15:16:57 +0100
Message-Id: <1455027417-32278-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22f
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] w32: include winsock2.h before windows.h
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
X-List-Received-Date: Tue, 09 Feb 2016 14:17:08 -0000

Recent Fedora complains while compiling ui/sdl.c:

    /usr/x86_64-w64-mingw32/sys-root/mingw/include/winsock2.h:15:2: warning: #warning Please include winsock2.h before windows.h [-Wcpp]

And with this patch we dutifully obey.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/sysemu/os-win32.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 400e098..fbed346 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -26,8 +26,8 @@
 #ifndef QEMU_OS_WIN32_H
 #define QEMU_OS_WIN32_H
 
-#include <windows.h>
 #include <winsock2.h>
+#include <windows.h>
 
 /* Workaround for older versions of MinGW. */
 #ifndef ECONNREFUSED
-- 
2.5.0


