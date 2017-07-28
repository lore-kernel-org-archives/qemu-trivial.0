Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxyS-0005LF-6T
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:38:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyP-0005Hi-8W
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:38:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyN-0004or-G2
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:38:05 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:34114)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyK-0004kw-F2; Fri, 28 Jul 2017 01:38:00 -0400
Received: by mail-qk0-x242.google.com with SMTP id q66so20242935qki.1;
	Thu, 27 Jul 2017 22:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GxWulpUqcUXjwmpoTYc1abjGvMlVTZCRoeKcsNYArf0=;
	b=cGh3AfT0SdT9D6LPCjIH/n1rx0wsw4fJLbA92jPZxjeTJ4P6lmo045lDdSMG9I4Qab
	J64NSvm1JHnagL6o2+US6/KJvllZOTujkpswObUaOLFmCqXk2XoR67iMJH/aPnSYzLIp
	LujPw7Ahb8makJDz6kmi5iviIs0D9MGZqfz4BwRxv7Z+a+M+ocWX2UcoUTa/w4tMVe4j
	F3OZvXe0vjFBN6FTX+QlkuQ/hHsAZ3jt28COLYDZRqj9sRiO2oSM28b6qj6sP8WYWUQ3
	/2yEd95mDlW5ZvEcwcNUlZNzivLjXNpiTkxso6ismFwD0osPECfSkUW4No/2cuyNoACf
	1DBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=GxWulpUqcUXjwmpoTYc1abjGvMlVTZCRoeKcsNYArf0=;
	b=KbPpZpvnQOlVDknO+vgTAhPUK9siJYNVTJk0CSzvLI0Jm85UI7jIttCzCQ78yP1hBu
	RmH+VbMT5MGkA1dNd3LnuTQH8yyz1hg/mdqGBWHovQ6UaDs+w9RqwKXGclshBJpXnVSe
	5koWRTqxbWnVAvs02rPs2st/lZyEtB+U0cglKG7hmzHz5KEw7Vlnsy/33Bl4n2vxshuK
	nnmBEargeUMj1D7bX1FfhJksvI/tgKLJCjzH41Wiaajhy8QOUqYQ6zjoONTpxZF4Z85L
	7NCRv/q6WLCcRKvgd6V8j6m2gpjkxKvspm10WPQLjnz4DmAU4g23KeEqz+TR6LP8OBbU
	EQHQ==
X-Gm-Message-State: AIVw1108k+jpE8GhYwPvdjS6pvdGxEU/U+1Uysf9MVDve6W8P/iOjyzS
	0ytqdlqiCEenNQ==
X-Received: by 10.55.162.210 with SMTP id l201mr9746181qke.180.1501220280010; 
	Thu, 27 Jul 2017 22:38:00 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:59 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Corey Minyard <cminyard@mvista.com>,
	Alastair D'Silva <alastair@d-silva.org>,
	KONRAD Frederic <fred.konrad@greensocs.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Date: Fri, 28 Jul 2017 02:36:04 -0300
Message-Id: <20170728053610.15770-42-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [RFC PATCH 41/47] MAINTAINERS: add missing I2C
 entries
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
X-List-Received-Date: Fri, 28 Jul 2017 05:38:06 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fb6a82c1ad..46807decf5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1630,6 +1630,12 @@ F: include/sysemu/replay.h
 F: docs/replay.txt
 F: stubs/replay.c
 
+I2C
+S: Orphan
+F: hw/i2c/core.c
+F: include/hw/i2c/i2c.h
+F: tests/libqos/i2c.?
+
 Usermode Emulation
 ------------------
 Overall
-- 
2.13.3


