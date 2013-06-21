Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uq6N1-0007Zp-J3
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jun 2013 14:47:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uq6Mw-0007QY-BY
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 14:47:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uq6Mv-0005WH-1X
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 14:47:34 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42706)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Uq6Mt-0005Vq-1u; Fri, 21 Jun 2013 14:47:31 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 8EC2141DCF;
	Fri, 21 Jun 2013 22:47:29 +0400 (MSK)
Message-ID: <51C49FC0.5010201@msgid.tls.msk.ru>
Date: Fri, 21 Jun 2013 22:47:28 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130529 Icedove/17.0.5
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>
References: <1371811105-730-1-git-send-email-kraxel@redhat.com>
In-Reply-To: <1371811105-730-1-git-send-email-kraxel@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 00/13] A bunch of little socket + chardev
 fixes
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
X-List-Received-Date: Fri, 21 Jun 2013 18:47:38 -0000

21.06.2013 14:38, Gerd Hoffmann wrote:
>   Hi,
> 
> Here is a colletion of little bugfixes and minor improvements for the
> chardev and socket code.

Thank you Gerd!  You had me busy for some time verifying it all ;)

The series looks fine, except:

> Gerd Hoffmann (13):
>   qemu-socket: zero-initialize SocketAddress

Maybe we should drop the =NULL initializer as well, suggested
patch included.

>   qemu-socket: drop pointless allocation
>   qemu-socket: catch monitor_get_fd failures

A nitpick, suggested patch included.

>   qemu-char: check optional fields using has_*
>   qemu-char: use more specific error_setg_* variants
>   qemu-char: print notification to stderr
>   qemu-char: fix documentation for telnet+wait socket flags
>   qemu-char: don't leak opts on error
>   qemu-char: use ChardevBackendKind in in CharDriver

In other place int is used instead of this type.
(sysemu/sysemu.h where the prototype is declared
#includes qapi-types.h)

>   qemu-char: minor mux chardev fixes
>   qemu-char: add -chardev mux support
>   qemu-char: report udb backend errors

syntax error in the description, I can fix that when applying

>   qemu-socket: don't leak opts on error

Looks good.  I can fix all the above if you want :)

Thanks!

/mjt

