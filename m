Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnoIb-00059o-8s
	for mharc-qemu-trivial@gnu.org; Sat, 15 Jun 2013 07:05:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnoIY-00056Y-Ax
	for qemu-trivial@nongnu.org; Sat, 15 Jun 2013 07:05:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnoIX-0002st-1Z
	for qemu-trivial@nongnu.org; Sat, 15 Jun 2013 07:05:34 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45883)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnoIV-0002sQ-28; Sat, 15 Jun 2013 07:05:31 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 78F2E41740;
	Sat, 15 Jun 2013 15:05:28 +0400 (MSK)
Message-ID: <51BC4A77.7020308@msgid.tls.msk.ru>
Date: Sat, 15 Jun 2013 15:05:27 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Peter Wu <lekensteyn@gmail.com>
References: <1371292923-28105-1-git-send-email-mjt@msgid.tls.msk.ru>
	<12048990.5frBUX2jFf@al>
In-Reply-To: <12048990.5frBUX2jFf@al>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH trivial] vl: always define no_frame
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
X-List-Received-Date: Sat, 15 Jun 2013 11:05:35 -0000

15.06.2013 14:51, Peter Wu wrote:
> On Saturday 15 June 2013 14:42:03 Michael Tokarev wrote:
> 
>> Commit 047d4e151dd46 "Unbreak -no-quit for GTK, validate SDL options" broke
>> build of qemu without sdl, by referencing `no_frame' variable which is
>> defined inside #if SDL block. Fix that by defining that variable
>> unconditionally.
> 
> Reviewed-by: Peter Wu <lekensteyn@gmail.com>

Thanks!

> As for the discussion about legacy options[1], are there plans to remove `-sdl` (replaced by `-display sdl`) and move the `-*-grab` and `-no-frame` to `-display sdl` options? If that is the idea, what about printing a message that the mentioned options are deprecated and removed in a future version?

This is already done for sdl, see select_display() function in vl.c --
it handles -display sdl,frame={on|off},...

It is unlikely the old options will be removed any time soon, and
these will not likely print any warnings either -- this hasn't done
for lots of other old options (-stdvga for example).

Thanks,

/mjt

