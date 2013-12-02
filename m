Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VnWxU-0000tw-St
	for mharc-qemu-trivial@gnu.org; Mon, 02 Dec 2013 12:06:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VnWxM-0000jw-Tq
	for qemu-trivial@nongnu.org; Mon, 02 Dec 2013 12:06:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VnWxG-0002gZ-Vh
	for qemu-trivial@nongnu.org; Mon, 02 Dec 2013 12:06:48 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:49489)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VnWx4-0002f1-1K; Mon, 02 Dec 2013 12:06:30 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 786CD405F2;
	Mon,  2 Dec 2013 21:06:29 +0400 (MSK)
Message-ID: <529CBE15.8010206@msgid.tls.msk.ru>
Date: Mon, 02 Dec 2013 21:06:29 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <1385350750-21468-1-git-send-email-aik@ozlabs.ru>
In-Reply-To: <1385350750-21468-1-git-send-email-aik@ozlabs.ru>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] vl: remove (max_cpus > 255) check from
 smp_parse
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
X-List-Received-Date: Mon, 02 Dec 2013 17:06:55 -0000

25.11.2013 07:39, Alexey Kardashevskiy wrote:
> Since modern POWER7/POWER8 chips can have more that 256 CPU threads
> (>2000 actually), remove this check from smp_parse.
> 
> The CPUs number is still checked against machine->max_cpus and this check
> should be enough not to break other archs.
[]
> -    if (max_cpus > 255) {
> -        fprintf(stderr, "Unsupported number of maxcpus\n");
> -        exit(1);
> -    }

I don't know whenever this is actually safe.  Do we have any static arrays
of size 255 somewhere, which will be overflowed without this check? :)

Thanks,

/mjt

