Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyj1T-0005mp-8Y
	for mharc-qemu-trivial@gnu.org; Fri, 16 Aug 2019 16:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55341)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hyj1P-0005mO-Rv
 for qemu-trivial@nongnu.org; Fri, 16 Aug 2019 16:40:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hyj1O-00022h-As
 for qemu-trivial@nongnu.org; Fri, 16 Aug 2019 16:40:27 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:34181)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1hyj1O-00022U-3A; Fri, 16 Aug 2019 16:40:26 -0400
Received: by mail-oi1-x22f.google.com with SMTP id l12so5756806oil.1;
 Fri, 16 Aug 2019 13:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=c9VsMHVCP4KfoSfL3VT11e66qBGPrsJnARN0azHYKUA=;
 b=YruAphYXMraAMzob3smlwmxNmmkPlIQEgYTiRbIk8y2XT4dB3GTBiSveuZvvK7GWuN
 +EcOnTH39Q1PWPlhz2u9aNGY2yi6zRAitbYyZPJA2RFL2jEYxIvi8Uq6U0pj1jrTUJCs
 QhddWSsicrpvR7sXHu1GCux5lmllT98cLNM4/KLEUksn7fQu/paDujKtE9A7gmnSnXY7
 W3BNXem2A4lEQmhO52nf5b2Uks1tCfMqRCo1jhiDaDqUu4GGZmVRN1iIrai9R71xNQvG
 kIhAzZkJHAkpvJbbtV30zEpZAZHPaeD3j7DJ52IRyaeAk2xNlU/nr9aG7G5QTEA189Q9
 Y68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=c9VsMHVCP4KfoSfL3VT11e66qBGPrsJnARN0azHYKUA=;
 b=iwUSkdyzQ9KR9KyyLssmwbM6NMXjQLCm/nAz6Y+Q4oOqwJ73iYMuyuzaHQR5s8g6ah
 tpsUFYO72Gycg4bGYr9VFVPoKyrSDnxESmUzk5Cxm+ATRFfNf6O49MW70+LPTiZ3AuwQ
 ezbYOOVs+nfBMe6dwWSv1AmyXFhzCgjzIvq+sPBWcMfzkX8Pxlu0TGL15jvrusZW5MsF
 7Gbz0Ngvmiwzk/7ecJ2n+VsK6HD5EZVKWqzlNEQ6kxtldTnyYebKIpRQcHqDaX4vgozQ
 l1ulxdST/MGi6Dq5V6GL6RoEx7GvQR7x4kqCmW3CeYiTZUvMaxKmOF1B87iPEkv40zkU
 0zcg==
X-Gm-Message-State: APjAAAVZtXxStQBGPu2Hv9MQENtJIELvwsMRrzBAZbAIO/bfT5SFP4I4
 HIumkccCTGsRFI81XT8rEqn9IUL4aH3ZKpIZCwY=
X-Google-Smtp-Source: APXvYqxaTWOAm/l1MOhvoSsoq5mkFcyhEntd6Wirl7CSo0Md0lq8qVQSRwbxOaJJ35Fn38tf0wvQ7v3r1wGxH8dokwo=
X-Received: by 2002:a05:6808:8cd:: with SMTP id
 k13mr6459721oij.136.1565988024958; 
 Fri, 16 Aug 2019 13:40:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Fri, 16 Aug 2019 13:40:24
 -0700 (PDT)
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Fri, 16 Aug 2019 13:40:24
 -0700 (PDT)
In-Reply-To: <CAAgDR1NQSoO6d-OSB_YqbrPA6vxYnq7ZJE_=LoA=eLdmoc3Rsw@mail.gmail.com>
References: <CAAgDR1NQSoO6d-OSB_YqbrPA6vxYnq7ZJE_=LoA=eLdmoc3Rsw@mail.gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 16 Aug 2019 22:40:24 +0200
Message-ID: <CAL1e-=gE94D+JXnje7e8+_-P7qBjRTmmX548fA+89Zx-Q-HfWQ@mail.gmail.com>
To: Sebastian Rasmussen <sebras@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000f34531059041ff25"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22f
Subject: Re: [Qemu-trivial] [Qemu-devel] Translation of qemu to Swedish...
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
X-List-Received-Date: Fri, 16 Aug 2019 20:40:29 -0000

