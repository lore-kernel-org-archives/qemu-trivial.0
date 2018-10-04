Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g86Wx-00016e-9g
	for mharc-qemu-trivial@gnu.org; Thu, 04 Oct 2018 12:31:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1g86Wu-00015Q-Cy
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 12:31:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1g86Wt-0000Ul-EU
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 12:31:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47573)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1g86Wo-0000RI-6q; Thu, 04 Oct 2018 12:31:06 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A99DEC057E37;
	Thu,  4 Oct 2018 16:31:04 +0000 (UTC)
Received: from dhcp-17-10.bos.redhat.com (dhcp-17-10.bos.redhat.com
	[10.18.17.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBE771816A;
	Thu,  4 Oct 2018 16:31:03 +0000 (UTC)
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
	Max Reitz <mreitz@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-7-crosa@redhat.com>
	<4f0850d2-3baa-7acc-d34b-98f074f1a2f8@vivier.eu>
From: Cleber Rosa <crosa@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <50e4aeaa-7f4f-03b3-05ae-2a29deac9662@redhat.com>
Date: Thu, 4 Oct 2018 12:31:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <4f0850d2-3baa-7acc-d34b-98f074f1a2f8@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 04 Oct 2018 16:31:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 06/10] thunk.c: clean up commented out
 definition
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
X-List-Received-Date: Thu, 04 Oct 2018 16:31:13 -0000



On 10/4/18 12:24 PM, Laurent Vivier wrote:
> Le 04/10/2018 =C3=A0 18:18, Cleber Rosa a =C3=A9crit=C2=A0:
>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>  thunk.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/thunk.c b/thunk.c
>> index d5d8645cd4..e351ae53af 100644
>> --- a/thunk.c
>> +++ b/thunk.c
>> @@ -21,8 +21,6 @@
>>  #include "qemu.h"
>>  #include "exec/user/thunk.h"
>> =20
>> -//#define DEBUG
>> -
>=20
> Generally we use that to enable easily existing debug traces.
>=20

Oh, I wasn't aware that was intentional (I clearly lack some background
here).

> In this case, if you remove the "#define" I think you should also
> replace the "#ifdef DEBUG"s by some trace_XXXX() functions.
>=20

Is that desirable? I don't want to disrupt the status quo just because
it looked odd to me.

Thanks!
- Cleber.

> Thanks,
> Laurent
>=20

