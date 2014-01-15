Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W3WIM-0005ao-1M
	for mharc-qemu-trivial@gnu.org; Wed, 15 Jan 2014 14:38:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3WIE-0005OR-FC
	for qemu-trivial@nongnu.org; Wed, 15 Jan 2014 14:38:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3WI8-0005qh-I1
	for qemu-trivial@nongnu.org; Wed, 15 Jan 2014 14:38:26 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50534)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W3WHw-0005p8-Cy; Wed, 15 Jan 2014 14:38:08 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id BBA03413E7;
	Wed, 15 Jan 2014 23:38:07 +0400 (MSK)
Message-ID: <52D6E39F.10200@msgid.tls.msk.ru>
Date: Wed, 15 Jan 2014 23:38:07 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: pavel.zbitskiy@gmail.com
References: <1389432851-11420-1-git-send-email-pavel.zbitskiy@gmail.com>
In-Reply-To: <1389432851-11420-1-git-send-email-pavel.zbitskiy@gmail.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/3] Fix networking for s390x-user
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
X-List-Received-Date: Wed, 15 Jan 2014 19:38:32 -0000

11.01.2014 13:34, pavel.zbitskiy@gmail.com wrote:
> Pavel Zbitskiy (3):
>   linux-user: fixed s390x clone() argument order
>   linux-user: fixed getsockopt() optlen
>   linux-user: fixed recvfrom() addrlen

Thanks, applied all 3 to the trivial-patches queue.

/mjt


