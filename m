Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dr5qF-0003OR-Mr
	for mharc-qemu-trivial@gnu.org; Sun, 10 Sep 2017 13:16:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dr5qD-0003O7-72
	for qemu-trivial@nongnu.org; Sun, 10 Sep 2017 13:16:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dr5q9-0003Wx-1N
	for qemu-trivial@nongnu.org; Sun, 10 Sep 2017 13:16:17 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35628)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dr5q8-0003Wc-Sg; Sun, 10 Sep 2017 13:16:12 -0400
Received: by mail-qt0-x242.google.com with SMTP id l25so1487064qtf.2;
	Sun, 10 Sep 2017 10:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Tpjbv4NA22yxNTYGugKthImXouxOCQbSF13uql0Q9kQ=;
	b=qtcjJNEfLkMlamhLCUIYDrPK63yLhRdeFHh0+9YDaKR395j0CBXdo7Z+Y/UEKFrkkP
	TG8XX/nkvX82M6JpKwgceLgiUNzYgXZtzIO4EJ3kBfDjZs/efsEYBjNgHcSmrsdJqlep
	wIznWDS1UU/Qk3/QSTikdurygGIoQuGi98OKyCK3zWzkNaoLTVq6qd08mri9UR9K5RL3
	lBrJ41umA56KJeO4f1ayH3gK6kRWEajHu8WzpHhEEPBzEm8mjNqd68qM6YPOxPA8R31h
	AftC3IXS/UIWLhhFsfQ2mLAV+thXEdcWc/gooILJ9QRw5Gfe5cbFW96HIrHQxEVsY5EV
	Dxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=Tpjbv4NA22yxNTYGugKthImXouxOCQbSF13uql0Q9kQ=;
	b=pShQYyhGr6HXJsN73SqTG3G2q1gKJWRrI+04R6+enXhPx8jMEnVuDQvIT/Bw+3F+dp
	Ckc7URcZ4f3EomiiUTIH0teL1/uC94BzZ6eq2TUG30bIauo5+kF30iiRf1Yb9WQiR2eQ
	ZF0K282VIxXp8ye26JTxT1BZniX1N2cMm3HbbVb0sp40Gn5tm14wQYToUASbKn/Y3dHg
	smVQUW/82Fcvdr7lfmttRQvt2SEQMme0cy65JRvrFBpwz/ONI2O4+ezCCRLtf8RytXbX
	etPE74pEnVigQa6/KJKdjw234FPQV5C95yURFla1wZ1W4uU4UD+dnqVnDFL+0cxn+tIV
	aDeA==
X-Gm-Message-State: AHPjjUgebsWzxPcBngHjQIzMoBUfvPtdrr40wLuP9NFaQEDhiS1TwRwA
	D4g8sJ4bRmKGYA==
X-Google-Smtp-Source: AOwi7QDtAjCDGOfkoykOJm27CLIpAgzKkN1TA2XZmEpX7wYrKU1Qx7107emBw1s9xu5I06jzDxhTXQ==
X-Received: by 10.200.26.135 with SMTP id x7mr10292044qtj.14.1505063772235;
	Sun, 10 Sep 2017 10:16:12 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	e126sm4470485qkd.86.2017.09.10.10.16.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Sep 2017 10:16:11 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Hannes Reinecke <hare@suse.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-block@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Date: Sun, 10 Sep 2017 14:15:57 -0300
Message-Id: <20170910171557.12689-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: update email,
 add missing test entry for megasas
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
X-List-Received-Date: Sun, 10 Sep 2017 17:16:18 -0000

and update maintainer email address

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Hannes Reinecke replied:
I'm currently on vacation with no internet access, but will be happy to answer your mail once I'm back at work on Sep, 12th.

 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36eeb42d19..371e23a9ff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1101,11 +1101,12 @@ F: hw/block/nvme*
 F: tests/nvme-test.c
 
 megasas
-M: Hannes Reinecke <hare@suse.de>
+M: Hannes Reinecke <hare@suse.com>
 L: qemu-block@nongnu.org
 S: Supported
 F: hw/scsi/megasas.c
 F: hw/scsi/mfi.h
+F: tests/megasas-test.c
 
 Network packet abstractions
 M: Dmitry Fleytman <dmitry@daynix.com>
-- 
2.14.1


