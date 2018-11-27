Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRZDn-0004V2-6U
	for mharc-qemu-trivial@gnu.org; Tue, 27 Nov 2018 03:59:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gRZDk-0004TQ-AE
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 03:59:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gRZDf-0004FG-6T
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 03:59:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:32832)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gRZDS-00041s-9k; Tue, 27 Nov 2018 03:59:34 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DBD5731256A8;
	Tue, 27 Nov 2018 08:59:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-104.ams2.redhat.com
	[10.36.116.104])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63B3260141;
	Tue, 27 Nov 2018 08:59:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id ED34E1132928; Tue, 27 Nov 2018 09:59:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,  Peter
	Maydell <peter.maydell@linaro.org>,  "Michael S . Tsirkin"
	<mst@redhat.com>, qemu-trivial@nongnu.org, qemu-devel@nongnu.org, Paolo
	Bonzini <pbonzini@redhat.com>
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-26-philmd@redhat.com>
	<5fedf421-a138-041a-638b-98f3fd3ffeef@redhat.com>
Date: Tue, 27 Nov 2018 09:59:24 +0100
In-Reply-To: <5fedf421-a138-041a-638b-98f3fd3ffeef@redhat.com> (Thomas Huth's
	message of "Tue, 27 Nov 2018 08:26:53 +0100")
Message-ID: <87h8g2uc9f.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 27 Nov 2018 08:59:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-3.1 25/25] MAINTAINERS:
 Remove duplicate entries of qemu-devel@nongnu.org
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
X-List-Received-Date: Tue, 27 Nov 2018 08:59:53 -0000

Thomas Huth <thuth@redhat.com> writes:

> On 2018-11-25 21:50, Philippe Mathieu-Daud=C3=A9 wrote:
>> The list is always selected by the 'All patches CC here' section.
>>=20
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>  MAINTAINERS | 13 -------------
>>  1 file changed, 13 deletions(-)
>>=20
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c616861ca3..9d6dae71ff 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -109,7 +109,6 @@ L: qemu-s390x@nongnu.org
>>  Guest CPU cores (TCG):
>>  ----------------------
>>  Overall
>> -L: qemu-devel@nongnu.org
>>  M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>>  M: Richard Henderson <rth@twiddle.net>
>>  R: Paolo Bonzini <pbonzini@redhat.com>
>> @@ -403,30 +402,25 @@ Hosts:
>>  ------
>>=20=20
>>  LINUX
>> -L: qemu-devel@nongnu.org
>>  S: Maintained
>>  F: linux-*
>>  F: linux-headers/
>>=20=20
>>  POSIX
>> -L: qemu-devel@nongnu.org
>>  S: Maintained
>>  F: *posix*
>
> I agree that we can remove the "L: qemu-devel" entries everywhere, but
> for these subsystems that have no "M:" entry, but "S: Maintained", this
> now looks somewhat strange - the subsystem is "Maintained" but has no
> maintainer? I think we need somebody who feels responsible to pick up
> patches here...?

It looks strange because it *is* strange.  If we take the definition of
S: in MAINTAINERS seriously, we need to appoint a maintainer (a person,
not a mailing list), or downgrade to S: Orphan.

