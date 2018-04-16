Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7xoL-00056O-G2
	for mharc-qemu-trivial@gnu.org; Mon, 16 Apr 2018 02:40:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1f7xoJ-000539-Gp
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2018 02:40:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1f7xoI-0003ym-QO
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2018 02:40:19 -0400
Received: from ssl.serverraum.org ([2a01:4f8:222:d45::1:2]:57231)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <michael@walle.cc>)
	id 1f7xoD-0003lb-Ks; Mon, 16 Apr 2018 02:40:13 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher DHE-RSA-CAMELLIA256-SHA256 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id E971F22322;
	Mon, 16 Apr 2018 08:40:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
	s=mail2016061301; t=1523860805;
	bh=D1cZ9pXvFopXFaNHkIMso+QXFjVTUJAtczkLX5H0h2s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SwYBoH1Ai65/JyNZm20UF5jY3jooSfBrO6xh9lX06eM4Ijz4BPWALHYcZpQDzvpyj
	VKSFrvMWQZVqQbXAuZsLDNwrtkKGfpzvqJQXdUAThPsAWuQ/4opcFUPvH6fp27sg0u
	LL5KAnD5ChF51EJ4d4YYM3AP+mCFEBC9m/Ffa0+w=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Mon, 16 Apr 2018 08:40:04 +0200
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
In-Reply-To: <20180415234307.28132-28-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
	<20180415234307.28132-28-f4bug@amsat.org>
Message-ID: <140b55d5d04ee9b1a6a79233e51eb42f@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.2.3
X-Virus-Scanned: clamav-milter 0.99.4 at web
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a01:4f8:222:d45::1:2
Subject: Re: [Qemu-trivial] [PATCH v3 27/41] hw/lm32: Use the BYTE-based
 definitions
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
X-List-Received-Date: Mon, 16 Apr 2018 06:40:20 -0000

Am 2018-04-16 01:42, schrieb Philippe Mathieu-Daud=C3=A9:
> It eases code review, unit is explicit.
>=20
> Patch generated using:
>=20
>   $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/=20
> include/hw/
>=20
> and modified manually.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Acked-by: Michael Walle <michael@walle.cc>

