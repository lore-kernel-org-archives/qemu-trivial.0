Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FVZ-0006MW-Vz
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:13:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVY-0006KS-4x
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVX-00048Z-AU
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:20 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:45793)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVV-00046s-1X; Mon, 16 Oct 2017 20:13:17 -0400
Received: by mail-qt0-x243.google.com with SMTP id p1so69942qtg.2;
	Mon, 16 Oct 2017 17:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=IpDl0yNSmk1sfH/brr/Tu4rer3b/KD/QB9sW24KL4l0=;
	b=kEINvoJSKx8ixXfx97AcaM16xIx8LbkYb6PTeF+MNR4bZLZ3cQViDxXEd+MmpYT8uJ
	3s43pjEqVvVzreHXkzlLWFGAu/rs9ydbR8slzd6kEcesnGVG+lCNql89p7/Vv1gJW1xF
	tkioLS0y3kAwuOPCWl8so99C8vZyqMPSLp3pQWtwLg+DkzeajOBU6B5HYLSrV4b/qc6g
	ZFk8hM7h82w8Nxm7b0/X8EKnBLw5URPgXGofMBpRdZ02EzU1bDm+KCCEtPXkeX2MgTdw
	TDsrA98pm2Hq71uQoL9XdsLV6I7WJ9pyTWaGGDOWykGAGM6cX8s8xGqh1mSrPOxd303Z
	vbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=IpDl0yNSmk1sfH/brr/Tu4rer3b/KD/QB9sW24KL4l0=;
	b=Q0h4P+62IuryTN5qpFZX4aKHWN5+6DVi1/cU8uJJAfAt5OWoa0f8NJPc6PNxjtKab7
	UB/zJ1odZORb5+cPQUGYp/grlQWJffUYICZU2A3OapEAfUSen81HJx+LVbS4JGW2WTLU
	WBAmE9faW0TxRmZzSun19aCXOKNQV7SG/Z/nArf9J6vnwB/nBljULdmVswxj2/dWPJ8T
	ruK8epBtpegKZ30h583UOG4mfmPXhoYFmanMbj9KwQI6VYXi5UwPM3P+uR3plh1WjaWZ
	uibRAYpjuw0I4KfL++W3nFScvgNTAWQzDtzOxkHS5UWBSPBNQMP+xWRwElSfiDxPw8Yf
	ng1g==
X-Gm-Message-State: AMCzsaUwalk1DM8EfHn/+1LJWACMG5xPITTxdTPctZw9Ye/LtPjfOru6
	azM/WIjzww3sx0bY5p+iw90=
X-Google-Smtp-Source: ABhQp+RtAvjP13DLcSLfqDKfZDqEjn7m4/juwUUMUAm360CtLQ3hKIG1pk188/cpCVgnIu+FfvcOFw==
X-Received: by 10.237.63.129 with SMTP id s1mr17641263qth.89.1508199196655;
	Mon, 16 Oct 2017 17:13:16 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.13.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:13:15 -0700 (PDT)
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
Date: Mon, 16 Oct 2017 21:11:45 -0300
Message-Id: <20171017001209.32276-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v2 15/39] i386/hax: remove duplicated include
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
X-List-Received-Date: Tue, 17 Oct 2017 00:13:21 -0000

this file in include in "target/i386/hax-i386.h":

    #ifdef CONFIG_WIN32
    #include "target/i386/hax-windows.h"
    #endif

which guaranty than sysemu/os-win32.h is previously included (CONFIG_WIN32)

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
could be squashed with previous

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


