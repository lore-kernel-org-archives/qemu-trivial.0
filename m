Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UYzNn-0003mE-Vl
	for mharc-qemu-trivial@gnu.org; Sun, 05 May 2013 09:53:43 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UYzNl-0003iT-9E
	for qemu-trivial@nongnu.org; Sun, 05 May 2013 09:53:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UYzNj-0005R8-VT
	for qemu-trivial@nongnu.org; Sun, 05 May 2013 09:53:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38663)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UYzNg-0005Ne-3M; Sun, 05 May 2013 09:53:36 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 92A364000C;
	Sun,  5 May 2013 17:53:26 +0400 (MSK)
Message-ID: <51866456.4040300@msgid.tls.msk.ru>
Date: Sun, 05 May 2013 17:53:26 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Ed Maste <emaste@freebsd.org>
References: <1367419253-53868-1-git-send-email-emaste@freebsd.org>
In-Reply-To: <1367419253-53868-1-git-send-email-emaste@freebsd.org>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] m25p80.c: Sync Flash chip list with Linux
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
X-List-Received-Date: Sun, 05 May 2013 13:53:42 -0000

01.05.2013 18:40, Ed Maste wrote:
> Add new devices for various manufacturers, and re-sort Spansion list to
> match the order in Linux, which requires chips with a non-zero extended ID
> to come first.
> 
> With this commit the outstanding differences to Linux rev 55bf75b are:
> 
> - Erase size flag differences in s25sl032p, s25sl064p, s25fl016k, s25fl064k
>   (These devices have only some blocks that support small erase sizes.)
> - Linux lacks n25q128
> - Devices without a Jedec ID have been excluded

Added to the trivial patch queue (dc8fab46180b7368f39b317202b98a12b802e1e3).
Thank you!

/mjt

