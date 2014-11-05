Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlupN-00038b-QN
	for mharc-qemu-trivial@gnu.org; Wed, 05 Nov 2014 02:16:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XlupH-00031o-RI
	for qemu-trivial@nongnu.org; Wed, 05 Nov 2014 02:16:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XlupD-0002RG-0n
	for qemu-trivial@nongnu.org; Wed, 05 Nov 2014 02:16:19 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44310)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xluox-0002M6-94; Wed, 05 Nov 2014 02:15:59 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 09AF440A7C;
	Wed,  5 Nov 2014 10:15:58 +0300 (MSK)
Message-ID: <5459CEAD.8060902@msgid.tls.msk.ru>
Date: Wed, 05 Nov 2014 10:15:57 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1415098223-32404-1-git-send-email-zhang.zhanghailiang@huawei.com>	<1415098223-32404-5-git-send-email-zhang.zhanghailiang@huawei.com>
	<87zjc7t78h.fsf@linaro.org>
In-Reply-To: <87zjc7t78h.fsf@linaro.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, armbru@redhat.com, kraxel@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 4/5] qemu-char: convert
 some open functions to use Error API
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
X-List-Received-Date: Wed, 05 Nov 2014 07:16:24 -0000

04.11.2014 16:39, Alex Benn=C3=A9e wrote:
> zhanghailiang <zhang.zhanghailiang@huawei.com> writes:
>=20
>> Convert several Character backend open functions to use the Error API.
>>
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>> ---
>>  qemu-char.c | 76 +++++++++++++++++++++++++++++++++-------------------=
---------
>>  1 file changed, 41 insertions(+), 35 deletions(-)
>>
>> diff --git a/qemu-char.c b/qemu-char.c
>> index 0f38cdd..a1d25c7 100644
>> --- a/qemu-char.c
>> +++ b/qemu-char.c
>> @@ -1077,7 +1077,7 @@ static CharDriverState *qemu_chr_open_fd(int fd_=
in, int fd_out)
>>      return chr;
>>  }
>> =20
>> -static CharDriverState *qemu_chr_open_pipe(ChardevHostdev *opts)
>> +static CharDriverState *qemu_chr_open_pipe(ChardevHostdev *opts, Erro=
r **errp)
>>  {
>>      int fd_in, fd_out;
>>      char filename_in[CHR_MAX_FILENAME_SIZE];
> <snip>
> Why convert the call if we are not using the passed parameter?

This is actually a good question, -- one way or another.  On one hand,
this way we're making it all consistent for the caller at least.  On
another, this, at least, introduces a warning about unused parameter,
so an 'unused' attribute might be a good idea.

[]
>> -static CharDriverState *qemu_chr_open_win_path(const char *filename)
>> +static CharDriverState *qemu_chr_open_win_path(const char *filename,
>> +                                               Error **errp)
>>  {
>>      CharDriverState *chr;
>>      WinCharState *s;
>> +    Error *local_err =3D NULL;
>> =20
>>      chr =3D qemu_chr_alloc();
>>      s =3D g_malloc0(sizeof(WinCharState));
>> @@ -2033,9 +2035,11 @@ static CharDriverState *qemu_chr_open_win_path(=
const char *filename)
>>      chr->chr_write =3D win_chr_write;
>>      chr->chr_close =3D win_chr_close;
>> =20
>> -    if (win_chr_init(chr, filename) < 0) {
>> +    win_chr_init(chr, filename, &local_err);
>> +    if (local_err) {
>>          g_free(s);
>>          g_free(chr);
>> +        error_propagate(errp, local_err);
>>          return NULL;
>=20
> Hmm I'm not sure I find the change from a return value to
> pass-by-reference return value intuitive. What does this gain us?
>=20
> Are the messages now being reported actually more suitable for user
> consumption? For example "ClearCommError failed" doesn't actually tell
> the user much apart from something went wrong.

Alex, I think you're way too late into the game already.  This
error api has been designed this way quite some time ago, and
many places uses it this way.  I don't really like it too, but
heck, what can I do?

I don't actually get it why, when converting some function which
returned success/failure before, to this error API, the return
value is always discarded and the function becomes void?  I'd
keep the return value (success/failure) _and_ the error, to
have better shugar in places like this one.  But I guess it'll
be a bit more confusing, which condition should be treated as
error - failure function return or non-null error argument.

But this is. again, not about this patch/change -- this is how
qemu is doing for quite some time, discusing/changing this
should be elsewhere.

P.S.  Alex, please trim unrelated original text in your replies
a bit, -- it is kinda easy to miss your small comments scattered
in a huge original patch.  (Hopefully I didn't miss any)

Thanks,

/mjt

