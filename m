Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qm8aH-0005oq-Py
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jul 2011 14:11:53 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <freddy77@gmail.com>) id 1Qm8aG-0005og-0h
	for qemu-trivial@nongnu.org; Wed, 27 Jul 2011 14:11:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <freddy77@gmail.com>) id 1Qm8aE-0002Ia-Sl
	for qemu-trivial@nongnu.org; Wed, 27 Jul 2011 14:11:51 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:39092)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <freddy77@gmail.com>)
	id 1Qm8aE-0002He-Mb; Wed, 27 Jul 2011 14:11:50 -0400
Received: by wwf26 with SMTP id 26so1519597wwf.10
	for <multiple recipients>; Wed, 27 Jul 2011 11:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=cuwNPWalIYiADgCSWg0MJgYSXS9LPBcsmP3xBu+N+s4=;
	b=VLCfD3noD45CfmByeOUz176/D/bhv3mNshl0G9i7IAJ843eNBPbzucfpBJpS/5M0nd
	zX9mbwzUVmqpcj+HXwoyaStvw1uZl+Oc/LlYlUxRY/GHlmcN6TjkO36wbrnk3xYj5ZVo
	+ZI8maAp3onv/ayVE5tcnU1hmXvl9k9NqH8HM=
Received: by 10.216.133.146 with SMTP id q18mr127572wei.15.1311790308885;
	Wed, 27 Jul 2011 11:11:48 -0700 (PDT)
Received: from obol602.localdomain (net-2-37-106-50.cust.dsl.vodafone.it
	[2.37.106.50])
	by mx.google.com with ESMTPS id fn12sm108836wbb.38.2011.07.27.11.11.46
	(version=SSLv3 cipher=OTHER); Wed, 27 Jul 2011 11:11:47 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 27 Jul 2011 20:11:59 +0200
Message-Id: <1311790322-10889-1-git-send-email-freddy77@gmail.com>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Frediano Ziglio <freddy77@gmail.com>
Subject: [Qemu-trivial] [PATCH 0/3] small trivial patches
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
X-List-Received-Date: Wed, 27 Jul 2011 18:11:53 -0000

Minor fixes and improves

Frediano Ziglio (3):
  block: removed unused function
  block: typo fix
  aio: always check paio_init result

 block.c           |   13 -------------
 block.h           |    2 --
 block/raw-posix.c |   13 ++++++-------
 3 files changed, 6 insertions(+), 22 deletions(-)


