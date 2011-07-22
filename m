Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QkNV7-0004CL-JB
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jul 2011 17:43:17 -0400
Received: from eggs.gnu.org ([140.186.70.92]:56911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QkNV5-00046F-DK
	for qemu-trivial@nongnu.org; Fri, 22 Jul 2011 17:43:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QkNV4-0001au-GA
	for qemu-trivial@nongnu.org; Fri, 22 Jul 2011 17:43:15 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:56227)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>)
	id 1QkNV2-0001aC-0r; Fri, 22 Jul 2011 17:43:12 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	0FB7F7282F9C; Fri, 22 Jul 2011 23:43:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id VA0MVOIE7JGo; Fri, 22 Jul 2011 23:43:09 +0200 (CEST)
Received: from [192.168.178.20] (p54AD9F32.dip.t-dialin.net [84.173.159.50])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	6758A7282F9B; Fri, 22 Jul 2011 23:43:09 +0200 (CEST)
Message-ID: <4E29EEEC.3090803@mail.berlios.de>
Date: Fri, 22 Jul 2011 23:43:08 +0200
From: Stefan Weil <weil@mail.berlios.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
References: <1311190818-4793-1-git-send-email-weil@mail.berlios.de>
	<1A5A263C-4EFA-4BF5-AC6E-937D109C8DA7@web.de>
In-Reply-To: <1A5A263C-4EFA-4BF5-AC6E-937D109C8DA7@web.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] darwin-user: Remove two
	unused variables
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
X-List-Received-Date: Fri, 22 Jul 2011 21:43:16 -0000

Am 22.07.2011 22:48, schrieb Andreas F=E4rber:
> Hi Stefan W.,
>
> Am 20.07.2011 um 21:40 schrieb Stefan Weil:
>
>> cppcheck report:
>>
>> darwin-user/signal.c:322: style: Unused variable: i
>> darwin-user/signal.c:322: style:
>> Variable 'err' is assigned a value that is never used
>
> Does this really bug you? I'm a bit skeptical towards trying to fix=20
> warnings in code that doesn't compile either way... (or does it by now?=
)
>
> Andreas

Hi Andreas,

the warnings were the result of a static code inspection with
a program called cppcheck. I don't compile darwin code,
so I did not notice that the code does not compile.

Is there a good reason to keep those two unused variables?
Fixing the issue helps with static code analysis because
unnecessary manual code checks can be avoided.

Cheers,
Stefan


