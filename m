Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9Jf8-0008Hw-Tl
	for mharc-qemu-trivial@gnu.org; Wed, 05 Sep 2012 13:45:14 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1T9Jf2-00080b-Pa
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 13:45:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1T9Jf1-0003gx-ON
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 13:45:08 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:43905)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1T9Jez-0003X4-Ev; Wed, 05 Sep 2012 13:45:05 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	AB599728002B; Wed,  5 Sep 2012 19:45:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id WeFg5SBN4rfk; Wed,  5 Sep 2012 19:45:03 +0200 (CEST)
Received: from flocke.weilnetz.de (p5086FA69.dip.t-dialin.net [80.134.250.105])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	40CF07280029; Wed,  5 Sep 2012 19:45:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1T9Jew-0001WB-Iw; Wed, 05 Sep 2012 19:45:02 +0200
Message-ID: <50478F9E.80403@weilnetz.de>
Date: Wed, 05 Sep 2012 19:45:02 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20120724 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1346703803-22003-1-git-send-email-sw@weilnetz.de>	<504774FF.6000501@suse.de>	<CAJSP0QXtri4UNmdriCFiTg4_m+-a0CBpG36FYFdXQ1XcJywNww@mail.gmail.com>
	<504788BB.7030609@weilnetz.de>
In-Reply-To: <504788BB.7030609@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] sparc-dis: Remove redundant
	NULL check
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
X-List-Received-Date: Wed, 05 Sep 2012 17:45:13 -0000

Am 05.09.2012 19:15, schrieb Stefan Weil:
>
> AFAIK, binutils moved to GPL 3. Therefore I don't expect that
> QEMU will update to upstream in the next years.
>
> We'll have to maintain the code which we have.
>
> Try "git log *-dis.c" or "gitk *-dis.c": there are already lots
> of more trivial changes which got applied to the disassembler files.
>
> => The patch should be applied.
>
> Regards,
> Stefan

Here is some additional information:

binutils switched from GPL 2 to GPL 3 with version 2.18:

Changes in 2.18:

* The binutils sources are now released under version 3 of the GNU General
   Public License.


sparc-dis.c is already based on 2.17, so we won't get anything newer.
Even the latest version still uses the redundant NULL check, so I
can send my patch to the binutils maintainers, too.

Regards,
Stefan


