Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vpw0t-0001ZM-BO
	for mharc-qemu-trivial@gnu.org; Mon, 09 Dec 2013 03:16:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vpw0n-0001SL-PG
	for qemu-trivial@nongnu.org; Mon, 09 Dec 2013 03:16:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vpw0i-0007DJ-Pp
	for qemu-trivial@nongnu.org; Mon, 09 Dec 2013 03:16:17 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46206)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vpw0Y-0007C7-4v; Mon, 09 Dec 2013 03:16:02 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A311A40FBF;
	Mon,  9 Dec 2013 12:16:00 +0400 (MSK)
Message-ID: <52A57C40.2000502@msgid.tls.msk.ru>
Date: Mon, 09 Dec 2013 12:16:00 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Amos Kong <akong@redhat.com>
References: <1386576358-10469-1-git-send-email-akong@redhat.com>
In-Reply-To: <1386576358-10469-1-git-send-email-akong@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, pbonzini@redhat.com,
	qemu-devel@nongnu.org, anthony@codemonkey.ws,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 0/2] fix strict boot
	regression
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
X-List-Received-Date: Mon, 09 Dec 2013 08:16:22 -0000

09.12.2013 12:05, Amos Kong wrote:
> parsing of "strict" is wrongly removed, we need it.
> The first patch fixes a typo.
> 
> V2: remove bios.bin change, I just used it for testing (mjt)
> 
> Amos Kong (2):
>   fix a typo of strict option
>   add parsing of "strict" boot parameter
> 
>  vl.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)

I think it is okay to go to qemu-trivial (both patches are fine to my eyes).
I queued them up for now, will roll back if there's any objections.  At any
rate,

Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>

Note that boot_strict can be made static since it isn't used anywhere else.
I'll queue this change too.

Thanks,

/mjt


