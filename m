Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dGKfd-0003nS-Vd
	for mharc-qemu-trivial@gnu.org; Thu, 01 Jun 2017 03:37:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dGKfb-0003lf-68
	for qemu-trivial@nongnu.org; Thu, 01 Jun 2017 03:37:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dGKfa-0007Bq-ET
	for qemu-trivial@nongnu.org; Thu, 01 Jun 2017 03:37:23 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:34608)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1dGKfY-00079H-59; Thu, 01 Jun 2017 03:37:20 -0400
Received: by mail-lf0-x244.google.com with SMTP id f14so1252489lfe.1;
	Thu, 01 Jun 2017 00:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=kNv0g+MHzoVThmyd8d3UV025dNkpxeo23P9bS7vntuc=;
	b=q/IjOXmhxfCx0H4DbPyUchNtTjAiXMPAoopw9sjNTVPislseeucfEiCU3Lmp4V2XhL
	Ilv1KxeWa7uCCtri5fovz6m2DwnkyVzR/El7GEhs7IxnOJF7z2vzkgBitu2YX0UajpqZ
	f/DotTzsWdIPqlpQbdm/d9wRpJmYycv7F9xjPbTa3MeTDAUe+fFJNHgaqfF8EIgH4b8H
	CAGFCEE97S7vL7qnSRjr+hf7v+W8USFZrZ9s2Fl2vm53ToMoVq/6CnOCca+Z+Wh61foc
	jYPQs1WEthsHLovxZ2Oj6Z779WQt6c4vI+lfQsS28bzQ45w9Vu7J5Yzpik7uzUZgZaRy
	Sagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=kNv0g+MHzoVThmyd8d3UV025dNkpxeo23P9bS7vntuc=;
	b=s+I9jznmURxBu7Ibne55/9jkTH7gNaXuefZKM5lsJ7gz1w19ltcdhFeo1CDjnejYZt
	IBP1Rm26eYi9VmQZwBVIFx1cA7jIOuisKfW9+ZqOON1kWlCXENQBlZcQsWvKqLh6WxkD
	ZiZyS07uOrTwn9bSlFghY/moa+85uKUr3atMWDiflcxdLrySnMRRu4aMOl5MyG0jHpGp
	aGJyT2DWGvDRwZrYIyFcpn8BAMV9fYKjxHLvJ/QZHBYPYm87dsrymf/D/pTa61uw/k/H
	7miL7KgcDzMudMncbzKsd4/dNRR5g3wLdoUC7g2TOAunsg2xY+QLFeFjWNpKZbyHwDGs
	WVbA==
X-Gm-Message-State: AODbwcD44WJDw7M3vVkPygOS2+ylDrSvyAX7+fWnypew4NVwldlDJRow
	sL/nSQKWPXejhmwGEQRmJftWefJ/I6ed
X-Received: by 10.46.74.1 with SMTP id x1mr36810lja.117.1496302638385; Thu, 01
	Jun 2017 00:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20170503223846.6559-1-marcandre.lureau@redhat.com>
	<20170503223846.6559-6-marcandre.lureau@redhat.com>
	<CAJ+F1CJBs_uqCNbrj4iS94p-04OC3f3_2GZ8sUichC_h=9PHbg@mail.gmail.com>
In-Reply-To: <CAJ+F1CJBs_uqCNbrj4iS94p-04OC3f3_2GZ8sUichC_h=9PHbg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 01 Jun 2017 07:37:07 +0000
Message-ID: <CAJ+F1C+yP2fGyrNsBc_9fizw75SF_6W1zZATNXAnCZoi2cgpgA@mail.gmail.com>
To: QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	wencongyang@gmail.com, qemu trival <qemu-trivial@nongnu.org>
Content-Type: multipart/alternative; boundary="f403045ebdc23cd0fc0550e11bb0"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 5/5] dump: fix
 memory_mapping_filter leak
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
X-List-Received-Date: Thu, 01 Jun 2017 07:37:24 -0000

--f403045ebdc23cd0fc0550e11bb0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2017 at 3:03 PM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@gmail.com> wrote:

> Hi
>
> On Thu, May 4, 2017 at 2:42 AM Marc-Andr=C3=A9 Lureau <
> marcandre.lureau@redhat.com> wrote:
>
>> Spotted by ASAN.
>>
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> ---
>>  memory_mapping.c | 1 +
>>
>
> No maintainer for this file, Wen, Paolo?
>

CC qemu-trivial

thanks


>
>
>
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/memory_mapping.c b/memory_mapping.c
>> index 6a39d71da2..a5d38552a6 100644
>> --- a/memory_mapping.c
>> +++ b/memory_mapping.c
>> @@ -337,6 +337,7 @@ void memory_mapping_filter(MemoryMappingList *list,
>> int64_t begin,
>>          if (cur->phys_addr >=3D begin + length ||
>>              cur->phys_addr + cur->length <=3D begin) {
>>              QTAILQ_REMOVE(&list->head, cur, next);
>> +            g_free(cur);
>>              list->num--;
>>              continue;
>>          }
>> --
>> 2.12.0.191.gc5d8de91d
>>
>>
>> --
> Marc-Andr=C3=A9 Lureau
>
--=20
Marc-Andr=C3=A9 Lureau

--f403045ebdc23cd0fc0550e11bb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">O=
n Fri, May 26, 2017 at 3:03 PM Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto=
:marcandre.lureau@gmail.com">marcandre.lureau@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi<br><div><br><div cl=
ass=3D"gmail_quote"></div></div></div><div dir=3D"ltr"><div><div class=3D"g=
mail_quote"><div dir=3D"ltr">On Thu, May 4, 2017 at 2:42 AM Marc-Andr=C3=A9=
 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank=
">marcandre.lureau@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">Spotted by ASAN.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0memory_mapping.c | 1 +<br></blockquote><div><br></div></div></div></d=
iv><div dir=3D"ltr"><div><div class=3D"gmail_quote"><div>No maintainer for =
this file, Wen, Paolo?<br></div></div></div></div></blockquote><div><br></d=
iv><div>CC qemu-trivial<br><br></div><div>thanks<br>=C2=A0<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"ltr"><div><div class=3D"gmail_quote"><d=
iv><br>=C2=A0<br></div></div></div></div><div dir=3D"ltr"><div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/memory_mapping.c b/memory_mapping.c<br>
index 6a39d71da2..a5d38552a6 100644<br>
--- a/memory_mapping.c<br>
+++ b/memory_mapping.c<br>
@@ -337,6 +337,7 @@ void memory_mapping_filter(MemoryMappingList *list, int=
64_t begin,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cur-&gt;phys_addr &gt;=3D begin + len=
gth ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cur-&gt;phys_addr + cur-&gt=
;length &lt;=3D begin) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QTAILQ_REMOVE(&amp;list-&gt=
;head, cur, next);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(cur);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list-&gt;num--;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--<br>
2.12.0.191.gc5d8de91d<br>
<br>
<br>
</blockquote></div></div></div><div dir=3D"ltr">-- <br></div><div data-smar=
tmail=3D"gmail_signature"><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div>=
</div></blockquote></div></div></div><div dir=3D"ltr">-- <br></div><div dat=
a-smartmail=3D"gmail_signature"><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br>=
</div></div>

--f403045ebdc23cd0fc0550e11bb0--

