Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKBzq-0003Qo-Tq
	for mharc-qemu-trivial@gnu.org; Thu, 12 Sep 2013 14:52:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKBzj-0003Hf-GU
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:52:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKBzd-0004wL-FS
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:51:59 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49663)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VKBzR-0004t7-15; Thu, 12 Sep 2013 14:51:41 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 52B8D40ECD;
	Thu, 12 Sep 2013 22:51:40 +0400 (MSK)
Message-ID: <52320D3C.7070104@msgid.tls.msk.ru>
Date: Thu, 12 Sep 2013 22:51:40 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Michal Privoznik <mprivozn@redhat.com>
References: <58dbd819c4270169fa26487cf1e7220b11c363ac.1378378402.git.mprivozn@redhat.com>
In-Reply-To: <58dbd819c4270169fa26487cf1e7220b11c363ac.1378378402.git.mprivozn@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH RESEND] configure: Undefine
 _FORTIFY_SOURCE prior using it
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
X-List-Received-Date: Thu, 12 Sep 2013 18:52:05 -0000

05.09.2013 14:54, Michal Privoznik wrote:
> Currently, we are enforcing the _FORTIFY_SOURCE=2 without any
> previous detection if the macro has been already defined, e.g.
> by environment, or is just enabled by compiler by default.

Thanks, applied to the trivial-patches queue
(combined with the similar patch by Jan Vesely).

/mjt

