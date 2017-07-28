Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxx3-000426-IB
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:36:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxwz-0003zw-Rj
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxwz-00031W-30
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:37 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35745)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxwx-0002z9-2I; Fri, 28 Jul 2017 01:36:35 -0400
Received: by mail-qt0-x242.google.com with SMTP id t37so8843989qtg.2;
	Thu, 27 Jul 2017 22:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KNHOKAYa40NmKusfYf/JxHcN9TpXOEEB5V/CxZX4+ng=;
	b=D7jxI6ylWMV/slGBWgSAgeIitQE5Hrp/CR7ijFLCUWJplL0Fi1EDOJo6gfiidlWnJh
	wjL+LyHfwZHkzHFS8XMdFl3XQR4C6quCsbF5U1MohDJtCJiayGWjDPUnYiNZrgVXR+5A
	biJ0PfTOURJWytQRy0Z4NrlCqmjNOMhKMo4uzjUjNqJZJtptcEDSWWZ27B3JyEBR0PdT
	XGpmnwpM5o9c54AAoihtoiDFibBTl3jkCFy2d4YQ02O+ztyQ2Of1F6zNSMjoT03DaKcM
	FfyvT67fEBkSfWyzjC4XymDM0Wj781k4fvYaSETr4yxLz8Gqidgt8CgII4SLYH3+B7sb
	ejDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=KNHOKAYa40NmKusfYf/JxHcN9TpXOEEB5V/CxZX4+ng=;
	b=i/TVTlQhEnq02h3mNwP+WQ7IK4WGumAYORHnP1QWCk7McpYpeSLRw5RLQ5YlYr2I4d
	gEmbQctsm6YPbCcp8UWdIi/go9HxgrUGZGhXk9IWb3oUEh+8i0NaQkPGc/om6fE1TWa6
	8cSMMJKTkqDL9MBr/gKzyBVdXDhqkNhk2xTify9IEOyH5daKKMcrfyEyuKfeU6Vs9gKJ
	WkFLKsyuc1C9YDYa1B8amcrJhYj2i/E4Hua3z73qUTRKJEbpIaE9DOsP6Nm9DHRw1fvy
	+wzCCPBDuHKaS5LalBYQwlqoBxAIRXZej5mCzt+ne3jA0rHivmKO1mQ/P9pgrrdfKSbg
	jx9w==
X-Gm-Message-State: AIVw111FZaA5fILFB2liQeNWWlJl7yRK++KUOsmkE64WSs7bjEnJP/in
	ImK+bk4G3SM1hQ==
X-Received: by 10.237.35.81 with SMTP id i17mr4201323qtc.19.1501220194655;
	Thu, 27 Jul 2017 22:36:34 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.36.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:36:33 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:28 -0300
Message-Id: <20170728053610.15770-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 05/47] MAINTAINERS: add missing KVM entry
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
X-List-Received-Date: Fri, 28 Jul 2017 05:36:40 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3b472d7a09..ece02522be 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -278,6 +278,7 @@ S: Supported
 F: */kvm.*
 F: accel/kvm/
 F: include/sysemu/kvm*.h
+F: linux-headers/asm-*/kvm*.h
 
 ARM
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.13.3


