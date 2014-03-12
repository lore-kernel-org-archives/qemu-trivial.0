Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WNjzw-0000VL-3I
	for mharc-qemu-trivial@gnu.org; Wed, 12 Mar 2014 10:19:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WNjzp-0000L1-H2
	for qemu-trivial@nongnu.org; Wed, 12 Mar 2014 10:19:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WNjzk-0006e8-Q2
	for qemu-trivial@nongnu.org; Wed, 12 Mar 2014 10:19:01 -0400
Received: from cantor2.suse.de ([195.135.220.15]:37965 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WNjza-0006b9-P4; Wed, 12 Mar 2014 10:18:46 -0400
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id EA14C75018;
	Wed, 12 Mar 2014 14:18:45 +0000 (UTC)
Message-ID: <53206CC5.6040902@suse.de>
Date: Wed, 12 Mar 2014 15:18:45 +0100
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
References: <1394630689-11913-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA9Le87gpzh-5cBtZVzYS05VfvKSnXZDuVRDC3XYUKiD=w@mail.gmail.com>
In-Reply-To: <CAFEAcA9Le87gpzh-5cBtZVzYS05VfvKSnXZDuVRDC3XYUKiD=w@mail.gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-m68k: Remove custom
 qemu_assert() function
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
X-List-Received-Date: Wed, 12 Mar 2014 14:19:06 -0000

Am 12.03.2014 15:15, schrieb Peter Maydell:
> On 12 March 2014 13:24, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Remove the custom qemu_assert() function defined by target-m68k/transl=
ate.c
>> in favour of either using glib g_assert_not_reached() (for the genuine=
ly
>> can't-happen cases) or cpu_abort() (for the "this isn't implemented",
>> in line with other unimplemented cases in the target).
>>
>> This has the benefit of silencing some clang warnings about
>> variables used while uninitialized (which are emitted because
>> clang can't figure out that qemu_assert(0, something) never
>> returns.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>=20
> Andreas pointed out that we've had one attempt to fix this
> late last year:
> http://lists.gnu.org/archive/html/qemu-devel/2013-12/msg02177.html
> which didn't work because hw_assert() is not present in user-mode
> compiles. This version of the patch doesn't suffer from that issue.

Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>

Looks fine then, except that cpu_abort() will conflict with my series.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

