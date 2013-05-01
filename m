Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UXaKP-0000nd-6f
	for mharc-qemu-trivial@gnu.org; Wed, 01 May 2013 12:56:25 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UXaKM-0000jr-I5
	for qemu-trivial@nongnu.org; Wed, 01 May 2013 12:56:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UXaKL-0006q6-O3
	for qemu-trivial@nongnu.org; Wed, 01 May 2013 12:56:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43058)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UXaKI-0006p1-Bs; Wed, 01 May 2013 12:56:18 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 97C9040073;
	Wed,  1 May 2013 20:56:17 +0400 (MSK)
Message-ID: <5181492F.8060709@msgid.tls.msk.ru>
Date: Wed, 01 May 2013 20:56:15 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1367142597-28810-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1367142597-28810-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Trivial grammar and spelling fixes
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
X-List-Received-Date: Wed, 01 May 2013 16:56:23 -0000

28.04.2013 13:49, Stefan Weil wrote:
> similiar -> similar
> recieve -> receive
> transfered -> transferred
> preperation -> preparation
> 
> Most changes are in comments, one modifies a parameter name in a function
> prototype.
> 
> The spelling fixes were made using codespell.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Thanks, applied to qemu-trivial tree (805a25050272fe7cbbc2e9ce911612fc86c7b9a9)

/mjt


