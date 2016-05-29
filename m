Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b6vqS-0008Ux-TW
	for mharc-qemu-trivial@gnu.org; Sun, 29 May 2016 04:13:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b6vqQ-0008TU-5P
	for qemu-trivial@nongnu.org; Sun, 29 May 2016 04:13:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b6vqO-0002Iz-BT
	for qemu-trivial@nongnu.org; Sun, 29 May 2016 04:13:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60250)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b6vqI-0002H1-Tw; Sun, 29 May 2016 04:13:03 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 54F8F42C30;
	Sun, 29 May 2016 11:12:59 +0300 (MSK)
To: James Clarke <jrtc27@jrtc27.com>, qemu-devel@nongnu.org
References: <20160510211635.GA48818@Jamess-MacBook.local>
Cc: qemu-trivial@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <574AA48A.5090207@msgid.tls.msk.ru>
Date: Sun, 29 May 2016 11:12:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <20160510211635.GA48818@Jamess-MacBook.local>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] Fix linking relocatable objects on Sparc
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 29 May 2016 08:13:11 -0000

11.05.2016 00:16, James Clarke wrote:
> On Sparc, gcc implicitly passes --relax to the linker, but -r is
> incompatible with this. Therefore, if --no-relax is supported, it should
> be passed to the linker.

Applied to -trivial, thanks!

/mjt

