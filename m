Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YjpHw-0001D7-IU
	for mharc-qemu-trivial@gnu.org; Sun, 19 Apr 2015 09:29:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1YjpHe-0001Al-TI
	for qemu-trivial@nongnu.org; Sun, 19 Apr 2015 09:29:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1YjpHE-0002ZW-KO
	for qemu-trivial@nongnu.org; Sun, 19 Apr 2015 09:29:14 -0400
Received: from mail-ig0-f171.google.com ([209.85.213.171]:33412)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1YjpHE-0002ZI-Bi
	for qemu-trivial@nongnu.org; Sun, 19 Apr 2015 09:28:48 -0400
Received: by igbpi8 with SMTP id pi8so51133686igb.0
	for <qemu-trivial@nongnu.org>; Sun, 19 Apr 2015 06:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=irGswKH7dhQ+HcKEggfDNJOZG0BpKKuXinj3rMFsilI=;
	b=Ye2wbRKefIAYQUYPV/hlDG1UQW5EpcC9XZQJgDmFLeUjpn/Lc09ylbelQuUa5mc8Es
	Nt/SXf2zCoQvRg4oh2QBYHj9EufbmnP5YEew0yx05HwTCV2OFsO7vqLlX8JszFcXtvi3
	8+Xx9h43SK3dVX+LIrDP8OLKpPGbKtmXB/DDRBmy7GDhSyR8yA5xZACto9TXNfLTZmLw
	9b+/qrvw7zxmaTbjkDSTDC3RfvAoMKdJPXhpFmxUjmKPIDZ7OE35VXGlKi+nx2h5dDKU
	l25gNrI79KiT6WRS2B1xGRfzPlW+yZKKvHPuhxYJ7WO56qdu9MBIxJNsiuLf4o/tSiaE
	TW9Q==
X-Gm-Message-State: ALoCoQkZP09uxFx63ElDiJWZ0bw3EPbvNhcjESyGyagLFvpT5ljGw+imSClCuuNNsBt3ch56XPjd
MIME-Version: 1.0
X-Received: by 10.50.79.202 with SMTP id l10mr15108505igx.7.1429450127860;
	Sun, 19 Apr 2015 06:28:47 -0700 (PDT)
Received: by 10.107.181.15 with HTTP; Sun, 19 Apr 2015 06:28:47 -0700 (PDT)
X-Originating-IP: [91.205.155.63]
In-Reply-To: <1429440798-11888-1-git-send-email-jhindin@daynix.com>
References: <1429440798-11888-1-git-send-email-jhindin@daynix.com>
Date: Sun, 19 Apr 2015 16:28:47 +0300
Message-ID: <CAJAHpUbL9KDSKArLRjqm4-5v6+f0srnVqtFiQQWo26LLrvYP_A@mail.gmail.com>
From: Joseph Hindin <jhindin@daynix.com>
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary=089e0122aaee188572051413cb18
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.171
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] Windows MSI installation package
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
X-List-Received-Date: Sun, 19 Apr 2015 13:29:31 -0000

--089e0122aaee188572051413cb18
Content-Type: text/plain; charset=UTF-8

Please, excuse for for accidentally sending the patched before they are
ready.
Ignore this patches's set.

   Thank you,
       Joseph Hindin


On Sun, Apr 19, 2015 at 1:53 PM, Joseph Hindin <jhindin@daynix.com> wrote:

> The patch set has been revised according to reviews
>
> 1. options documented in commit messages
> 2. typos fixed
> 3. confugure/Makefile melded into one commit
>
> Following changes were introduced since the last review:
>
> 1. Makefile launches wilx in quite mode.
> 2. configure script explicity valudates option setting and complains on
> mismatch if
> MSI package build is enabled without guest agent or MinGW
> cross-compilation: in the
> previous version, absence of guest agent and MinGW made the script to
> silently drop
> MSI package build.
>
>

--089e0122aaee188572051413cb18
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please, excuse for for accidentally sending the patched be=
fore they are ready.<div>Ignore this patches&#39;s set.</div><div><br></div=
><div>=C2=A0 =C2=A0Thank you,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0Joseph H=
indin</div><div><br></div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Sun, Apr 19, 2015 at 1:53 PM, Joseph Hindin <span dir=
=3D"ltr">&lt;<a href=3D"mailto:jhindin@daynix.com" target=3D"_blank">jhindi=
n@daynix.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The pa=
tch set has been revised according to reviews<br>
<br>
1. options documented in commit messages<br>
2. typos fixed<br>
3. confugure/Makefile melded into one commit<br>
<br>
Following changes were introduced since the last review:<br>
<br>
1. Makefile launches wilx in quite mode.<br>
2. configure script explicity valudates option setting and complains on mis=
match if<br>
MSI package build is enabled without guest agent or MinGW cross-compilation=
: in the<br>
previous version, absence of guest agent and MinGW made the script to silen=
tly drop<br>
MSI package build.<br>
<br>
</blockquote></div><br></div>

--089e0122aaee188572051413cb18--

