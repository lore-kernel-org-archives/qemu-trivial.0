Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9qm7-0001Ik-SP
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2020 08:42:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53241)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1j9qm4-0001G3-1J
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 08:42:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1j9qm1-0004Ha-CQ
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 08:42:51 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:52220
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1j9qm1-0004EX-5x
 for qemu-trivial@nongnu.org; Thu, 05 Mar 2020 08:42:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583415768;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5U1jcN4sA13f/aT+uXQIVD4ub6a//UX3n63FTLnQIKA=;
 b=KytBqRl0dryFxJRKCVA7dTMInizQu4zdYsf7cmR1vbWqDpowmt7Jvs6eKTAcwOdbGCmMeB
 bYPxOBWq8VDwgbXxTdDq5DDFoaqF4m48u7y8bHq5XPn53TE0g3FrrkHtS71ctyXnlPjqa6
 4WK+26n5GvpjNFY/qq3BxtqM8icJkKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-WahPDiqmMo6_5GYbq1j_7A-1; Thu, 05 Mar 2020 08:42:39 -0500
X-MC-Unique: WahPDiqmMo6_5GYbq1j_7A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5418C800D5A;
 Thu,  5 Mar 2020 13:42:38 +0000 (UTC)
Received: from redhat.com (ovpn-112-77.ams2.redhat.com [10.36.112.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C15D273890;
 Thu,  5 Mar 2020 13:42:32 +0000 (UTC)
Date: Thu, 5 Mar 2020 13:42:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Greg Kurz <groug@kaod.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v2 0/9] hw, ui, virtfs-proxy-helper: Reduce QEMU
 .data/.rodata/.bss footprint
Message-ID: <20200305134229.GB2112347@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20200305124525.14555-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200305124525.14555-1-philmd@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Mar 2020 13:42:54 -0000

On Thu, Mar 05, 2020 at 01:45:16PM +0100, Philippe Mathieu-Daud=C3=A9 wrote=
:
> Since v1:
> - merged 2 series
> - reworked hw/usb/quirks
> - added R-b/A-b tags
>=20
> This series reduce the footprint of the QEMU binary:
> .bss: 106KiB (moved to .heap)

Did this actually have an impact on the binary size, or just on the
size the elf-dissector reports ?  I'm not very familiar with ELF,
but Wikipedia's description of BSS makes me question it...

  "Typically only the length of the bss section, but no data,=20
   is stored in the object file. The program loader allocates=20
   memory for the bss section when it loads the program. On
   some platforms, some or all of the bss section is initialized
   to zeroes. Unix-like systems and Windows initialize the bss=20
   section to zero"

This suggests .bss has no on-disk overhead, only runtime overhead,
which is presumably going to be the same with heap allocations.

> .data: 1MiB
> .rodata: 4.34MiB

These looks useful though in terms of disk footprint.

> (sizes on x86_64 building with -Os)
>=20
> The elf-dissector tool [1] [2] helped to notice the big array.
>=20
> [1] https://phabricator.kde.org/source/elf-dissector/
> [2] https://www.volkerkrause.eu/2019/06/22/elf-dissector-aarch64-support.=
html
> [heap equivalent tool working with QEMU: https://github.com/KDE/heaptrack=
]
>=20
> Supersedes: <20200304221807.25212-1-philmd@redhat.com>
> Supersedes: <20200305010446.17029-1-philmd@redhat.com>
>=20
> Philippe Mathieu-Daud=C3=A9 (9):
>   hw/audio/fmopl: Fix a typo twice
>   hw/audio/fmopl: Move ENV_CURVE to .heap to save 32KiB of .bss
>   hw/audio/intel-hda: Use memory region alias to reduce .rodata by
>     4.34MB
>   hw/net/e1000: Add readops/writeops typedefs
>   hw/net/e1000: Move macreg[] arrays to .rodata to save 1MiB of .data
>   hw/usb/quirks: Use smaller types to reduce .rodata by 10KiB
>   ui/curses: Make control_characters[] array const
>   ui/curses: Move arrays to .heap to save 74KiB of .bss
>   virtfs-proxy-helper: Make the helper_opts[] array const
>=20
>  hw/usb/quirks.h             | 22 +++++++++++++---------
>  fsdev/virtfs-proxy-helper.c |  2 +-
>  hw/audio/fmopl.c            |  8 +++++---
>  hw/audio/intel-hda.c        | 24 ++++++++++--------------
>  hw/net/e1000.c              |  6 ++++--
>  hw/net/e1000e_core.c        |  6 ++++--
>  hw/usb/quirks.c             |  4 ++--
>  ui/curses.c                 | 10 +++++++---
>  8 files changed, 46 insertions(+), 36 deletions(-)
>=20
> --=20
> 2.21.1
>=20
>=20

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


