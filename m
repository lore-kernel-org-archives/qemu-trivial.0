Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VcBZD-00086W-2h
	for mharc-qemu-trivial@gnu.org; Fri, 01 Nov 2013 06:02:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VcBZ5-0007v6-KV
	for qemu-trivial@nongnu.org; Fri, 01 Nov 2013 06:02:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VcBYz-0006M9-JZ
	for qemu-trivial@nongnu.org; Fri, 01 Nov 2013 06:02:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36401)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VcBYn-0006Ii-DO; Fri, 01 Nov 2013 06:02:33 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id ABE8C4003C;
	Fri,  1 Nov 2013 14:02:32 +0400 (MSK)
Message-ID: <52737C38.5090300@msgid.tls.msk.ru>
Date: Fri, 01 Nov 2013 14:02:32 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Jan Krupa <JKrupa@suse.com>
References: <8f4fa5abe5690da612b33b2dd2602098e0e1820d.1381925918.git.JKrupa@suse.com>
In-Reply-To: <8f4fa5abe5690da612b33b2dd2602098e0e1820d.1381925918.git.JKrupa@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [v2,2/4] qemu-char: add Czech keymap file
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
X-List-Received-Date: Fri, 01 Nov 2013 10:02:57 -0000

16.10.2013 16:40, Jan Krupa wrote:
> This patch adds Czech keyboard layout to available keymap files
> and Makefile.

Thanks, applied to the trivial-patches queue.

Again, I rely solely on you for the correctness of the keymap itself.
I'm sorry this took so long.

/mjt

