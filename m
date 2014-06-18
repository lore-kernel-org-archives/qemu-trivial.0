Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wx3L6-00045i-II
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jun 2014 20:02:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Wx3Kw-0003vJ-MA
	for qemu-trivial@nongnu.org; Tue, 17 Jun 2014 20:02:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Wx3Ko-0001hZ-T1
	for qemu-trivial@nongnu.org; Tue, 17 Jun 2014 20:02:46 -0400
Received: from cantor2.suse.de ([195.135.220.15]:42457 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Wx3KZ-0001eC-98; Tue, 17 Jun 2014 20:02:23 -0400
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 7216FAC0C;
	Wed, 18 Jun 2014 00:02:22 +0000 (UTC)
Message-ID: <53A0D70D.6000208@suse.de>
Date: Wed, 18 Jun 2014 02:02:21 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <1403046329-12784-1-git-send-email-ehabkost@redhat.com>
In-Reply-To: <1403046329-12784-1-git-send-email-ehabkost@redhat.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] target-i386: Fix indentation of CPU
	model definitions
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
X-List-Received-Date: Wed, 18 Jun 2014 00:02:54 -0000

Am 18.06.2014 01:05, schrieb Eduardo Habkost:
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  target-i386/cpu.c | 204 +++++++++++++++++++++++++++-------------------=
--------
>  1 file changed, 102 insertions(+), 102 deletions(-)

Thanks, applied to qom-cpu.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

