Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iIuDb-0000o9-GR
	for mharc-qemu-trivial@gnu.org; Fri, 11 Oct 2019 08:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44576)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nsoffer@redhat.com>) id 1iIt5I-0007IV-0k
 for qemu-trivial@nongnu.org; Fri, 11 Oct 2019 07:27:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nsoffer@redhat.com>) id 1iIt5F-0006VL-Qe
 for qemu-trivial@nongnu.org; Fri, 11 Oct 2019 07:27:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36680)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <nsoffer@redhat.com>) id 1iIt5E-0006Se-Vg
 for qemu-trivial@nongnu.org; Fri, 11 Oct 2019 07:27:45 -0400
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E916081F22
 for <qemu-trivial@nongnu.org>; Fri, 11 Oct 2019 11:27:42 +0000 (UTC)
Received: by mail-ot1-f72.google.com with SMTP id d15so4618219otc.18
 for <qemu-trivial@nongnu.org>; Fri, 11 Oct 2019 04:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i+pru+W/cL9NaXsEZaHTyJYge4kHKehavYL9OBP5BVA=;
 b=oEmgIjvfLnCrxAzdBEc0QXqG2nTwdttZXK4rJltEzAcE0tN1eqfXj5E8R8g4LqfzKW
 G9iBjLWzXKkzCPLWiqnLIM1IjpF0zwiSAe3Q/v9LUDy7UbLmz30LCgxiMNUPZAD0ut9q
 nhijru+1CUiS79FcaFgBjUoAzim9QTvwASdlxTdMLT/tqCQ4JU5cnQsaqUwBTQvWTOrM
 9XaWeNqgUnwJXpf7K0tcKLbV+Ev3UfMXPBpLN2H7D0KGlIUsCQk8B7gdvIkApJo2PzgO
 xw3h/pqLbM3D3yBg+zdmU8xH0U2LWk4VAX1hXdUVG1katLWpmcmd1wFtQMssrQsLPMf5
 uRNw==
X-Gm-Message-State: APjAAAV1snjGiDkbdh9q/8nzgqfnHvshtddh6cWvOdu/374+pp17hLto
 38JgMartIbNQV5ezJOeDNXCbVn0XXjlaMGeV1scBEUuzgzXYB4/Ng4sar2OQN0HOs8IVWC3DX/8
 Ff9ZL3mMWeGaijIggjOwZnG1PGZ4VZWVg+A==
X-Received: by 2002:a9d:3675:: with SMTP id w108mr9413201otb.81.1570793262429; 
 Fri, 11 Oct 2019 04:27:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQHTZIBTgumgY8dP4Xk1kkQ7jfHWGFgVnTzXyEsIUjt4/Juz4yMgYh/VGf3x3tC+fcJEWd9sbdJo4bko2Y4wY=
X-Received: by 2002:a9d:3675:: with SMTP id w108mr9413178otb.81.1570793262147; 
 Fri, 11 Oct 2019 04:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191009194740.8079-1-crosa@redhat.com>
 <20191009194740.8079-2-crosa@redhat.com>
 <20191011093610.GD5158@localhost.localdomain>
In-Reply-To: <20191011093610.GD5158@localhost.localdomain>
From: Nir Soffer <nsoffer@redhat.com>
Date: Fri, 11 Oct 2019 14:27:25 +0300
Message-ID: <CAMRbyyu=NdwhKFwb=JzMyHfbnP4XzzpaHTCd7ucT7tLEk9HdFA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] qemu-iotests: remove bash shebang from library
 files
To: Kevin Wolf <kwolf@redhat.com>
Cc: Cleber Rosa <crosa@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 qemu-trivial@nongnu.org, 
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006809840594a0cedd"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Fri, 11 Oct 2019 08:40:27 -0400
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
X-List-Received-Date: Fri, 11 Oct 2019 11:27:50 -0000

--0000000000006809840594a0cedd
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 11, 2019, 12:36 Kevin Wolf <kwolf@redhat.com> wrote:

> Am 09.10.2019 um 21:47 hat Cleber Rosa geschrieben:
> > Due to not being able to find a reason to have shebangs on files that
> > are not executable.
> >
> > While at it, add a mode hint to emacs, which would be clueless or
> > plain wrong about these containing shell code.
>
> vim still doesn't like the change.
>
> Of course, we could also add another line for vim and for every other
> editor in use, but actually, I think I'd prefer just dropping this
> patch. It even makes each file a few bytes larger instead of saving
> something. Shebang lines are a shorter and more portable format
> indicator than the alternatives.
>
> So I think in the end we have found a good reason to keep them. :-)
>

What about .sh suffix? Should be most portable way.

>

--0000000000006809840594a0cedd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Oct 11, 2019, 12:36 Kevin Wolf &lt;<a href=3D"=
mailto:kwolf@redhat.com">kwolf@redhat.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Am 09.10.2019 um 21:47 hat Cleber Rosa geschrieben:<b=
r>
&gt; Due to not being able to find a reason to have shebangs on files that<=
br>
&gt; are not executable.<br>
&gt; <br>
&gt; While at it, add a mode hint to emacs, which would be clueless or<br>
&gt; plain wrong about these containing shell code.<br>
<br>
vim still doesn&#39;t like the change.<br>
<br>
Of course, we could also add another line for vim and for every other<br>
editor in use, but actually, I think I&#39;d prefer just dropping this<br>
patch. It even makes each file a few bytes larger instead of saving<br>
something. Shebang lines are a shorter and more portable format<br>
indicator than the alternatives.<br>
<br>
So I think in the end we have found a good reason to keep them. :-)<br></bl=
ockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">What abo=
ut .sh suffix? Should be most portable way.</div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote></div></div>=
</div>

--0000000000006809840594a0cedd--

