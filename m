Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cZ5ti-0004aG-SP
	for mharc-qemu-trivial@gnu.org; Wed, 01 Feb 2017 20:09:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cZ5tg-0004ZY-Pj
	for qemu-trivial@nongnu.org; Wed, 01 Feb 2017 20:09:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cZ5tf-0001Zv-VN
	for qemu-trivial@nongnu.org; Wed, 01 Feb 2017 20:09:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55372)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1cZ5tb-0001Xt-Eh; Wed, 01 Feb 2017 20:09:07 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 71C253B702;
	Thu,  2 Feb 2017 01:09:07 +0000 (UTC)
Received: from [10.36.116.16] (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5189CB7D2B;
	Thu,  2 Feb 2017 01:09:05 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>
References: <1485879287-12548-1-git-send-email-peter.maydell@linaro.org>
	<87wpdbw2ki.fsf@dusky.pond.sub.org>
	<157b55c5-2927-5f4e-0c43-820abd75a6d2@redhat.com>
	<874m0ejth1.fsf@dusky.pond.sub.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6c841220-8219-69fc-413f-c6ad320fe2ed@redhat.com>
Date: Wed, 1 Feb 2017 17:09:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <874m0ejth1.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 02 Feb 2017 01:09:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 02 Feb 2017 01:09:13 -0000



On 31/01/2017 22:49, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
>=20
>> On 31/01/2017 12:40, Markus Armbruster wrote:
>>>> =20
>>>>  #define QEMU_NORETURN __attribute__ ((__noreturn__))
>>>> =20
>>>> -#if QEMU_GNUC_PREREQ(3, 4)
>>>>  #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
>>>> -#else
>>>> -#define QEMU_WARN_UNUSED_RESULT
>>>> -#endif
>>> Should we inline this macro?
>>>
>>>> =20
>>>> -#if QEMU_GNUC_PREREQ(4, 0)
>>>>  #define QEMU_SENTINEL __attribute__((sentinel))
>>>> -#else
>>>> -#define QEMU_SENTINEL
>>>> -#endif
>>> Likewise.
>>
>> Why, since we don't do that for QEMU_NORETURN, QEMU_PACKED, etc.?
>=20
> Because we do it for aligned, always_inline, constructor, format, mode,
> noinline, and in places even noreturn and packed:
>=20
>     $ git-grep __attribute__ | sed '/define/d;s/.*__attribute__ *((\([A=
-Za-z0-9_]*\).*/\1/' | sort -u
>=20

Uh oh. :)  You have to remove uses in firmware and in imported code
(which covers mode, format and noreturn), but there's certainly room for
some BiteSizedTasks.

For sure noinline should be wrapped by a macro so that you also include
noclone (usually you want to thwart some compiler optimization so both
are needed).

That leaves aligned, always_inline and constructor.  always_inline has
three users, constructors has many, aligned has many and there's
QEMU_ALIGNED too.  The smallest work would be to convert these three to
QEMU_* rather than convert QEMU_* to __attribute__.

Thanks,

Paolo

