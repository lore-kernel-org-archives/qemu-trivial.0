Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RG5iM-0001o7-2j
	for mharc-qemu-trivial@gnu.org; Tue, 18 Oct 2011 05:12:02 -0400
Received: from eggs.gnu.org ([140.186.70.92]:45222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RG5iI-0001ck-NF
	for qemu-trivial@nongnu.org; Tue, 18 Oct 2011 05:12:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RG5iH-0003Di-F2
	for qemu-trivial@nongnu.org; Tue, 18 Oct 2011 05:11:58 -0400
Received: from cantor2.suse.de ([195.135.220.15]:55757 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1RG5i9-0003Bu-JR; Tue, 18 Oct 2011 05:11:49 -0400
Received: from [10.10.102.108] (charybdis-ext.suse.de [195.135.221.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 65E9B8E857;
	Tue, 18 Oct 2011 11:11:48 +0200 (CEST)
Message-ID: <4E9D42D4.9070901@suse.de>
Date: Tue, 18 Oct 2011 11:11:48 +0200
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110922 Thunderbird/7.0
MIME-Version: 1.0
To: Juan Pineda <juan@logician.com>
References: <DE9DD0B1-B0C7-4ECC-889E-2B84EE2F287E@logician.com>
In-Reply-To: <DE9DD0B1-B0C7-4ECC-889E-2B84EE2F287E@logician.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] Patch for ui/cocoa.m
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
X-List-Received-Date: Tue, 18 Oct 2011 09:12:00 -0000

Hello Juan,

Am 18.10.2011 03:22, schrieb Juan Pineda:
> This is my first time submitting a patch, so please let me know if I'm =
not following the correct protocol.

Please see http://wiki.qemu.org/Contribute/SubmitAPatch

Using the git-send-mail tool assures that the patch format gets right.

Then, this patch despite its small size is not "trivial" so instead of
qemu-trivial@nongnu.org please cc andreas.faerber@web.de for Cocoa. Thank=
s.

> Under OSX Lion the boot volume dialog is not closed and it permanently =
obscures the emulator window since under Lion the dialog cannot be reposi=
tioned. The fix adds only to add a single line to close the dialog.

I don't have access to v10.7 so please describe the problem in more
details: What command line do you use? If using the right arguments you
shouldn't see a window at all. Are you maybe using -drive instead of
-hda and that is not yet handled correctly?

Apart from this issue, is it working correctly for you?

Regards,
Andreas

> Signed-off-by: Juan Pineda <juan@logician.com>
>=20
> Thanks!
> -Juan
>=20
>=20
>> git diff ui/cocoa.m
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index d9e4e3d..4b42462 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -811,6 +811,8 @@ QemuCocoaView *cocoaView;
> =20
>          char **argv =3D (char**)malloc( sizeof(char*)*3 );
> =20
> +       [sheet close];
> +
>          asprintf(&argv[0], "%s", bin);
>          asprintf(&argv[1], "-hda");
>          asprintf(&argv[2], "%s", img);
>=20
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746, AG N=FCrnb=
erg

