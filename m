Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XknUm-0004US-GH
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 01:14:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XknUf-0004LD-AI
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 01:14:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XknUZ-0001L8-0h
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 01:14:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36140)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XknUM-0001KR-GW; Sun, 02 Nov 2014 01:14:06 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id EB4C640231;
	Sun,  2 Nov 2014 08:14:05 +0300 (MSK)
Message-ID: <5455BD9D.3090209@msgid.tls.msk.ru>
Date: Sun, 02 Nov 2014 08:14:05 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: SeokYeon Hwang <syeon.hwang@samsung.com>, qemu-devel@nongnu.org
References: <1414742525-18639-1-git-send-email-syeon.hwang@samsung.com>
In-Reply-To: <1414742525-18639-1-git-send-email-syeon.hwang@samsung.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, sw@weilnetz.de
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vdi: wrapped uuid_unparse()
	in #ifdef
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
X-List-Received-Date: Sun, 02 Nov 2014 05:14:31 -0000

31.10.2014 11:02, SeokYeon Hwang wrote:
> Wrapped uuid_unparse() in #ifdef to avoid "-Wunused-function" on clang 3.4 or later.

Applied to -trivial, after adding a newline into the commit message :)
Thanks,

/mjt

