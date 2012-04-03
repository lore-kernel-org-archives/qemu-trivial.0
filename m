Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SF0eK-00070q-2s
	for mharc-qemu-trivial@gnu.org; Tue, 03 Apr 2012 06:07:40 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony.perard@gmail.com>) id 1SF0eC-0006dl-Qz
	for qemu-trivial@nongnu.org; Tue, 03 Apr 2012 06:07:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony.perard@gmail.com>) id 1SF0e8-0000zK-4E
	for qemu-trivial@nongnu.org; Tue, 03 Apr 2012 06:07:32 -0400
Received: from mail-lpp01m010-f45.google.com ([209.85.215.45]:64364)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony.perard@gmail.com>)
	id 1SF0dz-0000uH-Rb; Tue, 03 Apr 2012 06:07:20 -0400
Received: by lahe6 with SMTP id e6so4649295lah.4
	for <multiple recipients>; Tue, 03 Apr 2012 03:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=zvPKgd3tltibvKzJ+ZjDKeuA32r/gDWro0ngWnzhFGA=;
	b=JL6D9DmhLg6XnP1OqGnZGCc8uubpk2oj0oMRkayzvUvWP96TLr3Y1zD3HDstY97Mdc
	oPkZQ2lBabrksD1y9Gmt1PMnbV8A+KsqlXjeym/BvLbHSFZs21EfAoTzqEyiSCodho+u
	ZwZCdkEEx6g1AlT6B2Bp3VkLngmrMBGlbWVQ86/ueQXVLr9Gg1jvnk04aIY9nOEMbsYG
	/8OHTSxX7ZwUckew7E1VDxSfEVcfmP6L7I5e1kKWLaLf9LvbfUqZeYDCpYuzkob7TfKM
	4iGr2gY/MHw9H/QtccnuWKQa8dUOEYpdyzjSUeyY5SMCoov6lUMYATya+lzakezvW8d2
	+ogA==
Received: by 10.152.135.104 with SMTP id pr8mr13332011lab.27.1333447636346;
	Tue, 03 Apr 2012 03:07:16 -0700 (PDT)
MIME-Version: 1.0
Sender: anthony.perard@gmail.com
Received: by 10.152.5.162 with HTTP; Tue, 3 Apr 2012 03:06:45 -0700 (PDT)
In-Reply-To: <20120403085620.GC30614@stefanha-thinkpad.localdomain>
References: <1333379439-8688-1-git-send-email-anthony.perard@citrix.com>
	<20120403085620.GC30614@stefanha-thinkpad.localdomain>
From: Anthony PERARD <anthony.perard@citrix.com>
Date: Tue, 3 Apr 2012 11:06:45 +0100
X-Google-Sender-Auth: FZbaBEqpvq4PDm-c0cm7HSiGqe8
Message-ID: <CAJJyHj+gJOeAhoK9dLBt5YKwXh55tB2gJBHTxPC6z7h8KVYN=Q@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, QEMU-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] make: fix clean
 rule by removing build file in qom/
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
X-List-Received-Date: Tue, 03 Apr 2012 10:07:38 -0000

On Tue, Apr 3, 2012 at 09:56, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
>> tg: (a3b6181..) fix/make-clean (depends on: master)
>
> What's this? =C2=A0I'm curious. =C2=A0First I thought it was a signature =
joke that
> I didn't get but I guess it's for some kind of commit tracking system?

No, it is not. To prepare a patch (or patch set), I use a tool called topgi=
t.

http://repo.or.cz/w/topgit.git

It creates one git branch per patch, and you can add as many
dependence branch as you want. When you want to "rebase" a patch,
topgit will merge with the depends.

--=20
Anthony PERARD

