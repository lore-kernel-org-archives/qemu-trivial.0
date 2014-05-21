Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wmu2k-0007Gi-H8
	for mharc-qemu-trivial@gnu.org; Tue, 20 May 2014 20:06:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1Wmu2Z-00070E-8t
	for qemu-trivial@nongnu.org; Tue, 20 May 2014 20:06:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>) id 1Wmu2Q-0004by-8y
	for qemu-trivial@nongnu.org; Tue, 20 May 2014 20:05:51 -0400
Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234]:54606)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tamlokveer@gmail.com>)
	id 1Wmu27-0004au-P4; Tue, 20 May 2014 20:05:23 -0400
Received: by mail-pa0-f52.google.com with SMTP id fa1so802216pad.39
	for <multiple recipients>; Tue, 20 May 2014 17:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rWGmABgjTrOcSVXN82onigW/xguX+np0LKE0GCD4Ep8=;
	b=fUnN2bBi5Csjp2ii5nif3qkW8uwJOTXZADX2BsxPgFFqy+uth8uTccwc7oG6XfUdlP
	KTiVz9RWHyMU857XUN/b/INwQ3HiE/TeSkAQ9ddMtBnwomnNbAuxZJ5qfMcRFEXrPNPo
	Kw0hDQaY4zBfiamDZUw9bFV8bMv0UYbhWa3gZNcUwXATNPB54p8bU8wcf4soah/gtzBD
	fUpJP1efWQqVF1yVqzrIcVUSGud3MpRFg+Jgy7/KNjHk180T53YG5jC5QpRkVJ8Sp3gz
	1bNjMzouBIJNYMylki253bdgVUA9DJSF+/2UCjCM+0asv/ZrdIotC+H59jvTx+n27ep5
	R+4g==
X-Received: by 10.66.180.200 with SMTP id dq8mr54976047pac.104.1400630722194; 
	Tue, 20 May 2014 17:05:22 -0700 (PDT)
Received: from localhost.localdomain ([162.105.146.101])
	by mx.google.com with ESMTPSA id bz4sm5042881pbb.12.2014.05.20.17.05.19
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 20 May 2014 17:05:21 -0700 (PDT)
From: Le Tan <tamlokveer@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 May 2014 08:10:37 +0800
Message-Id: <1400631039-7208-1-git-send-email-tamlokveer@gmail.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::234
Cc: qemu-trivial@nongnu.org, peter.crosthwaite@xilinx.com, jan.kiszka@web.de,
	afaerber@suse.de, Le Tan <tamlokveer@gmail.com>
Subject: [Qemu-trivial] [PATCH 0/2] replace some fprintf(stderr,
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
X-List-Received-Date: Wed, 21 May 2014 00:06:00 -0000

This series of patches replaces some more occurrences of fprintf(stderr, ...)
with error_report() and removes the trailing "\n". Those for debugging are not
changed.

Le Tan (2):
  arch_init: replace fprintf(stderr,...) with error_report()
  block: replace fprintf(stderr,...) with error_report()

 arch_init.c            |   32 +++++++-------
 block-migration.c      |    5 +--
 block.c                |    4 +-
 block/qcow2-refcount.c |  114 ++++++++++++++++++++++++------------------------
 block/qcow2.c          |   18 ++++----
 block/raw-posix.c      |   10 ++---
 block/raw-win32.c      |    6 +--
 block/ssh.c            |    2 +-
 block/vdi.c            |   15 ++++---
 block/vmdk.c           |   15 +++----
 block/vpc.c            |    4 +-
 block/vvfat.c          |   69 +++++++++++++++--------------
 blockdev.c             |    6 +--
 13 files changed, 147 insertions(+), 153 deletions(-)

-- 
1.7.9.5


