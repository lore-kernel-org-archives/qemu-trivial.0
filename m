Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W9XIb-0003Df-FT
	for mharc-qemu-trivial@gnu.org; Sat, 01 Feb 2014 04:55:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9XIU-0003Ab-9Y
	for qemu-trivial@nongnu.org; Sat, 01 Feb 2014 04:55:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9XIO-0000C9-72
	for qemu-trivial@nongnu.org; Sat, 01 Feb 2014 04:55:34 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56439)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W9XIB-0008Jt-MN; Sat, 01 Feb 2014 04:55:15 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A585440053;
	Sat,  1 Feb 2014 13:55:14 +0400 (MSK)
Message-ID: <52ECC482.3080700@msgid.tls.msk.ru>
Date: Sat, 01 Feb 2014 13:55:14 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Stewart Smith <stewart@linux.vnet.ibm.com>
References: <1390452896-20146-1-git-send-email-stewart@linux.vnet.ibm.com>
	<1390527551-22069-1-git-send-email-stewart@linux.vnet.ibm.com>
In-Reply-To: <1390527551-22069-1-git-send-email-stewart@linux.vnet.ibm.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 0/6] configure: make output and errors
 more friendly
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
X-List-Received-Date: Sat, 01 Feb 2014 09:55:40 -0000

24.01.2014 05:39, Stewart Smith wrote:
> This expands on my previous patch which was just the "configure: helpfully
> output package names for some missing dependencies" patch.
> 
> Based on feedback I've added a hint to the could not find DTC error message.
> 
> There's also other changes that were suggested and the ordering of output
> from configure and configure --help which I found rather useful when
> attempting to find what package was needed for each configure option.
> 
> Stewart Smith (6):
>1   configure: add hint of libfdt to DTC dependency not found message
>2   configure: sort output of configure results alphabetically
>3   configure: alphabetize output of --help and separate into groups
>4   configure: add help for --disable-xfsctl and --enable-xfsctl
>5   configure: add hints to a remedy for feature_not_found errors
>6   configure: helpfully output package names for some missing
>     dependencies.

I think I'd happily take 1, 2, 5 and 6, but 3 and 4 really needs to be
redone, mentioning every option just once, not twice as it is done
now.  After that's done, it might be not necessary anymore for 3 at all.

Or I can wait for a resend of whole series.  Or alternatively I can
try to rework it myself, but for now I'm quite busy so can't promise
anything.

Please note that major tweaks in ./configure will most likely conflict
with modules support series which has been posted for revew again.

What should I do?

Thanks,

/mjt

