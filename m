Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XNPoI-0003W4-SY
	for mharc-qemu-trivial@gnu.org; Fri, 29 Aug 2014 13:18:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1XNPoB-0003IN-EK
	for qemu-trivial@nongnu.org; Fri, 29 Aug 2014 13:18:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1XNPo0-0001mJ-25
	for qemu-trivial@nongnu.org; Fri, 29 Aug 2014 13:17:55 -0400
Received: from mail-we0-f177.google.com ([74.125.82.177]:63822)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmitry@daynix.com>) id 1XNPnz-0001lx-Q7
	for qemu-trivial@nongnu.org; Fri, 29 Aug 2014 13:17:43 -0400
Received: by mail-we0-f177.google.com with SMTP id u56so2470298wes.8
	for <qemu-trivial@nongnu.org>; Fri, 29 Aug 2014 10:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=tS3m++AhD6OZSNkVXmnUPERDRbvbkwszQnRhyD06wGQ=;
	b=mBiSA+e3xk5fImIn0BW91WsiQZ2VUPpE59xWCT/mPuF1Vl4YhvjZXbITNJ5yFXTUHc
	RVVeMTITfQD1pLqLg1EvzMQDXDWdmiY1Uv35CbjXqzNNj2mjsua602neZ253KyvsARb4
	UMLU0fuARWpexNe+5jJiDu+QoQ2g5rGolFABnxabzsRYt8pxlDrDCDjJOo5qepqTOUyQ
	u8p1qgnccgslCnqnSYLPgkUWILPxQlfg49gyaav65Colc8FQjarMkICE0gVC6YUXZXCA
	CPToS3UE5tNMHmHI2LsdPLtyT6iQY3Kp1ClJPD4tRdf47FRhYpkAAolgBIJqT5lG1tiT
	dbUQ==
X-Gm-Message-State: ALoCoQnQCbKxGwW/zNfEw5+ulZO/lOG3gp6FyefJ/8g5CkcTWpxbyJotvmAyiE/zRQ6MAmsROvay
X-Received: by 10.180.75.17 with SMTP id y17mr5188031wiv.3.1409332662711;
	Fri, 29 Aug 2014 10:17:42 -0700 (PDT)
Received: from [10.142.13.247] ([37.26.147.247])
	by mx.google.com with ESMTPSA id h3sm1337793wjz.24.2014.08.29.10.17.41
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 29 Aug 2014 10:17:41 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (1.0)
From: Dmitry Fleytman <dmitry@daynix.com>
X-Mailer: iPhone Mail (11D257)
In-Reply-To: <5400A944.4050603@msgid.tls.msk.ru>
Date: Fri, 29 Aug 2014 20:17:39 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <2D2DF368-5E51-48A4-BD00-30AF2DC4929C@daynix.com>
References: <1409119123-15445-1-git-send-email-dmitry@daynix.com>
	<5400A944.4050603@msgid.tls.msk.ru>
To: Michael Tokarev <mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.177
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Yan Vugenfirer <yan@daynix.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Anthony Liguori <anthony@codemonkey.ws>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Add VMWare devices
	maintainer
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
X-List-Received-Date: Fri, 29 Aug 2014 17:18:01 -0000



> On 29 =D7=91=D7=90=D7=95=D7=92 2014, at 19:24, Michael Tokarev <mjt@tls.ms=
k.ru> wrote:
>=20
> Applied to -trivial, dunno if it'll be picked up by anyone else ;)

This patch is pretty trivial indeed ;)

>=20
> Thank you!
>=20
> /mjt

