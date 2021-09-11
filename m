Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mP0mh-0005Fi-Q2
	for mharc-qemu-trivial@gnu.org; Sat, 11 Sep 2021 07:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mP0mf-0005C2-LF
 for qemu-trivial@nongnu.org; Sat, 11 Sep 2021 07:02:57 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:43738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mP0ma-00017t-UA
 for qemu-trivial@nongnu.org; Sat, 11 Sep 2021 07:02:57 -0400
Received: by mail-ej1-x632.google.com with SMTP id qq21so3810394ejb.10
 for <qemu-trivial@nongnu.org>; Sat, 11 Sep 2021 04:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vMY5MhdXnNtRvMssFkjK0i1wunhLwq3GINuwlMn5d2A=;
 b=JJQLToGji3h2EgVOxAO6LvrgFk6FMHX+2gb+WZY77/PD/vuDUjpOlB14SuOM2yRooo
 WmKstZmnl56hMpNCuxyICbu5xV2A2+QO4m8zObnlAqrYqI0bKmsHkzjcyuLV2DA0r4Js
 HM/p3rJ05VYWnnyr1HvmchoqcKd1l+0fhKSNXe5dlPl3Qr6NCTnpGCKZrlZPTxGigZN5
 0y03DOBkiirqRiuP73FK/AjOXioPJh8huB6EBNgCmpFPU6mTk/dFIkSiosKRquoCHqyt
 fY+ecNJb0/eDtIqlIAP1CzWhYbothORh+yC6tyIAU6NwP/qN91Q8ka3W2CIEujwH5bY9
 1gDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vMY5MhdXnNtRvMssFkjK0i1wunhLwq3GINuwlMn5d2A=;
 b=0ukRNvSl6pbDBYozOPvu3V0cpk0AwqJCqMCqbVwgGgEcw4oP6oy93T72DeOTK//PDx
 addhm+v6eNsWsYzoRiZ7MQrgaRSPI1znNrnouieXCdQBlw4rK82YAJqzTWR67GZr7URD
 hKdz7G2TSKSGsSRjEqB9fA1/peCpmzVLAfYzzV5LYIPQYqkI+qgomPu9BiHORVV/zhTG
 A59oNTtaaM9TFsSL8g/3jgPgSyzIwDUV2iYkQ407J1ewzoAH5Wlp3hKuUkOKBKR6SOEW
 nhtzCEGjvb6+2EFRD4cZdZqIHqqURkOReQe87vOwNTYCPt3uU85sKf7Si87aBm573X3T
 UwdA==
X-Gm-Message-State: AOAM531xIkH4Sh8qoSnqHVc1aWUL+WzdnJ/QfCgEtqYhzSdxmwnY1m5g
 C3Cxh/SR0TWMgBh+fWiQzj3793hearn4CZ1SVxR8EQ==
X-Google-Smtp-Source: ABdhPJzx7JoALTOZ/6pEIMslB+/cf0iCwVtWfgWaH3Jo9oqtgUZ4xxizn9+MYK7sMqCxFx6MMvNwc7p6oAzQUHTWqoI=
X-Received: by 2002:a17:906:d045:: with SMTP id
 bo5mr2295257ejb.461.1631358171270; 
 Sat, 11 Sep 2021 04:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210908222157.2377282-1-philmd@redhat.com>
 <d11a3da6-c26c-1f78-ff52-e965f214cba7@t-online.de>
 <a1988342-7304-ccc9-8a5a-7da0172569ff@redhat.com>
 <CAARzgwzr=mKp6nxsy6STs5Sy9NKCkA53pCLY7CoxhbdN4=4U3g@mail.gmail.com>
 <cc0cebd1-43a3-17c7-f52a-db4db0161855@redhat.com>
 <CAARzgwxLf0hfxLaOs6mEWm05zGkXJWJLT6qETAgkYyPuWP7JEQ@mail.gmail.com>
