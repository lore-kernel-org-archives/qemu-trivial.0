Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axU60-0004oG-6Z
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 02:46:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axOWM-0005t1-3n
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 20:49:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axOWB-000596-PZ
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 20:48:56 -0400
Received: from mail-io0-x244.google.com ([2607:f8b0:4001:c06::244]:35442)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>)
	id 1axOVu-0004xC-Uz; Mon, 02 May 2016 20:48:36 -0400
Received: by mail-io0-x244.google.com with SMTP id u185so760531iod.2;
	Mon, 02 May 2016 17:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=Jl8oXI9Uh9gsJvP+Kn9OtR3GMd22LHU7MUlSjZohpd0=;
	b=zqNPIYeVtOkxbAMfpoq+gfxqZEm7PgLDUJ1frEKeJb9chXj+0c8YO/ozSAEwBkUP2p
	fxc7Ucw6EcbGYl5w4nyMqebtwnRNphbY5qwFssyPLU7Vzy/JA8y4hpnbRO/PGKLdg5dD
	TlQYfWmxsjHuImPEMk8j8QZ2VKCweNCo0IrVk8tBGQOSEB/1qtr1heSkSzzvvMOkV71P
	ApalC9NVeH2D/39q++OJHd87W67PrItbEq7MvERfVY1EzQJffHW/ZgjWvC7QZ9Y0Lt2I
	Gz/6XuT574g6UJNi2ySLa4mTFrlPVGJxRL8+/exSOAbjKn9mrAYkXQCIy2yqxfMQeqO2
	bTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
	bh=Jl8oXI9Uh9gsJvP+Kn9OtR3GMd22LHU7MUlSjZohpd0=;
	b=P5nZLO0/X1O/o70a+mD8txZxbk06tvuvSv8XcKf7pLp7dJmutLsUcXvY/NYiFoKfDE
	C3QupA6hd3YugohW+nYObGIZ+cRyMaOhDvb+VYwNfIq9mlj6kx2k2cU3J56XeDFFZXYk
	+M2MY7W1BYCkJkmZYnt5Pl0AWRIoF/vsfL393fbraGxx5nGAl21KUfw+KQIFzW30s4VW
	xIopgDrwYFsJEgdZ0A+hO3OL06ON243gYNAnmT8RD9Y4KSce0FNlKkGMwgCh/vndbdqK
	plrwb5ONnO5dM/+pc8RtWCpp6AJliZIdqsFE5w+RhharzE0Z+HtLjK7QJ1gf/IK9RwEP
	N2rA==
X-Gm-Message-State: AOPr4FVXr3EkBupu9QZtJ3vEC2vaPk6VhAiycr/NTdExRQfWSMhdN0YK8q3wvzxDgdzdXg==
X-Received: by 10.107.1.80 with SMTP id 77mr98356iob.74.1462236482899;
	Mon, 02 May 2016 17:48:02 -0700 (PDT)
Received: from localhost.localdomain (76-10-180-162.dsl.teksavvy.com.
	[76.10.180.162])
	by smtp.gmail.com with ESMTPSA id u187sm815650iod.3.2016.05.02.17.48.02
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Mon, 02 May 2016 17:48:02 -0700 (PDT)
From: Christopher Friedt <chrisfriedt@gmail.com>
To: famz@redhat.com,
	mst@redhat.com
Cc: Christopher Friedt <chrisfriedt@gmail.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Mon,  2 May 2016 20:47:56 -0400
Message-Id: <1462236478-61645-1-git-send-email-chrisfriedt@gmail.com>
X-Mailer: git-send-email 2.6.4 (Apple Git-63)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------2.6.4 (Apple Git-63)"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::244
X-Mailman-Approved-At: Tue, 03 May 2016 02:46:05 -0400
Subject: [Qemu-trivial] [PATCH 0/2] Resolve link errors on Mac OS X
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
X-List-Received-Date: Tue, 03 May 2016 00:49:08 -0000

This is a multi-part message in MIME format.
--------------2.6.4 (Apple Git-63)
Content-Type: text/plain; charset=UTF-8; format=fixed
Content-Transfer-Encoding: 8bit

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


--------------2.6.4 (Apple Git-63)--
