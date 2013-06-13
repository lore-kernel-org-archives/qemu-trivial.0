Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Un5LP-0000zS-IN
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jun 2013 07:05:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Un5LJ-0000s8-JO
	for qemu-trivial@nongnu.org; Thu, 13 Jun 2013 07:05:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Un5LI-0003wJ-F8
	for qemu-trivial@nongnu.org; Thu, 13 Jun 2013 07:05:25 -0400
Received: from cantor2.suse.de ([195.135.220.15]:50887 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Un5LC-0003vU-Ay; Thu, 13 Jun 2013 07:05:18 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id E358AA53F3;
	Thu, 13 Jun 2013 13:05:17 +0200 (CEST)
Message-ID: <51B9A766.6070706@suse.de>
Date: Thu, 13 Jun 2013 13:05:10 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Hu Tao <hutao@cn.fujitsu.com>
References: <1371120709-18923-1-git-send-email-hutao@cn.fujitsu.com>
	<1371120709-18923-2-git-send-email-hutao@cn.fujitsu.com>
In-Reply-To: <1371120709-18923-2-git-send-email-hutao@cn.fujitsu.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fix typo: apci -> acpi
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
X-List-Received-Date: Thu, 13 Jun 2013 11:05:30 -0000

Am 13.06.2013 12:51, schrieb Hu Tao:
> Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
> ---
>  hw/acpi/ich9.c  | 4 ++--
>  hw/acpi/piix4.c | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

