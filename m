Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WgVMz-00005E-Ve
	for mharc-qemu-trivial@gnu.org; Sat, 03 May 2014 04:32:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35874)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WgVMs-0008Mn-RF
	for qemu-trivial@nongnu.org; Sat, 03 May 2014 04:32:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WgVMm-0002Sv-ND
	for qemu-trivial@nongnu.org; Sat, 03 May 2014 04:32:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38827)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WgVMa-0002Nn-6a; Sat, 03 May 2014 04:32:04 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 637384027E;
	Sat,  3 May 2014 12:32:01 +0400 (MSK)
Message-ID: <5364A980.10107@msgid.tls.msk.ru>
Date: Sat, 03 May 2014 12:32:00 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1398682430-23659-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1398682430-23659-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] docs/memory.txt: old_portio has gone,
 so don't mention it
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
X-List-Received-Date: Sat, 03 May 2014 08:32:29 -0000

28.04.2014 14:53, Peter Maydell wrote:
> The old_portio mechanism in the memory API has been removed, but
> we forgot to update the documentation to match. Remove the stray
> reference to this now-vanished bit of back-compatibility API.

Applied to -trivial, thanks!

/mjt

