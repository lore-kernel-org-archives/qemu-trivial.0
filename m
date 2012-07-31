Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwDbu-0004Le-1T
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jul 2012 10:39:46 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SwDbm-0003xk-1F
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 10:39:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SwDbh-0004pk-SG
	for qemu-trivial@nongnu.org; Tue, 31 Jul 2012 10:39:37 -0400
Received: from cantor2.suse.de ([195.135.220.15]:58157 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1SwDbc-0004nf-Bh; Tue, 31 Jul 2012 10:39:28 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 6A1C8A3A49;
	Tue, 31 Jul 2012 16:39:27 +0200 (CEST)
Message-ID: <5017EE1D.8060908@suse.de>
Date: Tue, 31 Jul 2012 16:39:25 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>
References: <1343714097-545-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1343714097-545-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.5a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>,
	qemu-devel@nongnu.org, Hannes Reinecke <hare@suse.de>
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
X-List-Received-Date: Tue, 31 Jul 2012 14:39:44 -0000

Am 31.07.2012 07:54, schrieb Stefan Weil:
> Commit f90c2bcdbc69e41e575f868b984c3e2de8f51bac changed
> PCIUnregisterFunc, therefore the function prototype
> needs an update.
>=20
> megasas.o is currently not linked, so this bug was not
> detected by the buildbots.

Why would megasas be in master but not compiled/linked?

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

