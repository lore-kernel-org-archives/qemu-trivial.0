Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhCGC-0003NK-HH
	for mharc-qemu-trivial@gnu.org; Thu, 23 Oct 2014 02:52:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XhCG6-0003FF-FB
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 02:52:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XhCG1-0005kk-Gd
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 02:52:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:14791)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XhCFq-0005Oq-Fk; Thu, 23 Oct 2014 02:52:14 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9N6q9vg008965
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 23 Oct 2014 02:52:09 -0400
Received: from blackfin.pond.sub.org (ovpn-116-30.ams2.redhat.com
	[10.36.116.30])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9N6q7OP013512
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 23 Oct 2014 02:52:09 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3B85F303F175; Thu, 23 Oct 2014 08:52:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1411097848-3900-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<541D8812.1040406@msgid.tls.msk.ru>
	<87ppeow4uk.fsf@blackfin.pond.sub.org>
	<541FD10D.8000809@msgid.tls.msk.ru>
	<5448A14D.7070007@msgid.tls.msk.ru>
Date: Thu, 23 Oct 2014 08:52:07 +0200
In-Reply-To: <5448A14D.7070007@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Thu, 23 Oct 2014 10:33:49 +0400")
Message-ID: <8738afxoq0.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, zhanghailiang <zhang.zhanghailiang@huawei.com>,
	luonengjun@huawei.com, qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] vl: Fix possible freed
	memory accessing
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
X-List-Received-Date: Thu, 23 Oct 2014 06:52:35 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> On 09/22/2014 11:34 AM, Michael Tokarev wrote:
>> 22.09.2014 10:23, Markus Armbruster wrote:
>>> Michael Tokarev <mjt@tls.msk.ru> writes:
>>>
>>>> Applied to -trivial, thank you!
>>>
>>> Makes my 'hmp: Remove "info pcmcia"' conflict.  Either revert this one
>>> before applying mine, or resolve the conflict and drop the paragraph
>>> about the bug from my commit message.
>> 
>> Okay, I'll keep an eye on this -- I'm reverting the trivial patch
>> for now.
>
> So it looks like the original patch by zhanghailiang still applies,
> and your patch, `info pcmcia' removal, hasn't been applied for over
> a month. Should I apply the bugfix by zhanghailiang finally?

Please give me a few more days to try getting it committed.

