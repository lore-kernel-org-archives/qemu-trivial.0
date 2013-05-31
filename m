Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UiNwh-0000Ky-74
	for mharc-qemu-trivial@gnu.org; Fri, 31 May 2013 07:56:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UiNwe-0000Hh-CU
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 07:56:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UiNwd-0003Zm-57
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 07:56:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54007)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UiNwb-0003Z7-5W; Fri, 31 May 2013 07:56:29 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5435D42B55;
	Fri, 31 May 2013 15:56:26 +0400 (MSK)
Message-ID: <51A88FE8.6080302@msgid.tls.msk.ru>
Date: Fri, 31 May 2013 15:56:24 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <1369834243-17088-1-git-send-email-aik@ozlabs.ru>
In-Reply-To: <1369834243-17088-1-git-send-email-aik@ozlabs.ru>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH v3] qemu: fix out of tree cross compile
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
X-List-Received-Date: Fri, 31 May 2013 11:56:33 -0000

29.05.2013 17:30, Alexey Kardashevskiy wrote:
> The symlink to "asm" platform linux headers is made in the build tree by
> the configure script but gcc is not told to look for them there.
> 
> The patch fixes this.

Thanks, applied to the trivial patches queue.

/mjt

