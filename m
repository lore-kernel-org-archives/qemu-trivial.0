Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cb7Ih-0007AZ-3b
	for mharc-qemu-trivial@gnu.org; Tue, 07 Feb 2017 10:03:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1castD-0001CT-6s
	for qemu-trivial@nongnu.org; Mon, 06 Feb 2017 18:40:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1castC-0001TM-Jg
	for qemu-trivial@nongnu.org; Mon, 06 Feb 2017 18:40:07 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:36382)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cast8-0001R6-Gh; Mon, 06 Feb 2017 18:40:02 -0500
Received: by mail-qt0-x244.google.com with SMTP id h53so16968711qth.3;
	Mon, 06 Feb 2017 15:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5FWK+mqaAYT1Hi1RptN7i3j+1QWNFHqgGpo1Rlk7KFs=;
	b=ITpe8irUXa3iJLnt1ppV4FeMBIeNty+m98gMpIQ1sKGe+w7WfYGdMlEzsxeXODon8f
	1n72stbL9+6NrAyTMPqi2NBpQcqYWv3ZhTZSFf9rRKV8yDs4dK2lJYlBiWBk7YIdQKKr
	4FJ8Ln2vZo1ZS6L0/jTPxDdhTrtkAueZiWiqfXU8u2vK987JQ/2LxRpqGbVZB0zAE38S
	2LORgRLeQuoePxYfMBQ2FlQOT3s83KSSgBHo9yXa2vYiVz/ivlQFZ+7lviYlhZlUzQ1L
	NkY66YEZNEVPUe50vlGJQdQAQp2/ove+BrCSXapeKfLBfcuOPAoSYPZS83u0s6wN2lS/
	KBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=5FWK+mqaAYT1Hi1RptN7i3j+1QWNFHqgGpo1Rlk7KFs=;
	b=iJ8ERDmFI+Jh8CG/EytpHrpQ/GfyBYqITwp/4l+n7fQ2vTTgYunCXu5zjhXACQ8Q0o
	ct8fNdxC2k0sx2tE0Yy1VApZX3qEuF4wGpp7JN5OAshnc7BJJIzSqYhVeA/rHEu/hfe2
	Up/QDsnmOcwKfPv1BvWq7/2CEPq0tsKRTj+EtTnkqJp8mJFuZ5ACYQgHb20RStUa3cbi
	VG/XDcwJAY6e5/py5xahAqkfQDJJsGEGynVUaZvt2d4j4+vW35YPMM3HMj0HzTTB1d0D
	FxOBdghQN2a5KvVoN3uJ2zifP1PFgMm3i+DWDkNHggkq5e0zUD52EIQYu1D9e6ihUXXw
	lveA==
X-Gm-Message-State: AMke39nN1fBTSr2z+hYitwflvakZKUL/XhAeIdg/PUYuftpfIagxrTCgQXREBJdOjypR9A==
X-Received: by 10.200.58.101 with SMTP id w92mr11422370qte.160.1486424400492; 
	Mon, 06 Feb 2017 15:40:00 -0800 (PST)
Received: from yoga.lan ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id 37sm1817879qto.43.2017.02.06.15.39.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Feb 2017 15:40:00 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon,  6 Feb 2017 20:39:29 -0300
Message-Id: <20170206233931.14921-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::244
X-Mailman-Approved-At: Tue, 07 Feb 2017 10:03:21 -0500
Subject: [Qemu-trivial] [PATCH 0/2] register: fix incorrect read mask
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
X-List-Received-Date: Mon, 06 Feb 2017 23:40:08 -0000

Hi,

This serie fix a bug in register_read_memory(). To avoid duplicated code, a new
inlined function register_enabled_mask() is introduced in the first patch.

Philippe Mathieu-Daudé (2):
  register: inline register_enabled_mask
  register: fix incorrect read mask

 hw/core/register.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

-- 
2.11.0


