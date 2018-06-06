Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQZuT-00076r-ST
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jun 2018 10:59:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60634)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQZuS-00071N-9e
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 10:59:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQZuR-0007C9-Jd
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 10:59:36 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:33787)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQZuL-00078M-DU; Wed, 06 Jun 2018 10:59:29 -0400
Received: by mail-qt0-x244.google.com with SMTP id l10-v6so1447399qtj.0;
	Wed, 06 Jun 2018 07:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nkAN24y3wkG+pIL86nIxsjUfdKk4MXxnJlMhzLuNzcU=;
	b=C74d4GEkBcPEy3GasyF/nLt+2slg3OyuYpUYlsKEp2Jf9EvwxMyOb+El8QsCKXxhmI
	2eetURDPPYC9gTl/QsIAfF3KlzrDwQJzOfMi4PYEKHTXdI7cqa99NzAl+AKeSYc4ubmW
	5i5Nwvo/34nFvISesPNaGJpkRwit+hHr5pyjXCKt0d5g2oYG5mFxyC3S3/RUS0+YeSsL
	DZMePMkHzEWGzM3v52/UUBlXcfQtSS6IsZnxzNrNy4qTdyCshGtzJBlLTYZKu5mwWvl/
	SIIIVNQ548PNkY7YtZvYkoLWD8++WIuvRj20SOc1hAjdwrIKZxvIoQobFle8k1//yY86
	gdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=nkAN24y3wkG+pIL86nIxsjUfdKk4MXxnJlMhzLuNzcU=;
	b=D/30XVtwAQrTgAuFP8mXcjQlepig3PA2HhR/6m+KdWqo9lBdCTywq5tpdpVF7nMTEX
	+uWMd055jctJMtxx6haETC9HhLO5lZ+Su5HZNJFEB86Ee4Bubo5d8JNtVxdrTLOvkpJ1
	s/sWdQKSZQVuPxVkGZ0xu/e4EBLZJHUhrZBv5M6m8/YiQ3y0yRtwMgsN70B9aShkbw88
	7Zxv8aTMmcabCk1jiay+3qUpMwX7B8IjZslrCMSEq1rHOZxgqd/AM2nOwZBs57SNcOUI
	XvcGV91/at71i5SJKewGyPB+xtpCcGDRhDyRtM5VXdU0ZJ8LRR0s7C4T/TqE+gq3A1iQ
	SarQ==
X-Gm-Message-State: APt69E1PUPq1sUayQY1Rkx0ZDvm+CxATKMS0NyeZ6sotruPC0d6hUOT9
	fERCqz65hYA01DMKB78SPkw=
X-Google-Smtp-Source: ADUXVKLHAn/aUr/qLv1Egq2BNe/JXgI9jeh/Q0nkWpTk7Pb6/vgASw73tEXIV6NlYV5ziizAgIqW1g==
X-Received: by 2002:ac8:43ce:: with SMTP id
	w14-v6mr3110678qtn.137.1528297168651; 
	Wed, 06 Jun 2018 07:59:28 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	v29-v6sm8519439qkv.28.2018.06.06.07.59.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 07:59:28 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Alexander Graf <agraf@suse.de>, David Gibson <david@gibson.dropbear.id.au>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
Date: Wed,  6 Jun 2018 11:59:18 -0300
Message-Id: <20180606145921.30606-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 0/3] mac_newworld: add MAINTAINERS entries,
 fix qemu_log trailing '\n'
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
X-List-Received-Date: Wed, 06 Jun 2018 14:59:37 -0000

Nothing very exciting here.
I sometimes miss to notice some trace events, running with -d unimp,trace...
then using 'grep ^...'. This is only due to a missing '\n' :)

Philippe Mathieu-Daudé (3):
  MAINTAINERS: Add an entry for the MacIO device headers
  MAINTAINERS: Add entries for the MOS6522 VIA device
  hw/misc/mos6522: Add trailing '\n' to qemu_log() calls

 hw/misc/mos6522.c | 4 ++--
 MAINTAINERS       | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.17.1


