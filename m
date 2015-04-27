Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ymm9u-00045h-Ur
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 12:45:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ymm9l-0003nA-Hd
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:45:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ymm9h-0001Tk-6d
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:45:17 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:54672)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1Ymm9g-0001Sz-V1
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:45:13 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id DE01020B24
	for <qemu-trivial@nongnu.org>; Mon, 27 Apr 2015 12:45:11 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute6.internal (MEProxy); Mon, 27 Apr 2015 12:45:11 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:message-id:subject:to:x-sasl-enc:x-sasl-enc; s=
	mesmtp; bh=Kbr25ttEkMrkov1KblAuXJZIJEk=; b=cra+MqsfIL1vs4gyH3d2M
	NFjkoeG4wttGNG4aymuH/Hzxc5esU521XAo2K1i3wsbmKPT+9o5ecpfhuQ4lmaGB
	TZTA2PklHFGmFyp7ZJvy04LaI/xn2dQgkwfE5ZcWX0XeR+bbOPkbcdFKU17lahYq
	1QCTmaHeQ0jTkivf+OIONw=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-sasl-enc:x-sasl-enc; s=smtpout; bh=Kbr25ttEkMrkov1KblAuXJZIJE
	k=; b=hPM4PZn25IcKdjp5bCvyi50LluB7z9rz4Py0w6d0dMqkas+ojz1fHOWlMK
	EGHDCdUJDDYB0Ykk8H93eELfaa+d2p6C0/k2JeVUAi1Gfh2dWbYKlKquANMRC74D
	5pm1SavdrJWw0pTIxFC9Ombob2JIP9IZGYFCfc7tlHo3Mfugc=
X-Sasl-enc: XkJE51F22bz1eZoHY32hE8bGbCSZKh+Y2owL4npd/KsL 1430153111
Received: from localhost (unknown [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id A2BD5680226;
	Mon, 27 Apr 2015 12:45:11 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Mon, 27 Apr 2015 12:45:27 -0400
Message-Id: <1430153133-30988-1-git-send-email-cota@braap.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.111.4.25
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 0/6] trivial fixes
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Apr 2015 16:45:20 -0000

Here is a hodge-podge of fixes for issues I found while reviewing
QTAILQ callers, with a .gitignore patch as a bonus.

Thanks,

		Emilio



