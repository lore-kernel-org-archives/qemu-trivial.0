Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rqlp9-0006b6-7i
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 08:26:39 -0500
Received: from eggs.gnu.org ([140.186.70.92]:39960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Rqlp3-0006Fq-Jx
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 08:26:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Rqloy-0003fx-1x
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 08:26:33 -0500
Received: from cantor2.suse.de ([195.135.220.15]:33490 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Rqlop-0003eX-0O; Fri, 27 Jan 2012 08:26:19 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 7893A90349;
	Fri, 27 Jan 2012 14:26:18 +0100 (CET)
Message-ID: <4F22A579.3040307@suse.de>
Date: Fri, 27 Jan 2012 14:24:09 +0100
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111220 Thunderbird/9.0
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@siemens.com>
References: <4F1DA82F.4090808@siemens.com> <4F2297FB.2040508@siemens.com>
In-Reply-To: <4F2297FB.2040508@siemens.com>
X-Enigmail-Version: 1.3.4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [PATCH v2] optionroms: Silence intermediate file
	removal
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
X-List-Received-Date: Fri, 27 Jan 2012 13:26:37 -0000

Am 27.01.2012 13:26, schrieb Jan Kiszka:
> The build process of optionroms spits out an "rm ..." line. Moreover, i=
t
> removes all .o files that can be handy for debugging purposes.
>=20
> Disable automatic intermediate removal and only clean up the unneeded
> and large .img and .raw files.
>=20
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Thanks,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

