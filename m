Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WWgeg-0006Cy-OW
	for mharc-qemu-trivial@gnu.org; Sun, 06 Apr 2014 02:34:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WWgeZ-00065b-KO
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 02:34:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WWgeT-0000aE-Ez
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 02:34:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40010)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WWgeG-0000Yf-T2; Sun, 06 Apr 2014 02:33:45 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 33E7A4073F;
	Sun,  6 Apr 2014 10:33:44 +0400 (MSK)
Message-ID: <5340F547.6030304@msgid.tls.msk.ru>
Date: Sun, 06 Apr 2014 10:33:43 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1396291915-7269-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1396291915-7269-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Fix indentation of help for
 --enable/disable-debug-info
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
X-List-Received-Date: Sun, 06 Apr 2014 06:34:09 -0000

31.03.2014 22:51, Peter Maydell wrote:
> The help text for the --enable-debug-info and --disable-debug-info
> command line options was misindented: delete the stray extra space
> and bring it in to line with everything else.

Applied to -trivial, thanks!

/mjt

