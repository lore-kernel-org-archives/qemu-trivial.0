Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cTgs9-0006e5-5v
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jan 2017 22:25:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTgs7-0006cY-EK
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 22:25:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTgs6-0000a1-Lo
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 22:25:15 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:34166)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <skiver.cloud.yzy@gmail.com>)
	id 1cTgs4-0000Xv-VK; Tue, 17 Jan 2017 22:25:13 -0500
Received: by mail-qk0-x241.google.com with SMTP id e1so120673qkh.1;
	Tue, 17 Jan 2017 19:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZRE4ojHQC+x8UUumBDMNrqjS8Vb/1jigBub1ALvOWgU=;
	b=ECnIu705ioKNGj2VvlTpaYL+nz7GeJbyYkX35hDg6LaV40wMaFCHzvsiMRvP0xvoYe
	9cYLhlSNcmn5D1xUyWEgyDut3Vuty6Agvnj2EDEUDVNAhg5KZ6UG0HnICwdLaLXHes2b
	i5h1UkePSdtOl1pSdVUcL9UgEBcKxBhDpIYtjezN6dnPVlFZsX1FA63YrjqodjiNDi/Z
	w7CE3iL92E61LpN7yjN/pPUtbgE47mHuqQJVWP7UDQIijpY5+r/Shry6w1LAfU19r8BR
	dxzrp5KtMVTyv5Bx7nucbr3YQ4C+QaiUJjnIh/M92sSRfGkj6+UyZhue9W1cvl+Z/GME
	im6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZRE4ojHQC+x8UUumBDMNrqjS8Vb/1jigBub1ALvOWgU=;
	b=WY+y/RSnlP1/ZQHBmfFFfvQ1uNYkWyQAPQFt1w7SK+gKOx2hHyexGV5RDYFL/t9voR
	wE0Um4ZTO1GMoHx1X49jJFum1n7H249aHF5fcxUQ/m4mJl09sfNI9D2+lWaHPoHfm1Vo
	190ZMD4KQWUXZAudt8HIx6v5p3VLg7mItCPkaG7BfelIho71+zuwCAclQ8qGar/G5LzL
	ahvjgcC+K9OkkbgvgNhS/8yiOsPumUPrEdANKe3IeQMl1NuOc0XMaz6PRer0P3FGytiV
	hLqRjaSzVbe0flxYPnFGfUc1Qx7Uq/GPirBjfoJBBr6zvx3emA6an/7dYv4mxmoi3Kxs
	GskA==
X-Gm-Message-State: AIkVDXJlH3+RWDfln6qChRGyAQoIovwUqB9aV1vQ3nVPeNsKeY/Rp4zOylQUzwv9aDQb4VlbjH25eu2wXoELiQ==
X-Received: by 10.55.209.69 with SMTP id s66mr938289qki.94.1484709912490; Tue,
	17 Jan 2017 19:25:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.82.231 with HTTP; Tue, 17 Jan 2017 19:25:12 -0800 (PST)
In-Reply-To: <20170118021529.GC31883@lemon.Home>
References: <1484702885-11437-1-git-send-email-skiver.cloud.yzy@gmail.com>
	<20170118021529.GC31883@lemon.Home>
From: Yang Ziyue <skiver.cloud.yzy@gmail.com>
Date: Wed, 18 Jan 2017 11:25:12 +0800
Message-ID: <CAHkcwacfme4xZhzt0_YHi9wCvp3jZ31Kz+J2sLP3L5D-HBHO4g@mail.gmail.com>
To: Fam Zheng <famz@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Ziyue Yang <yzylivezh@hotmail.com>, Anthony Liguori <aliguori@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] gdbstub.c: fix GDB
 connection segfault caused by empty machines
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
X-List-Received-Date: Wed, 18 Jan 2017 03:25:16 -0000

Hi Fam,

I've split the patch into 2 smaller ones and submitted them tagged with "v4".
Thanks!

Ziyue Yang

2017-01-18 10:15 GMT+08:00 Fam Zheng <famz@redhat.com>:
> On Wed, 01/18 09:28, Ziyue Yang wrote:
>> Also some updates from fprintf(stderr, ...) to error_report.
>
> Looks like they belong to a separate patch.
>
> Fam

