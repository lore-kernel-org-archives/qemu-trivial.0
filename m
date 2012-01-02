Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RhmC6-0000yf-9N
	for mharc-qemu-trivial@gnu.org; Mon, 02 Jan 2012 13:01:10 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RhmC1-0000oR-Hu
	for qemu-trivial@nongnu.org; Mon, 02 Jan 2012 13:01:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RhmBz-00019A-Vx
	for qemu-trivial@nongnu.org; Mon, 02 Jan 2012 13:01:05 -0500
Received: from mail-yw0-f45.google.com ([209.85.213.45]:48461)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1RhmBw-00018K-A2; Mon, 02 Jan 2012 13:01:00 -0500
Received: by yhgg71 with SMTP id g71so10819143yhg.4
	for <multiple recipients>; Mon, 02 Jan 2012 10:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=kQ9Ycw2/HO0MqG3hssIQuesDCQTSJ4xozLm2CFk23UY=;
	b=qqwdvjS3qDZ6Aj7u1k9fWdIY3dQ7n80ARLR01ZWzI/87rCdYvJHY0ba03lbZj2kXB6
	4qXdJDV4LII/jDB9ggvxhdD1Zvl5X3J2FD78F5hP9iv5Nxs2BSwWBqkpYlgnIllie2f/
	yfuqbMdFKE6ZUj5ED1dWplLKCxvJktjkhW8jI=
Received: by 10.236.73.129 with SMTP id v1mr62071075yhd.129.1325527259708;
	Mon, 02 Jan 2012 10:00:59 -0800 (PST)
Received: from localhost.localdomain
	(host167-160-dynamic.2-87-r.retail.telecomitalia.it. [87.2.160.167])
	by mx.google.com with ESMTPS id u47sm70078488yhl.0.2012.01.02.10.00.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 Jan 2012 10:00:58 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  2 Jan 2012 19:00:29 +0100
Message-Id: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.7.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 0/8] qemu-queue cleanups
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
X-List-Received-Date: Mon, 02 Jan 2012 18:01:08 -0000

These patches simplify the jungle of lists provided by qemu-queue from
4 to 3.  QCIRCLEQ is dropped, since it provides no real advantage over
QTAILQ.  QSIMPLEQ is simplified to no longer permit insertion at the
tail, with the advantage that it is more suited for simple free lists.

Stefan, these are a bit borderline for qemu-trivial.  Let me know
if they're fine.

Paolo Bonzini (8):
  notifier: switch to QLIST
  block-migration: switch to QTAILQ
  qed: switch to QTAILQ
  ccid: switch to QTAILQ
  qemu-queue: really simplify QSIMPLEQ
  qemu-queue: drop QCIRCLEQ
  coroutine: switch to QSIMPLEQ
  block: use QSIMPLEQ for the AIO free list

 block-migration.c       |   44 ++++++------
 block.c                 |    9 +--
 block/qed.c             |   20 +++---
 block/qed.h             |    4 +-
 block_int.h             |    4 +-
 coroutine-ucontext.c    |   10 ++--
 hw/ccid-card-emulated.c |   24 +++---
 input.c                 |    2 +-
 migration.c             |    2 +-
 notify.c                |   10 ++--
 notify.h                |    8 +-
 qemu-coroutine-int.h    |    2 +-
 qemu-queue.h            |  175 +++--------------------------------------------
 qemu-timer.c            |    2 +-
 vl.c                    |    2 +-
 15 files changed, 81 insertions(+), 237 deletions(-)

-- 
1.7.7.1


