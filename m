Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ffjTM-000238-Lz
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jul 2018 06:14:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1ffjTK-00020y-1O
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2018 06:14:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1ffjTJ-0006P0-0z
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2018 06:14:13 -0400
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2]:47653)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <michael@walle.cc>)
	id 1ffjTH-0006M9-28; Wed, 18 Jul 2018 06:14:11 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher DHE-RSA-CAMELLIA256-SHA256 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 57C8122232;
	Wed, 18 Jul 2018 12:14:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
	s=mail2016061301; t=1531908848;
	bh=Z9ZU75IjjzWXmcZ7OWJ4K5xZ4+uT/BOMZNwwPI2bKW8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YyAS0kBOIgSyR74iW7MhcaOflg7hQ4nkIjhnT1mlJYdlLo5JKRj6KueOilM4Kbi+K
	TrhTGbedeh0x0ehd865hlEsAfdstTbKF384v0EseC6b7XCUNdvRzNH/C4NFcz6GqNz
	+JE0sRYC7RmXJal6INWVs5Kyx8CXCuQYx5tYRrbE=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Wed, 18 Jul 2018 12:14:07 +0200
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
In-Reply-To: <20180702014022.12395-1-f4bug@amsat.org>
References: <20180702014022.12395-1-f4bug@amsat.org>
Message-ID: <be617722854ec9aba00e86e756336568@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.2.3
X-Virus-Scanned: clamav-milter 0.100.0 at web
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a01:4f8:151:8464::1:2
Subject: Re: [Qemu-trivial] [PATCH v2] milkymist-minimac2: Use
 qemu_log_mask(GUEST_ERROR) instead of error_report
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
X-List-Received-Date: Wed, 18 Jul 2018 10:14:15 -0000

Am 2018-07-02 03:40, schrieb Philippe Mathieu-Daud=C3=A9:
> qemu_log_mask(GUEST_ERROR) is more appropriate:
>=20
>   $ qemu -d help
>   Log items (comma separated):
>   guest_errors    log when the guest OS does something invalid (eg
> accessing a non-existent register)
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Acked-by: Michael Walle <michael@walle.cc>

Will this go through the qemu-trivial queue?

-michael

