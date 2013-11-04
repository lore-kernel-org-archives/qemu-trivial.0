Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VdQRN-0002qI-5E
	for mharc-qemu-trivial@gnu.org; Mon, 04 Nov 2013 15:08:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VdQRG-0002g4-1D
	for qemu-trivial@nongnu.org; Mon, 04 Nov 2013 15:07:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VdQR5-0001rj-Em
	for qemu-trivial@nongnu.org; Mon, 04 Nov 2013 15:07:53 -0500
Received: from mail-la0-f41.google.com ([209.85.215.41]:45855)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VdQR5-0001r0-7t
	for qemu-trivial@nongnu.org; Mon, 04 Nov 2013 15:07:43 -0500
Received: by mail-la0-f41.google.com with SMTP id ea20so451174lab.0
	for <qemu-trivial@nongnu.org>; Mon, 04 Nov 2013 12:07:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=eUdeUgrZd89QcVSTP/ktwq1PtJOUIuCOFvnIGJs3Nio=;
	b=IqPQDb74SajDUeH8nvPczLxXXh3yNu41LS3FiKVc8KuN81RgfKIAae1kki9G8v/BvV
	0VKQJVd8EICJZ2c1JpL1zhL56lV8EKy+pEJvvchuKEkfGRpjA1ALltFQvBt/Vodwa+T8
	tk36h93QYMMOqQlC3jnXZdff/SEK8pQr6Bx1C9iyK4yZwSKU+20q8njBDjRAwhk/UpXs
	u60bMxQskFULbAyO/78QABmcI1j1wlJJEMKD6WKnwTtW0mr4r1jWNBBocIuVZPySI/0V
	o7mHVo7CgwCHrMgWTDBN7DW8bjDV5f11hmAoM+8JDwgB40su+KteQTpnAmAx/Ja019Nj
	5BQg==
X-Gm-Message-State: ALoCoQlcnqWPygavHNoVlSU3R52GU6b2xGBmPTxLfXvsvame2tqJ9j3i3gZMDyi/0HRJZ80Z9wBH
X-Received: by 10.152.3.42 with SMTP id 10mr13359666laz.22.1383595662299; Mon,
	04 Nov 2013 12:07:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.161.232 with HTTP; Mon, 4 Nov 2013 12:07:22 -0800 (PST)
In-Reply-To: <1383594685-19332-1-git-send-email-sw@weilnetz.de>
References: <1383594685-19332-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Nov 2013 20:07:22 +0000
Message-ID: <CAFEAcA9-YvQPprbt1+KCG0ov44-gbvaPx-gtX4yyd5fzfcX3UA@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.41
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gtk: Fix compiler warnings
	with -Werror=sign-compare
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
X-List-Received-Date: Mon, 04 Nov 2013 20:07:59 -0000

On 4 November 2013 19:51, Stefan Weil <sw@weilnetz.de> wrote:
> With -Werror=3Dsign-compare (not enabled by default), gcc shows these err=
ors:
>
> ui/gtk.c: In function =E2=80=98gtk_release_modifiers=E2=80=99:
> ui/gtk.c:288:19: error:
>  comparison between signed and unsigned integer expressions [-Werror=3Dsi=
gn-compare]
> ui/gtk.c: In function =E2=80=98gd_key_event=E2=80=99:
> ui/gtk.c:746:19: error:
>  comparison between signed and unsigned integer expressions [-Werror=3Dsi=
gn-compare]

If this warning is going to complain about entirely
safe and idiomatic code like

   int i;
   static const int some_array[] =3D {
       0x2a, 0x36, 0x1d, 0x9d, 0x38, 0xb8, 0xdb, 0xdd,
   };

   for (i =3D 0; i < ARRAY_SIZE(some_array); i++) {
       ...
   }

then I think it is more trouble than it is worth and we
should leave it disabled.

thanks
-- PMM

