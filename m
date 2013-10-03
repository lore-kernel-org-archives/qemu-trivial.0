Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VRlCe-000880-CE
	for mharc-qemu-trivial@gnu.org; Thu, 03 Oct 2013 11:52:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1VRisw-0008F2-0G
	for qemu-trivial@nongnu.org; Thu, 03 Oct 2013 09:24:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1VRisr-0001ZF-Lq
	for qemu-trivial@nongnu.org; Thu, 03 Oct 2013 09:24:05 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:35070 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1VRisj-0001Xz-5f; Thu, 03 Oct 2013 09:23:53 -0400
Received: from localhost ([127.0.0.1] helo=sloy)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1VRiuM-0004A2-Ei; Thu, 03 Oct 2013 15:25:34 +0200
References: <1380575089-11408-1-git-send-email-sw@weilnetz.de>
User-agent: mu4e 0.9.9.5; emacs 24.3.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
In-reply-to: <1380575089-11408-1-git-send-email-sw@weilnetz.de>
Date: Thu, 03 Oct 2013 14:23:51 +0100
Message-ID: <p1ioxebi8o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
X-Mailman-Approved-At: Thu, 03 Oct 2013 11:52:35 -0400
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-stable <qemu-stable@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Anthony Liguori <anthony@codemonkey.ws>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-char: Fix potential
	out of bounds accessto local arrayss
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
X-List-Received-Date: Thu, 03 Oct 2013 13:24:10 -0000


sw@weilnetz.de writes:

> Latest gcc-4.8 supports a new option -fsanitize=address which activates
> an AddressSanitizer. This AddressSanitizer stops the QEMU system emulation
> very early because two character arrays of size 8 are potentially written
> with 9 bytes.
>
> Commit 6ea314d91439741e95772dfbab98b4135e04bebb added the code.
>
> There is no obvious reason why width or height could need 8 characters,
> so reduce it to 7 characters which together with the terminating '\0'
> fit into the arrays.
>
> Cc: qemu-stable <qemu-stable@nongnu.org>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
<snip>

Reviewed-by: Alex Bennée <alex@bennee.com>

-- 
Alex Bennée

