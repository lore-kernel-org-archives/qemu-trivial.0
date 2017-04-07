Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cwcFb-0007qo-7A
	for mharc-qemu-trivial@gnu.org; Fri, 07 Apr 2017 18:21:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cwcFZ-0007pT-72
	for qemu-trivial@nongnu.org; Fri, 07 Apr 2017 18:21:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cwcFY-0004kS-Af
	for qemu-trivial@nongnu.org; Fri, 07 Apr 2017 18:21:01 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:34572)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cwcFU-0004g7-7Z; Fri, 07 Apr 2017 18:20:56 -0400
Received: by mail-qt0-x244.google.com with SMTP id x35so11505747qtc.1;
	Fri, 07 Apr 2017 15:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EIXKwBi0XdHbgJkJ+PIZ3n0fABty3QqRawwhvjlQ4yk=;
	b=QQ0GXNF24H0ziVd6sYS5oJtWeqXlQeEAMNDjr5ORWrWega29sCpenPDkQ4DUz2mtaD
	4oO9BGGA5BW7i4MVDyVGDZ/B6UfNwf/Vzi++tvwbMn413MHvn5Zp087SmJ6E1++L9lxC
	9B8pATfoNJmvKox26b4GHCOjBa+GxvrgBKBM5m/Y1Q7/EAmE1roqzpA07sOnYtBKQ1b9
	oWI/qoa99lhEOkjMIlSsE66t9Bsw+LPjIki4hjHzA6YcPNUZgxwa15Dpkf1X4pyy7jYM
	ET2xM4ybJ9SLWejAZVARQTXu/YFUGjCCjMaIDsGi1vk/EDhn5Pr7WskmQpuBQFvw1ryF
	Dw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=EIXKwBi0XdHbgJkJ+PIZ3n0fABty3QqRawwhvjlQ4yk=;
	b=YzJFYwY5CkUtvsSz6dAW6gjDJN9DDvGJkORwCMnHLF0Wt8jl/DAN7DkA5Eni7EEqU/
	BrtqxaURZeAkad7Q7AySX4qWqa64qDX5/4BhgYz86tki8m9A8WscYmxQ6GjrDA7wpCD6
	4rmLl6x05GJ2zkM7KpujELTvvCW2zt1nwQC8r3eEjWz84eHTS08x8l22Gh8bG6GgZFkt
	WRmxkPZympbLehFL/XCR9TBfKqLmoEBUP5rDz6VWdldBgqxFfTC1LmkTp26OMiC12a3U
	HKYU6lHFLvrKXZt9y4/XebNWWTh6lBquv+E82VQHtyQNvUFdjfqHvEjNwEXQPqlPgUp5
	6dcQ==
X-Gm-Message-State: AFeK/H2oMIGgB1YV39UuyxdaQVcNkzA5O5SGdzhjLEkl2U6J628JbWcU8hIteB38NcOgdg==
X-Received: by 10.200.50.20 with SMTP id x20mr42409704qta.169.1491603655551;
	Fri, 07 Apr 2017 15:20:55 -0700 (PDT)
Received: from yoga.lan ([138.117.48.226]) by smtp.gmail.com with ESMTPSA id
	d133sm1442146qke.9.2017.04.07.15.20.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Apr 2017 15:20:55 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alexander Graf <agraf@suse.de>, Michael Roth <mdroth@linux.vnet.ibm.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri,  7 Apr 2017 19:20:12 -0300
Message-Id: <20170407222016.15308-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v2 0/4] 3 easy-to-fix clang warnings,
 1 error code fixed
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
X-List-Received-Date: Fri, 07 Apr 2017 22:21:02 -0000

This patchset fixes three easy-to-fix unrelated clang warnings, so it was
probably better to send them separately the first time.

v2:
    - hw/usb/dev-smartcard-reader.c: The first patch was treating NULL and 0 as
      errors but those values are legal in some cases, i.e. no (virtual)
      smartcard inserted into the card reader (Gerd Hoffmann's review).
    - device_tree.c: Added Marc-André Lureau's Reviewed-by.
    - qga/commands-posix.c: Added a commit to improve failed operation, as
      suggested by Michael Roth.

Philippe Mathieu-Daudé (4):
  usb-ccid: make ccid_write_data_block() cope with null buffers
  device_tree: fix compiler warnings (clang 5)
  qga: fix compiler warnings (clang 5)
  qga: improve error handling in transfer_memory_block

 device_tree.c                 |  1 +
 hw/usb/dev-smartcard-reader.c |  5 ++++-
 qga/commands-posix.c          | 11 ++++++++---
 3 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.11.0


