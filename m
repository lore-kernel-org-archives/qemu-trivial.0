Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SFgyt-0001Ca-E1
	for mharc-qemu-trivial@gnu.org; Thu, 05 Apr 2012 03:19:43 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SFgyk-0000mg-RM
	for qemu-trivial@nongnu.org; Thu, 05 Apr 2012 03:19:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SFgyd-0003tb-RP
	for qemu-trivial@nongnu.org; Thu, 05 Apr 2012 03:19:33 -0400
Received: from cantor2.suse.de ([195.135.220.15]:33671 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1SFgyS-0003rL-B9; Thu, 05 Apr 2012 03:19:16 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 53BEA92325;
	Thu,  5 Apr 2012 09:19:12 +0200 (CEST)
Message-ID: <4F7D476F.5080307@suse.de>
Date: Thu, 05 Apr 2012 09:19:11 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120312 Thunderbird/11.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1333555395-12873-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1333555395-12873-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.4
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, patches@linaro.org,
	Juan Quintela <quintela@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Remove useless
	uses of ARCH_CFLAGS
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
X-List-Received-Date: Thu, 05 Apr 2012 07:19:42 -0000

Am 04.04.2012 18:03, schrieb Peter Maydell:
> Remove some useless uses of ARCH_CFLAGS -- this variable was never set
> so will always be empty. The uses were accidental: in commit 0c439cbf8
> Juan Quintela removed ARCH_CFLAGS in favour of CFLAGS (which in turn
> became QEMU_CFLAGS). However in commit be17dc90 a use of it was
> reintroduced (apparently accidentally) by Michael S. Tsirkin, and then
> I subsequently cut-n-pasted that into a number of other configure
> feature tests.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Thanks,

/-F

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

