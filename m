Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cedYH-0004xj-8q
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2017 03:06:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <snaipe@diacritic.io>) id 1cedYE-0004wc-G5
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 03:05:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <snaipe@diacritic.io>) id 1cedYD-0004Q0-Fk
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 03:05:58 -0500
Received: from relay5-d.mail.gandi.net ([2001:4b98:c:538::197]:51328)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <snaipe@diacritic.io>)
	id 1cedY7-0004KV-U6; Fri, 17 Feb 2017 03:05:52 -0500
Received: from mfilter38-d.gandi.net (mfilter38-d.gandi.net [217.70.178.169])
	by relay5-d.mail.gandi.net (Postfix) with ESMTP id 614C541C099;
	Fri, 17 Feb 2017 09:05:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mfilter38-d.gandi.net
Received: from relay5-d.mail.gandi.net ([IPv6:::ffff:217.70.183.197])
	by mfilter38-d.gandi.net (mfilter38-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id OyyCmlxET8dz; Fri, 17 Feb 2017 09:05:47 +0100 (CET)
X-Originating-IP: 74.125.82.176
Received: from mail-ot0-f176.google.com (mail-ot0-f176.google.com
	[74.125.82.176]) (Authenticated sender: snaipe@diacritic.io)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 734EC41C095;
	Fri, 17 Feb 2017 09:05:47 +0100 (CET)
Received: by mail-ot0-f176.google.com with SMTP id t47so27129115ota.1;
	Fri, 17 Feb 2017 00:05:47 -0800 (PST)
X-Gm-Message-State: AMke39k3IbklSWq0wRAFqgR7B699LrAjnU07lUIBfCwqWPak7FYBvCswAG4GD/Ebucf5VduT0bUhxin1fIe8sg==
X-Received: by 10.157.14.114 with SMTP id n47mr4034603otd.29.1487318745909;
	Fri, 17 Feb 2017 00:05:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.57.194 with HTTP; Fri, 17 Feb 2017 00:05:05 -0800 (PST)
In-Reply-To: <20170217005018.GA21716@lemon.lan>
References: <20170216085857.23501-1-snaipe@diacritic.io>
	<20170217005018.GA21716@lemon.lan>
From: "Franklin \"Snaipe\" Mathieu" <snaipe@diacritic.io>
Date: Fri, 17 Feb 2017 08:05:05 +0000
X-Gmail-Original-Message-ID: <CAK_MOSePd7740oW9X1M0U-ga3uOQZUm+P9v4sd95m+r0hBjQEw@mail.gmail.com>
Message-ID: <CAK_MOSePd7740oW9X1M0U-ga3uOQZUm+P9v4sd95m+r0hBjQEw@mail.gmail.com>
To: Fam Zheng <famz@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, snaipe@arista.com, 
	Riku Voipio <riku.voipio@linaro.org>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:4b98:c:538::197
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] syscall: fixed mincore(2)
 not failing with ENOMEM
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
X-List-Received-Date: Fri, 17 Feb 2017 08:05:59 -0000

2017-02-17 0:50 GMT+00:00 Fam Zheng <famz@redhat.com>:
> On Thu, 02/16 08:58, Franklin Snaipe Mathieu wrote:
>> +            p =3D lock_user_string(arg3)
>> +            if (!p) {
>
> Please compile test at least, even if it is a trivial patch.
>

Whoops, sorry, I forgot to re-compile after fixing the checkpatch issues.

--=20
Franklin "Snaipe" Mathieu
=F0=9F=9D=B0 https://diacritic.io

