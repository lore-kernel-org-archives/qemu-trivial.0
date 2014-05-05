Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhGix-0006lg-LJ
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 07:06:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhGip-0006bM-VJ
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 07:06:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhGij-0002nq-Rt
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 07:06:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45668)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhGiV-0002jR-1F; Mon, 05 May 2014 07:05:51 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 8ADFF406D9;
	Mon,  5 May 2014 15:05:49 +0400 (MSK)
Message-ID: <5367708D.80803@msgid.tls.msk.ru>
Date: Mon, 05 May 2014 15:05:49 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.4.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <1399287591-6525-1-git-send-email-famz@redhat.com>
	<1399287591-6525-2-git-send-email-famz@redhat.com>
In-Reply-To: <1399287591-6525-2-git-send-email-famz@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v2 1/2] docs/memory.txt: Put one
	whitespace between sentences
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
X-List-Received-Date: Mon, 05 May 2014 11:06:18 -0000

05.05.2014 14:59, Fam Zheng wrote:
> In other words, whitespace changes only.

>  The memory API models the memory and I/O buses and controllers of a QEMU
> -machine.  It attempts to allow modelling of:
> +machine. It attempts to allow modelling of:

What's the point?  In text form, it is quite often and, to my taste, quite
normal to use 2 spaces after the full-dot (at the end of the sentence), just
like an extra line between paragraphs.  This way, it is easier to separate
sentences between each other.

In real typography, 1.5-sized space is usually used in such places.  But since
plaintext format has no 1.5-sized space, 2 spaces is used.

I'd send an opposite patch, which adds additional space where it is missing.. :)

Thanks,

/mjt

