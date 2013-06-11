Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmMhE-000206-C9
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 07:25:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmMhB-0001ub-Ml
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 07:25:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmMhA-0007PP-GK
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 07:25:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57456)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UmMh7-0007Ou-RQ; Tue, 11 Jun 2013 07:24:58 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 09EFC411FC;
	Tue, 11 Jun 2013 15:24:57 +0400 (MSK)
Message-ID: <51B70908.4050705@msgid.tls.msk.ru>
Date: Tue, 11 Jun 2013 15:24:56 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Peter Wu <lekensteyn@gmail.com>
References: <1502140.O0l1epaFmp@al>
In-Reply-To: <1502140.O0l1epaFmp@al>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] gtk: implement -full-screen
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
X-List-Received-Date: Tue, 11 Jun 2013 11:25:02 -0000

10.06.2013 22:04, Peter Wu wrote:
> Aiming for GTK as replacement for SDL, a feature like -full-screen should also
> be implemented.
> 
> Bringing the window into full-screen mode is done by activating the "Fullscreen"
> menu item. This is done after showing the windows to make the cursor and menu
> hidden.
> 
> v2: drop -no-frame implementation, use booleans instead of ints and ensure
>     consistency between ui state and menu.

Thanks,  applied to the trivial-patches queue.

/mjt

