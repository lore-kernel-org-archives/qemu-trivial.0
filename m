Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dJLtY-0000UG-A8
	for mharc-qemu-trivial@gnu.org; Fri, 09 Jun 2017 11:32:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dJLtV-0000Qg-MH
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 11:32:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dJLtU-0002sv-OS
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 11:32:13 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:35040)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1dJLtS-0002s2-5Y; Fri, 09 Jun 2017 11:32:10 -0400
Received: by mail-lf0-x241.google.com with SMTP id v20so5372833lfa.2;
	Fri, 09 Jun 2017 08:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=M11eenF+QJ92wHVgMaFbBjAzcZamg2JYys4wtkO/bUo=;
	b=FR21PYmU3Uqu45R3nVqGgiccrJEgW0PuuzT85ta28BPOaO+2Tdul94ZhfFlTp20G3T
	HJXL3irtUe2vcytt2dU7LqsGpkSSQiy6CjxokkJgxjjQXoFIuYbA9Jac6Q9VNW9udSAf
	6uC3gfripkb9XxE81f9vYCwGgPAz/twFvO7EbNq5StJ1F2aWfe91h6ypkaaRje08Ilwh
	5Y7Kx5vBCvLjF6hbjW1Fb8vf992dEes4Vc1zr+pgzlMG3YSret1Dcy25D+vCnDPEcBt+
	45gYbHwq692V65CNH9ynYYdnVmc3e7L9UqBpt9hidY9vYjftm3j0jz6SSMvwFkTEOvAk
	eSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=M11eenF+QJ92wHVgMaFbBjAzcZamg2JYys4wtkO/bUo=;
	b=LQ7WJacSYqyUrQBnV18UdWS0s8HCmlJK9J71AC9sMfRmXGmv2V9dS5HMlYJ9CCl41Y
	GcbTwmUVEXZ21ArQ8N9eZ0pRi93IsPizQn4iQdvLFtDrrTnWvBEiI0bAnVqVvGcvws+E
	zTaKLtEVoBCWoJtAh0hRnnmnvk0KE6WszA/JQr+f4IhDS2PXsHR0MQXe6MMunsr0ur7B
	Rl9gzAQcqsc30aFDqwBbM8AaKzNvhDhWvSG2a1dZNbylBXWly7Xc7yCh3GCmIELoLpzP
	Q2rGZB1KvzRUAYbWs0608hJYdUlP2eTvl4x8TpzOR5z75lVdUMPStjbDpPvaMYZpIhDp
	yQ9w==
X-Gm-Message-State: AODbwcC/SvODmb3OtZfEGlBXtnoNRze/58+iFte6sqDG7xA8dcH4QakG
	jgQQHu2GphJXdsCgN69TxxXnne8z+vXh
X-Received: by 10.25.202.69 with SMTP id h5mr13042891lfj.15.1497022328877;
	Fri, 09 Jun 2017 08:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20170609152017.7286-1-eblake@redhat.com>
	<20170609152017.7286-2-eblake@redhat.com>
	<CAJ+F1CJL04MkrYmnhM3rLaSAuEXYo7JsZwyDLeXA35bV6dvqqA@mail.gmail.com>
In-Reply-To: <CAJ+F1CJL04MkrYmnhM3rLaSAuEXYo7JsZwyDLeXA35bV6dvqqA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 09 Jun 2017 15:31:58 +0000
Message-ID: <CAJ+F1CLkcUptCkq1pvwn2S_oj=3ShgTgUqi+tE1wfL2V4jA-Vw@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Content-Type: multipart/alternative; boundary="f403045e96a2223880055188ac37"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] qobject: Update
 coccinelle script to catch Q{INC, DEC}REF
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
X-List-Received-Date: Fri, 09 Jun 2017 15:32:14 -0000

--f403045e96a2223880055188ac37
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 9, 2017 at 7:28 PM Marc-Andr=C3=A9 Lureau <marcandre.lureau@gma=
il.com>
wrote:

> Hi
>
> On Fri, Jun 9, 2017 at 7:20 PM Eric Blake <eblake@redhat.com> wrote:
>
>> A recent patch submission was about to use qobject_decref(QOBJECT(E)),
>> even though we already have QDECREF(E) for that purpose.  While our
>> tree is currently free from the longhand form, we might as well update
>>
>
> Oh?
>
>  $ git grep 'object_unref(OBJECT('  | wc -l
> 152
>
>
ah not the same object kind :)

