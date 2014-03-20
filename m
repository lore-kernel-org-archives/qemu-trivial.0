Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQfMG-00085T-A0
	for mharc-qemu-trivial@gnu.org; Thu, 20 Mar 2014 11:58:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35158)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WQfM8-0007sY-TX
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 11:58:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WQfM2-0004O7-Uj
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 11:58:08 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48734)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WQfLq-00049K-K3; Thu, 20 Mar 2014 11:57:50 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 828B542D09;
	Thu, 20 Mar 2014 19:57:49 +0400 (MSK)
Message-ID: <532B0FFD.6020401@msgid.tls.msk.ru>
Date: Thu, 20 Mar 2014 19:57:49 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <1395092786-12641-1-git-send-email-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <1395092786-12641-1-git-send-email-mark.cave-ayland@ilande.co.uk>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/2] Trivial documentation updates for
 sun4m/PowerPC
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
X-List-Received-Date: Thu, 20 Mar 2014 15:58:15 -0000

18.03.2014 01:46, Mark Cave-Ayland wrote:
> Hi all,
> 
> Here are a couple of minor documentation updates - the first is for sun4m and 
> is primarily concerned with documenting the new CG3 framebuffer whilst touching
> up a couple of minor errors. The second updates the documentation with respect
> to the default PowerPC framebuffer settings which was changed in QEMU 1.7 to
> 800x600x32.

Thanks, applied both to -trivial.

/mjt

