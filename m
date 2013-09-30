Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQkTk-0000bd-O3
	for mharc-qemu-trivial@gnu.org; Mon, 30 Sep 2013 16:54:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VQkTc-0000Sy-ET
	for qemu-trivial@nongnu.org; Mon, 30 Sep 2013 16:54:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VQkTW-0006fu-E9
	for qemu-trivial@nongnu.org; Mon, 30 Sep 2013 16:53:56 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:56998)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VQkTK-0006du-5t; Mon, 30 Sep 2013 16:53:38 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	0503B72809F3; Mon, 30 Sep 2013 22:53:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id AHNXWDAMYDnZ; Mon, 30 Sep 2013 22:53:34 +0200 (CEST)
Received: from [192.168.178.35] (p54AD8BF3.dip0.t-ipconnect.de
	[84.173.139.243])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	1D58372809F2; Mon, 30 Sep 2013 22:53:34 +0200 (CEST)
Message-ID: <5249E4CD.1050605@weilnetz.de>
Date: Mon, 30 Sep 2013 22:53:33 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1380469272-19230-1-git-send-email-sw@weilnetz.de>	<52488A00.6000405@msgid.tls.msk.ru>
	<52488E98.3060505@weilnetz.de>
	<871u46iq96.fsf@blackfin.pond.sub.org>
In-Reply-To: <871u46iq96.fsf@blackfin.pond.sub.org>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] migration: Fix compiler
 warning ('caps' may be used uninitialized)
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
X-List-Received-Date: Mon, 30 Sep 2013 20:54:03 -0000

Am 30.09.2013 11:59, schrieb Markus Armbruster:
> Stefan Weil <sw@weilnetz.de> writes:
>> Am 29.09.2013 22:13, schrieb Michael Tokarev:
>>> 29.09.2013 19:41, Stefan Weil wrote:
>>>> The QEMU buildbot default_i386_debian_6_0 shows this warning:
>>>>
>>>>    CC    migration.o
>>>> migration.c: In function 'qmp_query_migrate_capabilities':
>>>> migration.c:149: warning:
>>>>   'caps' may be used uninitialized in this function
>>> Gah, how disgusting.  The code is correct, yet gcc complains
>>> needlessly...
>> That's not the first time where we help the compiler by modifying the code.
> It's also not the first time where attempting to "help" the compiler
> made code less readable, or even less correct.  So let's be just as
> careful as with "real" changes.

Well, I try to do my best. ;-)

Is there anything wrong with my patch? I think the code looks cleaner
than before.

If there is a better way to fix the problem that's fine, too.

The problem withthe buildbot showing a compiler warning exists and we
should fix it somehow.

Regards,
Stefan


