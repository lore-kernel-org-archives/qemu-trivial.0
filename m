Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X4sP7-0003ED-AJ
	for mharc-qemu-trivial@gnu.org; Wed, 09 Jul 2014 09:59:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X4sOy-00030w-6Z
	for qemu-trivial@nongnu.org; Wed, 09 Jul 2014 09:59:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X4sOr-0005AJ-VZ
	for qemu-trivial@nongnu.org; Wed, 09 Jul 2014 09:59:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59179)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1X4sOf-00055L-DT; Wed, 09 Jul 2014 09:58:57 -0400
Received: from [192.168.177.103] (aa9300.vpn.tls.msk.ru [192.168.177.103])
	by isrv.corpit.ru (Postfix) with ESMTP id 6DE74418E9;
	Wed,  9 Jul 2014 17:58:46 +0400 (MSK)
Message-ID: <53BD4A94.2000300@msgid.tls.msk.ru>
Date: Wed, 09 Jul 2014 15:58:44 +0200
From: Michael Tokarev <mjt@tls.msk.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.6.0
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>
References: <53B57D5B.2070204@gmail.com>
In-Reply-To: <53B57D5B.2070204@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH trivial] qemu-img: Remove redundancy "ret
 = -1"
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
X-List-Received-Date: Wed, 09 Jul 2014 13:59:22 -0000

03.07.2014 17:57, Chen Gang wrote:
> In this case, 'ret' is already '-1', so need not do it again.

It's a very minor thing in an error path, maybe compiler even
eliminates this statement entirely by its own already.

Not sure it is worth the effort but applied to the -trivial tree
anyway, thanks!

/mjt

