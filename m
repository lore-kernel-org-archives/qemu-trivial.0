Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VSNsr-0001Mc-MW
	for mharc-qemu-trivial@gnu.org; Sat, 05 Oct 2013 05:10:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSNsj-0001EA-W7
	for qemu-trivial@nongnu.org; Sat, 05 Oct 2013 05:10:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSNse-0002Fh-0p
	for qemu-trivial@nongnu.org; Sat, 05 Oct 2013 05:10:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58435)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VSNsQ-000254-Ew; Sat, 05 Oct 2013 05:10:18 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id C7C5640AC6;
	Sat,  5 Oct 2013 13:10:15 +0400 (MSK)
Message-ID: <524FD777.40303@msgid.tls.msk.ru>
Date: Sat, 05 Oct 2013 13:10:15 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1380746429-634-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1380746429-634-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] util/path: Fix type which is longer than
 8 bit for MinGW
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
X-List-Received-Date: Sat, 05 Oct 2013 09:10:44 -0000

03.10.2013 00:40, Stefan Weil wrote:
> While dirent->d_type is 8 bit for most systems, it is 32 bit for MinGW.
> Reducing it to 8 bit results in a compiler warning because the macro
> is_dir_maybe compares that 8 bit value with 32 bit constants.
>
> Using 'unsigned' instead of 'unsigned char' matches the declaration for
> MinGW and does not harm the other systems.
>
> MinGW-w32 is not affected: it does not declare d_type.

That's a good one.

What's the diff between mingw-w32 and mingw?

At any rate, there's - I think - no need to declare it as 'char',
int or unsigned should be just fine.

Thanks, applied to the trivial patches queue.

/mjt

