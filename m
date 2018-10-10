Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gAMzP-00006D-5Y
	for mharc-qemu-trivial@gnu.org; Wed, 10 Oct 2018 18:29:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gAMzM-0008VR-UA
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2018 18:29:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gAMzL-0002fG-3A
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2018 18:29:56 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36285)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gAMzF-0002cp-Vj; Wed, 10 Oct 2018 18:29:50 -0400
Received: by mail-wm1-x335.google.com with SMTP id a8-v6so7306806wmf.1;
	Wed, 10 Oct 2018 15:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mKvqA5IWCZ1yO9ac7UCFlrr8sVWH4umniE/X5txsfiw=;
	b=jwB5HnUzxTCM3Coo2bXyo16iJUDz4nPDIt0wYtXnPmCLdMCeEGIwto3U+MHPZv+0mg
	KelqaLNmZXnt9A0+CKega7TSmPKWLlJMP/n14bCUlnNmIFD77mvS/l0XEK77qpsn3kB4
	VSwij/NkjPLb7J2odr1ocIzezNqhMteQmEQq3rusTlG5bZx7lyY8LPEP9WJToShOgFw1
	KLx0FHngmgwKA+6mhEG7PtzcUDJif+pt5d1a0mbH/N5jS4nI4Hkw8L91N1U4v7wCl/h3
	RJqjjjOUWgtqYwQaWtJFyrEQyoNUoydxg7k4Bf6LDzeZH+qSzxVkJqaSn/pcgAEAxfos
	u4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=mKvqA5IWCZ1yO9ac7UCFlrr8sVWH4umniE/X5txsfiw=;
	b=EVeVYagFOSBENa7PiX3DvTrwiQQg1Rnq0J+pokUBjBBRc/ayKaNMm3U+LtYgn3DwPO
	DxzUWC+JZvPWPk/GvDU6BxgC/kutR0xIsPgEyRJO0BK8hDYZpqrCQ0O8jDLwpdVCzLdc
	vbvOOwQ6ZIBYeBs/Px1pPMUMvTwQZNIi88w+i4DvArs/BtmrcYrhovY+fGG+rMFWiDVm
	a5DwD0GgJJWaiSTazoKH4i+xDnvrd3hAMoI/JT32fsQCLdZy4nG6ohd1T6jTNwr2mD7Q
	SaWnVWFeYGxN/Lv/1ztrmrEfpSvIlRP6ql7UzIKPW6QaM77Vw2m78mhs7dELiXde2mQg
	GbcQ==
X-Gm-Message-State: ABuFfohPuNfRgLwELqlC8BJvj4ocJCCkpotyaMNsHuIyOYX8M9CygGfB
	lGJYUb0KVYthwZG0MJMGAt8=
X-Google-Smtp-Source: ACcGV60E2Tovr/qvujzKLCsV/2VciJ1lulDcJ+7sc4onOmKvzxcdOQ3IqB6f1R3dg7mf9WL118Kldw==
X-Received: by 2002:a1c:8e8c:: with SMTP id
	q134-v6mr2342756wmd.112.1539210588866; 
	Wed, 10 Oct 2018 15:29:48 -0700 (PDT)
Received: from x1.local (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	c64-v6sm13787447wma.44.2018.10.10.15.29.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 15:29:47 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Reimar=20D=C3=B6ffinger?= <Reimar.Doeffinger@gmx.de>,
	Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu, 11 Oct 2018 00:29:42 +0200
Message-Id: <20181010222944.29304-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::335
Subject: [Qemu-trivial] [PATCH 0/2] mailmap: Sort and clean an utf8 encoding
 issue
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
X-List-Received-Date: Wed, 10 Oct 2018 22:29:57 -0000

Hi,

This amazing series sort a bit the mailmap sections,
then fix Reimar Döffinger name from 2 missed commits.

Regards,

Phil.

Philippe Mathieu-Daudé (2):
  mailmap: Fix Reimar Döffinger name
  mailmap: Split 'prefered emails' from 'original git import' section

 .mailmap | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

-- 
2.19.1


