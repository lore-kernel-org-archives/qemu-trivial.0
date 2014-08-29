Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XNP4D-0007If-Pj
	for mharc-qemu-trivial@gnu.org; Fri, 29 Aug 2014 12:30:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XNP46-00078y-Qe
	for qemu-trivial@nongnu.org; Fri, 29 Aug 2014 12:30:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XNP40-0002f9-Is
	for qemu-trivial@nongnu.org; Fri, 29 Aug 2014 12:30:18 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43845)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XNP3o-0002CC-2j; Fri, 29 Aug 2014 12:30:00 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 628F24583B;
	Fri, 29 Aug 2014 20:29:59 +0400 (MSK)
Message-ID: <5400AA87.5000904@msgid.tls.msk.ru>
Date: Fri, 29 Aug 2014 20:29:59 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: Chen Fan <chen.fan.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org, 
	qemu-trivial@nongnu.org
References: <cover.1408344055.git.chen.fan.fnst@cn.fujitsu.com>
In-Reply-To: <cover.1408344055.git.chen.fan.fnst@cn.fujitsu.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [RESEND v2 0/3] Fix some memory leaks about
 query memdev
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
X-List-Received-Date: Fri, 29 Aug 2014 16:30:25 -0000

18.08.2014 10:46, Chen Fan wrote:
> when using valgrind to test the command "query memdev", I had
> found some memory leaks. the test result:
...

Applied all 3 to -trivial.  Usually these are not really trivial.
Please note that your 2nd patch - "qom/object.c: fix string_output_get_string()
memory leak" - also touches hmp.c (which has a maintainer), but you
didn't mention this in patch description.  I've added it.

Thanks,

/mjt

