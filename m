Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WlZUI-00070S-RT
	for mharc-qemu-trivial@gnu.org; Sat, 17 May 2014 03:56:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WlZUB-0006ra-HJ
	for qemu-trivial@nongnu.org; Sat, 17 May 2014 03:56:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WlZU5-0006Cn-Dh
	for qemu-trivial@nongnu.org; Sat, 17 May 2014 03:56:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40708)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WlZTs-00066M-Mv; Sat, 17 May 2014 03:56:32 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D62B64171A;
	Sat, 17 May 2014 11:56:31 +0400 (MSK)
Message-ID: <5377162F.5060209@msgid.tls.msk.ru>
Date: Sat, 17 May 2014 11:56:31 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1400245203-32005-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1400245203-32005-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] iohandler.c: Properly initialize
 sigaction struct
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
X-List-Received-Date: Sat, 17 May 2014 07:56:57 -0000

16.05.2014 17:00, Peter Maydell wrote:
> The code in qemu_init_child_watch() wasn't clearing the 'struct
> sigaction' before passing it to sigaction(); this meant that we
> would block a random set of signals while executing the SIGCHLD
> handler. Initialize properly by using memset() on the struct,
> as we do in similar cases elsewhere

Applied to -trivial, thank you!

/mjt

