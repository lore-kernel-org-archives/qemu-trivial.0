Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwDrQ-00044p-Pw
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jul 2012 10:55:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SwDrK-0003mK-Fo
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 10:55:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SwDrJ-0002YL-Fz
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 10:55:42 -0400
Received: from cantor2.suse.de ([195.135.220.15]:58775 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1SwDrE-0002V4-CM; Tue, 31 Jul 2012 10:55:36 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 31ABCA0FED;
	Tue, 31 Jul 2012 16:55:34 +0200 (CEST)
Message-ID: <5017F1E3.90806@suse.de>
Date: Tue, 31 Jul 2012 16:55:31 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1343714097-545-1-git-send-email-sw@weilnetz.de>
	<5017EE1D.8060908@suse.de> <5017EEFD.5070503@redhat.com>
	<5017EFC6.1050705@suse.de> <5017F0A2.5030400@redhat.com>
In-Reply-To: <5017F0A2.5030400@redhat.com>
X-Enigmail-Version: 1.5a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	Hannes Reinecke <hare@suse.de>, Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] megasas: Update function
	megasys_scsi_uninit
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
X-List-Received-Date: Tue, 31 Jul 2012 14:55:47 -0000

Am 31.07.2012 16:50, schrieb Paolo Bonzini:
> Il 31/07/2012 16:46, Andreas F=E4rber ha scritto:
>>>> Why would megasas be in master but not compiled/linked?
>>> Because Anthony objected to how it picks the initiator WWN.
>> Ah, anything keeping us from fixing that? :)
>=20
> Exact knowledge of the requirements, basically. :)

I.e. waiting on feedback about numeric constraints from Hannes? :)
Or waiting on general direction from Anthony?
How to make progress there for 1.2 / Soft Freeze?

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

