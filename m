Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fmNkk-0005Jn-Gf
	for mharc-qemu-trivial@gnu.org; Sun, 05 Aug 2018 14:27:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1fmNki-0005I8-25
	for qemu-trivial@nongnu.org; Sun, 05 Aug 2018 14:27:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pavel.zbitskiy@gmail.com>) id 1fmNkh-00048x-8w
	for qemu-trivial@nongnu.org; Sun, 05 Aug 2018 14:27:40 -0400
Received: from mail-qt0-x22b.google.com ([2607:f8b0:400d:c0d::22b]:34790)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pavel.zbitskiy@gmail.com>)
	id 1fmNkb-0003wj-8E; Sun, 05 Aug 2018 14:27:33 -0400
Received: by mail-qt0-x22b.google.com with SMTP id m13-v6so11537059qth.1;
	Sun, 05 Aug 2018 11:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xVs61bJBnIwWy8fAh9ZXoThBCw+QPxKw+Y9z2+s8j6I=;
	b=VLcAsyaUy8fXaX5D+TCpZk6B511dJUYV/zjfSPMnhrN2H4r7zC86YQnYmPtelytrvm
	MKOjW7j/T7wR2iL1R4nu48n/0omYoXnwyhgIVA0LoFBlEhLa5RLCq5jOhJTLb70e+XjA
	RPtGR1bQ31Ya92vcrRDY2t6FCFlZhDOfQWszGD8fmBgs2sIqbNUEuqgNrlPUB2kAl9wU
	SAx64AURwztAPbqn/SaitfU+sagAE9/bJXS74XL05B89G7CMtRK9klfyEiHsQFQQkIes
	9idnZs68sszhppYGDSjcCNv7AzuiAGWGwETpce+O1U7vQciiTR5ZgThK4/z/+7h0hFQ+
	Gm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xVs61bJBnIwWy8fAh9ZXoThBCw+QPxKw+Y9z2+s8j6I=;
	b=L3ft62BdBB2T6Gfn+dAUIEm9P03dZuT1fwGwK1urFOmWB6LkT+Xl2gDdXG8ORXKKUX
	6nq973cYF/fM1uivaG8FKNj+K8TreXhFZMMINWd7tmj9PwfqhwaBVFropTw9OrbFOn80
	53BqnDzTDQR4JFe76UEKamyzkXeZ/IXr1Pypn0FNnCtVHAsEvNG7S3/HhKTLCa1oOZz8
	PhgeheH3rpmHnAHeg0G2T8LLooXIzKebSGFLqSOagD3Ofui5a2aBKKArKqZdCZaBCiXz
	LBxavcP0KbuG+YJIdTVuNDFdAheM2alxclL2xcV7sRzK0l2u7wz41+MDeaj0zD+cHI49
	AULQ==
X-Gm-Message-State: AOUpUlEChDszlj6nxuqvmsogn8EZqcW2PHB4KzSTorZ6cNEiuhqGtapk
	mbTfL/+xw8R/hkSnF0JBw4t4AXOzV9E=
X-Google-Smtp-Source: AAOMgpedBKFSB9VxCJtI0tOMT6lBv4BzA6QoBtafoXT1DfGjoVn3WN0KnXxMHc47AV4WzzrEBmg0OQ==
X-Received: by 2002:ac8:3762:: with SMTP id
	p31-v6mr11658196qtb.310.1533493652459; 
	Sun, 05 Aug 2018 11:27:32 -0700 (PDT)
Received: from WAL-L-PZ01.rocketsoftware.com
	(inet-64-112-177-9.bos.netblazr.com. [64.112.177.9])
	by smtp.gmail.com with ESMTPSA id
	o26-v6sm8671526qtk.4.2018.08.05.11.27.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Aug 2018 11:27:31 -0700 (PDT)
From: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
Date: Sun,  5 Aug 2018 14:26:19 -0400
Message-Id: <20180805182625.13540-1-pavel.zbitskiy@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22b
Subject: [Qemu-trivial] [PATCH 0/6] Some improvements in z/Arch instructions
 support
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
X-List-Received-Date: Sun, 05 Aug 2018 18:27:41 -0000

Add BAL, BALR, CVB instructions
Fix few bugs in PACK, CSST

Pavel Zbitskiy (6):
  target/s390x: add BAL and BALR instructions
  target/s390x: fix CSST decoding and runtime alignment check
  target/s390x: fix ipm polluting irrelevant bits
  target/s390x: add EX support for TRT and TRTR
  target/s390x: fix PACK reading 1 byte less and writing 1 byte more
  target/s390x: implement CVB, CVBY and CVBG

 target/s390x/helper.h      |  2 ++
 target/s390x/insn-data.def |  7 ++++++
 target/s390x/int_helper.c  | 58 ++++++++++++++++++++++++++++++++++++++++++++++
 target/s390x/mem_helper.c  | 24 +++++++++++++++----
 target/s390x/translate.c   | 52 +++++++++++++++++++++++++++++++++++++----
 5 files changed, 135 insertions(+), 8 deletions(-)

-- 
2.16.2.windows.1


