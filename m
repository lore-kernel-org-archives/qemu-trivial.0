Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxyN-0005G5-N5
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:38:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyI-0005CR-BF
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyH-0004hH-Ha
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:58 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:37498)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyE-0004bV-7m; Fri, 28 Jul 2017 01:37:54 -0400
Received: by mail-qk0-x241.google.com with SMTP id x77so5584640qka.4;
	Thu, 27 Jul 2017 22:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=R9JtZP5r/aefxd18bvu29gGSK14yyx4/17+6z8nZoRM=;
	b=IvlMzmdkZBpIy8+gd631RK2kv6dZg+h693d8b8bbfeDXI/peQ+SfIwRAUDxo59iM5g
	k/PXdUk90JFPQp32O1IZ6OLqAhI0CBaZZrstWZ75/0GhzSEBBrbyZrYUsadyw/zpuc3L
	xPDI3pVe+sh+fqITz42+NN1rPNmwyrgxR/hwCM0o77fjXq1EmBq+DlLT+TMVNz2gb+HW
	nK3uffOsth+Jw1aQBbBFkaviVFPJMVT21P9JaiMEbl6ekXoSCS0WyNALsaW//wm5K5pc
	kfoMgj3hxV9GzZin6kzZA+7Jfj8NbzuSxgfN7jmc0pp4fPutQC/F83+71MLFFw6/9leC
	9WaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=R9JtZP5r/aefxd18bvu29gGSK14yyx4/17+6z8nZoRM=;
	b=f/ljVahtfwcVHA+R1XkLxutNhIr39HOMPm2ZbyOZdb6bWp+U7I88RpNLEZyh57wVUx
	C+5fAUAyEfcCrjEXd1dCI4z+oyl4qolyEBVFdPd9zuupl9hNTjxNBN3srnf/vSO/+agJ
	3LIEPFoZ8RrMBbgc9GNS+C97GeqxLSc+0I2ujFDedCwva4V8sVNYLNRZRViVq1W62EEj
	O+SvJ7ZzD4h8Rj3f4pjhDjCAsdJDlfyW4o/cYwpPWRXy6Ny9WRtJ2K1ywpcJLoyH0ViK
	WSKJVxnNSYKrCt0OppgYIgMJt3sg35B/kyB6UnCERkPTtwUNDd1RMuQyISZdMpXgSeMm
	s1Gg==
X-Gm-Message-State: AIVw110Seh4yg4yPoqYstufn04a9oLNmR/N1Ofo25JGjUS2Q+gvCQ1xm
	SNeufnVaVAYJog==
X-Received: by 10.55.7.7 with SMTP id 7mr8726312qkh.121.1501220273779;
	Thu, 27 Jul 2017 22:37:53 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:53 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:36:02 -0300
Message-Id: <20170728053610.15770-40-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH 39/47] MAINTAINERS: add missing SSI entries
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:59 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
RFC because I'm not sure m25p80 fits.

 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 54e35fdab9..83597fca4e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1010,7 +1010,9 @@ M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
 S: Maintained
 F: hw/ssi/*
 F: hw/block/m25p80.c
+F: include/hw/ssi/ssi.h
 X: hw/ssi/xilinx_*
+F: tests/m25p80-test.c
 
 Xilinx SPI
 M: Alistair Francis <alistair.francis@xilinx.com>
-- 
2.13.3


