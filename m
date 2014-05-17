Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WlZZp-0000Y1-EP
	for mharc-qemu-trivial@gnu.org; Sat, 17 May 2014 04:02:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WlZZh-0000MQ-2T
	for qemu-trivial@nongnu.org; Sat, 17 May 2014 04:02:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WlZZa-0007XN-Vy
	for qemu-trivial@nongnu.org; Sat, 17 May 2014 04:02:33 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60438)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WlZZO-0007Tc-Ac; Sat, 17 May 2014 04:02:14 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id B26694171A;
	Sat, 17 May 2014 12:02:12 +0400 (MSK)
Message-ID: <53771784.10009@msgid.tls.msk.ru>
Date: Sat, 17 May 2014 12:02:12 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Hani Benhabiles <kroosec@gmail.com>, qemu-devel@nongnu.org
References: <1399937716-6086-1-git-send-email-kroosec@gmail.com>
In-Reply-To: <1399937716-6086-1-git-send-email-kroosec@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, stefanha@redhat.com,
	kwolf@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 1/2] nbd: Close socket on negotiation
	failure.
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
X-List-Received-Date: Sat, 17 May 2014 08:02:39 -0000

13.05.2014 03:35, Hani Benhabiles wrote:
> Otherwise, the nbd client may hang waiting for the server response.

Applied to -trivial, thanks!

/mjt

