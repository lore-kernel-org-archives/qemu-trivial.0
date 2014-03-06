Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WLe2g-0005F3-4L
	for mharc-qemu-trivial@gnu.org; Thu, 06 Mar 2014 14:33:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WLe2R-0004t3-Bu
	for qemu-trivial@nongnu.org; Thu, 06 Mar 2014 14:33:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WLe2K-0003GV-2a
	for qemu-trivial@nongnu.org; Thu, 06 Mar 2014 14:33:03 -0500
Received: from cantor2.suse.de ([195.135.220.15]:52527 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WLe25-0003Ff-8A; Thu, 06 Mar 2014 14:32:41 -0500
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id A7515ACB0;
	Thu,  6 Mar 2014 19:32:40 +0000 (UTC)
Message-ID: <5318CD57.6010107@suse.de>
Date: Thu, 06 Mar 2014 20:32:39 +0100
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1394098765-12727-1-git-send-email-imammedo@redhat.com>
In-Reply-To: <1394098765-12727-1-git-send-email-imammedo@redhat.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: kwolf@redhat.com, aliguori@amazon.com, qemu-trivial@nongnu.org,
	coreyb@linux.vnet.ibm.com, qemu-devel@nongnu.org,
	mreitz@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
	Igor Mammedov <imammedo@redhat.com>, lcapitulino@redhat.com,
	lersek@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 0/2] convert -m to
	QemuOpts
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
X-List-Received-Date: Thu, 06 Mar 2014 19:33:16 -0000

mjt,

Am 06.03.2014 10:39, schrieb Igor Mammedov:
> Igor Mammedov (1):
>   vl: convert -m to QemuOpts
>=20
> Paolo Bonzini (1):
>   qemu-option: introduce qemu_find_opts_singleton
>=20
>  include/qemu/config-file.h |    2 +
>  qemu-options.hx            |    9 +++--
>  util/qemu-config.c         |   14 +++++++
>  vl.c                       |   82 +++++++++++++++++++++++++++++++-----=
--------
>  4 files changed, 80 insertions(+), 27 deletions(-)

Since I believe you have a track record of reviewing and queuing such
QemuOpts conversions, can you review and take this for 2.0 please?

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

