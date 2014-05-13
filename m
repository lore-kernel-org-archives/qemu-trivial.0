Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wk8le-0007gm-S4
	for mharc-qemu-trivial@gnu.org; Tue, 13 May 2014 05:12:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Wk8lW-0007Og-Cc
	for qemu-trivial@nongnu.org; Tue, 13 May 2014 05:12:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Wk8lO-0000cc-Tw
	for qemu-trivial@nongnu.org; Tue, 13 May 2014 05:12:50 -0400
Received: from cantor2.suse.de ([195.135.220.15]:45450 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Wk8ku-0000Y2-6z; Tue, 13 May 2014 05:12:12 -0400
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id BA1EAAD23;
	Tue, 13 May 2014 09:12:10 +0000 (UTC)
Message-ID: <5371E1E9.1070504@suse.de>
Date: Tue, 13 May 2014 11:12:09 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Li, Zhen-Hua" <zhen-hual@hp.com>
References: <1399964954-10842-1-git-send-email-zhen-hual@hp.com>
In-Reply-To: <1399964954-10842-1-git-send-email-zhen-hual@hp.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/4] Support more than 255
	cpus
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
X-List-Received-Date: Tue, 13 May 2014 09:12:57 -0000

Am 13.05.2014 09:09, schrieb Li, Zhen-Hua:
> From: "Li, ZhenHua" <zhen-hual@hp.com>
>=20
> These series patches are trying to make Qemu support more than 255 CPUs=
.=20
> The max cpu number changed to 4096.

This series is not trivial.
And it's not a bug fix either, so not stable material.

CC'ing Igor and Eduardo for review.

Regards,
Andreas

>  Support more than 255 cpus: ACPI and APIC defines
>  Support more than 255 cpus: max_cpus to 4096
>  Support more than 255 cpus: max cpumask bit to 4096
>  Support more than 255 cpus: runtime chec
>=20
>  include/hw/acpi/cpu_hotplug_defs.h | 4 ++--
>  include/hw/i386/apic_internal.h    | 2 +-
>  include/hw/i386/pc.h | 2 +-
>  include/sysemu/sysemu.h | 2 +-
>  hw/i386/acpi-build.c | 8 ++++----

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

