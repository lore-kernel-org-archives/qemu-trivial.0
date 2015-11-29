Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a2zPx-0000oC-8y
	for mharc-qemu-trivial@gnu.org; Sun, 29 Nov 2015 05:41:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a2zPu-0000kC-7x
	for qemu-trivial@nongnu.org; Sun, 29 Nov 2015 05:41:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a2zPt-0000AI-FY
	for qemu-trivial@nongnu.org; Sun, 29 Nov 2015 05:41:14 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:60783)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1a2zPn-00009M-HD; Sun, 29 Nov 2015 05:41:07 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E048F43237;
	Sun, 29 Nov 2015 13:41:06 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id C761FA68;
	Sun, 29 Nov 2015 13:41:06 +0300 (MSK)
Message-ID: <565AD642.1070202@msgid.tls.msk.ru>
Date: Sun, 29 Nov 2015 13:41:06 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1448376946-10572-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1448376946-10572-1-git-send-email-peter.maydell@linaro.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH] configure: Diagnose broken linkers
	directly
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
X-List-Received-Date: Sun, 29 Nov 2015 10:41:15 -0000

24.11.2015 17:55, Peter Maydell wrote:
> Currently if the user's compiler works for creating .o files but
> their linker is broken such that compiling an executable from a
> C file does not work, we will report a misleading error message
> about the compiler not supporting __thread (since that happens
> to be the first test we run which requires a working linker).
> Explicitly check that compile_prog works as well as compile_object,
> so that people whose toolchain setup is broken get a more helpful
> error message.

Applied to -trivial, thanks!

/mjt

