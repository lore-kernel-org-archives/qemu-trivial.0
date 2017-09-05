Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dpGCd-0002DV-Oa
	for mharc-qemu-trivial@gnu.org; Tue, 05 Sep 2017 11:55:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dpGCY-000294-35
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 11:55:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dpGCS-0005Vw-PU
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 11:55:46 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:33277)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1dpGCS-0005VO-JV; Tue, 05 Sep 2017 11:55:40 -0400
Received: by mail-oi0-x241.google.com with SMTP id k191so2929447oih.0;
	Tue, 05 Sep 2017 08:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+L5aZ/QySFPq/8pOAY6bCHffUdUY0G6YppHROyJXcno=;
	b=RjNtVwIJSIAY+8cwQmtTPszzekDnx9FBfl5nc+Av9SbKquxBYgbb/qn10ZFgpgLjil
	dFe8WRdoaj1ZnAq4Lm4WBwuvAPMmDdG3t+1jLnQr6FaIsKmhEQLOQ/xiHb69OAo1xIlp
	dxrIx/Uu8isXUSOtrG/aUkcWDJdzDnIURQt4OSlHvAFmrFhxklyjRS8I+sOv5Ink6uwK
	Fu3UoyWcvTcA7JKD67V3UHC4SHo+qPVwKG6u9ft5IjAJRMiYtpiJpt1PIhrxG4v3lh+m
	T4WXkoaums1OhsPeimgw/8BTeyvm78IMjohMOOrjUG+MMKcEUGJXe1QLOJWxeINSlypd
	8E6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+L5aZ/QySFPq/8pOAY6bCHffUdUY0G6YppHROyJXcno=;
	b=jHJ6DyIfiYQD9orpn9WTcfEwyM/MpO1Z1DR9r+fhcO5lvhoZx3ZEg/TqLwpNgYXwQe
	if/u07d7N8JvUWXNdkCQktxY9DUlQG+DUAzN8iFCCwDEgj83uTx5v4cwujypDDVjBB6r
	lUdHANC9kc4Z73XvIcIbMUhAtWcb85JYp7ta9hNZvKmOqzFVN0eO2ELLwbXzbMbvPoXG
	mdECPHzxDzQLhjqMPFvS1WdRLrshvKZ8TS+VUKY8vXER5WqhdLyMw4T+C+8qYuPRVGdr
	89fEq6SIZ5vUyUCXYuvL9HWwCbQVnF5E7XKTcrfGgPsr/iquHHFsgaAH8TCjEYl2gql0
	RRAw==
X-Gm-Message-State: AHPjjUjQ8ELInPIig340am0wM6onSpAXON8v5hA3M1yQ5rQNw8ptpOc5
	7DOkkME+T0deaWxvLGXJNC492tiY2Q==
X-Google-Smtp-Source: ADKCNb6VjksQJpJAAl2Fl1dvT2Po4izfbZgRBsGtxit3sybq3o+IZOZqJY72N6pN9TJBkVY6IAm0wA+S/HsltkuL5pQ=
X-Received: by 10.202.79.211 with SMTP id d202mr3979601oib.42.1504626939695;
	Tue, 05 Sep 2017 08:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+F1C+mPu9ftXwgs4UrGTQp4f65-thhvmWoB-kuRmu0=vnFFw@mail.gmail.com>
	<87zia9palk.fsf@dusky.pond.sub.org>
	<CAJ+F1CJaxdbHnLQy6H=5=Q3ZMw0w01xsvK3ybhj80=6F9dR6gQ@mail.gmail.com>
	<87fuc1ma7d.fsf@dusky.pond.sub.org>
In-Reply-To: <87fuc1ma7d.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 05 Sep 2017 15:55:28 +0000
Message-ID: <CAJ+F1CLAFEHjWpZpJQ_QS2VV=sjYqYpydjSe2ZEdRN-N-bhHzQ@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu trival <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="001a113d709c429d5905587342d8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-trivial] [Qemu-devel] clang-tidy: use g_new() family of
 functions
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
X-List-Received-Date: Tue, 05 Sep 2017 15:55:51 -0000

--001a113d709c429d5905587342d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi


> Suggest you show us cool things you can do with clang-tidy that haven't
> been done with Coccinelle :)
>
> Well to do that I would have to have a transformations to do & know the
limits/strength of coccinelle & clang-tidy, I am not there yet... Today, I
prefer invest in clang-tidy for what I need to do.

We already discussed some of the pros/cons of coccinelle vs tidy her and in
the previous round-up series. For ex, clang-tidy is able to evaluate
constant expressions, so you can write generic rules that you can't capture
with coccinelle yet (A + B-1) / B * B:
https://github.com/elmarco/clang-tools-extra/blob/master/clang-tidy/qemu/Ro=
undCheck.cpp
.

However, I think it is more difficult to write clang-tidy transformation
that spans accross various code paths (like adding errors/free/locks etc).
Coccinelle makes that fairly easily apparently.
--=20
Marc-Andr=C3=A9 Lureau

--001a113d709c429d5905587342d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<br><br><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div><br>
Suggest you show us cool things you can do with clang-tidy that haven&#39;t=
<br>
been done with Coccinelle :)<br>
<br></div></blockquote><div>Well to do that I would have to have a transfor=
mations to do &amp; know the limits/strength of coccinelle &amp; clang-tidy=
, I am not there yet... Today, I prefer invest in clang-tidy for what I nee=
d to do.<br></div><div><br></div><div>We already discussed some of the pros=
/cons of coccinelle vs tidy her and in the previous round-up series. For ex=
, clang-tidy is able to evaluate constant expressions, so you can write gen=
eric rules that you can&#39;t capture with coccinelle yet (<span class=3D"i=
nbox-inbox-pl-c">A + B-1) / B * B</span>: <a href=3D"https://github.com/elm=
arco/clang-tools-extra/blob/master/clang-tidy/qemu/RoundCheck.cpp">https://=
github.com/elmarco/clang-tools-extra/blob/master/clang-tidy/qemu/RoundCheck=
.cpp</a>.</div><div><br></div><div>However, I think it is more difficult to=
 write clang-tidy transformation that spans accross various code paths (lik=
e adding errors/free/locks etc). Coccinelle makes that fairly easily appare=
ntly.</div></div></div><div dir=3D"ltr">-- <br></div><div class=3D"gmail_si=
gnature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Marc-Andr=C3=
=A9 Lureau<br></div></div>

--001a113d709c429d5905587342d8--

