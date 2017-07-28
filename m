Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxyV-0005P3-77
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:38:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyT-0005N0-Em
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:38:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyS-0004w4-RI
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:38:09 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:37504)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyR-0004t3-0T; Fri, 28 Jul 2017 01:38:07 -0400
Received: by mail-qk0-x242.google.com with SMTP id x77so5584900qka.4;
	Thu, 27 Jul 2017 22:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jU8DHEsXuMbKzeu6CxHXSugsz/OYIHF3MHqMT2/zSDQ=;
	b=YSfLQ+kIUgIkh0keqV1/Sqi8W8gooTZMxtZqL+oozmnr5AtwGCBQVT+/nk2xpH/xnB
	/C4gSfOxrXx7SBbXcayOHwla5axUcxYjZlyoZ8mgksPPPjgOl7O2zZKOyyim/n6uCTet
	68IQMhwhYXoCJsxXe0YhSJqOmKVKr2SDsO/3Vhwd3dQRVAq4q0UhtsnlDVg0eIJkdcJi
	x2y6ximOjky3BBuky/GdZC3lxUhc5vCP3NymwI2fxv/z9ylUHiQtu0ZcrnfU3sZbTUAY
	nyRirQOR9c2+Q8YzsHXdU1ggEWn+ngKw2cLYKDA4cNrHPy7wY4e5cGnv1/KEPr0yKL3y
	iH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=jU8DHEsXuMbKzeu6CxHXSugsz/OYIHF3MHqMT2/zSDQ=;
	b=qqSfKRPQWu3bMw3rL7SZZer5lChDOGtJPa2TdpNWmmdtAHPsjpBWPnX0iVv+HY9/DO
	cxVImxOOedbICScOak7WASOlQgGcMoCeK6D38n7Z+tbMnr4ZKYxPK1U9Hwc3xsHP63GI
	wTKBz1cRuWnzuyu/JmDh3gaXRfjqVACa8PTILZgW/434sNofQVuBxHoTq+62mu1h/27k
	ncktUiWRqI7zVxp1n9LcXXy1M+D+hFoA5FgBKOnCZLtOirSqtlR4jVTD9SaXEAC3xpFR
	57Tdk+dCfeJetfraHwaZxd5rsjOPQzPTqC/L4HcvnwSbQxrflR0rgVGuMyhFcroHrP1Z
	ukgg==
X-Gm-Message-State: AIVw111vrq3/FbEH8RpMuANmyoDWmEKSmqGiUY1Gzzyqle+5z7JMRPIW
	fgWFkjE8Uw6XdA==
X-Received: by 10.55.43.160 with SMTP id r32mr8410582qkr.47.1501220286585;
	Thu, 27 Jul 2017 22:38:06 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.38.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:38:06 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <rth@twiddle.net>, Chen Gang <gang.chen.5i5j@gmail.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:36:07 -0300
Message-Id: <20170728053610.15770-45-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [RFC PATCH 44/47] MAINTAINERS: add missing entry for
 tilegx
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
X-List-Received-Date: Fri, 28 Jul 2017 05:38:10 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 453f5fb3d7..dc1a69051c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -283,6 +283,10 @@ F: hw/tricore/
 F: include/hw/tricore/
 F: default-configs/tricore-softmmu.mak
 
+TILE-Gx
+S: Orphan
+F: target/tilegx/
+
 Guest CPU Cores (KVM):
 ----------------------
 
-- 
2.13.3


