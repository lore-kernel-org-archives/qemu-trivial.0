Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wtcwj-0001N3-T0
	for mharc-qemu-trivial@gnu.org; Sun, 08 Jun 2014 09:15:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wtcwc-0001KH-Gj
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 09:15:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WtcwW-0002Cc-3q
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 09:15:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51786)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WtcwJ-00029Y-DW; Sun, 08 Jun 2014 09:15:11 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E669B40DD7;
	Sun,  8 Jun 2014 17:15:10 +0400 (MSK)
Message-ID: <539461DE.5050700@msgid.tls.msk.ru>
Date: Sun, 08 Jun 2014 17:15:10 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1402063613-12400-1-git-send-email-pbonzini@redhat.com>
	<1402063613-12400-2-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1402063613-12400-2-git-send-email-pbonzini@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] x86: correctly implement soft reset
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
X-List-Received-Date: Sun, 08 Jun 2014 13:15:37 -0000

06.06.2014 18:06, Paolo Bonzini wrote:
> Do not do a hard reset for port 92h, keyboard controller, or cf9h soft reset.
> These only reset the CPU.

I'm not sure how this is -trivial material? :)

Thanks,

/mjt

