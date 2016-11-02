Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1wPY-0002Vh-Dj
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 10:21:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c1wPT-0002S5-TV
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 10:21:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c1wPP-0000SB-Tv
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 10:20:59 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43623)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c1wPG-0000MB-Ui; Wed, 02 Nov 2016 10:20:47 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9DEF94036B;
	Wed,  2 Nov 2016 17:20:44 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 8A927B2C;
	Wed,  2 Nov 2016 17:20:43 +0300 (MSK)
To: Markus Armbruster <armbru@redhat.com>
References: <1477728462-16774-1-git-send-email-mjt@msgid.tls.msk.ru>
	<87ziliqkzi.fsf@dusky.pond.sub.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <0cbc1332-3b6f-5168-1563-2acf0b5ba7ec@msgid.tls.msk.ru>
Date: Wed, 2 Nov 2016 17:20:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <87ziliqkzi.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] vl.c: move pidfile creation up
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Nov 2016 14:21:03 -0000

02.11.2016 12:39, Markus Armbruster wrote:
> Michael Tokarev <mjt@tls.msk.ru> writes:
> 
>> With current code, pid file is open after various
>> sockets, chardevs, fsdevs and the like.  This causes
>> interesting effects, for example when monitor is a
>> unix-socket, and another qemu instance is already
>> running, new qemu first "damages" the socket and
>> next complain that it can't acquire the pid file and
>> exits, making running qemu unreachable.
..
> ... is this early enough?  For instance, we clobber the log file another
> 200 lines further up.

Yeah, you're right.  There's also some tracing initing in
there and other potentially interesting stuff.

I moved the pid file creation right after the os_daemonize()
call.  Before this point we don't even know our pid.

> A "don't clobber anything externally visible before this spot" comment
> could be useful.

Hopefully this is "early enough" to not need this comment :)

Thanks,

/mjt

