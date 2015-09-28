Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZguQL-0000HT-KP
	for mharc-qemu-trivial@gnu.org; Tue, 29 Sep 2015 08:54:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59552)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZgaD0-0000B8-FC
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 11:19:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZgaCw-000806-D3
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 11:19:18 -0400
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80]:47561)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1ZgaCm-0007vW-Gy; Mon, 28 Sep 2015 11:19:04 -0400
Received: from localhost (localhost [127.0.0.1])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id 625D9101105;
	Mon, 28 Sep 2015 17:19:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
	by localhost (smtp.mail.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id w9aEVCqWc6Z1; Mon, 28 Sep 2015 17:19:03 +0200 (CEST)
Received: from [134.155.36.73] (edv13.bib.uni-mannheim.de [134.155.36.73])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTPSA id 405451010F8;
	Mon, 28 Sep 2015 17:19:03 +0200 (CEST)
To: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <1443211950-8207-1-git-send-email-sw@weilnetz.de>
	<871tdjni3w.fsf@blackfin.pond.sub.org> <5608F9BC.603@weilnetz.de>
	<5609576F.2060407@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
X-Enigmail-Draft-Status: N1110
Message-ID: <56095A66.8050003@weilnetz.de>
Date: Mon, 28 Sep 2015 17:19:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <5609576F.2060407@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 134.155.96.80
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] trace/simple: Fix warning
 and wrong trace file name for MinGW
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
X-List-Received-Date: Mon, 28 Sep 2015 15:19:24 -0000

Am 28.09.2015 um 17:06 schrieb Eric Blake:
> On 09/28/2015 02:26 AM, Stefan Weil wrote:
>
>>> Can you explain why osdep.h's
>>>
>>>     #define FMT_pid "%" PRId64
>>>
>>> is appropriate for Windows?
>> Don't blame me for any strangeness which you might find in Windows. :-)
>>
>> Mingw-w64 sys/types.h defines pid_t to be either an int or an __int64.
>> FMT_pid must match these definitions.
>>
>> But getpid returns an int, not a pid_t...
> Can we 1) file a bug against mingw for their buggy getpid(), and 2)
> write a wrapper that makes getpid() always return pid_t in the meantime?

1) No, because MinGW and Mingw-w64 use the same declaration as MS.
They cannot change that, of course. Nor will MS correct this after many
years, for obvious reasons.

2) We could use a wrapper qemu_getpid or #define getpid() ((pid_t)getpid()).
But that would require several other code changes.


