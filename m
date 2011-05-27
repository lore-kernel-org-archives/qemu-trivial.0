Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQ0mT-0000I8-G4
	for mharc-qemu-trivial@gnu.org; Fri, 27 May 2011 13:25:01 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QQ0mR-0000EH-Aa
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 13:25:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QQ0mQ-0003ac-I8
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 13:24:59 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:45883)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1QQ0mO-0003aF-JE; Fri, 27 May 2011 13:24:56 -0400
Received: by qwj8 with SMTP id 8so1166413qwj.4
	for <multiple recipients>; Fri, 27 May 2011 10:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:mime-version:content-type:content-transfer-encoding;
	bh=if+srPb2A2aV4QHEGlMTaHlYSrlkliifi1fRH4MTLAU=;
	b=EMszf2/RgYdKHB+xXLtZTngOk5YU0VEoVhB7784wyTxiJQOJJI9xO+eQ1xIUYyhxoe
	M8n0OrTTnrJUyw44O7DTplWabWvE7M35UtctKBTFPevpTtCzZIouDX+mYlLZASObfCMP
	EKY0XKQOoNSY9uuFV9wKlHUZ7PivxF5anw/kI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	b=EuPvYNoKVQOacjiBkXvD6XRGG8TgebvPQkdyCIhEoWrwCrcNfiFJnYsMKg2A0r6bQY
	9y5XJ1I8CF5VFxGX/5bKRsrZX2Ly0RgGc9SsoCpatck6gTCQVgVl3OhK7dyAipDUaPgA
	MeZbhLLtD8JMdLSYt6xsCcT1ey6n4bFzNMcDA=
Received: by 10.229.77.166 with SMTP id g38mr1810820qck.60.1306517095697;
	Fri, 27 May 2011 10:24:55 -0700 (PDT)
Received: from localhost.localdomain (modemcable055.201-23-96.mc.videotron.ca
	[96.23.201.55])
	by mx.google.com with ESMTPS id e28sm1198569qck.30.2011.05.27.10.24.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 10:24:54 -0700 (PDT)
From: Alexandre Raymond <cerbere@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 May 2011 13:22:25 -0400
Message-Id: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
X-Mailer: git-send-email 1.7.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, Alexandre Raymond <cerbere@gmail.com>
Subject: [Qemu-trivial] [PATCH 0/6] Fix compilation issues under darwin
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
X-List-Received-Date: Fri, 27 May 2011 17:25:00 -0000

Hello everyone,

The following series contains trivial patches to fix several minor issues
encountered while compiling qemu under OSX 10.6.7.

I used [./configure --disable-bsd-user --disable-darwin-user --enable-io-thread]
to configure the build.

Cheers,
Alexandre

Alexandre Raymond (6):
  Fix incorrect check for fdatasync() in configure
  Cocoa: avoid displaying window when command-line contains '-h'
  Fix compilation warning due to incorrectly specified type
  Fix missing prototype under cocoa for qemu_main
  Remove warning in printf due to type mismatch
  Avoid compilation warning regarding kvm under darwin

 audio/coreaudio.c       |    2 +-
 configure               |    8 +++++++-
 target-lm32/translate.c |    2 +-
 target-s390x/helper.c   |    1 -
 ui/cocoa.m              |    3 ++-
 vl.c                    |    1 +
 6 files changed, 12 insertions(+), 5 deletions(-)

-- 
1.7.5


