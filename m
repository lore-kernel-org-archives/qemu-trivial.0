Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VOVkz-0003jD-1U
	for mharc-qemu-trivial@gnu.org; Tue, 24 Sep 2013 12:46:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1VOVkr-0003Xx-NM
	for qemu-trivial@nongnu.org; Tue, 24 Sep 2013 12:46:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1VOVkl-0005p3-Ns
	for qemu-trivial@nongnu.org; Tue, 24 Sep 2013 12:46:29 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:43960
	helo=smtp.eu.adacore.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1VOVkX-0005kI-3r; Tue, 24 Sep 2013 12:46:09 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 812062666377;
	Tue, 24 Sep 2013 18:46:07 +0200 (CEST)
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lxbod2tmFKDH; Tue, 24 Sep 2013 18:46:07 +0200 (CEST)
Received: from PomPomGalli.act-europe.fr (pompomgalli.act-europe.fr
	[10.10.1.88])
	(using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 63AA52664F5B;
	Tue, 24 Sep 2013 18:46:07 +0200 (CEST)
From: Fabien Chouteau <chouteau@adacore.com>
To: qemu-trivial@nongnu.org
Date: Tue, 24 Sep 2013 18:45:58 +0200
Message-Id: <1380041161-13266-1-git-send-email-chouteau@adacore.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, afaerber@suse.de,
	lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH 0/3] Few minor improvements of monitor disas
	command (v2)
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
X-List-Received-Date: Tue, 24 Sep 2013 16:46:36 -0000

1. Fix coding style (missing space and tab indentation)

2. Add symbole lookup (when possible)

3. Add ARM registers definitions

   I tried to abstract monitor_defs in a CPU field, but I got lost in the
   dependencies maze. I still think this patch is a step forward.


Fabien Chouteau (3):
  Fix coding style
  Improve Monitor disas with symbol lookup
  Add ARM registers definitions in Monitor commands

 disas.c   |   19 ++++++++++++++-----
 monitor.c |   17 +++++++++++++++++
 2 files changed, 31 insertions(+), 5 deletions(-)

-- 
1.7.9.5


