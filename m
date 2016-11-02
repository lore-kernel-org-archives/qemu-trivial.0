Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1tfJ-0008An-6J
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 07:25:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c1tfG-00087I-Ti
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 07:25:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c1tfG-0002tM-1l
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 07:25:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36088)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1c1tfC-0002ri-6i; Wed, 02 Nov 2016 07:25:02 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F1BC73056;
	Wed,  2 Nov 2016 11:25:01 +0000 (UTC)
Received: from [10.36.116.29] (ovpn-116-29.ams2.redhat.com [10.36.116.29])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA2BOw3b011746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 2 Nov 2016 07:25:00 -0400
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <1478076128-11661-1-git-send-email-thuth@redhat.com>
	<55723a41-3829-f461-7915-951b96ebaa1c@vivier.eu>
Cc: qemu-trivial@nongnu.org
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1ecd2eb2-e568-094f-a7dc-0777773f6147@redhat.com>
Date: Wed, 2 Nov 2016 12:24:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <55723a41-3829-f461-7915-951b96ebaa1c@vivier.eu>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 02 Nov 2016 11:25:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] m68k: Add include/hw/m68k/ and
 disas/m68k.c to the MAINTAINERS file
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
X-List-Received-Date: Wed, 02 Nov 2016 11:25:07 -0000

On 02.11.2016 09:51, Laurent Vivier wrote:
>=20
> Le 02/11/2016 =C3=A0 09:42, Thomas Huth a =C3=A9crit :
>> The include/hw/m68k/ folder and disas/m68k.c obviously belong to
>> the m68k section in the MAINTAINERS file.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  MAINTAINERS | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 79484ed..5d45160 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -149,6 +149,8 @@ M: Laurent Vivier <laurent@vivier.eu>
>>  S: Maintained
>>  F: target-m68k/
>>  F: hw/m68k/
>> +F: include/hw/m68k/
>=20
> Under this directory, we have only mcf.h, which is used by M68K
> machines, not by TCG, so I think this include should be added to the
> "M68K Machines" section.

OK. But the M68k Machines are currently orphan, so I guess that's not
worth the effort for a patch here.

>> +F: disas/m68k.c

Feel free to still include that line if you like.

 Thanks,
  Thomas


