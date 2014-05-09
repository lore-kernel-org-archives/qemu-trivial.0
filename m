Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WizjK-0002ng-54
	for mharc-qemu-trivial@gnu.org; Sat, 10 May 2014 01:21:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1WiuZn-0002N9-Ft
	for qemu-trivial@nongnu.org; Fri, 09 May 2014 19:51:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1WiuZe-0001DL-Eo
	for qemu-trivial@nongnu.org; Fri, 09 May 2014 19:51:39 -0400
Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f]:43513)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>)
	id 1WiuZL-0001Av-Vq; Fri, 09 May 2014 19:51:12 -0400
Received: by mail-pa0-f47.google.com with SMTP id lf10so2480042pab.6
	for <multiple recipients>; Fri, 09 May 2014 16:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=u75sZzqorKReC39KBufMW9y1FCX2Ny38fOoSM4etyjU=;
	b=pm7UBqGps6JqcVWOBoSDtmOr9jp2vxh5TeBfyyRSd+greEay7XiKyp9g7rLMhEKs3h
	BGoC9pFppzybqlgEZNOhUZmn0c9RRPR89RFvNeIoFh2Cgx2c2dc+mI9Cs1j5CNq6KKQS
	mttlfKIqZC9tdW6nC5vTzuVgrs6frr1UwcJ6FXLwT8L2mYHAHTyDYJHS1xrujXwVBADx
	kqJ4EcDrV+V1NaKOmYoYxvoxXXlizv5L+dr+BueTiXdkXDZqVPsC5fzhL1PqDuyCVR7Q
	XhYnRTzFGP6tUnfhCTnkbJ9qH1AIjZpqPbY+euZ5nGw2rQ75liD0IYNWWL4XC+gKRcyq
	Ur0w==
X-Received: by 10.66.180.168 with SMTP id dp8mr26172462pac.100.1399679470391; 
	Fri, 09 May 2014 16:51:10 -0700 (PDT)
Received: from localhost.localdomain ([162.105.146.101])
	by mx.google.com with ESMTPSA id op3sm9623456pbc.40.2014.05.09.16.51.08
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 May 2014 16:51:09 -0700 (PDT)
From: Le Tan <tamlokveer@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 May 2014 07:55:18 +0800
Message-Id: <cover.1399641611.git.tamlokveer@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <y>
References: <y>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22f
X-Mailman-Approved-At: Sat, 10 May 2014 01:21:49 -0400
Cc: qemu-trivial@nongnu.org, jan.kiszka@web.de, afaerber@suse.de,
	Le Tan <tamlokveer@gmail.com>
Subject: [Qemu-trivial] [PATCH 0/4] replace some fprintf(stderr,
	...) with error_report()
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
X-List-Received-Date: Fri, 09 May 2014 23:51:48 -0000

This series of patches replaces some more occurrences of fprintf(stderr, ...)
with error_report() and removes the trailing "\n". Some of them are not changed
because I am not sure if they should be changed. There are some inconsistency
while dealing with macros that involves fprintf(stderr,...), that is, some of
them remain the same while some are changed to error_report().
I have 43 more patches (most of them touch files in hw/) and would send them
out once the first 4 patches are fine.

Le Tan (4):
  arch_init: replace fprintf(stderr,...) with error_report() in
    arch_init.c
  audio: replace fprintf(stderr,...) with error_report() in audio
  block: replace fprintf(stderr,...) with error_report() in block/
  bsd-user: replace fprintf(stderr,...) with error_report()

 arch_init.c            |   36 ++++++++-------
 audio/spiceaudio.c     |    2 +-
 audio/wavcapture.c     |    4 +-
 block-migration.c      |    4 +-
 block.c                |    4 +-
 block/linux-aio.c      |    4 +-
 block/nbd-client.h     |    2 +-
 block/qcow2-cluster.c  |    4 +-
 block/qcow2-refcount.c |  114 ++++++++++++++++++++++++------------------------
 block/qcow2.c          |   16 +++----
 block/quorum.c         |    4 +-
 block/raw-posix.c      |    8 ++--
 block/raw-win32.c      |    6 +--
 block/ssh.c            |    4 +-
 block/vdi.c            |   14 +++---
 block/vmdk.c           |   21 ++++-----
 block/vpc.c            |    4 +-
 block/vvfat.c          |  108 ++++++++++++++++++++++-----------------------
 blockdev.c             |    6 +--
 bsd-user/bsdload.c     |    2 +-
 bsd-user/elfload.c     |    2 +-
 bsd-user/main.c        |   14 +++---
 22 files changed, 189 insertions(+), 194 deletions(-)

-- 
1.7.9.5


