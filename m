Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TO0ih-0003pv-9U
	for mharc-qemu-trivial@gnu.org; Tue, 16 Oct 2012 02:33:39 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1TO0ic-0003dc-6f
	for qemu-trivial@nongnu.org; Tue, 16 Oct 2012 02:33:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1TO0ib-0005Ac-9I
	for qemu-trivial@nongnu.org; Tue, 16 Oct 2012 02:33:34 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46869)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1TO0iV-00058l-3r; Tue, 16 Oct 2012 02:33:27 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A3407A1336;
	Tue, 16 Oct 2012 10:33:25 +0400 (MSK)
Message-ID: <507CFFB3.7070907@msgid.tls.msk.ru>
Date: Tue, 16 Oct 2012 10:33:23 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:10.0.7) Gecko/20120922 Icedove/10.0.7
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1349872258-21952-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1349872258-21952-1-git-send-email-pbonzini@redhat.com>
X-Enigmail-Version: 1.4.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vnc: fix "info vnc" with
	"-vnc ..., reverse=on"
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
X-List-Received-Date: Tue, 16 Oct 2012 06:33:36 -0000

On 10.10.2012 16:30, Paolo Bonzini wrote:
[]
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -372,6 +372,10 @@ VncInfo *qmp_query_vnc(Error **errp)
>              }
>          }
>  
> +        if (vnc_display->lsock == -1) {

FWIW, can't we use "< 0" condition in all cases like this - for
testing whenever a filedescriptor is not open or if a system call
returned failure?  Why we compare with -1 only?  The "< 0" comparison
is cheaper in the resulting code (very very small difference), but
more to the point, it guarantees that no invalid value is treated
as valid - for example, in case some function returns -errno like
it was with bdrv_something() recently.  I use "< 0" in such places
for over 20 years for this reason, this "technique" saved me
countless number of times, when old API changed, or when I switched
to a new API without reviewing return value checking in all places,
or when I just didn't read the manpage carefully... ;)

Thanks,

/mjt

