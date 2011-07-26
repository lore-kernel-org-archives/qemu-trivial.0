Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QlYlI-0006TC-Ny
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jul 2011 23:56:52 -0400
Received: from eggs.gnu.org ([140.186.70.92]:46249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QlYlG-0006Js-5x
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 23:56:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QlYlC-0006SJ-Ps
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 23:56:50 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:54805)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1QlYlB-0006Pe-00; Mon, 25 Jul 2011 23:56:45 -0400
Received: by qwj8 with SMTP id 8so26458qwj.4
	for <multiple recipients>; Mon, 25 Jul 2011 20:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=GGqgNSWsbKGcX9BhDwipnlsJA5BI/sGHpqD8x1Ix86E=;
	b=RRTS16Utyz/Rwj6+eENGP7LsnBFSnJsLuB4dBuJJdN6aXf/irE4NFs0UugoHC006R1
	lBvx4CaJcWG5zWm0R4KPNyMvQuf3K5JOR11X4uFuR8FZU5o3JcYSfuApVQ6tCUts30Fs
	Kx/06nMxMPw+VpPqCKDaUL5Ame3YHGiG3EHV4=
Received: by 10.224.31.7 with SMTP id w7mr3968934qac.55.1311652604084;
	Mon, 25 Jul 2011 20:56:44 -0700 (PDT)
Received: from localhost.localdomain (modemcable055.201-23-96.mc.videotron.ca
	[96.23.201.55])
	by mx.google.com with ESMTPS id p15sm62804qct.22.2011.07.25.20.56.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jul 2011 20:56:43 -0700 (PDT)
From: Alexandre Raymond <cerbere@gmail.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Mon, 25 Jul 2011 23:56:00 -0400
Message-Id: <1311652562-10794-1-git-send-email-cerbere@gmail.com>
X-Mailer: git-send-email 1.7.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, Alexandre Raymond <cerbere@gmail.com>
Subject: [Qemu-trivial] [PATCH 0/2] Minor makefile fixes
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
X-List-Received-Date: Tue, 26 Jul 2011 03:56:51 -0000

Two simple patches for "make distclean"


Alexandre Raymond (2):
  Makefile: distclean should clean all possible targets
  Makefile: delete config.log in distclean

 Makefile  |    3 ++-
 configure |    1 +
 2 files changed, 3 insertions(+), 1 deletions(-)

-- 
1.7.5