our coccinelle script to catch any future relapses.
>>
>
> sadly, coccinelle is unabarebly slow on my machine, not easy to grasp, an=
d
> thereby fails to catch a lot of cases.. I am looking at alternative from
> clang tools/lib, by curiosity.
>
>
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>  scripts/coccinelle/qobject.cocci | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/scripts/coccinelle/qobject.cocci
>> b/scripts/coccinelle/qobject.cocci
>> index 97703a4..656dc3e 100644
>> --- a/scripts/coccinelle/qobject.cocci
>> +++ b/scripts/coccinelle/qobject.cocci
>> @@ -3,6 +3,12 @@
>>  expression Obj, Key, E;
>>  @@
>>  (
>> +- qobject_incref(QOBJECT(E));
>> ++ QINCREF(E);
>> +|
>> +- qobject_decref(QOBJECT(E));
>> ++ QDECREF(E);
>> +|
>>  - qdict_put_obj(Obj, Key, QOBJECT(E));
>>  + qdict_put(Obj, Key, E);
>>  |
>> --
>> 2.9.4
>>
>>
>> --
> Marc-Andr=C3=A9 Lureau
>
--=20
Marc-Andr=C3=A9 Lureau

--f403045e96a2223880055188ac37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri=
, Jun 9, 2017 at 7:28 PM Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marca=
ndre.lureau@gmail.com">marcandre.lureau@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi<br><div><br><div class=3D=
"gmail_quote"></div></div></div><div dir=3D"ltr"><div><div class=3D"gmail_q=
uote"><div dir=3D"ltr">On Fri, Jun 9, 2017 at 7:20 PM Eric Blake &lt;<a hre=
f=3D"mailto:eblake@redhat.com" target=3D"_blank">eblake@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">A recent patch submission wa=
s about to use qobject_decref(QOBJECT(E)),<br>
even though we already have QDECREF(E) for that purpose.=C2=A0 While our<br=
>
tree is currently free from the longhand form, we might as well update<br><=
/blockquote><div><br></div></div></div></div><div dir=3D"ltr"><div><div cla=
ss=3D"gmail_quote"><div>Oh?<br><br>=C2=A0$ git grep &#39;object_unref(OBJEC=
T(&#39;=C2=A0 | wc -l<br>152<br><br></div></div></div></div></blockquote><d=
iv><br></div><div>ah not the same object kind :) <br><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div dir=3D"ltr"><div><div class=3D"gmail_quote"><div></=
div></div></div></div><div dir=3D"ltr"><div><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
our coccinelle script to catch any future relapses.<br></blockquote><div><b=
r></div></div></div></div><div dir=3D"ltr"><div><div class=3D"gmail_quote">=
<div>sadly, coccinelle is unabarebly slow on my machine, not easy to grasp,=
 and thereby fails to catch a lot of cases.. I am looking at alternative fr=
om clang tools/lib, by curiosity.<br>=C2=A0<br></div></div></div></div><div=
 dir=3D"ltr"><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
<br>
Signed-off-by: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com" target=
=3D"_blank">eblake@redhat.com</a>&gt;<br>
---<br>
=C2=A0scripts/coccinelle/qobject.cocci | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/scripts/coccinelle/qobject.cocci b/scripts/coccinelle/qobject.=
cocci<br>
index 97703a4..656dc3e 100644<br>
--- a/scripts/coccinelle/qobject.cocci<br>
+++ b/scripts/coccinelle/qobject.cocci<br>
@@ -3,6 +3,12 @@<br>
=C2=A0expression Obj, Key, E;<br>
=C2=A0@@<br>
=C2=A0(<br>
+- qobject_incref(QOBJECT(E));<br>
++ QINCREF(E);<br>
+|<br>
+- qobject_decref(QOBJECT(E));<br>
++ QDECREF(E);<br>
+|<br>
=C2=A0- qdict_put_obj(Obj, Key, QOBJECT(E));<br>
=C2=A0+ qdict_put(Obj, Key, E);<br>
=C2=A0|<br>
--<br>
2.9.4<br>
<br>
<br>
</blockquote></div></div></div><div dir=3D"ltr">-- <br></div><div data-smar=
tmail=3D"gmail_signature"><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div>=
</div></blockquote></div></div><div dir=3D"ltr">-- <br></div><div data-smar=
tmail=3D"gmail_signature"><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div>=
</div>

--f403045e96a2223880055188ac37--

