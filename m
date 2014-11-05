Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xlwa6-0005Wa-OF
	for mharc-qemu-trivial@gnu.org; Wed, 05 Nov 2014 04:08:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Xlwa0-0005MN-3d
	for qemu-trivial@nongnu.org; Wed, 05 Nov 2014 04:08:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XlwZv-0005iu-NF
	for qemu-trivial@nongnu.org; Wed, 05 Nov 2014 04:08:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55598)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XlwZj-0005gD-Ta; Wed, 05 Nov 2014 04:08:24 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sA598GKb030103
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 5 Nov 2014 04:08:17 -0500
Received: from blackfin.pond.sub.org (ovpn-116-29.ams2.redhat.com
	[10.36.116.29])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sA5989lD011791
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 5 Nov 2014 04:08:11 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 458D130403B1; Wed,  5 Nov 2014 10:08:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1415098223-32404-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1415098223-32404-5-git-send-email-zhang.zhanghailiang@huawei.com>
	<87zjc7t78h.fsf@linaro.org> <5459CEAD.8060902@msgid.tls.msk.ru>
Date: Wed, 05 Nov 2014 10:08:08 +0100
In-Reply-To: <5459CEAD.8060902@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Wed, 05 Nov 2014 10:15:57 +0300")
Message-ID: <87tx2erp53.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com, kraxel@redhat.com,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
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
X-List-Received-Date: Wed, 05 Nov 2014 09:08:44 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 04.11.2014 16:39, Alex Benn=C3=A9e wrote:
>> zhanghailiang <zhang.zhanghailiang@huawei.com> writes:
>>=20
>>> Convert several Character backend open functions to use the Error API.
>>>
>>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>>> ---
>>>  qemu-char.c | 76 +++++++++++++++++++++++++++++++++--------------------=
--------
>>>  1 file changed, 41 insertions(+), 35 deletions(-)
>>>
>>> diff --git a/qemu-char.c b/qemu-char.c
>>> index 0f38cdd..a1d25c7 100644
>>> --- a/qemu-char.c
>>> +++ b/qemu-char.c
>>> @@ -1077,7 +1077,7 @@ static CharDriverState *qemu_chr_open_fd(int fd_i=
n, int fd_out)
>>>      return chr;
>>>  }
>>>=20=20
>>> -static CharDriverState *qemu_chr_open_pipe(ChardevHostdev *opts)
>>> +static CharDriverState *qemu_chr_open_pipe(ChardevHostdev *opts, Error=
 **errp)
>>>  {
>>>      int fd_in, fd_out;
>>>      char filename_in[CHR_MAX_FILENAME_SIZE];
>> <snip>
>> Why convert the call if we are not using the passed parameter?
>
> This is actually a good question, -- one way or another.  On one hand,
> this way we're making it all consistent for the caller at least.  On
> another, this, at least, introduces a warning about unused parameter,
> so an 'unused' attribute might be a good idea.

Matter of taste.

As long as the open functions remain different, I don't see the value of
adding unused Error ** parameters.

The churn would save a purpose if it actually unified the function types
and simplified the switch to an indirect call.

Marking unused parameters with __attribute__((unused)) is a good idea
indeed.

> []
>>> -static CharDriverState *qemu_chr_open_win_path(const char *filename)
>>> +static CharDriverState *qemu_chr_open_win_path(const char *filename,
>>> +                                               Error **errp)
>>>  {
>>>      CharDriverState *chr;
>>>      WinCharState *s;
>>> +    Error *local_err =3D NULL;
>>>=20=20
>>>      chr =3D qemu_chr_alloc();
>>>      s =3D g_malloc0(sizeof(WinCharState));
>>> @@ -2033,9 +2035,11 @@ static CharDriverState *qemu_chr_open_win_path(c=
onst char *filename)
>>>      chr->chr_write =3D win_chr_write;
>>>      chr->chr_close =3D win_chr_close;
>>>=20=20
>>> -    if (win_chr_init(chr, filename) < 0) {
>>> +    win_chr_init(chr, filename, &local_err);
>>> +    if (local_err) {
>>>          g_free(s);
>>>          g_free(chr);
>>> +        error_propagate(errp, local_err);
>>>          return NULL;
>>=20
>> Hmm I'm not sure I find the change from a return value to
>> pass-by-reference return value intuitive. What does this gain us?
>>=20
>> Are the messages now being reported actually more suitable for user
>> consumption? For example "ClearCommError failed" doesn't actually tell
>> the user much apart from something went wrong.
>
> Alex, I think you're way too late into the game already.  This
> error api has been designed this way quite some time ago, and
> many places uses it this way.  I don't really like it too, but
> heck, what can I do?

I'm not really happy with it either, but it addresses real problems.

Down where the error happens, you know what went wrong, but have no idea
how to handle it.

Further up where you know how to handle errors, you have no idea what
went wrong.

Passing up success/failure doesn't help with that.

Passing up -errno helps in simple cases.

Inventing other error enumerations tends to produce a mess and/or end in
confusion.

Passing up an error *object* can provide information on what went wrong.
It's admittedly cumbersome, and prone to leak memory.  I prefer to stick
to -errno in simple cases.

Our current object is basically a container for a human-readable error
message for error handling to use.

Example: when win_chr_init() fails, it prints to stderr.  This is
actually wrong when it runs on behalf of monitor command chardev-add.
It should print to the monitor when it's HMP, and should send an error
reply when it's QMP.  win_chr_init() doesn't know.  The monitor calling
qmp_chardev_add() does.

> I don't actually get it why, when converting some function which
> returned success/failure before, to this error API, the return
> value is always discarded and the function becomes void?  I'd
> keep the return value (success/failure) _and_ the error, to
> have better shugar in places like this one.  But I guess it'll
> be a bit more confusing, which condition should be treated as
> error - failure function return or non-null error argument.

Yes, this annoys me, too.  It can turn a simple

    if (frobnicate(arg) < 0) {
        goto fail;
    }

into

    Error *local_err =3D NULL;

    frobnicate(arg, &local_err);
    if (local_err) {
        error_free(local_err);
        goto fail;
    }

when it could be simply

    if (frobnicate(arg, NULL) < 0) {
        goto fail;
    }

> But this is. again, not about this patch/change -- this is how
> qemu is doing for quite some time, discusing/changing this
> should be elsewhere.

Moaning about it in review is fine (I indulge in such things myself from
time to time), but if you want infrastructure changed, you probably have
to start with a patch changing it.

[...]

