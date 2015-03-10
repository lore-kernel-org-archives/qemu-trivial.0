Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVDYS-0000b7-M2
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2015 02:22:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YVDYR-0000ZO-4s
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 02:22:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1YVDYQ-0001ZF-DI
	for qemu-trivial@nongnu.org; Tue, 10 Mar 2015 02:22:11 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:39769)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1YVDYM-0001YU-AY; Tue, 10 Mar 2015 02:22:06 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	7126B1180041; Tue, 10 Mar 2015 07:22:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id ix7GqIOFBQMj; Tue, 10 Mar 2015 07:22:03 +0100 (CET)
Received: from [192.168.178.24] (p54ACAA0C.dip0.t-ipconnect.de [84.172.170.12])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	9B6A51180040; Tue, 10 Mar 2015 07:22:03 +0100 (CET)
Message-ID: <54FE8D8B.3070807@weilnetz.de>
Date: Tue, 10 Mar 2015 07:22:03 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1425838487-28274-1-git-send-email-sw@weilnetz.de>
	<54FE896B.1000802@msgid.tls.msk.ru>
In-Reply-To: <54FE896B.1000802@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 1/7] backends: Fix warning from Sparse
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
X-List-Received-Date: Tue, 10 Mar 2015 06:22:11 -0000

Am 10.03.2015 um 07:04 schrieb Michael Tokarev:
> Applied all 7 to -trivial.
>
> Is it intentional that there's no cover letter for the series?
>
> Thanks,
>
> /mjt

No, that was my mistake. Please excuse also the cris patch which I sent 
twice.
I did not notice that it already had caused trouble, nor did I notice 
that I had already sent it.
In my local patch queue (~ 50 patches) there was even a 2nd cris patch
which removed the unused variables...

Regards
Stefan


