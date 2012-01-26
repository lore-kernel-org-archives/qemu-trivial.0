Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RqQt6-0002iT-Kh
	for mharc-qemu-trivial@gnu.org; Thu, 26 Jan 2012 10:05:20 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RqQsy-0002JY-A7
	for qemu-trivial@nongnu.org; Thu, 26 Jan 2012 10:05:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RqQsu-0007jU-2C
	for qemu-trivial@nongnu.org; Thu, 26 Jan 2012 10:05:12 -0500
Received: from cantor2.suse.de ([195.135.220.15]:58076 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1RqQsc-0007du-Ib; Thu, 26 Jan 2012 10:04:50 -0500
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 2BE029043F;
	Thu, 26 Jan 2012 16:04:47 +0100 (CET)
Message-ID: <4F216B0C.4010904@suse.de>
Date: Thu, 26 Jan 2012 16:02:36 +0100
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111220 Thunderbird/9.0
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <1327425457-31313-1-git-send-email-afaerber@suse.de>
In-Reply-To: <1327425457-31313-1-git-send-email-afaerber@suse.de>
X-Enigmail-Version: 1.3.4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: Kevin Wolf <kwolf@redhat.com>,
	Vasilis Liaskovitis <vasilis.liaskovitis@profitbricks.com>,
	Anthony Liguori <aliguori@us.ibm.com>,
	Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
	Jan Kiszka <jan.kiszka@siemens.com>, Markus Armbruster <armbru@redhat.com>,
	Blue Swirl <blauwirbel@gmail.com>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <andreas.faerber@web.de>,
	Amit Shah <amit.shah@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v6] qdev: Add support for
	property type bool
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
X-List-Received-Date: Thu, 26 Jan 2012 15:05:18 -0000

Am 24.01.2012 18:17, schrieb Andreas F=C3=A4rber:
> From: Andreas F=C3=A4rber <andreas.faerber@web.de>
>=20
> VMState supports the type bool but qdev instead supports bit, backed by
> uint32_t. Therefore let's add DEFINE_PROP_BOOL() and qdev_prop_set_bool=
().

Actually qdev_prop_set_bool() got lost in a merge conflict... Re-adding.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

