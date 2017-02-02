Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cZEXE-0002Gy-UQ
	for mharc-qemu-trivial@gnu.org; Thu, 02 Feb 2017 05:22:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cZEXC-0002F7-D3
	for qemu-trivial@nongnu.org; Thu, 02 Feb 2017 05:22:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cZEX8-0004ox-2M
	for qemu-trivial@nongnu.org; Thu, 02 Feb 2017 05:22:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51170)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cZESD-00036O-GE; Thu, 02 Feb 2017 05:17:25 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 42A3A7E9F2;
	Thu,  2 Feb 2017 10:17:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-50.ams2.redhat.com
	[10.36.116.50])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v12AHNvI018648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 2 Feb 2017 05:17:24 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6207D1138646; Thu,  2 Feb 2017 11:17:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, patches@linaro.org
References: <1485879287-12548-1-git-send-email-peter.maydell@linaro.org>
	<87wpdbw2ki.fsf@dusky.pond.sub.org>
	<157b55c5-2927-5f4e-0c43-820abd75a6d2@redhat.com>
	<874m0ejth1.fsf@dusky.pond.sub.org>
	<6c841220-8219-69fc-413f-c6ad320fe2ed@redhat.com>
Date: Thu, 02 Feb 2017 11:17:22 +0100
In-Reply-To: <6c841220-8219-69fc-413f-c6ad320fe2ed@redhat.com> (Paolo
	Bonzini's message of "Wed, 1 Feb 2017 17:09:00 -0800")
Message-ID: <87vass7v7x.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 02 Feb 2017 10:17:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Drop QEMU_GNUC_PREREQ()
 checks for gcc older than 4.1
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
X-List-Received-Date: Thu, 02 Feb 2017 10:22:35 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 31/01/2017 22:49, Markus Armbruster wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>> 
>>> On 31/01/2017 12:40, Markus Armbruster wrote:
>>>>>  
>>>>>  #define QEMU_NORETURN __attribute__ ((__noreturn__))
>>>>>  
>>>>> -#if QEMU_GNUC_PREREQ(3, 4)
>>>>>  #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
>>>>> -#else
>>>>> -#define QEMU_WARN_UNUSED_RESULT
>>>>> -#endif
>>>> Should we inline this macro?
>>>>
>>>>>  
>>>>> -#if QEMU_GNUC_PREREQ(4, 0)
>>>>>  #define QEMU_SENTINEL __attribute__((sentinel))
>>>>> -#else
>>>>> -#define QEMU_SENTINEL
>>>>> -#endif
>>>> Likewise.
>>>
>>> Why, since we don't do that for QEMU_NORETURN, QEMU_PACKED, etc.?
>> 
>> Because we do it for aligned, always_inline, constructor, format, mode,
>> noinline, and in places even noreturn and packed:
>> 
>>     $ git-grep __attribute__ | sed '/define/d;s/.*__attribute__ *((\([A-Za-z0-9_]*\).*/\1/' | sort -u
>> 
>
> Uh oh. :)  You have to remove uses in firmware and in imported code
> (which covers mode, format and noreturn), but there's certainly room for
> some BiteSizedTasks.
>
> For sure noinline should be wrapped by a macro so that you also include
> noclone (usually you want to thwart some compiler optimization so both
> are needed).
>
> That leaves aligned, always_inline and constructor.  always_inline has
> three users, constructors has many, aligned has many and there's
> QEMU_ALIGNED too.  The smallest work would be to convert these three to
> QEMU_* rather than convert QEMU_* to __attribute__.

I prefer "direct" expression to hiding behind macros, unless there's a
reason for macros.  A common reason is portability.  Occasionally
abstraction, say when the direct expression doesn't really convey what
you're trying to do, or it's is overly verbose.

Anyway, I'm not particular on how we use attributes.  Since you seem to
have more specific ideas, could you file suitable BiteSizedTasks?

