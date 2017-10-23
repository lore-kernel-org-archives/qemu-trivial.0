Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e6kMb-0008Np-BP
	for mharc-qemu-trivial@gnu.org; Mon, 23 Oct 2017 17:34:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6kMZ-0008MV-J5
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 17:34:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6kMY-00007a-Sh
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 17:34:23 -0400
Received: from mail-qk0-x229.google.com ([2607:f8b0:400d:c09::229]:52387)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6kMU-000057-LR; Mon, 23 Oct 2017 17:34:18 -0400
Received: by mail-qk0-x229.google.com with SMTP id b15so23852434qkg.9;
	Mon, 23 Oct 2017 14:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cXYXht3zee+zu7C75Dt6yPw3AMqnwzF/nsHUaeMrvIM=;
	b=F3SwOcIQxpR63hm3ozKR8odvhcOMqBjS9p44AbPIfKGI1XYfFFv4/E8BfjDH5W+Opo
	ITay/9Rz0PSM7fmXvJNz1sgRxfo6HT46cGqCMTsS5faJLdzBfj6rpCitpXKQRNsPuEm3
	fnStrGf3DwRkp6Bmndk1NxZ8OOX49NR6N4oOARhpodk+mDzLhKSD1E6reoFibB2Tws0n
	nlIznu6eySLUokbmuvP5UA3+ZQMleUjhlJwxe3rMyDOeKRBqZ4UP15boM9v6Z0BylpKy
	uE7Xywu+RWtXp6BatDQ9xTDQ688OxSmy1KMirXDcVMKHWDdt7FigpYeogIr07zMsD3tI
	LXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=cXYXht3zee+zu7C75Dt6yPw3AMqnwzF/nsHUaeMrvIM=;
	b=Bsn8N8jZ+tdWjVZETheYGWydGgcy2tFttwFIrzuOGOqHw3GK+fqSCSXCsTQYakjY7V
	P7hG0t7UPPEZ/CWpShDaUflD0ifd8AytpSQQzQTbwGMzXq/HWrp3jEfex4U390f7SpEb
	5K486W2yrQl28x5R8OWagq5tREObuOj/poKjV79p/x1jZ3PGbSURZ1QW93o67JhN8kTv
	IEwUFHMF1/OmdrJYitQiCrJGdlLuzvFF5Y7Mx0eYt5NQDxYb+G2R2PTGKFtXjQgvU/ub
	TThD7d8glr0vo1rRovpjW2N5uCLR5MFNBkuZm8xkry8Fy2HoqTXHOeDgaIBCayE02/Sv
	uRTg==
X-Gm-Message-State: AMCzsaWyy75OY9ImOYRic/AXHgzVzhk9b8LbWUWpxK7gjeqn+1wdwje/
	ZtRZ+PjDe2PRWzCbvU30YaI=
X-Google-Smtp-Source: ABhQp+TKQBpN8gDp4omuryA3vGJP6q9hQN6O48kmOYW+yP5dw+zxbt6CQFlgc2yIfbfmFtveWFX4IA==
X-Received: by 10.55.139.70 with SMTP id n67mr20998298qkd.275.1508794458160;
	Mon, 23 Oct 2017 14:34:18 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	s51sm5568381qtk.32.2017.10.23.14.34.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Oct 2017 14:34:17 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	"Richard W . M . Jones" <rjones@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Date: Mon, 23 Oct 2017 18:33:56 -0300
Message-Id: <20171023213359.23025-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::229
Subject: [Qemu-trivial] [PATCH 0/3] tpm: add stubs to fix compiling with
 --disable-tpm
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
X-List-Received-Date: Mon, 23 Oct 2017 21:34:24 -0000

This fixes building with --disable-tpm as reported by Zoltan:
  http://lists.nongnu.org/archive/html/qemu-devel/2017-10/msg05369.html

Cc'ing Peter in case this enters as build fix instead of via trivial.

Regards,

Phil.

Philippe Mathieu-Daudé (3):
  tpm: add missing include
  tpm: add stubs
  vl: remove unnecessary #ifdef CONFIG_TPM

 Makefile.objs        |  2 +-
 include/sysemu/tpm.h |  1 +
 stubs/tpm.c          | 33 +++++++++++++++++++++++++++++++++
 vl.c                 |  2 --
 MAINTAINERS          |  1 +
 stubs/Makefile.objs  |  1 +
 6 files changed, 37 insertions(+), 3 deletions(-)
 create mode 100644 stubs/tpm.c

-- 
2.15.0.rc1


