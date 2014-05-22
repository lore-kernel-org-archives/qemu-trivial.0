Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WnSMB-0006Sm-5h
	for mharc-qemu-trivial@gnu.org; Thu, 22 May 2014 08:44:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WnSM2-0006DW-T2
	for qemu-trivial@nongnu.org; Thu, 22 May 2014 08:44:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WnSLw-0002cT-6q
	for qemu-trivial@nongnu.org; Thu, 22 May 2014 08:44:14 -0400
Received: from cantor2.suse.de ([195.135.220.15]:51758 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WnSLi-0002Yq-4O; Thu, 22 May 2014 08:43:54 -0400
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 90079AC96;
	Thu, 22 May 2014 12:43:53 +0000 (UTC)
Message-ID: <537DF108.8050608@suse.de>
Date: Thu, 22 May 2014 14:43:52 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Saravanakumar <saravanakumar.punith@gmail.com>, 
 qemu-devel@nongnu.org
References: <1400758430-32697-1-git-send-email-saravanakumar.punith@gmail.com>
In-Reply-To: <1400758430-32697-1-git-send-email-saravanakumar.punith@gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pci: move dereferencing of
 root only after verifying valid root pointer.
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
X-List-Received-Date: Thu, 22 May 2014 12:44:21 -0000

Am 22.05.2014 13:33, schrieb Saravanakumar:
> Move dereferencing of root only after verifying valid root pointer.
>=20
>=20
> Signed-off-by: Saravanakumar <saravanakumar.punith@gmail.com>

Looks sensible, but mst can hopefully tweak the overly long subject. No
need to write the same into subject and body. That said,

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

