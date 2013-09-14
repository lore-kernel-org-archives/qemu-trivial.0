Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKlqR-0000cu-E7
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 05:08:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKlqJ-000818-Mu
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 05:08:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKlno-000460-3r
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 05:06:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54766)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VKlZ2-0000qV-Tm; Sat, 14 Sep 2013 04:50:49 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 249CA41074;
	Sat, 14 Sep 2013 12:50:48 +0400 (MSK)
Message-ID: <52342368.2000509@msgid.tls.msk.ru>
Date: Sat, 14 Sep 2013 12:50:48 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Anthony PERARD <anthony.perard@citrix.com>
References: <1378830978-27578-1-git-send-email-anthony.perard@citrix.com>
In-Reply-To: <1378830978-27578-1-git-send-email-anthony.perard@citrix.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	QEMU-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] docs: Fix IO port number for CPU present
 bitmap.
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
X-List-Received-Date: Sat, 14 Sep 2013 09:08:46 -0000

10.09.2013 20:36, Anthony PERARD wrote:
> -CPU present bitmap (IO port 0xaf00-0xae1f, 1-byte access):
> +CPU present bitmap (IO port 0xaf00-0xaf1f, 1-byte access):

Thanks, applied to the trivial-patches queue.  I can't really
verify whenever this is correct, but let's hope for the best ;)

/mjt

