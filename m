Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQv02-0001FQ-Vw
	for mharc-qemu-trivial@gnu.org; Tue, 01 Oct 2013 04:08:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1VQuzv-00016d-Ox
	for qemu-trivial@nongnu.org; Tue, 01 Oct 2013 04:08:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1VQuzq-0004aZ-SE
	for qemu-trivial@nongnu.org; Tue, 01 Oct 2013 04:07:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58016)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1VQuzg-0004Xa-Os; Tue, 01 Oct 2013 04:07:44 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9187hic014628
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 1 Oct 2013 04:07:43 -0400
Received: from blackfin.pond.sub.org (ovpn-116-37.ams2.redhat.com
	[10.36.116.37])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r9187e0G015691
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 1 Oct 2013 04:07:41 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A4AB9200BF; Tue,  1 Oct 2013 10:07:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
References: <1380469272-19230-1-git-send-email-sw@weilnetz.de>
	<52488A00.6000405@msgid.tls.msk.ru> <52488E98.3060505@weilnetz.de>
	<871u46iq96.fsf@blackfin.pond.sub.org> <5249E4CD.1050605@weilnetz.de>
Date: Tue, 01 Oct 2013 10:07:39 +0200
In-Reply-To: <5249E4CD.1050605@weilnetz.de> (Stefan Weil's message of "Mon, 30
	Sep 2013 22:53:33 +0200")
Message-ID: <878uydh0s4.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
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
X-List-Received-Date: Tue, 01 Oct 2013 08:08:05 -0000

Stefan Weil <sw@weilnetz.de> writes:

> Am 30.09.2013 11:59, schrieb Markus Armbruster:
>> Stefan Weil <sw@weilnetz.de> writes:
>>> Am 29.09.2013 22:13, schrieb Michael Tokarev:
>>>> 29.09.2013 19:41, Stefan Weil wrote:
>>>>> The QEMU buildbot default_i386_debian_6_0 shows this warning:
>>>>>
>>>>>    CC    migration.o
>>>>> migration.c: In function 'qmp_query_migrate_capabilities':
>>>>> migration.c:149: warning:
>>>>>   'caps' may be used uninitialized in this function
>>>> Gah, how disgusting.  The code is correct, yet gcc complains
>>>> needlessly...
>>> That's not the first time where we help the compiler by modifying the code.
>> It's also not the first time where attempting to "help" the compiler
>> made code less readable, or even less correct.  So let's be just as
>> careful as with "real" changes.
>
> Well, I try to do my best. ;-)
>
> Is there anything wrong with my patch? I think the code looks cleaner
> than before.

Michael disagrees, and I can see his points.

> If there is a better way to fix the problem that's fine, too.
>
> The problem withthe buildbot showing a compiler warning exists and we
> should fix it somehow.

The warning is bogus, and current compilers don't seem to emit it.  If
you can remove the warning by improving the code (or at least not making
it worse), then go right ahead anyway.