--000000000000f34531059041ff25
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

16.08.2019. 22.20, "Sebastian Rasmussen" <sebras@gmail.com> =D1=98=D0=B5 =
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> Hi!
>
> I noticed that a translation to Swedish was missing,
> so I'd like to contribute that. Let me know if there is
> some issue and I'll do my best to fix it. :)
>
>  / Sebastian
>
> From 9d8525b987e0db8309b6221a7e2a292fa5db9eec Mon Sep 17 00:00:00 2001
> From: Sebastian Rasmussen <sebras@gmail.com>
> Date: Fri, 16 Aug 2019 21:22:11 +0200
> Subject: [PATCH] Added Swedish translation.
>
> Signed-off-by: Sebastian Rasmussen <sebras@gmail.com>
> ---

Very kind of you, Sebastian!

I don't have any computer at hand to check, do I am asking you, or anybody
else, to check if there is no clash between hot keys: you used 'f' for both
"_F=C3=A5nga inmatning" and "Visa _flika", 'a' for "_Avsluta" and "Zooma ti=
ll
_anpassad storlek", and 'h' for "_Helsk=C3=A4rm" and "F=C3=A5nga vid _hovri=
ng". (If
those hot keys are applicable at different situations, they are OK, but not
in the same situation.)

Tack ska du ha!

Aleksandar

>  po/sv.po | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 po/sv.po
>
> diff --git a/po/sv.po b/po/sv.po
> new file mode 100644
> index 0000000000..e1ef3f7776
> --- /dev/null
> +++ b/po/sv.po
> @@ -0,0 +1,75 @@
> +# Swedish translation of qemu po-file.
> +# This file is put in the public domain.
> +# Sebastian Rasmussen <sebras@gmail.com>, 2019.
> +#
> +msgid ""
> +msgstr ""
> +"Project-Id-Version: QEMU 2.12.91\n"
> +"Report-Msgid-Bugs-To: qemu-devel@nongnu.org\n"
> +"POT-Creation-Date: 2018-07-18 07:56+0200\n"
> +"PO-Revision-Date: 2019-08-16 21:19+0200\n"
> +"Last-Translator: Sebastian Rasmussen <sebras@gmail.com>\n"
> +"Language-Team: Swedish <tp-sv@listor.tp-sv.se>\n"
> +"Language: sv\n"
> +"MIME-Version: 1.0\n"
> +"Content-Type: text/plain; charset=3DUTF-8\n"
> +"Content-Transfer-Encoding: 8bit\n"
> +"Plural-Forms: nplurals=3D2; plural=3D(n !=3D 1);\n"
> +"X-Generator: Poedit 2.2.3\n"
> +
> +msgid " - Press Ctrl+Alt+G to release grab"
> +msgstr " - Tryck Ctrl+Alt+G f=C3=B6r att sluta f=C3=A5nga"
> +
> +msgid " [Paused]"
> +msgstr " [Pausad]"
> +
> +msgid "_Pause"
> +msgstr "_Paus"
> +
> +msgid "_Reset"
> +msgstr "_Starta om"
> +
> +msgid "Power _Down"
> +msgstr "St=C3=A4ng _ner"
> +
> +msgid "_Quit"
> +msgstr "_Avsluta"
> +
> +msgid "_Fullscreen"
> +msgstr "_Helsk=C3=A4rm"
> +
> +msgid "_Copy"
> +msgstr "_Kopiera"
> +
> +msgid "Zoom _In"
> +msgstr "Zooma _in"
> +
> +msgid "Zoom _Out"
> +msgstr "Zooma _ut"
> +
> +msgid "Best _Fit"
> +msgstr "Anpassad _storlek"
> +
> +msgid "Zoom To _Fit"
> +msgstr "Zooma till _anpassad storlek"
> +
> +msgid "Grab On _Hover"
> +msgstr "F=C3=A5nga vid _hovring"
> +
> +msgid "_Grab Input"
> +msgstr "_F=C3=A5nga inmatning"
> +
> +msgid "Show _Tabs"
> +msgstr "Visa _flika"
> +
> +msgid "Detach Tab"
> +msgstr "Frig=C3=B6r flik"
> +
> +msgid "Show Menubar"
> +msgstr "Visa menyrad"
> +
> +msgid "_Machine"
> +msgstr "_Maskin"
> +
> +msgid "_View"
> +msgstr "_Visa"
> --
> 2.23.0.rc1
>

