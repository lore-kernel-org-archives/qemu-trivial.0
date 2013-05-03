Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UYFfp-0008OF-37
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2013 09:05:17 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UYFfj-0008Gj-En
	for qemu-trivial@nongnu.org; Fri, 03 May 2013 09:05:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UYFfc-0000FK-QF
	for qemu-trivial@nongnu.org; Fri, 03 May 2013 09:05:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53040)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UYFfV-0008Rx-5h; Fri, 03 May 2013 09:04:57 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7A18D40190;
	Fri,  3 May 2013 17:04:47 +0400 (MSK)
Message-ID: <5183B5EF.4010509@msgid.tls.msk.ru>
Date: Fri, 03 May 2013 17:04:47 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Ed Maste <emaste@freebsd.org>
References: <1367328572-40615-1-git-send-email-emaste@freebsd.org>
In-Reply-To: <1367328572-40615-1-git-send-email-emaste@freebsd.org>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] bsd-user: OS-agnostic 64-bit SYSCTL
 types
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
X-List-Received-Date: Fri, 03 May 2013 13:05:16 -0000

30.04.2013 17:29, Ed Maste wrote:
> Use existence of type as #ifdef condition rather than FreeBSD-specific
> version check, as suggested by Patrick Welche.
> 
> Also handle the signed (CTLTYPE_S64) case identically to the unsigned
> (CTLTYPE_U64) case, per later patches in the FreeBSD ports tree
> (emulators/qemu-devel/files/patch-z-arm-bsd-user-001).

Applied to trivial-patches tree (8e4125147a8bc4da2c1e8eced722ebe31bafc19e),
thank you!

/mjt

