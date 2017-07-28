Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dbBxy-0000iu-Kv
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 16:34:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1dbBxw-0000h7-Lk
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 16:34:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1dbBxv-0007tA-PR
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 16:34:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57372)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1dbBxm-0007ii-OT; Fri, 28 Jul 2017 16:34:22 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 50CB968697;
	Fri, 28 Jul 2017 20:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 50CB968697
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=jsnow@redhat.com
Received: from [10.10.123.233] (ovpn-123-233.rdu2.redhat.com [10.10.123.233])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3AA3B7090B;
	Fri, 28 Jul 2017 20:34:15 +0000 (UTC)
To: Fam Zheng <famz@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-39-f4bug@amsat.org>
	<20170728061620.GO5117@lemon.lan>
From: John Snow <jsnow@redhat.com>
Message-ID: <ba9d2082-62a8-1c29-f5bb-0ac47d857e5e@redhat.com>
Date: Fri, 28 Jul 2017 16:34:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170728061620.GO5117@lemon.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 28 Jul 2017 20:34:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 38/47] MAINTAINERS: update
 docs/interop/ entries
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
X-List-Received-Date: Fri, 28 Jul 2017 20:34:33 -0000



On 07/28/2017 02:16 AM, Fam Zheng wrote:
> On Fri, 07/28 02:36, Philippe Mathieu-Daud=C3=A9 wrote:
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>   MAINTAINERS | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 23de632424..54e35fdab9 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1283,7 +1283,7 @@ F: block/dirty-bitmap.c
>>   F: include/qemu/hbitmap.h
>>   F: include/block/dirty-bitmap.h
>>   F: tests/test-hbitmap.c
>> -F: docs/bitmaps.md
>> +F: docs/interop/bitmaps.rst
>>   T: git git://github.com/famz/qemu.git bitmaps
>>   T: git git://github.com/jnsnow/qemu.git bitmaps
>>  =20
>> @@ -1852,7 +1852,7 @@ M: Denis V. Lunev <den@openvz.org>
>>   L: qemu-block@nongnu.org
>>   S: Supported
>>   F: block/parallels.c
>> -F: docs/specs/parallels.txt
>> +F: docs/interop/parallels.txt
>>  =20
>>   qed
>>   M: Stefan Hajnoczi <stefanha@redhat.com>
>> --=20
>> 2.13.3
>>
>=20
> Acked-by: Fam Zheng <famz@redhat.com>
>=20

"Me too"

Acked-by: John Snow <jsnow@redhat.com>

