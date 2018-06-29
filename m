Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fYwoI-0005vj-Hc
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jun 2018 13:03:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fYwoE-0005uv-UT
	for qemu-trivial@nongnu.org; Fri, 29 Jun 2018 13:03:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fYwoE-0005Qm-0d
	for qemu-trivial@nongnu.org; Fri, 29 Jun 2018 13:03:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46030)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1fYwo8-0005IN-3J; Fri, 29 Jun 2018 13:03:40 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8820E804F6;
	Fri, 29 Jun 2018 17:03:38 +0000 (UTC)
Received: from [10.10.124.141] (ovpn-124-141.rdu2.redhat.com [10.10.124.141])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E26A17131;
	Fri, 29 Jun 2018 17:03:36 +0000 (UTC)
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-2-f4bug@amsat.org>
	<20180627132747.76773eb9@redhat.com>
	<3dd9341a-f4e6-c107-2f1f-0745d039f03e@redhat.com>
	<15aad1db-2f4c-ea49-9966-a969f0c769f5@amsat.org>
	<c1939f7b-76e2-eca9-2819-d0b4d9a134b1@redhat.com>
	<0822da0f-1da2-bff3-e465-57654aad7c16@amsat.org>
	<20180629150236.GV27016@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	qemu-trivial@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <c9ecf4b8-6b9d-7094-e364-2d53b7d40187@redhat.com>
Date: Fri, 29 Jun 2018 12:03:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180629150236.GV27016@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 29 Jun 2018 17:03:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 01/46] include: Add IEC
 binary prefixes in "qemu/units.h"
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
X-List-Received-Date: Fri, 29 Jun 2018 17:03:47 -0000

On 06/29/2018 10:02 AM, Daniel P. Berrang=C3=A9 wrote:
>> Are you suggesting this?
>>
>> #define KiB     (INT32_C(1) << 10)
>> #define MiB     (INT32_C(1) << 20)
>> #define GiB     (INT32_C(1) << 30)
>>
>> #define TiB     (INT64_C(1) << 40)
>> #define PiB     (INT64_C(1) << 50)
>> #define EiB     (INT64_C(1) << 60)

Maybe, but then '8 * GiB' overflows, rather than giving a 64-bit result.

>=20
> This feels dangerous to me as now the calculation may or may not be 32-=
bit
> or 64-bit depending on which constant you happen to pick. I think this
> inconsistency is going to be surprising to both devs and reviewers lead=
ing
> to bugs.

Being consistently 64-bit may be annoying, but it's easy enough to=20
reason about, compared to worrying whether an overflow will happen.

>=20
> Did you consider just adding unsigned versions  ?  eg UKiB, UMiB, UGiB.=
 It
> is a bit ugly but is has the benefit of being obvious whether you're in=
tending
> the calculation  to be signed vs unsigned.

That might also be worthwhile, although I'd tend towards the name KiBU=20
instead if UKiB (since I'm already used to U as a suffix).

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

