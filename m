Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hAmvv-0004qB-5g
	for mharc-qemu-trivial@gnu.org; Sun, 31 Mar 2019 22:44:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jbi.octave@gmail.com>) id 1hAmvs-0004oT-QT
	for qemu-trivial@nongnu.org; Sun, 31 Mar 2019 22:44:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jbi.octave@gmail.com>) id 1hAmvs-00012l-2U
	for qemu-trivial@nongnu.org; Sun, 31 Mar 2019 22:44:20 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41592)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jbi.octave@gmail.com>)
	id 1hAmvq-00010x-4E; Sun, 31 Mar 2019 22:44:18 -0400
Received: by mail-wr1-x429.google.com with SMTP id r4so9815502wrq.8;
	Sun, 31 Mar 2019 19:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wcPtnO5zk/35tD5wYDgy5VwGITHIzbB7ZRrlSWc6Ehk=;
	b=GPMe/+XTTbET9uJSUBRwLXIsWr3M+5u0lEqmeosXehQGdw7iJLwhuHFiFa8zYSYb7p
	2KO3h4UgRU7CLSOtIbYdU8pVckXxx6+RtAey+nxcHXpi7jlEYr6lXxB0hJOMDFje6ASV
	WymTQ11ekgANg+IqdaKdRa1GbN7Mn4fmYcAzYiIVK0Oa2faId3wMZ6dwK5KIobdDD0SB
	7bzfHbrvxdTRkfKAMp8srFTEzCzdZwc1RcYJbxWLVVS8cidBGd8HVkHkQ2+uDRglXrj0
	BC3s4PBxvm+GRBYBIdBFLsFO3QMYMMVO2xdsdzPGid9OwlwJG2nP+QDTyHDIRmYHfqO2
	7k3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wcPtnO5zk/35tD5wYDgy5VwGITHIzbB7ZRrlSWc6Ehk=;
	b=ntvvsjTAvkxUFZn480zhqa9RQyrkQ4PXhUY2ulkwKGhBSrBp3QCbcapZo04f5nLr02
	0gD/sZ4Wl/emMUsfmJHDy/lr2p53VUOHm9Vf+/WRISf/myEIpP9Xkwvj1Jh6vC/RtSbo
	TZEqQXSblQhF86sg0DEHRbOqpqfYJmvauyhq5wtBY2oRUVmRXlqJyqkykRGaKDcbdDka
	epC0FsbSQl5oeguuM4RFmsFMGmvkdm8W4I6wYCNU7gYYanPkTKQAHry9omXR3rPsTiFt
	/3M6RtYlO8VwOVYGA5m1cKcsaiP7IK5I33OcNk7E4Xf5MjSBrPivYvYoKO+3PxzsFM9r
	gOsA==
X-Gm-Message-State: APjAAAVu4q2XHPzNPIqFvJniF8TzZisG4nEFQN4w+IsFIRFRQPW6/yMd
	b2sIBZ9KW1r+zAkbWy7polAxQt8=
X-Google-Smtp-Source: APXvYqybgWDNpwiRfBm37CqfAtbnoaII7d2nRxliICRgePcEWuYnu2yIkYMtSmXkRaZFHGgVUuF8pQ==
X-Received: by 2002:adf:eb0b:: with SMTP id s11mr15777722wrn.140.1554086654873;
	Sun, 31 Mar 2019 19:44:14 -0700 (PDT)
Received: from ninjatsu.lan (host-2-103-80-5.as13285.net. [2.103.80.5])
	by smtp.gmail.com with ESMTPSA id
	s189sm13627048wmf.45.2019.03.31.19.44.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 31 Mar 2019 19:44:14 -0700 (PDT)
From: Jules Irenge <jbi.octave@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Mon,  1 Apr 2019 03:44:04 +0100
Message-Id: <20190401024406.10819-1-jbi.octave@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::429
Subject: [Qemu-trivial] [PATCH v2 0/2] util/readline: errors clean-ups
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
X-List-Received-Date: Mon, 01 Apr 2019 02:44:21 -0000

This v2 version combines two fix of errors into one  and replace tab
indent by four spaces

Jules Irenge (2):
  util/readline: add a space to fix errors by checkpatch tool
  util: readline: replace tab indent by four spaces to fix checkpatch
    errors

 util/readline.c | 132 ++++++++++++++++++++++++------------------------
 1 file changed, 66 insertions(+), 66 deletions(-)

-- 
2.20.1


