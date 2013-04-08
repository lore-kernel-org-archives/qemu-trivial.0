Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UPEfs-0002rH-Ub
	for mharc-qemu-trivial@gnu.org; Mon, 08 Apr 2013 12:12:04 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UPEfk-0002gq-K4
	for qemu-trivial@nongnu.org; Mon, 08 Apr 2013 12:12:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UPEff-0004V4-Sb
	for qemu-trivial@nongnu.org; Mon, 08 Apr 2013 12:11:56 -0400
Received: from cantor2.suse.de ([195.135.220.15]:38646 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UPEfW-0004R9-56; Mon, 08 Apr 2013 12:11:42 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id E2851A3DDF;
	Mon,  8 Apr 2013 18:11:40 +0200 (CEST)
Message-ID: <5162EC3C.2050208@suse.de>
Date: Mon, 08 Apr 2013 18:11:40 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1365436306-20152-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1365436306-20152-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Anthony Green <green@moxielogic.com>,
	Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-moxie: Fix VMState
	registration
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
X-List-Received-Date: Mon, 08 Apr 2013 16:12:02 -0000

Am 08.04.2013 17:51, schrieb Peter Maydell:
> Register the CPU VMState in the correct way, via cpu_class_set_vmsd(),
> rather than doing it in two different wrong ways (once by providing
> cpu_save and cpu_load functions, and once by setting the vmsd field in
> DeviceClass).
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Having just revamped the target-arm vmstate code I now have a
> better grasp of how it should work, so I noticed we didn't quite
> get moxie right. Not really very tested since I couldn't find a test
> image to try, but should work better than the previous code...

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Thanks for fixing this,

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

