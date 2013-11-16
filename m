Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vhcno-0004HA-PD
	for mharc-qemu-trivial@gnu.org; Sat, 16 Nov 2013 05:08:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vhcnh-00043H-2S
	for qemu-trivial@nongnu.org; Sat, 16 Nov 2013 05:08:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vhcnb-0000my-26
	for qemu-trivial@nongnu.org; Sat, 16 Nov 2013 05:08:24 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:33427)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VhcnO-0000ke-Qp; Sat, 16 Nov 2013 05:08:06 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 10DB841CD9;
	Sat, 16 Nov 2013 14:07:55 +0400 (MSK)
Message-ID: <528743FA.50508@msgid.tls.msk.ru>
Date: Sat, 16 Nov 2013 14:07:54 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1384452423-7831-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1384452423-7831-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH (1.7?)] configure: Use -B switch only for
 Python versions which support it
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
X-List-Received-Date: Sat, 16 Nov 2013 10:08:31 -0000

14.11.2013 22:07, Stefan Weil wrote:
> Commit 1d984a67a95d88f3e708b077dab8adeb47c38c93 added the -B switch
> unconditionally. This breaks Python versions before 2.6 which don't
> support that switch.
> 
> Now configure adds -B only if it is accepted by the Python interpreter.
> 
> This modification introduces a small incompatiblity because -B might now
> also be added when configure was called with --python=PYTHON_INTERPRETER.

Thanks, applied to the trivial-patches queue, with the spelling fix in comment.

/mjt

