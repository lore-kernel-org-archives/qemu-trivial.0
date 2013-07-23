Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V1gHp-0000An-DV
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jul 2013 13:22:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V1gHm-00006g-QD
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 13:22:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V1gHl-0004Iz-CF
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 13:22:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46199)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V1gHh-0004HO-Ox; Tue, 23 Jul 2013 13:22:01 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 17E0B429A5;
	Tue, 23 Jul 2013 21:22:01 +0400 (MSK)
Message-ID: <51EEBBB6.5080500@msgid.tls.msk.ru>
Date: Tue, 23 Jul 2013 21:21:58 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130704 Icedove/17.0.7
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1373647719-32757-1-git-send-email-sw@weilnetz.de>
	<51E4E011.70407@weilnetz.de> <51E846AC.5070309@weilnetz.de>
	<F63092DE-7795-4009-AB16-68BE6EC53F94@suse.de>
	<51E98C93.8010508@weilnetz.de> <51EA9DBA.4080400@suse.de>
	<51EBF71A.3050300@weilnetz.de>
In-Reply-To: <51EBF71A.3050300@weilnetz.de>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Anthony Liguori <aliguori@us.ibm.com>,
	qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] PPC: dbdma: macio: Fix
 format specifiers (build regression)
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
X-List-Received-Date: Tue, 23 Jul 2013 17:22:07 -0000

21.07.2013 18:58, Stefan Weil wrote:
> Am 20.07.2013 16:24, schrieb Andreas F=E4rber:
>>
>> Anthony recently stated very clearly that in order for him to pick up =
a
>> patch it needs to have a Reviewed-by. This one only got an Acked-by.
>=20
>=20
> No rule without exception. When I look at the list of patches
> which were picked up recently, I see lots of patches without
> a Reviewed-by.
>=20
> I still think that build regressions should be fixed
> very fast and don't understand why it takes so long:

I reviewed the patch and it appears to be correct.
Applied to the trivial patches queue.
Thanks,

/mjt

