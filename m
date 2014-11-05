Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xlufa-0000Df-Jq
	for mharc-qemu-trivial@gnu.org; Wed, 05 Nov 2014 02:06:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XlufU-0008Vb-W9
	for qemu-trivial@nongnu.org; Wed, 05 Nov 2014 02:06:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XlufQ-0006SM-EO
	for qemu-trivial@nongnu.org; Wed, 05 Nov 2014 02:06:12 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41794)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XlufH-0006Qh-Gi; Wed, 05 Nov 2014 02:05:59 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CF97240A79;
	Wed,  5 Nov 2014 10:05:58 +0300 (MSK)
Message-ID: <5459CC56.1030109@msgid.tls.msk.ru>
Date: Wed, 05 Nov 2014 10:05:58 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1415098223-32404-1-git-send-email-zhang.zhanghailiang@huawei.com>	<1415098223-32404-2-git-send-email-zhang.zhanghailiang@huawei.com>
	<874mufumgk.fsf@linaro.org>
In-Reply-To: <874mufumgk.fsf@linaro.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, armbru@redhat.com, kraxel@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
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
X-List-Received-Date: Wed, 05 Nov 2014 07:06:17 -0000

04.11.2014 16:25, Alex Benn=C3=A9e wrote:
> zhanghailiang <zhang.zhanghailiang@huawei.com> writes:
>=20
>> For some qemu_chr_parse_* functions, we just check whether the paramet=
er
>> is NULL or not, but do not check if it is empty.
>>
>> For example:
>> qemu-system-x86_64 -chardev pipe,id=3Did,path=3D
>> It will pass the check of NULL but will not find the error until
>> trying to open it, while essentially missing and empty parameter
>> is the same thing.
>>
>> So check the parameters for emptiness too, and avoid emptiness
>> check at open time.
>>
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>> ---
>>  qemu-char.c | 15 +++++----------
>>  1 file changed, 5 insertions(+), 10 deletions(-)
>>
>> diff --git a/qemu-char.c b/qemu-char.c
>> index bd0709b..a09bbf6 100644
>> --- a/qemu-char.c
>> +++ b/qemu-char.c
>> @@ -1084,11 +1084,6 @@ static CharDriverState *qemu_chr_open_pipe(Char=
devHostdev *opts)
>>      char filename_out[CHR_MAX_FILENAME_SIZE];
>>      const char *filename =3D opts->device;
>> =20
>> -    if (filename =3D=3D NULL) {
>> -        fprintf(stderr, "chardev: pipe: no filename given\n");
>> -        return NULL;
>> -    }
>> -
>=20
> You seem to have dropped a check here, are you sure all avenues into
> this code have validated filename? What if a new function gets added?

Yes, the code first calls parse_pipe() and only after it is
successfully completed, it calls open_pipe().  I don't see
a good reason for having assert here.

> At a minimum I'd replace it with a g_assert(filename) to make the
> calling contract clear.

This is an internal set of APIs for a chr device, each kind is
having a pair of functions which are called in order (first parse,
next open), -- _that_ is the contract.

[]
> All this boilerplate checking makes me think that either the qemu_opt
> machinery should be ensuring we get a valid option string?

Might be a good idea, yes, but that'd be a huge change, since that
should be done in a lot of places, and in many cases we can't
express our rules easily (eg, only one of two parameters should
be present).  I think at this stage adding simple checks to
_parse functions is the way to go, and it is easy to read too.

Thanks,

/mjt


