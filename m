Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WdVE3-0004Dz-Ow
	for mharc-qemu-trivial@gnu.org; Thu, 24 Apr 2014 21:46:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WdUhy-0005u1-FK
	for qemu-trivial@nongnu.org; Thu, 24 Apr 2014 21:14:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WdLMG-0003yl-DF
	for qemu-trivial@nongnu.org; Thu, 24 Apr 2014 11:14:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41465)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WdLM9-0003xl-W2; Thu, 24 Apr 2014 11:14:34 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3EB4C42CD7;
	Thu, 24 Apr 2014 19:14:33 +0400 (MSK)
Message-ID: <53592A59.4030305@msgid.tls.msk.ru>
Date: Thu, 24 Apr 2014 19:14:33 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.4.0
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>, Eric Blake <eblake@redhat.com>, 
	Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, 
	Anthony Liguori <aliguori@amazon.com>
References: <5355C202.9040603@gmail.com>
In-Reply-To: <5355C202.9040603@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH trivial v2] vl: avoid closing stdout with
 'writeconfig'
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
X-List-Received-Date: Fri, 25 Apr 2014 01:46:50 -0000

22.04.2014 05:12, Chen Gang wrotr:
> 'writeconfig' supports output to stdout (with '-'); when that happens,
> we must not close stdout, or further command line options that also use
> stdout will be impacted. (Although 'writeconfig' was copied from
> 'readconfig', the latter does not have the problem because it does not
> support reading from '-')

Thanks, applied to -trivial.

/mjt

