Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xm0db-0007BC-Da
	for mharc-qemu-trivial@gnu.org; Wed, 05 Nov 2014 08:28:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Xm0dV-00074j-FK
	for qemu-trivial@nongnu.org; Wed, 05 Nov 2014 08:28:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Xm0dQ-0000jg-MG
	for qemu-trivial@nongnu.org; Wed, 05 Nov 2014 08:28:33 -0500
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:33891 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1Xm0dQ-0000jK-Fo; Wed, 05 Nov 2014 08:28:28 -0500
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1Xm1AX-0007aq-3w; Wed, 05 Nov 2014 15:02:41 +0100
References: <1415098223-32404-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1415098223-32404-2-git-send-email-zhang.zhanghailiang@huawei.com>
	<874mufumgk.fsf@linaro.org> <5459CC56.1030109@msgid.tls.msk.ru>
	<545A15C8.6090501@huawei.com>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
In-reply-to: <545A15C8.6090501@huawei.com>
Date: Wed, 05 Nov 2014 13:28:27 +0000
Message-ID: <87zjc5srno.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	armbru@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 1/5] qemu-char: fix
	parameter check in some qemu_chr_parse_* functions
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
X-List-Received-Date: Wed, 05 Nov 2014 13:28:38 -0000


zhanghailiang <zhang.zhanghailiang@huawei.com> writes:

> On 2014/11/5 15:05, Michael Tokarev wrote:
>> 04.11.2014 16:25, Alex Bennée wrote:
>>> zhanghailiang <zhang.zhanghailiang@huawei.com> writes:
<snip>
>> a good reason for having assert here.
>>
>
> Agreed, assert here is still not unnecessary,
> filename will never to be NULL in these two cases.
>
>>> At a minimum I'd replace it with a g_assert(filename) to make the
>>> calling contract clear.
>>
>> This is an internal set of APIs for a chr device, each kind is
>> having a pair of functions which are called in order (first parse,
>> next open), -- _that_ is the contract.

assert isn't really about informing the user, it just makes an explicit
statement that this API will always have a filled in filename and if it
ever gets a NULL that's a programming bug in using the API, internal or
otherwise.

>> []
>>> All this boilerplate checking makes me think that either the qemu_opt
>>> machinery should be ensuring we get a valid option string?
>>
>> Might be a good idea, yes, but that'd be a huge change, since that
>> should be done in a lot of places, and in many cases we can't
>> express our rules easily (eg, only one of two parameters should
>> be present).  I think at this stage adding simple checks to
>> _parse functions is the way to go, and it is easy to read too.

Yes, I wasn't intending to suggest expanding this patch set to encompase
the larger task ;-)

-- 
Alex Bennée

