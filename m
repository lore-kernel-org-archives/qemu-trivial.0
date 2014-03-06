Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WLe03-0003YL-12
	for mharc-qemu-trivial@gnu.org; Thu, 06 Mar 2014 14:30:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WLdzu-0003C6-Vp
	for qemu-trivial@nongnu.org; Thu, 06 Mar 2014 14:30:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WLdzp-0002tq-03
	for qemu-trivial@nongnu.org; Thu, 06 Mar 2014 14:30:26 -0500
Received: from cantor2.suse.de ([195.135.220.15]:52489 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WLdzb-0002mK-Q8; Thu, 06 Mar 2014 14:30:07 -0500
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id F2284ACB0;
	Thu,  6 Mar 2014 19:30:06 +0000 (UTC)
Message-ID: <5318CCBD.20404@suse.de>
Date: Thu, 06 Mar 2014 20:30:05 +0100
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1394098765-12727-1-git-send-email-imammedo@redhat.com>
	<1394098765-12727-3-git-send-email-imammedo@redhat.com>
In-Reply-To: <1394098765-12727-3-git-send-email-imammedo@redhat.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: kwolf@redhat.com, aliguori@amazon.com, qemu-trivial@nongnu.org,
	coreyb@linux.vnet.ibm.com, mjt@tls.msk.ru, mreitz@redhat.com,
	stefanha@redhat.com, pbonzini@redhat.com, lcapitulino@redhat.com,
	lersek@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 2/2] vl: convert -m to
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
X-List-Received-Date: Thu, 06 Mar 2014 19:30:33 -0000

Am 06.03.2014 10:39, schrieb Igor Mammedov:
> Adds option to -m
>  "size" - startup memory amount
>=20
> For compatibility with legacy CLI if suffix-less number is passed,
> it assumes amount in Mb.
>=20
> Otherwise user is free to use suffixed number using suffixes b,k/K,M,G
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>

Thanks,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

