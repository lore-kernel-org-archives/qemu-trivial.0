Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z08e7-0006kf-HM
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 09:23:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Z08e4-0006h0-QG
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:23:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Z08e3-00035Y-Vh
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:23:48 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:42951 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1Z08dx-0002z8-4w; Wed, 03 Jun 2015 09:23:41 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1Z09zT-0003Oo-C3; Wed, 03 Jun 2015 16:49:59 +0200
References: <1433321798-13398-1-git-send-email-alex.bennee@linaro.org>
	<556EFB95.2010708@msgid.tls.msk.ru>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Michael Tokarev <mjt@tls.msk.ru>
In-reply-to: <556EFB95.2010708@msgid.tls.msk.ru>
Date: Wed, 03 Jun 2015 14:23:57 +0100
Message-ID: <87lhg1apsi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: postfix --extra-cflags to
	QEMU_CFLAGS
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
X-List-Received-Date: Wed, 03 Jun 2015 13:23:49 -0000


Michael Tokarev <mjt@tls.msk.ru> writes:

> Applied to -trivial, thanks!
>
> The other nearby case, --extra-ldflags, also wants this reordering :)

sent

One day I'll find a use for such a thing but fortunately my default build
environment has everything I need ;-)

>
> /mjt

-- 
Alex Bennée

