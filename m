Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axU5z-0004nH-O0
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 02:46:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axOj3-0004hj-7p
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:02:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axOir-0007s8-Ej
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:02:03 -0400
Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241]:35028)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>)
	id 1axOiY-0007kV-Bc; Mon, 02 May 2016 21:01:39 -0400
Received: by mail-io0-x241.google.com with SMTP id u185so779669iod.2;
	Mon, 02 May 2016 18:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ZGbxuUYjJIQy9KcJS7M3BZSjjmdPz/WC1PzWWIJlULQ=;
	b=ehXqIDpnxpgMnTeGNz+c3O4zX8OMhx009T/DXz1CTs3ve5bSUQo4eI+bdk7KzMrQRo
	lwgJKrGH4BxR2VXMI7Aq+ZFeWOYCv+09EVeF4RVFGAMFY60AI82oY8MezXZoSWF/CN4f
	rdHNHKZgQ89R1sOoJPXmDKruubRyArD3YcGB6vUqevIJYaIfEhTT2QDSQRgm6TmXDqTa
	icIKatLDEJ+swowVh8ZIKviF7C2ycTgcaseIJXlOHmKnocjUNMdWFRqQfNr3urwGMco/
	6LzJlcIc7sXZCkTmJyeg+dAL8UO8TEhQW1IPr1sNeRnROH99yJqH4m/JQJR5MV0cicxb
	0iWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZGbxuUYjJIQy9KcJS7M3BZSjjmdPz/WC1PzWWIJlULQ=;
	b=RYEJaIALLDrqO4Qp71O/0THI+ps3dzJ7+fUW+nnPwQO03DOx2DI2A2ykjq0QpbrO0R
	ACYG9sKi5/+k4ykVC+OugKzCajO5NdWFGkWXC8E0BjpxbTLu/L+U9sBjQ3RAOc/Ff+mU
	SuJLelN7ras7lhYlEg9K5PnVxC4z3FQuR1aKffWham/TV0w+hpW+2ysKPqf7oLgYtGzj
	R7xTGCImQ7C36UFZFBWqscH7jcSx0fYGtytlo71aWG7hV+zDoH5xVQHBCDNL9/0EMlRg
	3bXjmhh6P9YE1O3xPlZLo4oFi80FHneJHWzJZqjZcu6QLKAFcIL+ZHMcVnBL6NHi/tL2
	mvkw==
X-Gm-Message-State: AOPr4FXa79/n9FaDW+ek5tKT74S0vaTPVsOyfcvLpAUseKT/EEXEXZAtpqK+VHdm6PVudg==
X-Received: by 10.107.59.195 with SMTP id i186mr158593ioa.36.1462237266526;
	Mon, 02 May 2016 18:01:06 -0700 (PDT)
Received: from localhost.localdomain (76-10-180-162.dsl.teksavvy.com.
	[76.10.180.162])
	by smtp.gmail.com with ESMTPSA id i14sm803917iod.34.2016.05.02.18.01.05
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Mon, 02 May 2016 18:01:06 -0700 (PDT)
From: Christopher Friedt <chrisfriedt@gmail.com>
To: famz@redhat.com,
	mst@redhat.com
Cc: Christopher Friedt <chrisfriedt@gmail.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Mon,  2 May 2016 21:01:03 -0400
Message-Id: <1462237265-61763-1-git-send-email-chrisfriedt@gmail.com>
X-Mailer: git-send-email 2.6.4 (Apple Git-63)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::241
X-Mailman-Approved-At: Tue, 03 May 2016 02:46:09 -0400
Subject: [Qemu-trivial] [PATCH 0/2][RESENT-INLINE] Resolve link errors on
 Mac OS X
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
X-List-Received-Date: Tue, 03 May 2016 01:02:20 -0000

Hi list,

I recently tried to build Qemu on Mac and ran into a couple of trivial issues
that I've provided patches for. I suppose that normally people just use
'brew install qemu', but there is really no reason that it can't be built from
source, particularly for those modifying Qemu regularly.

In any case, the first change moves to using 'libtool -static' to create
libraries on Mac OS X. If one attempts to use ar and ranlib, then the final
link will fail with error messages resembling the following:

  ld: warning: ignoring file libqemuutil.a, file was built for archive which
  is not the architecture being linked (x86_64): libqemuutil.a
  Undefined symbols for architecture x86_64:
  ...

Notice ld (Apple's ld64) presumes the static library is a relocatable with
architecture 'archive' rather than x86_64, in this case.

A similar fix is required for dtc - again quite trivial, but I can provide that if necessary.

The second patch removes the preprocessor conditional around the function
event_notifier_init_fd() in util/event_notifier-posix.c so that the link does
not fail on systems where CONFIG_POSIX is defined but CONFIG_EVENTFD is not
(such as under Mac OS X).

There is more information in each of the commits that follows.

Please feel free to comment.

Cheers,

C

Christopher Friedt (2):
  Use libtool instead of ar to create static libraries on Darwin.
  Remove unnecessary CONFIG_EVENTFD preprocessor conditional to satisfy
    link

 rules.mak                   | 4 ++++
 util/event_notifier-posix.c | 2 --
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.6.4 (Apple Git-63)


