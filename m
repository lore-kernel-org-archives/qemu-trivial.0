Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnAxc-00059e-6Y
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 17:55:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxa-00059W-Ns
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:55:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxX-0007Qe-IG
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:55:42 -0400
Received: from mail-qt0-x231.google.com ([2607:f8b0:400d:c0d::231]:34962)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxX-0007Pt-E1; Wed, 30 Aug 2017 17:55:39 -0400
Received: by mail-qt0-x231.google.com with SMTP id x36so33047116qtx.2;
	Wed, 30 Aug 2017 14:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6rV7ojCzrGH7W+pM5N9ZpbOlC7xSBOBSogSPAtanc9M=;
	b=BauWsIETNCyYKBEE/kG8GjMPd/ygpP7nCW1ywd8RKx4mKg/woA0YnzOcFIvFaTkabj
	ZcynoCRNAHaLwKi4o77TmYgVojywMeXvXBKtZOp1Qx3c5eZbD5CMonFikMXpGp/AinxQ
	tC2T5hGFLgmwouTOxAS6ay1OF+Ns6XDU8w2/zMBxa7B1aqZ/YSF9ivryWPluSiyTCBiq
	e4k4DPF4O9aNJDrvjXvLk7HxQNAWTk9FVdlhrVSWTSY+lpW9ti0OfnbzAgmc9GT+jcVB
	S9dzNaNviCMtvwXCauuaxX6YmFf4rxfQwoSVvybDfVVEZ7OvAjtrMgllMf98MOcjkNIr
	Sf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=6rV7ojCzrGH7W+pM5N9ZpbOlC7xSBOBSogSPAtanc9M=;
	b=C+jKNnqvPwgB8QDm0K1mXbe1vm0CVXqIPo1zQObnfOc2PbiS5WILDG4jOebvDa2wx+
	I/z6x23lOn0ArIIGLbeG8pWV6uKDTR2UX7n56wBa6HtuR6XHS3L2qk4MkufWz7dGa01L
	knCHNe3f9VAeQAcp8NXYIvo5rgE7LCISHCwLBlMlqml1gUTMLokGLCFXCnevQocam9Lu
	zhpkm9nyWG8rnYrJL9rDIVr2BN/7SUFJ4Vrk23blJiVACr0wqfewk1+bUMU8d+gwhR3N
	cvUowpQtkpy9iREIAD+c/6jzCcO0xR7hzXGTBNHFmY045RSWLlXFlQac0ChCSSFpFk0t
	8vqA==
X-Gm-Message-State: AHYfb5hqYDCEGJErcyV3+1okNuIspJ+RRfb0rDwt+9ZtIUZ3yZHP0Xag
	B5QZHBOMemw9CDFMc6NjtQ==
X-Received: by 10.237.62.92 with SMTP id m28mr4050886qtf.235.1504130138509;
	Wed, 30 Aug 2017 14:55:38 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	w131sm4298690qkb.85.2017.08.30.14.55.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 14:55:37 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Date: Wed, 30 Aug 2017 18:55:06 -0300
Message-Id: <20170830215523.25278-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::231
Subject: [Qemu-trivial] [PATCH v2 00/17] add missing entries in MAINTAINERS
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
X-List-Received-Date: Wed, 30 Aug 2017 21:55:43 -0000

Hi,

I tried to have a more helpful ./scripts/get_maintainer.pl output, filling
missing entries in MAINTAINERS.

Regards,

Phil.

v2:
- add R-b & A-b
- clean ARM entries (Thomas Huth)
- moved files: comment since which commit (Eric Blake)
- drop inconsistent patches (default-configs.mak related to hw/machine, no CPU)
- drop unhappy patches (include/standard-headers/linux/*)
- drop unreplied patches

Philippe Mathieu-Daudé (17):
  MAINTAINERS: add missing ARM entries
  MAINTAINERS: add missing Versatile PB entry
  MAINTAINERS: add missing STM32 entry
  MAINTAINERS: add missing entry for vhost
  MAINTAINERS: add missing VMWare entry
  MAINTAINERS: add missing Guest Agent entries
  MAINTAINERS: add missing qcow2 entry
  MAINTAINERS: add missing USB entry
  MAINTAINERS: add missing PCI entries
  MAINTAINERS: add missing SSI entries
  MAINTAINERS: add missing entries for throttling infra
  MAINTAINERS: add missing megasas test entry
  MAINTAINERS: add missing AIO entry
  MAINTAINERS: add missing entry for Generic Loader
  MAINTAINERS: add missing Cryptography entry
  MAINTAINERS: update docs/devel/ entries
  MAINTAINERS: update docs/interop/ entries

 MAINTAINERS | 44 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 10 deletions(-)

-- 
2.14.1


