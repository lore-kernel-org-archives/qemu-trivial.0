Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ta2Jk-0006zG-Jk
	for mharc-qemu-trivial@gnu.org; Sun, 18 Nov 2012 05:41:36 -0500
Received: from eggs.gnu.org ([208.118.235.92]:56720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Ta2Jg-0006my-CZ
	for qemu-trivial@nongnu.org; Sun, 18 Nov 2012 05:41:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Ta2Jd-0005aT-AR
	for qemu-trivial@nongnu.org; Sun, 18 Nov 2012 05:41:32 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:56184)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Ta2JW-0005ZU-VL; Sun, 18 Nov 2012 05:41:23 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	E2681728003A; Sun, 18 Nov 2012 11:41:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id YuCSNHra42as; Sun, 18 Nov 2012 11:41:21 +0100 (CET)
Received: from flocke.fritz.box (p54ADBD8C.dip.t-dialin.net [84.173.189.140])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	63D61728002F; Sun, 18 Nov 2012 11:41:21 +0100 (CET)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.fritz.box with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1Ta2JU-0001BZ-Rs; Sun, 18 Nov 2012 11:41:20 +0100
Message-ID: <50A8BB50.5040905@weilnetz.de>
Date: Sun, 18 Nov 2012 11:41:20 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20121027 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1353170443-18168-1-git-send-email-sw@weilnetz.de>
	<50A8A264.4090705@redhat.com>
In-Reply-To: <50A8A264.4090705@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-common: Add definition for
	O_NONBLOCK
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
X-List-Received-Date: Sun, 18 Nov 2012 10:41:35 -0000

Am 18.11.2012 09:55, schrieb Paolo Bonzini:
> Il 17/11/2012 17:40, Stefan Weil ha scritto:
>> backends/rng-random.c which was added by commit
>> 5c74521d249486fa3e749dbbf6d56a70d4d7235f needs
>> macro O_NONBLOCK.
>>
>> The macro O_NONBLOCK is not defined for all hosts.
>> Adding a default definition fixes builds for MinGW.
>>
>> Signed-off-by: Stefan Weil<sw@weilnetz.de>
>> ---
>>
>> This is a build fix. Therefore I'd appreciate if it could be
>> committed soon.
>
> This would make things blocking when they were supposed to be
> nonblocking, so I'd prefer not including it.  I thought Anthony had a
> fix too?
>
> Paolo

Yes, my patch is only a quick fix to enable builds with MinGW again.

Anthony's patch solves the same problem by omitting the code in
comiplations for non-POSIX builds.

My primary goal was fixing the build, so any of these two patches
is fine for me.

A backends/rng-random.c which compiles with MinGW would be even better,
but maybe that needs a little more time. /dev/random is available with
MinGW, so there is no basic problem doing this.

Stefan


