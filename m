Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3zVg-0001KK-OB
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:49:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44634)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j3zVa-0001DM-NN
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:49:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j3zVZ-0000K6-LL
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:49:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20166
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j3zVZ-0000Ja-H1
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:49:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9bhLWeDmIRIbpw4WQFzMqL9ZUaH/2EcUzcdPU0bjoqQ=;
 b=iuFPcoJxrlC3KuSvnPZcWc+iKwNukwen7Br+geqjO0P2SdTdrbLSEOwquRK/Bog44enexP
 HABJDG1z6JnwrlEXWwlqTwkROErjT6rcQ1OTorvk0vgFY7sMLyIJXU9IMjOPdIXsHiedC6
 e5qOFaW7FocOdxtIs07qPrWZABldFpY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-U8j75KKONqCjknlOdUajEA-1; Tue, 18 Feb 2020 04:49:35 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 857261B2C980;
 Tue, 18 Feb 2020 09:49:31 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E858619756;
 Tue, 18 Feb 2020 09:49:08 +0000 (UTC)
Date: Tue, 18 Feb 2020 09:49:05 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Julia Suvorova <jusual@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org
Subject: Re: [PATCH RESEND 01/13] scripts/checkpatch.pl: Detect superfluous
 semicolon in C code
Message-ID: <20200218094905.GC3080@work-vm>
References: <20200218094402.26625-1-philmd@redhat.com>
 <20200218094402.26625-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200218094402.26625-2-philmd@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: U8j75KKONqCjknlOdUajEA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Tue, 18 Feb 2020 09:49:43 -0000

* Philippe Mathieu-Daud=E9 (philmd@redhat.com) wrote:
> Display error when a commit contains superfluous semicolon:
>=20
>   $ git show 6663a0a3376 | scripts/checkpatch.pl -q -
>   ERROR: superfluous trailing semicolon
>   #276: FILE: block/io_uring.c:186:
>   +                ret =3D -ENOSPC;;
>   total: 1 errors, 1 warnings, 485 lines checked
>=20
> Reported-by: Luc Michel <luc.michel@greensocs.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  scripts/checkpatch.pl | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index ce43a306f8..11512a8a09 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1830,6 +1830,11 @@ sub process {
>  =09=09=09ERROR("suspicious ; after while (0)\n" . $herecurr);
>  =09=09}
> =20
> +# Check superfluous trailing ';'
> +=09=09if ($line =3D~ /;;$/) {
> +=09=09=09ERROR("superfluous trailing semicolon\n" . $herecurr);
> +=09=09}
> +
>  # Check relative indent for conditionals and blocks.
>  =09=09if ($line =3D~ /\b(?:(?:if|while|for)\s*\(|do\b)/ && $line !~ /^.\=
s*#/ && $line !~ /\}\s*while\s*/) {
>  =09=09=09my ($s, $c) =3D ($stat, $cond);
> --=20
> 2.21.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


