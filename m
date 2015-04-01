Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YdLfp-0004Vu-5m
	for mharc-qemu-trivial@gnu.org; Wed, 01 Apr 2015 12:39:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1YdLfm-0004Rq-FP
	for qemu-trivial@nongnu.org; Wed, 01 Apr 2015 12:39:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1YdLfc-00007u-54
	for qemu-trivial@nongnu.org; Wed, 01 Apr 2015 12:39:22 -0400
Received: from mail-wg0-f50.google.com ([74.125.82.50]:33582)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1YdLfc-00007e-0M
	for qemu-trivial@nongnu.org; Wed, 01 Apr 2015 12:39:12 -0400
Received: by wgoe14 with SMTP id e14so59380965wgo.0
	for <qemu-trivial@nongnu.org>; Wed, 01 Apr 2015 09:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HP/RXMIn2YnpDOj92+ltGh/W5N2/9XTaSnQTPwoxWoE=;
	b=JZ2f47hPobOBhH13VeYEX8tPVqt+ctN0AFTdRE3M9/D98cB5mGqdfZJoJGTq7rTggM
	qbj0dPhxkCfvtOl45IPNqxzwrJWvllbRZBGr/6nZ9M2y4EE7adRapVL5PnZCZ8D+lPJS
	8ZIRDWnDk2QGZqYhXeQyG583eG0OJBfR8v4YiKtlPoXOIXf63tz0qaYCneg1qVyeEOF/
	3nJKC22fOWLHXdNvOxVEJN0J2YvjNGNVPKahFH+NnLyQuIsbbzC8pXxyA+KdB6MD6Eiw
	BJw5BpHttWOjLt8B6zXiLpVZHV/TjkcRTytH1hHHdIxtelPs5zsb6cgm8hUM6Vr4quKw
	habQ==
X-Gm-Message-State: ALoCoQkug8iZl2RQU4XmwmN6FpyRwy9C9J3EsABEcNuBUtFR6kA5GaazdNC3eRtCp1Omn7zFSYGN
X-Received: by 10.194.176.4 with SMTP id ce4mr86890368wjc.75.1427906350984;
	Wed, 01 Apr 2015 09:39:10 -0700 (PDT)
Received: from Snarl.daynix ([91.205.155.63])
	by mx.google.com with ESMTPSA id xy2sm3424115wjc.14.2015.04.01.09.39.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Apr 2015 09:39:10 -0700 (PDT)
From: Joseph Hindin <jhindin@daynix.com>
To: qemu-devel@nongnu.org
Date: Wed,  1 Apr 2015 19:38:56 +0300
Message-Id: <1427906337-20805-1-git-send-email-jhindin@daynix.com>
X-Mailer: git-send-email 2.1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.50
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Joseph Hindin <jhindin@daynix.com>
Subject: [Qemu-trivial] [PATCH v2] fitering out -fstack-protector-strong
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
X-List-Received-Date: Wed, 01 Apr 2015 16:39:23 -0000

The cross-compilation of VSS DLL from QEMU GA for Windows with MinGW
fails because of disreparancy between compiler's and linker's stack
protection options. The current qga/vss-win32/Makefile.objs filters
out option '-fstack-protector-all' from compiler's option, but commit
63678e17c introduced changes in configure script, setting
'-fstack-protector-strong' compiler option when available.

The '-fstack-protector-strong' option was not filtered out by the VSS
DLL Makefile.objs file, resulting in linking error.

Paolo Bonzini in the message
http://lists.nongnu.org/archive/html/qemu-devel/2015-03/msg02719.html
from 12.03.2015 suggested to fix the problem in a way similar to existing.

The patch follows the advice and filters out both '-fstack-protector-strong' and '-fstack-protector-all' from compiler's options' list.

Joseph Hindin (1):
  qga: fitering out -fstack-protector-strong

 qga/vss-win32/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.1.0


