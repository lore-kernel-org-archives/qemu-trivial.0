Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dqN8N-0002kV-3x
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2017 13:32:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqN8K-0002eo-Tr
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:32:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqN8H-0004Hb-0A
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:32:00 -0400
Received: from mail-qk0-x235.google.com ([2607:f8b0:400d:c09::235]:38064)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqN8G-0004H7-SF; Fri, 08 Sep 2017 13:31:56 -0400
Received: by mail-qk0-x235.google.com with SMTP id a128so7891679qkc.5;
	Fri, 08 Sep 2017 10:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JaVDFtvAkZ2Wxec45jF2zcgRMxWpssGEjwFq4+zCoGQ=;
	b=byqva+4skzfYaA2Os+80BfFmRB9ZWzGMzfBdsQ9m0CdbnfzuJKg2OLZsT5RXeeepe4
	KxauSPPFOIf6HK5f38fl1HBz7zeDTsoaxonNA5zssLmrL+QmBIE0f/CPdzSeT56exou2
	HDfFstCDLubw3GvlEYENC+x7nTKCvoLYJH6Jh8iOZbe/8WJ+b/FocQO/cxRUHeYtvlT0
	RJIP4UMyWmiwMjUDvsUJZIofGXX8/ZKmpltW9P09aGp+/CfoklL6Qzxq/Wzep3aG+0bB
	oVqaXkKFhuAKeD7FFkvAJXSduc3fOS/CW3BFoDyFukbTdaWWq1oGndLt1fsprddwP4pq
	2UbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=JaVDFtvAkZ2Wxec45jF2zcgRMxWpssGEjwFq4+zCoGQ=;
	b=Y+U1/1hRylo6pFpcUpaUY6Poc0rQ7+dC7rq6liMvVVzA21G3gj23qGopoDmcp15GXd
	Nm/N/MkUZCMQo9LBnboJZEBMaX+oAH6zjXdJ7EVHNIPTiUuWyqCck+htkJ7XJEPZfQ2P
	m4vagLiwfhr+2Nbkl6q7cyEPiv6gnY2bRSgEQ2A0csE0aFsGuMKDBHSeySX7tul9cm2y
	fUlacNYOsGrM7i0FCV/iV6HaVR9PYG9tDdeAYBGvKQhY/IN4cVlqkZSqOg4CpmfBugVl
	6psPUXM6yHo+wdWWh3ZMqwZrwsc/aUt68Ak/bHJVjLEY5duc/GCgZUfbhdL0MVyP8IT3
	b1Nw==
X-Gm-Message-State: AHPjjUhWZzGBmO3aAnOz627KCkUS+LDIHTD9CO/zouY+8TibZZjiZDec
	PbneYfqH3Xv0G679DEc=
X-Google-Smtp-Source: AOwi7QAsJw8bUupP4D+XFxymI4RyrTsUEF1swT3lQnCv8TPPkq2BV03jCGwOShmay1f9blepeCUZTw==
X-Received: by 10.55.33.75 with SMTP id h72mr4536888qkh.132.1504891916104;
	Fri, 08 Sep 2017 10:31:56 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id 13sm1671505qtp.74.2017.09.08.10.31.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 10:31:55 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Date: Fri,  8 Sep 2017 14:31:31 -0300
Message-Id: <20170908173146.6446-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::235
Subject: [Qemu-trivial] [PATCH v3 00/15] add missing entries in MAINTAINERS
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
X-List-Received-Date: Fri, 08 Sep 2017 17:32:01 -0000

Hi,

I tried to have a more helpful ./scripts/get_maintainer.pl output, filling
missing entries in MAINTAINERS.

Regards,

Phil.

v3:
- rebased, add R-b & A-b
- squashed ARM patches (Thomas Huth)
- remove 'megasas' patch, maintainer email not working

v2:
- add R-b & A-b
- clean ARM entries (Thomas Huth)
- moved files: comment since which commit (Eric Blake)
- drop inconsistent patches (default-configs.mak related to hw/machine, no CPU)
- drop unhappy patches (include/standard-headers/linux/*)
- drop unreplied patches

Philippe Mathieu-Daudé (15):
  MAINTAINERS: add missing ARM entries
  MAINTAINERS: add missing STM32 entry
  MAINTAINERS: add missing entry for vhost
  MAINTAINERS: add missing VMWare entry
  MAINTAINERS: add missing Guest Agent entries
  MAINTAINERS: add missing qcow2 entry
  MAINTAINERS: add missing USB entry
  MAINTAINERS: add missing PCI entries
  MAINTAINERS: add missing SSI entries
  MAINTAINERS: add missing entries for throttling infra
  MAINTAINERS: add missing AIO entry
  MAINTAINERS: add missing entry for Generic Loader
  MAINTAINERS: add missing Cryptography entry
  MAINTAINERS: update docs/devel/ entries
  MAINTAINERS: update docs/interop/ entries

 MAINTAINERS | 43 +++++++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 10 deletions(-)

-- 
2.14.1


