Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKm4Z-00056m-Px
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 05:23:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKm4T-0004xT-8x
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 05:23:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKm4N-00021z-AT
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 05:23:17 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51999)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VKlha-0002Ys-2c; Sat, 14 Sep 2013 04:59:38 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 4CA7041074;
	Sat, 14 Sep 2013 12:59:37 +0400 (MSK)
Message-ID: <52342579.7040607@msgid.tls.msk.ru>
Date: Sat, 14 Sep 2013 12:59:37 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1379008635-17714-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1379008635-17714-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Blue Swirl <blauwirbel@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] *-user: Improve documentation for
 lock_user function
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
X-List-Received-Date: Sat, 14 Sep 2013 09:23:23 -0000

12.09.2013 21:57, Stefan Weil wrote:
> Add a missing "function" and replace "and" by "any".
> BSD und Linux use the same documentation here, so fix both.

Thanks, applied to the trivial-patches queue (with the commit
comment fixup).

/mjt

