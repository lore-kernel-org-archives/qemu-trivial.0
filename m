Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1btMrf-0002fQ-0l
	for mharc-qemu-trivial@gnu.org; Sun, 09 Oct 2016 18:46:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@natulte.net>) id 1btMrc-0002Gm-MA
	for qemu-trivial@nongnu.org; Sun, 09 Oct 2016 18:46:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dave@natulte.net>) id 1btMkl-0002sv-EV
	for qemu-trivial@nongnu.org; Sun, 09 Oct 2016 18:39:32 -0400
Received: from mail-ua0-x234.google.com ([2607:f8b0:400c:c08::234]:33445)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@natulte.net>) id 1btMkl-0002sh-Ap
	for qemu-trivial@nongnu.org; Sun, 09 Oct 2016 18:39:31 -0400
Received: by mail-ua0-x234.google.com with SMTP id p102so77449231uap.0
	for <qemu-trivial@nongnu.org>; Sun, 09 Oct 2016 15:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=natulte-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qYEWFM/4kmE7TRHvGmAwNLgzgtwZaAJsTphoDV1qyNM=;
	b=ycnSFhKmtr+QBSvcBY/nf0EqJYN7qAVFAwokhBCB5pUKQBV1Lwsh2uH82QIXEVcj1N
	UXODw7hXDWqjonMTKolaaRJGhc7fVLr/ht2btNb8ubW1fMGvHl8ipbyVL62PP6LIarGI
	s8nCRE4B4KQqPXJHeUPrEPs9Tlgpa9c3RihQIdALMALMwHSx/VbW3E3Gnd6izwdxXz+u
	eyFjmkWMlFnmzTLRl/Iwfcgkeq67H8bgNnx4nVax6RsMXrh5mjd+n43PjXj+m/4oWB90
	E/PetqJO4/Ef5stZ7cxS8k8petPCtbIy5FceDAdiTuxJrM05eg/SD0f0/7EElVj8IO8Q
	st7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qYEWFM/4kmE7TRHvGmAwNLgzgtwZaAJsTphoDV1qyNM=;
	b=WVwi9ZPoO54nLqf1/3twKAO02DEjQBC9I1c1mas7LAmOaDp0aM63nF4DesU9M+gjOV
	7xlpUYBVeeEmTDs4vF6wfH5DxIkU0aXgvskI9AXn5KxyBrsMv7I/nUETzNDifCJ6nG3g
	o37dUx73ekvqvXX32vzxdIybhz86+y6q6D05fhCFZQbKtHBOWKMReZbT5fsC4ULXDzyl
	9rc8lDkAbwoqM66l/OkjirMimtW2L3cWVvVVKhxV+JUtWcc+/5AUNqSe3qBwKpeL8uze
	b1yhv1sXx6jZPn4VvJ2CUagOWWhDglTeJsW8Som9c7LieWIzbY47rFXopnyPka2BM0Vd
	pWGw==
X-Gm-Message-State: AA6/9Rmh0X0IGn2abZoqXVbdJNeZcrskp/APqVHUH5FF4CL1XD6Du7jLw1aU7TL0sU961EZUm9IyDSE/s4rqKA==
X-Received: by 10.176.80.131 with SMTP id c3mr20300828uaa.44.1476052770187;
	Sun, 09 Oct 2016 15:39:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.64.6 with HTTP; Sun, 9 Oct 2016 15:39:09 -0700 (PDT)
In-Reply-To: <24687c78-d7cb-07f4-ac6e-bf717ed03fb8@msgid.tls.msk.ru>
References: <20160922040019.19165-1-dave@natulte.net>
	<24687c78-d7cb-07f4-ac6e-bf717ed03fb8@msgid.tls.msk.ru>
From: David Anderson <dave@natulte.net>
Date: Sun, 9 Oct 2016 15:39:09 -0700
Message-ID: <CAMx+r7U04TqNS2nwh+t8k4ugMxoZi5JGC+K_TMqibEKaLL-5ug@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary=94eb2c191ed2098131053e7651b3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::234
Subject: Re: [Qemu-trivial] [PATCH] qapi: make the json schema files more
 regular.
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
X-List-Received-Date: Sun, 09 Oct 2016 22:46:38 -0000

--94eb2c191ed2098131053e7651b3
Content-Type: text/plain; charset=UTF-8

This patch doesn't seem to be in the main repo yet. Any idea when it might
land?

- Dave

On Thu, Sep 29, 2016 at 8:52 AM, Michael Tokarev <mjt@tls.msk.ru> wrote:

> 22.09.2016 07:00, David Anderson wrote:
>
>> This makes it easier to parse the schema file for tool generation:
>> each paragraph is either a non-docstring comment, or a docstring
>> immediately followed by a Python dict describing an API item.
>>
>
> Applied to -trivial, thanks!
>
> /mjt
>

--94eb2c191ed2098131053e7651b3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch doesn&#39;t seem to be in the main repo yet. An=
y idea when it might land?<div><br></div><div>- Dave</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Sep 29, 2016 at 8:5=
2 AM, Michael Tokarev <span dir=3D"ltr">&lt;<a href=3D"mailto:mjt@tls.msk.r=
u" target=3D"_blank">mjt@tls.msk.ru</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><span class=3D""><a href=3D"tel:22.09.2016%2007" value=3D"=
+12209201607" target=3D"_blank">22.09.2016 07</a>:00, David Anderson wrote:=
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
This makes it easier to parse the schema file for tool generation:<br>
each paragraph is either a non-docstring comment, or a docstring<br>
immediately followed by a Python dict describing an API item.<br>
</blockquote>
<br></span>
Applied to -trivial, thanks!<br>
<br>
/mjt<br>
</blockquote></div><br></div>

--94eb2c191ed2098131053e7651b3--

