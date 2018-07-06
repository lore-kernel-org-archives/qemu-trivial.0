Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fbT1W-0002d9-5i
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jul 2018 11:51:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fbT1U-0002c2-CR
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2018 11:51:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fbT1T-0000bi-G1
	for qemu-trivial@nongnu.org; Fri, 06 Jul 2018 11:51:52 -0400
Received: from mail-qt0-x22e.google.com ([2607:f8b0:400d:c0d::22e]:33623)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fbT1O-0000X6-L5; Fri, 06 Jul 2018 11:51:46 -0400
Received: by mail-qt0-x22e.google.com with SMTP id l10-v6so10338568qtj.0;
	Fri, 06 Jul 2018 08:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RtyCkRPGxF/ngyL3Jw4u9smbZ1BS6eqItL6f3mFAsOo=;
	b=AKxs5LeTzx8SiNjR058ZnWs2U8WU5MuXE+1QiOZEh8S8hWeaqj9fM9OpQyhRKb1okH
	1XqhdTPCRDZbOSziKqPSux8i0nWEj4QpGwXpFu5pZfdfN3hQf0waJy4lAhbyf6wZqzo9
	1AkQoUbsp6bTLZtZ1/+HigluTKKG6NeuLq0Tn2iOwazrB19CrMtSDMTENAD5W4sLTevA
	OdzsWYCyj/nJ4DmxAOVn2zmoseDmCIqzSvqRBRBugs+vKXIry264QANtTmeWF8GWx3MT
	anJ0p8sn8TQM578kZSs/L8JBOZs/qZ9jKmgOoX6DyRoAVzq3iup0rNqfV89RalldRR2x
	SSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=RtyCkRPGxF/ngyL3Jw4u9smbZ1BS6eqItL6f3mFAsOo=;
	b=nj2tCcbtNfEQBUWlWGDa4e3PlE7HwLNQEgVhg7aO8ZGh4pvNvp4R+LrDAx6WVTE3Gq
	cNqgzd+VHW9bE/qkGALJt4BpAKSsrz2gfD/m2qJzbBq8vXowSn4LuTOcAtQjxeac2BaV
	M7WEwg4b555oo4U0qiUdM38KbyWwIwM5TelY1rXsDlbgvsUq5oWBS//cfpvJHP94THeU
	45ryXylL11h79l1/UWViQVl9rVlc6JQpSfQ8EmNfyszxRqd/yfpIiQoQjBzvnp+f4Z69
	74Ox/GMe/UUgNTPvn9tbOEXjSNsiehNNPEIO6XcMFsCEUvDD1ZtCB2r0UQEEPpC5cxh1
	Vikw==
X-Gm-Message-State: APt69E1AogvJZnDVwKUGafyU3kv9icbVNsltgNo82Ei/jcKTUh+Z/Mgw
	ZKS4/hrj/ji9z2VvcB1GqTE=
X-Google-Smtp-Source: AAOMgpdyV9rezt4n5Ln81Rcxb/VYzIv5GgfS4oYWtTv9UlatB08/wtM69eab+oHGDFrjqMHgZ3hWJQ==
X-Received: by 2002:a0c:c70d:: with SMTP id
	w13-v6mr9305900qvi.205.1530892305854; 
	Fri, 06 Jul 2018 08:51:45 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	140-v6sm5913691qkm.18.2018.07.06.08.51.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jul 2018 08:51:45 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Laurent Vivier <laurent@vivier.eu>,
	Riku Voipio <riku.voipio@iki.fi>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org
Date: Fri,  6 Jul 2018 12:51:24 -0300
Message-Id: <20180706155127.7483-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22e
Subject: [Qemu-trivial] [PATCH for-3.0 0/3] Sanitize linux-user stdout
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
X-List-Received-Date: Fri, 06 Jul 2018 15:51:53 -0000

Hi Laurent,

Here 3 trivial patches, the first one resolves this launchpad issue:
https://bugs.launchpad.net/qemu/+bug/1777226, then the following two
sanitize a bit further.

Regards,

Phil.

Philippe Mathieu-Daudé (3):
  linux-user: Do not report "Unsupported syscall" by default
  linux-user: Do not report "syscall not implemented" by default
  linux-user: Report error message on stderr, rather than stdout

 linux-user/alpha/cpu_loop.c      | 2 +-
 linux-user/cris/cpu_loop.c       | 2 +-
 linux-user/cris/signal.c         | 4 ++--
 linux-user/microblaze/cpu_loop.c | 6 +++---
 linux-user/microblaze/signal.c   | 4 ++--
 linux-user/nios2/signal.c        | 2 +-
 linux-user/sh4/cpu_loop.c        | 2 +-
 linux-user/sparc/cpu_loop.c      | 2 +-
 linux-user/sparc/signal.c        | 4 ++--
 linux-user/syscall.c             | 2 +-
 10 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.18.0