In-Reply-To: <CAARzgwxLf0hfxLaOs6mEWm05zGkXJWJLT6qETAgkYyPuWP7JEQ@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Sat, 11 Sep 2021 16:32:40 +0530
Message-ID: <CAARzgwxHFBMP6Qyb-QRWHE1qdhLeoCK4RkQN1yqJrpju1Q021Q@mail.gmail.com>
Subject: Re: [PATCH] hw/i386/acpi-build: Fix a typo
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>, qemu-devel@nongnu.org, 
 qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000004ce62205cbb62c75"
Received-SPF: none client-ip=2a00:1450:4864:20::632;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x632.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Sep 2021 11:02:57 -0000

--0000000000004ce62205cbb62c75
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 11, 2021 at 15:24 Ani Sinha <ani@anisinha.ca> wrote:

>
>
> On Sat, Sep 11, 2021 at 13:56 Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
> wrote:
>
>> On 9/11/21 3:33 AM, Ani Sinha wrote:
>> > On Sat, Sep 11, 2021 at 1:03 AM Philippe Mathieu-Daud=C3=A9
>> > <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
>> >
>> >     On 9/10/21 8:54 PM, Volker R=C3=BCmelin wrote:
>> >     >> Fix 'hotplugabble' -> 'hotpluggabble' typo.
>> >     >
>> >     > I'm convinced that the correct spelling is hotpluggable. Only th=
e
>> >     > consonant g is doubled.
>> >
>> >     Lol I missed this part, thanks :>
>> >
>> >
>> > Oops my apologies. I also did not notice the double b.
>>
>> Typoglycemia++
>
>
> Will have to experiment with this
>
> https://www.tenderisthebyte.
> <https://www.tenderisthebyte.com/blog/2019/06/09/spell-checking-emacs/>
>
com/blog/2019/06/09/spell-checking-emacs/
> <https://www.tenderisthebyte.com/blog/2019/06/09/spell-checking-emacs/>
>

Maybe we could also add a spellchecker to checkpatch?

--0000000000004ce62205cbb62c75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Sep 11, 2021 at 15:24 Ani Sinha &lt;<a href=3D"mail=
to:ani@anisinha.ca">ani@anisinha.ca</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><div><br></div><div><br><div class=3D"gmail_quote"></div></=
div><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Sat, Sep 11, 2021 at 13:56 Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mai=
lto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">On 9/11/21 3:33 AM, Ani Sinha wrote:=
<br>
&gt; On Sat, Sep 11, 2021 at 1:03 AM Philippe Mathieu-Daud=C3=A9<br>
&gt; &lt;<a href=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd@redh=
at.com</a> &lt;mailto:<a href=3D"mailto:philmd@redhat.com" target=3D"_blank=
">philmd@redhat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 9/10/21 8:54 PM, Volker R=C3=BCmelin wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Fix &#39;hotplugabble&#39; -&gt; &#39;hotp=
luggabble&#39; typo.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I&#39;m convinced that the correct spelling is=
 hotpluggable. Only the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; consonant g is doubled.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Lol I missed this part, thanks :&gt;<br>
&gt; <br>
&gt; <br>
&gt; Oops my apologies. I also did not notice the double b.<br>
<br>
Typoglycemia++</blockquote><div dir=3D"auto"><br></div></div></div><div><di=
v class=3D"gmail_quote"><div dir=3D"auto">Will have to experiment with this=
=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div><a href=3D"h=
ttps://www.tenderisthebyte.com/blog/2019/06/09/spell-checking-emacs/" targe=
t=3D"_blank">https://www.tenderisthebyte.</a></div></div></div></div></bloc=
kquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div><div class=3D"gmail_quote"><div =
dir=3D"auto"><div dir=3D"auto"><a href=3D"https://www.tenderisthebyte.com/b=
log/2019/06/09/spell-checking-emacs/" target=3D"_blank">com/blog/2019/06/09=
/spell-checking-emacs/</a></div></div></div></div></blockquote><div dir=3D"=
auto"><br></div><div dir=3D"auto">Maybe we could also add a spellchecker to=
 checkpatch?=C2=A0</div><div dir=3D"auto"><br></div></div></div>

--0000000000004ce62205cbb62c75--