--000000000000f34531059041ff25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
16.08.2019. 22.20, &quot;Sebastian Rasmussen&quot; &lt;<a href=3D"mailto:se=
bras@gmail.com">sebras@gmail.com</a>&gt; =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=
=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:<br>
&gt;<br>
&gt; Hi!<br>
&gt;<br>
&gt; I noticed that a translation to Swedish was missing,<br>
&gt; so I&#39;d like to contribute that. Let me know if there is<br>
&gt; some issue and I&#39;ll do my best to fix it. :)<br>
&gt;<br>
&gt; =C2=A0/ Sebastian<br>
&gt;<br>
&gt; From 9d8525b987e0db8309b6221a7e2a292fa5db9eec Mon Sep 17 00:00:00 2001=
<br>
&gt; From: Sebastian Rasmussen &lt;<a href=3D"mailto:sebras@gmail.com">sebr=
as@gmail.com</a>&gt;<br>
&gt; Date: Fri, 16 Aug 2019 21:22:11 +0200<br>
&gt; Subject: [PATCH] Added Swedish translation.<br>
&gt;<br>
&gt; Signed-off-by: Sebastian Rasmussen &lt;<a href=3D"mailto:sebras@gmail.=
com">sebras@gmail.com</a>&gt;<br>
&gt; ---</p>
<p dir=3D"ltr">Very kind of you, Sebastian!</p>
<p dir=3D"ltr">I don&#39;t have any computer at hand to check, do I am aski=
ng you, or anybody else, to check if there is no clash between hot keys: yo=
u used &#39;f&#39; for both &quot;_F=C3=A5nga inmatning&quot; and &quot;Vis=
a _flika&quot;, &#39;a&#39; for &quot;_Avsluta&quot; and &quot;Zooma till _=
anpassad storlek&quot;, and &#39;h&#39; for &quot;_Helsk=C3=A4rm&quot; and =
&quot;F=C3=A5nga vid _hovring&quot;. (If those hot keys are applicable at d=
ifferent situations, they are OK, but not in the same situation.)</p>
<p dir=3D"ltr">Tack ska du ha!</p>
<p dir=3D"ltr">Aleksandar</p>
<p dir=3D"ltr">&gt; =C2=A0po/sv.po | 75 +++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++<br>
&gt; =C2=A01 file changed, 75 insertions(+)<br>
&gt; =C2=A0create mode 100644 po/sv.po<br>
&gt;<br>
&gt; diff --git a/po/sv.po b/po/sv.po<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..e1ef3f7776<br>
&gt; --- /dev/null<br>
&gt; +++ b/po/sv.po<br>
&gt; @@ -0,0 +1,75 @@<br>
&gt; +# Swedish translation of qemu po-file.<br>
&gt; +# This file is put in the public domain.<br>
&gt; +# Sebastian Rasmussen &lt;<a href=3D"mailto:sebras@gmail.com">sebras@=
gmail.com</a>&gt;, 2019.<br>
&gt; +#<br>
&gt; +msgid &quot;&quot;<br>
&gt; +msgstr &quot;&quot;<br>
&gt; +&quot;Project-Id-Version: QEMU 2.12.91\n&quot;<br>
&gt; +&quot;Report-Msgid-Bugs-To: <a href=3D"mailto:qemu-devel@nongnu.org">=
qemu-devel@nongnu.org</a>\n&quot;<br>
&gt; +&quot;POT-Creation-Date: 2018-07-18 07:56+0200\n&quot;<br>
&gt; +&quot;PO-Revision-Date: 2019-08-16 21:19+0200\n&quot;<br>
&gt; +&quot;Last-Translator: Sebastian Rasmussen &lt;<a href=3D"mailto:sebr=
as@gmail.com">sebras@gmail.com</a>&gt;\n&quot;<br>
&gt; +&quot;Language-Team: Swedish &lt;<a href=3D"mailto:tp-sv@listor.tp-sv=
.se">tp-sv@listor.tp-sv.se</a>&gt;\n&quot;<br>
&gt; +&quot;Language: sv\n&quot;<br>
&gt; +&quot;MIME-Version: 1.0\n&quot;<br>
&gt; +&quot;Content-Type: text/plain; charset=3DUTF-8\n&quot;<br>
&gt; +&quot;Content-Transfer-Encoding: 8bit\n&quot;<br>
&gt; +&quot;Plural-Forms: nplurals=3D2; plural=3D(n !=3D 1);\n&quot;<br>
&gt; +&quot;X-Generator: Poedit 2.2.3\n&quot;<br>
&gt; +<br>
&gt; +msgid &quot; - Press Ctrl+Alt+G to release grab&quot;<br>
&gt; +msgstr &quot; - Tryck Ctrl+Alt+G f=C3=B6r att sluta f=C3=A5nga&quot;<=
br>
&gt; +<br>
&gt; +msgid &quot; [Paused]&quot;<br>
&gt; +msgstr &quot; [Pausad]&quot;<br>
&gt; +<br>
&gt; +msgid &quot;_Pause&quot;<br>
&gt; +msgstr &quot;_Paus&quot;<br>
&gt; +<br>
&gt; +msgid &quot;_Reset&quot;<br>
&gt; +msgstr &quot;_Starta om&quot;<br>
&gt; +<br>
&gt; +msgid &quot;Power _Down&quot;<br>
&gt; +msgstr &quot;St=C3=A4ng _ner&quot;<br>
&gt; +<br>
&gt; +msgid &quot;_Quit&quot;<br>
&gt; +msgstr &quot;_Avsluta&quot;<br>
&gt; +<br>
&gt; +msgid &quot;_Fullscreen&quot;<br>
&gt; +msgstr &quot;_Helsk=C3=A4rm&quot;<br>
&gt; +<br>
&gt; +msgid &quot;_Copy&quot;<br>
&gt; +msgstr &quot;_Kopiera&quot;<br>
&gt; +<br>
&gt; +msgid &quot;Zoom _In&quot;<br>
&gt; +msgstr &quot;Zooma _in&quot;<br>
&gt; +<br>
&gt; +msgid &quot;Zoom _Out&quot;<br>
&gt; +msgstr &quot;Zooma _ut&quot;<br>
&gt; +<br>
&gt; +msgid &quot;Best _Fit&quot;<br>
&gt; +msgstr &quot;Anpassad _storlek&quot;<br>
&gt; +<br>
&gt; +msgid &quot;Zoom To _Fit&quot;<br>
&gt; +msgstr &quot;Zooma till _anpassad storlek&quot;<br>
&gt; +<br>
&gt; +msgid &quot;Grab On _Hover&quot;<br>
&gt; +msgstr &quot;F=C3=A5nga vid _hovring&quot;<br>
&gt; +<br>
&gt; +msgid &quot;_Grab Input&quot;<br>
&gt; +msgstr &quot;_F=C3=A5nga inmatning&quot;<br>
&gt; +<br>
&gt; +msgid &quot;Show _Tabs&quot;<br>
&gt; +msgstr &quot;Visa _flika&quot;<br>
&gt; +<br>
&gt; +msgid &quot;Detach Tab&quot;<br>
&gt; +msgstr &quot;Frig=C3=B6r flik&quot;<br>
&gt; +<br>
&gt; +msgid &quot;Show Menubar&quot;<br>
&gt; +msgstr &quot;Visa menyrad&quot;<br>
&gt; +<br>
&gt; +msgid &quot;_Machine&quot;<br>
&gt; +msgstr &quot;_Maskin&quot;<br>
&gt; +<br>
&gt; +msgid &quot;_View&quot;<br>
&gt; +msgstr &quot;_Visa&quot;<br>
&gt; -- <br>
&gt; 2.23.0.rc1<br>
&gt;<br>
</p>

--000000000000f34531059041ff25--

