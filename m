Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VN3JU-0003Ys-PD
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2013 12:12:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN3JN-0003Mp-E7
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 12:12:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN3JH-0002Wf-62
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 12:12:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59032)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VN3J4-0002MY-Vd; Fri, 20 Sep 2013 12:11:47 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id EFE00419B2;
	Fri, 20 Sep 2013 20:11:37 +0400 (MSK)
Message-ID: <523C73B9.1060207@msgid.tls.msk.ru>
Date: Fri, 20 Sep 2013 20:11:37 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1379450395-13460-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1379450395-13460-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] kvm: Fix compiler warning (clang)
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
X-List-Received-Date: Fri, 20 Sep 2013 16:12:11 -0000

18.09.2013 00:39, Stefan Weil wrote:
> Report from clang analyzer:
>
> clock.c:42:15: warning:
> Value stored to 'cpu' during its initialization is never read

Thanks, applied to the trivial patches queue.

/mjt

