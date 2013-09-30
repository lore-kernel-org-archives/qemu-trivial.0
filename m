Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQaH5-0005eM-WE
	for mharc-qemu-trivial@gnu.org; Mon, 30 Sep 2013 06:00:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1VQaGz-0005WJ-3p
	for qemu-trivial@nongnu.org; Mon, 30 Sep 2013 06:00:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1VQaGt-0003gV-CM
	for qemu-trivial@nongnu.org; Mon, 30 Sep 2013 06:00:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58427)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1VQaGh-0003NM-BT; Mon, 30 Sep 2013 05:59:55 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8U9xskh024200
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 30 Sep 2013 05:59:54 -0400
Received: from blackfin.pond.sub.org (ovpn-116-35.ams2.redhat.com
	[10.36.116.35])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8U9xnQl031156
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 30 Sep 2013 05:59:51 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 1CA64200BF; Mon, 30 Sep 2013 11:59:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
References: <1380469272-19230-1-git-send-email-sw@weilnetz.de>
	<52488A00.6000405@msgid.tls.msk.ru> <52488E98.3060505@weilnetz.de>
Date: Mon, 30 Sep 2013 11:59:49 +0200
In-Reply-To: <52488E98.3060505@weilnetz.de> (Stefan Weil's message of "Sun, 29
	Sep 2013 22:33:28 +0200")
Message-ID: <871u46iq96.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Mon, 30 Sep 2013 10:00:19 -0000

Stefan Weil <sw@weilnetz.de> writes:

> Am 29.09.2013 22:13, schrieb Michael Tokarev:
>> 29.09.2013 19:41, Stefan Weil wrote:
>>> The QEMU buildbot default_i386_debian_6_0 shows this warning:
>>>
>>>    CC    migration.o
>>> migration.c: In function 'qmp_query_migrate_capabilities':
>>> migration.c:149: warning:
>>>   'caps' may be used uninitialized in this function
>>
>> Gah, how disgusting.  The code is correct, yet gcc complains
>> needlessly...
>
> That's not the first time where we help the compiler by modifying the code.

It's also not the first time where attempting to "help" the compiler
made code less readable, or even less correct.  So let's be just as
careful as with "real" changes.

