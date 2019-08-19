Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hzpUK-000412-EQ
	for mharc-qemu-trivial@gnu.org; Mon, 19 Aug 2019 17:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32985)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jkz@google.com>) id 1hzpU0-0003yR-0m
 for qemu-trivial@nongnu.org; Mon, 19 Aug 2019 17:46:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jkz@google.com>) id 1hzpTw-0001lz-PY
 for qemu-trivial@nongnu.org; Mon, 19 Aug 2019 17:46:31 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:33100)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jkz@google.com>) id 1hzpTw-0001hc-Cc
 for qemu-trivial@nongnu.org; Mon, 19 Aug 2019 17:46:28 -0400
Received: by mail-pf1-x441.google.com with SMTP id g2so1967935pfq.0
 for <qemu-trivial@nongnu.org>; Mon, 19 Aug 2019 14:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ikavlIOQOEnel5CO+3gZOR2OAKyiRO+kaAZwrxJfrzg=;
 b=boTVdzNxiFK/APPvyrHAKGZ+XUFBxDu06Oq1BPKodzjO7RWbVQ3rsBBbveHGuCGHHT
 h15V2eZ+2XhEvWL+O/3gwdHxun6T5BJaSVTkeFcyide3xd15zyPFayBoYCTxiQDRqled
 4+RE2P538/o28ox8JLgfY+1+++SIKyg6g4HuGidcqcLIembnD2nIOIk1XPw1fM8vBRQH
 W4DP3floDjhOP/tMlE93YXNysrbobHKh4qp7XOMPtdA1q3xGfGJuwwl++63wUrechVmc
 S8tTQFB/OH1e4ZovT2iCKAfyTb1X9yhcX2tP6Hgnzna3PQ6j1tS6DVcHOoKlQ8f5Kf8i
 bcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ikavlIOQOEnel5CO+3gZOR2OAKyiRO+kaAZwrxJfrzg=;
 b=uTi2HWFmWAsWZGji3Cl21n2aOSEMFDXBxpwrYB+y/a6YWlB3Cmjp6Q5ZoFN55qmicw
 LvCuK5++KvRBhNcuoNrf35EtVTvmBIZ6OtjTEMtjUp/vzXQ4crSBJHA2cvvjzjbblmU2
 GNl61jA924fKXhFpXeSW7psKS47tj8PsT39ECXeAkGWEgJOuQw3iYHNxxdfmF4U9tYUP
 YReFBh8JZoNGB7fRYF8Nelo5ChDI18rYCU+UMjJ8I6zcOXXciqoJMUPIEFAeuEwI7z6Y
 sZwtzXDbEcnf3kV9D7U+YEIxk6+kzGhJvEH+9YBrC82dB82tHSMaE/yeYlUYdu09KslS
 GIQA==
X-Gm-Message-State: APjAAAUIFccDHgtDReFz4cDM5cmXmzYWee+QytkhjlcLnZLxHyKVuZYy
 iHJxpIgpgIMiNg+6K/7d8QwMCM2eQzn1hwbvEsmXeA==
X-Google-Smtp-Source: APXvYqxRx6oUNp1G9JHtrYWLK+lg+ZxfFHsYR09xUd7U/+vXBqqUJxFeCPikTgVX0o5Z79OgQi3+vUv/kfGUwpI2+pg=
X-Received: by 2002:a62:7513:: with SMTP id q19mr27647688pfc.192.1566251184064; 
 Mon, 19 Aug 2019 14:46:24 -0700 (PDT)
MIME-Version: 1.0
From: Josh Kunz <jkz@google.com>
Date: Mon, 19 Aug 2019 14:46:13 -0700
Message-ID: <CADgy-2vznasvwaUwNSi96Sy=ucPC=-3e=O9irqc5DSpV_uhWUg@mail.gmail.com>
To: marlies.ruck@gmail.com, qemu-devel@nongnu.org, riku.voipio@iki.fi, 
 laurent@vivier.eu
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, 
 Shu-Chun Weng <scw@google.com>
Content-Type: multipart/alternative; boundary="00000000000074ea1c05907f4579"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-trivial] [Qemu-devel] patch to swap SIGRTMIN + 1 and
 SIGRTMAX - 1
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
X-List-Received-Date: Mon, 19 Aug 2019 21:46:46 -0000

--00000000000074ea1c05907f4579
Content-Type: text/plain; charset="UTF-8"

Hi all,

I have also experienced issues with SIGRTMIN + 1, and am interested in
moving this patch forwards. Anything I can do here to help? Would the
maintainers prefer myself or Marli re-submit the patch?

The Go issue here seems particularly sticky. Even if we update the Go
runtime, users may try and run older binaries built with older versions of
Go for quite some time (months? years?). Would it be better to hide this
behind some kind of build-time flag (`--enable-sigrtmin-plus-one-proxy` or
something), so that some users can opt-in, but older binaries still work as
expected?

Also, here is a link to the original thread this message is in reply to
in-case my mail-client doesn't set up the reply properly:
https://lists.nongnu.org/archive/html/qemu-devel/2019-07/msg01303.html

Thanks,
Josh Kunz

--00000000000074ea1c05907f4579
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I have also experienced issues=
=C2=A0with SIGRTMIN=C2=A0+ 1, and am interested in moving this patch forwar=
ds. Anything I can do here to help? Would the maintainers prefer myself or =
Marli re-submit the patch?</div><div><br></div><div>The Go issue here seems=
 particularly sticky. Even if we update the Go runtime, users may try and r=
un older binaries built with older versions of Go for quite some time (mont=
hs? years?). Would it be better to hide this behind some kind of build-time=
 flag (`--enable-sigrtmin-plus-one-proxy` or something), so that some users=
=C2=A0can opt-in, but older binaries still work as expected?</div><div><br>=
</div><div>Also, here is a link to=C2=A0the original thread this message is=
 in reply to in-case my mail-client doesn&#39;t set up the reply properly:=
=C2=A0<a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/2019-07/m=
sg01303.html">https://lists.nongnu.org/archive/html/qemu-devel/2019-07/msg0=
1303.html</a></div><div><br></div><div>Thanks,</div><div>Josh Kunz</div></d=
iv>

--00000000000074ea1c05907f4579--

