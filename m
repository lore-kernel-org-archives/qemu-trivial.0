Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCcJe-0005qT-BB
	for mharc-qemu-trivial@gnu.org; Fri, 13 Mar 2020 00:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33267)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mansourweb@gmail.com>) id 1jCcJc-0005q9-Gv
 for qemu-trivial@nongnu.org; Fri, 13 Mar 2020 00:52:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mansourweb@gmail.com>) id 1jCcJb-00065K-Ir
 for qemu-trivial@nongnu.org; Fri, 13 Mar 2020 00:52:56 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:41899)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mansourweb@gmail.com>)
 id 1jCcJb-00061m-Bc
 for qemu-trivial@nongnu.org; Fri, 13 Mar 2020 00:52:55 -0400
Received: by mail-lj1-x236.google.com with SMTP id o10so9037735ljc.8
 for <qemu-trivial@nongnu.org>; Thu, 12 Mar 2020 21:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=WwmgiojUsfIVy1Lf7pSIzWrFwQmd0fXZ6lmVwXUDjgs=;
 b=bs5X/RX+6kDzrSqlY75NdWvHfmN/zsuNORP70RyJmCpYZBf987YPWXP4CX3KMDKw12
 53gWM+YPmmy7zqTXhAe/mmwLflT9DnQzNH5jdYi8fZ1UtZ+7T83fu9sy5bk9oDOcz9tY
 LVjNgyXjQ013JZicWC3YfnZTt96nLns3RBdIrHwLMkvC8dMk26/5FJu3Ot4dSybKp7c+
 E5pMfIwEIrvSlxAhWhRdqR/mleR2MJw3PCsMj1/3LgF4tPTCyab3LZ8QH1SFuJv/t/mi
 Xeef8LWtGFLuSakJV+cVoIRrq1t+EDQHhR08JlqEbK1tYD18ht6hC9+NRNVmeB2kqIkD
 FtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=WwmgiojUsfIVy1Lf7pSIzWrFwQmd0fXZ6lmVwXUDjgs=;
 b=PReKYu8DuV4vaDnrlwHou4w6xkFqZ6ElvWJf1r57gocwQf7uV4/lRV4VWMTKtJLm4b
 JIdEmg+1Dnn4gz3ca2wUqbfhSYy521wLeFwuIUMsoJtnk8O2C5Mw6QDsovfgH7jf0AGy
 P88ehR+QxzVCqD5TEj8Cmv6/YMXBr+QUkvNXxykmrjORgK5OF35Uzw5GtGwR1rqiA4jv
 D+4BpL9aQOgvdwbQloEJiA2zitH/bTKi7W66BOe28fbn5MnlxaZqDKFmfFqDZssU5lAl
 gXueOON9UnAWtvVnQqr/dH82uAYZH2tuGxR0vvo+VdiPY/SYxW0FTSB1UXiwsPwmxn4h
 bvGw==
X-Gm-Message-State: ANhLgQ1kmwlDuy2fGnmwWZnh6QBfmyBW3ewyUN7IXHk/bqE8CBad8Qc9
 eoNDiqAHIMfDGygMvRUSTBZO4PciTwvWLY2zGlC9k6M1rnY=
X-Google-Smtp-Source: ADFU+vsf6kNaE52jJnvuf2+BxGmj34EZjX0gnJyQ7cCSSD+tNEPzTy2Tl4y3H0OliKXnPUJOcmEDFP9H6dg9mkHkwXY=
X-Received: by 2002:a2e:9b87:: with SMTP id z7mr6980032lji.197.1584075173496; 
 Thu, 12 Mar 2020 21:52:53 -0700 (PDT)
MIME-Version: 1.0
From: Mansour Ahmadi <mansourweb@gmail.com>
Date: Fri, 13 Mar 2020 00:52:42 -0400
Message-ID: <CAGT9xrAYkEMy=Yd1exCyqoq8xsiM9a7kVnG0LfdiisCpn+jiuA@mail.gmail.com>
Subject: Missing unlock_user_struct , Deadlock
To: qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000038c1505a0b53e23"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::236
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
X-List-Received-Date: Fri, 13 Mar 2020 04:52:57 -0000

--000000000000038c1505a0b53e23
Content-Type: text/plain; charset="UTF-8"

Hi

In the case of badframe, user struct is not unlocked here and may lead to
deadlock:

https://github.com/qemu/qemu/blob/d4f7d56759f7c75270c13d5f3f5f736a9558929c/linux-user/m68k/signal.c#L380

In similar case, it in unlocked correctly:
https://github.com/qemu/qemu/blob/d4f7d56759f7c75270c13d5f3f5f736a9558929c/linux-user/sh4/signal.c#L303

Thanks,
Mansour

--000000000000038c1505a0b53e23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:garamond=
,serif;font-size:large">Hi</div><div class=3D"gmail_default" style=3D"font-=
family:garamond,serif;font-size:large"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-family:garamond,serif;font-size:large">In the case of badf=
rame, user struct is not unlocked here and may lead to deadlock:</div><div =
class=3D"gmail_default" style=3D"font-family:garamond,serif;font-size:large=
"><br></div><div class=3D"gmail_default" style=3D"font-family:garamond,seri=
f;font-size:large"><a href=3D"https://github.com/qemu/qemu/blob/d4f7d56759f=
7c75270c13d5f3f5f736a9558929c/linux-user/m68k/signal.c#L380">https://github=
.com/qemu/qemu/blob/d4f7d56759f7c75270c13d5f3f5f736a9558929c/linux-user/m68=
k/signal.c#L380</a><br></div><div class=3D"gmail_default" style=3D"font-fam=
ily:garamond,serif;font-size:large"><br></div><div class=3D"gmail_default" =
style=3D"font-family:garamond,serif;font-size:large">In similar case, it in=
 unlocked correctly:</div><div class=3D"gmail_default" style=3D"font-family=
:garamond,serif;font-size:large"><a href=3D"https://github.com/qemu/qemu/bl=
ob/d4f7d56759f7c75270c13d5f3f5f736a9558929c/linux-user/sh4/signal.c#L303">h=
ttps://github.com/qemu/qemu/blob/d4f7d56759f7c75270c13d5f3f5f736a9558929c/l=
inux-user/sh4/signal.c#L303</a><br></div><div class=3D"gmail_default" style=
=3D"font-family:garamond,serif;font-size:large"><br></div><div class=3D"gma=
il_default" style=3D"font-family:garamond,serif;font-size:large">Thanks,</d=
iv><div class=3D"gmail_default" style=3D"font-family:garamond,serif;font-si=
ze:large">Mansour</div><div class=3D"gmail_default" style=3D"font-family:ga=
ramond,serif;font-size:large"></div></div>

--000000000000038c1505a0b53e23--

