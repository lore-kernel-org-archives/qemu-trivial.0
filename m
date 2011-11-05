Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RMbRC-0002mC-Vn
	for mharc-qemu-trivial@gnu.org; Sat, 05 Nov 2011 04:17:14 -0400
Received: from eggs.gnu.org ([140.186.70.92]:42412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RMbRB-0002m6-1O
	for qemu-trivial@nongnu.org; Sat, 05 Nov 2011 04:17:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RMbR9-0001Ku-Sr
	for qemu-trivial@nongnu.org; Sat, 05 Nov 2011 04:17:13 -0400
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:23449)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RMbR9-0001Jb-6i
	for qemu-trivial@nongnu.org; Sat, 05 Nov 2011 04:17:11 -0400
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 836D4835
	for <qemu-trivial@nongnu.org>; Sat,  5 Nov 2011 16:15:12 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=from:to
	:subject:date:message-id; s=rsa1024; bh=jEjnnneZOcMJs1KNNER+QFDQ
	Ta0=; b=ZQKxI8cxeII0HOvXePHRQ/Xf4m6Ml2iPKFogqk1vjPVbwGMtNvrwCL23
	U8CDnm7an/LGO/mG54CSjUPRytvKIHC8+zamMVQvzSNloBCtfsVvssv0+1f8iNeC
	ajRhfRBJK10EDHFypcE/0N5p3vCJHapnp3vCq76+A1VbW7U9nrA=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 616A7834
	for <qemu-trivial@nongnu.org>; Sat,  5 Nov 2011 16:15:12 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.4/8.14.4/Submit) id pA58Gr5w038796
	for qemu-trivial@nongnu.org; Sat, 5 Nov 2011 16:16:53 +0800 (CST)
	(envelope-from chenwj)
From: Chen Wen-Ren <chenwj@iis.sinica.edu.tw>
To: qemu-trivial@nongnu.org
Date: Sat,  5 Nov 2011 16:16:53 +0800
Message-Id: <1320481013-38506-1-git-send-email-chenwj@iis.sinica.edu.tw>
X-Mailer: git-send-email 1.7.3.5
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.113.235.130
Subject: [Qemu-trivial] [PATCH 0/2] Add option to user-mode emulation so
	that user can specify log file name
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
X-List-Received-Date: Sat, 05 Nov 2011 08:17:14 -0000

  QEMU user-mode's default log file name is "/tmp/qemu.log". In order to change
the log file name, user need to modify the source code then recompile QEMU. This
patchset allow user use "-D filename" option to specify the log file name.

Chen Wen-Ren (2):
  exec.c: Make variable logfilename accessible from linux-user/main.c
  linux-user/main.c: Add option to user-mode emulation so that user can
    specify log file name

 exec.c            |    2 +-
 linux-user/main.c |    8 ++++++++
 2 files changed, 9 insertions(+), 1 deletions(-)

-- 
1.7.3.5


