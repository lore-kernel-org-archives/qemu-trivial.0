Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eOzR2-00088Q-KJ
	for mharc-qemu-trivial@gnu.org; Wed, 13 Dec 2017 00:18:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eOzR0-00082C-Ng
	for qemu-trivial@nongnu.org; Wed, 13 Dec 2017 00:18:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eOzR0-0004Mn-0n
	for qemu-trivial@nongnu.org; Wed, 13 Dec 2017 00:18:22 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:44298)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eOzQt-0004L6-TT; Wed, 13 Dec 2017 00:18:15 -0500
Received: by mail-qk0-x243.google.com with SMTP id h19so580696qkj.11;
	Tue, 12 Dec 2017 21:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PJd+sGAm/Zifxt2pgLc38IAziMDBBKlALK667l2ek4Q=;
	b=NEDNaOT4clUAXuYaEvbqIkP7BmXIQW1t1Pj6FwuVYQSbuAXPH4l6nSk3mJ5gSvNtpZ
	118ffX3VRKqRktXjJIEzNo8kVoRCUxH61iZlOb/5zrBWfn4yfi5KV6totdNpr6afIoF8
	R3LqQtTK52cxyBF9XO5CqJ2UYZ6Gfjir/D9sI9MJBabNlDwGmv3Ji4oiJTIXI1TjooQU
	QE/a1hpBNo71Fizn0kFynp1TliM9EvWRU3wO9cvVBTiQma1xUDjjTIEsl7PNi5+PEv8h
	pkbBW5/2mJt/uObk0bjXuqLzhkVT9gevVkkWHHbYKolBs1KFFQD2RIlaj4hz5au8KGB+
	/zWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=PJd+sGAm/Zifxt2pgLc38IAziMDBBKlALK667l2ek4Q=;
	b=ftZ4jCLXxD3IXKglcKp3E+3/lwmEmyPwvamZfat2w1EpHUoq2HcvFhO4Fiu38N7Y0P
	q+cXdlBQOgHoCCznd37eAk3w+4ZHlZlHa5ER7JjDajuit7dn9ZwOVQihui3tLYiikB2m
	/XjStn3H7ZqRYwJra7B8X+98qTWZ29OBdZhcFKwJYSjwGRfEI6F5p1gQmEfbPh3rsJdB
	02VA0KySU3YomZE4ahky+S1ZBPk1bIYxSoKc9SWy4kCCUKQcYJIxg28/u/TD0ezWOrzc
	u0XTCTeLqyGR5sMXgBDxvBgcRXKTpOMksEbFFIbYZ5HdomhXjjWMymFM3RDopX6USE9e
	Q9cA==
X-Gm-Message-State: AKGB3mL14BHd4DEizd2pll5Qruc4qx18hPOw8EWVW/+rGThX8Ee2nV98
	lZhsRt3h9AaOr7bxf6V2vVk=
X-Google-Smtp-Source: ACJfBov8WDVrc6uPTzB2hk0YdX7Eo4R4+9kFve36wGEIzQ2bEofzQctMse0u5+3DfP76Nzu6aXQ59A==
X-Received: by 10.55.137.135 with SMTP id l129mr332659qkd.294.1513142294953;
	Tue, 12 Dec 2017 21:18:14 -0800 (PST)
Received: from x1.local ([138.117.48.211])
	by smtp.gmail.com with ESMTPSA id d15sm522318qkc.26.2017.12.12.21.18.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 21:18:14 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Date: Wed, 13 Dec 2017 02:17:32 -0300
Message-Id: <20171213051736.17755-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH 0/4] Trivial changes in "registerfields.h"
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
X-List-Received-Date: Wed, 13 Dec 2017 05:18:23 -0000

Philippe Mathieu-Daudé (4):
  MAINTAINERS: add "hw/registerfields.h" in Register API entry
  hw/registerfields: fix a typo in the FIELD() documentation
  hw/registerfields: add 64-bit extract/deposit macros
  hw/registerfields: add missing include

 include/hw/registerfields.h | 15 ++++++++++++++-
 MAINTAINERS                 |  1 +
 2 files changed, 15 insertions(+), 1 deletion(-)

-- 
2.15.1


