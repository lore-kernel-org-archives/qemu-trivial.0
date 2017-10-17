Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V0K-0001ua-Cs
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:46:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0I-0001sJ-Ai
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0H-0003La-Im
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:06 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:47828)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0F-0003KU-O7; Tue, 17 Oct 2017 12:46:03 -0400
Received: by mail-qk0-x244.google.com with SMTP id m189so2833702qke.4;
	Tue, 17 Oct 2017 09:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7S0MveDhFqqIn0/+cQEg8BRobd44/EHkp13lCV4Fp3E=;
	b=KEsss+yIbsLsw7J27H4+oMVrWaDFX9uDP7/TPm773Jr/STAsl13XIQH38Y553CFXPm
	WZhqUqVEUTfsuQzB6RW9qHEKu1dXpd4VLqTEY2dJX4hIyHLaHm30N5Kypr5Va1SDW0rM
	6uUlY+kz8vMMZY1dXZ6wB/6YcQVNJnMJXWU/9u6XkkJwuwkj6DSSKeHcKe3dIzdMkclA
	xG3sZR1y8tYCXZskBNHFB8R6SlKNZ109AN0jDRKwtdCeQjhMTgS+tsX7uRuD+EJIKMij
	RZjW1fIrzS0nWx6/4xsUJR+bFzqkjhB50VGLi8MzFhC4ta6M5pbS5IqW75t8QHMfz95v
	vUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=7S0MveDhFqqIn0/+cQEg8BRobd44/EHkp13lCV4Fp3E=;
	b=Zg7dcjYBmlEHRpMh8pTk0kq8l1Kl3AX2uJZKg1xsfGL9jhYHPl0S5f2QQlcNnR7Zex
	ZczUDYq/Ur/gIiB1k9bZ6q1BVYpZAEN4UAZ2UVW7bqGmHlN/RPn8AYxKcLUCHcyC01sr
	t/P3Nofqswoo6srX3SK6gwbpsGRU5uvo6usMNPDatbkU44R14d7sfnZYBgr6HL9I+B10
	d2NAvJfzRtFFt3CTac4b0smIbxd8kgigh2wxZYxk4ITIscnnh1Cu6WGMgkABHnENs/vT
	rGW2mTNWjEcpn0ykd5tiJcdTMq2UlpNiCJJS9/+X1+aCNePAbCLuXuoKFzuwdd0VtQ+8
	FsSw==
X-Gm-Message-State: AMCzsaWOBXr7FM4MLjgmHZ1lxEQEijOR/qqXYS6CsSO1M42PlO1syuYg
	5rspRPxU3HEkoSmS357zPdeURtDovug=
X-Google-Smtp-Source: ABhQp+Tdx02wRcTfL2d6ntL2fV3WSYlqSa4ky7hJU7eQjRSY8chf5+XM9t1mesvvwy922OLS/Aa9Tg==
X-Received: by 10.55.174.129 with SMTP id x123mr10618659qke.61.1508258763228; 
	Tue, 17 Oct 2017 09:46:03 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.45.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:46:02 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
	Yu Ning <yu.ning@linux.intel.com>, Vincent Palatin <vpalatin@chromium.org>,
	Corey Minyard <cminyard@mvista.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:00 -0300
Message-Id: <20171017164426.25277-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v3 16/42] i386/hax: remove duplicated include
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
X-List-Received-Date: Tue, 17 Oct 2017 16:46:07 -0000

this file in include in "target/i386/hax-i386.h":

    #ifdef CONFIG_WIN32
    #include "target/i386/hax-windows.h"
    #endif

which guaranty than sysemu/os-win32.h is previously included (CONFIG_WIN32)

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hax-windows.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/i386/hax-windows.h b/target/i386/hax-windows.h
index f7c3e99246..004f867694 100644
--- a/target/i386/hax-windows.h
+++ b/target/i386/hax-windows.h
@@ -20,7 +20,6 @@
 #ifndef TARGET_I386_HAX_WINDOWS_H
 #define TARGET_I386_HAX_WINDOWS_H
 
-#include <windows.h>
 #include <memory.h>
 #include <malloc.h>
 #include <winioctl.h>
-- 
2.15.0.rc0


