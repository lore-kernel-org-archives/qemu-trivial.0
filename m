Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WeLEV-0003yz-P1
	for mharc-qemu-trivial@gnu.org; Sun, 27 Apr 2014 05:18:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WeLEO-0003qK-Ug
	for qemu-trivial@nongnu.org; Sun, 27 Apr 2014 05:18:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WeLEI-0005Zg-Ld
	for qemu-trivial@nongnu.org; Sun, 27 Apr 2014 05:18:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33851)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WeLE2-0005YN-6v; Sun, 27 Apr 2014 05:18:18 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 38ABA42F31;
	Sun, 27 Apr 2014 13:18:17 +0400 (MSK)
Message-ID: <535CCB59.8020606@msgid.tls.msk.ru>
Date: Sun, 27 Apr 2014 13:18:17 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.4.0
MIME-Version: 1.0
To: Baojun Wang <wangbj@gmail.com>, qemu-devel@nongnu.org
References: <53457D1A.7000602@redhat.com>
	<1397065744-9561-1-git-send-email-wangbj@gmail.com>
In-Reply-To: <1397065744-9561-1-git-send-email-wangbj@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, eblake@redhat.com
Subject: Re: [Qemu-trivial] [PATCH V5 1/1] qmp: add pmemload command
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
X-List-Received-Date: Sun, 27 Apr 2014 09:18:47 -0000

09.04.2014 21:49, Baojun Wang wrote:
> I found this could be useful to have qemu-softmmu as a cross debugger (launch
> with -s -S command line option), then if we can have a command to load guest
> physical memory, we can use cross gdb to do some target debug which gdb cannot
> do directly.
> 
> Many thanks to Eric Blake for review the patch and suggestions.

Okay, that looks sane, but can you explain please, why did you address
qemu-trivial@?  The change definitely is not "trivial", as it introduces
a new qmp command which becomes a part of public interface.  Even if
the implementation may look trivial, the interface change should not be
done using -trivial tree.

Thanks,

/mjt

