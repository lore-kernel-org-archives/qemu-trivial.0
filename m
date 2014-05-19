Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WmIKM-0001iM-QI
	for mharc-qemu-trivial@gnu.org; Mon, 19 May 2014 03:49:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WmIKE-0001WD-VS
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 03:49:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WmIK8-0007Gp-O1
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 03:49:34 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58287)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WmIJw-0007F2-6h; Mon, 19 May 2014 03:49:16 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5904541BD9;
	Mon, 19 May 2014 11:49:15 +0400 (MSK)
Message-ID: <5379B77B.9000606@msgid.tls.msk.ru>
Date: Mon, 19 May 2014 11:49:15 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <1400336958-32463-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1400336958-32463-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Automatically select GTK+ 3.0
 if GTK+ 2.0 is unavailable
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
X-List-Received-Date: Mon, 19 May 2014 07:49:41 -0000

17.05.2014 18:29, Stefan Weil wrote:
> The configure option --with-gtkabi=3.0 is still supported, but no longer
> needed when GTK+-2.0 is missing. When no GTK+ ABI is selected by the
> user, configure first tries 2.0, then 3.0.
> 
> For some platforms (e.g. Windows) newer binaries of GTK+ are only
> available for GTK+ 3.0. Now building on these platforms is a little bit
> easier.

This is something I wanted to do for a long time (but before I disabled
gtk entirely :).

Applied to -trivial, thank you!

/mjt

