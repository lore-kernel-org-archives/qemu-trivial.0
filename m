Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VUyiT-0004fr-7z
	for mharc-qemu-trivial@gnu.org; Sat, 12 Oct 2013 08:54:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1VUyiM-0004f8-D7
	for qemu-trivial@nongnu.org; Sat, 12 Oct 2013 08:54:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1VUyiH-00038m-Hy
	for qemu-trivial@nongnu.org; Sat, 12 Oct 2013 08:54:38 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:55490 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1VUyiH-00038g-BY; Sat, 12 Oct 2013 08:54:33 -0400
Received: from localhost ([127.0.0.1])
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1VUyk1-0008DB-0U; Sat, 12 Oct 2013 14:56:21 +0200
References: <1381482317-25433-1-git-send-email-mjt@msgid.tls.msk.ru>
User-agent: mu4e 0.9.9.6pre2; emacs 24.3.2
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <87k3hi6466.fsf@linaro.org>
In-reply-to: <1381482317-25433-1-git-send-email-mjt@msgid.tls.msk.ru>
Date: Sat, 12 Oct 2013 13:54:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: create fsdev/
	directory
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
X-List-Received-Date: Sat, 12 Oct 2013 12:54:43 -0000


mjt@tls.msk.ru writes:

> In some cases when building with parallelism (make -jN),
> build fails because the directory where output files are
> supposed to be does not exist.  In particular, when make
> decides to build virtfs-proxy-helper.1 before other files
> in fsdev/, build will fail with the following error:
<snip>

Isn't this the sort of think Make dependencies are for?

-- 
Alex Bennée

