Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIJ2O-0005eG-Qb
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 11:03:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJ2I-0005X2-TB
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:03:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJ2E-0001t2-Js
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:03:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47575)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XIJ24-0001gv-CR; Fri, 15 Aug 2014 11:03:08 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 845FA43050;
	Fri, 15 Aug 2014 19:03:07 +0400 (MSK)
Message-ID: <53EE212A.60405@msgid.tls.msk.ru>
Date: Fri, 15 Aug 2014 19:03:06 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: "Michael S. Tsirkin" <mst@redhat.com>, 
	zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>	<1408001361-13580-10-git-send-email-zhang.zhanghailiang@huawei.com>
	<20140814103350.GH31346@redhat.com>
In-Reply-To: <20140814103350.GH31346@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: kwolf@redhat.com, lkurusa@redhat.com, qemu-trivial@nongnu.org,
	jan.kiszka@siemens.com, riku.voipio@iki.fi,
	luonengjun@huawei.com, qemu-devel@nongnu.org,
	lcapitulino@redhat.com, stefanha@redhat.com,
	Li Liu <john.liuli@huawei.com>, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, alex.bennee@linaro.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v6 09/10] tcg: check return value of
	fopen()
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
X-List-Received-Date: Fri, 15 Aug 2014 15:03:27 -0000

14.08.2014 14:33, Michael S. Tsirkin wrote:
> On Thu, Aug 14, 2014 at 03:29:20PM +0800, zhanghailiang wrote:
>> From: Li Liu <john.liuli@huawei.com>
>>
>> Give a warning message if fopen() failed to open the log file.
>>
>> Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>> Signed-off-by: Li Liu <john.liuli@huawei.com>
>> ---
>>  tcg/tcg.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/tcg/tcg.c b/tcg/tcg.c
>> index c068990..8f50d2a 100644
>> --- a/tcg/tcg.c
>> +++ b/tcg/tcg.c
>> @@ -2406,6 +2406,10 @@ static void dump_op_count(void)
>>      int i;
>>      FILE *f;
>>      f =3D fopen("/tmp/op.log", "w");

Gosh.  So why are we still use fixed filenames in /tmp?????
Every such use is a potential security holw... :(  Ughm.

Can't we get rid of this somehow, by requiring a filename
parameter for example?

Thanks,

/mjt


>> +    if (f =3D=3D NULL) {
>=20
> if (!f) please.
>=20
>> +        fprintf(stderr, "Failed to open /tmp/op.log\n");

> Maybe add "for writing. Logging op count will be disabled.".
>=20
>> +        return;
>> +    }
>>      for(i =3D INDEX_op_end; i < NB_OPS; i++) {
>>          fprintf(f, "%s %" PRId64 "\n", tcg_op_defs[i].name, tcg_table=
_op_count[i]);
>>      }
>> --=20
>> 1.7.12.4
>>
>=20


