Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WHjve-0004iE-Gl
	for mharc-qemu-trivial@gnu.org; Sun, 23 Feb 2014 20:01:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1WHjvX-0004Vl-Uz
	for qemu-trivial@nongnu.org; Sun, 23 Feb 2014 20:01:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1WHjvS-0007X1-Cp
	for qemu-trivial@nongnu.org; Sun, 23 Feb 2014 20:01:47 -0500
Received: from mail-oa0-x22b.google.com ([2607:f8b0:4003:c02::22b]:53953)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>)
	id 1WHjvH-0007Ue-FQ; Sun, 23 Feb 2014 20:01:31 -0500
Received: by mail-oa0-f43.google.com with SMTP id i7so3328682oag.30
	for <multiple recipients>; Sun, 23 Feb 2014 17:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:content-type:mime-version:content-transfer-encoding:to:from
	:in-reply-to:cc:references:message-id:user-agent:subject:date;
	bh=zx3FOL9MExmghiv0iMN66FEnD6MYhooQpQzTQfZ5Iaw=;
	b=sIX7wOw2VcjDErgkN0tH97ux6PpZOrP5GLP0zugQTwt43/fYtYp17Zr+x2MY86NfDg
	kGpNBSfw1Y0B4TLTZjv7OhSWDBaQ2+MuCjbeqR0VzQbu9+NqvW1ymE1dA4LpsriKbbbt
	h9per+25NPdLFdKLfmr4NU82G7+6FLdx1trwlizI0HVKW/dU+m+rK2iODP0FGsNn4J6Y
	cXVOW61SokoKNAH9Z+kwziZTzyht5m8Re/nCsZbXxds2ap0INo+tcXgjlPuSYLJSLJ63
	drvaqliNj38wvgC2FH7Ruys9K6VWLW8ZdBOwkdnWamsxNEBrOa77hvFokGbTEsb7Cgjr
	HDyQ==
X-Received: by 10.182.142.229 with SMTP id rz5mr15245569obb.12.1393203690830; 
	Sun, 23 Feb 2014 17:01:30 -0800 (PST)
Received: from localhost ([70.114.130.150])
	by mx.google.com with ESMTPSA id cg5sm30281176obc.9.2014.02.23.17.01.30
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 23 Feb 2014 17:01:30 -0800 (PST)
Sender: fluxion <flukshun@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Markus Armbruster <armbru@redhat.com>,  qemu-devel@nongnu.org
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <1392986209-32162-1-git-send-email-armbru@redhat.com>
References: <1392986209-32162-1-git-send-email-armbru@redhat.com>
Message-ID: <20140224010127.3593.72999@loki>
User-Agent: alot/0.3.4
Date: Sun, 23 Feb 2014 19:01:27 -0600
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c02::22b
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qga: Fix memory allocation
	pasto
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
X-List-Received-Date: Mon, 24 Feb 2014 01:01:53 -0000

Quoting Markus Armbruster (2014-02-21 06:36:49)
> qmp_guest_file_seek() allocates memory for a GuestFileRead object
> instead of the GuestFileSeek object it actually uses.  Harmless,
> because the GuestFileRead is slightly larger.
> =

> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Thanks, applied to qga tree:                                               =
                                  =


  https://github.com/mdroth/qemu/commits/qga

> ---
>  qga/commands-posix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index cae4171..2c496b6 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -525,7 +525,7 @@ struct GuestFileSeek *qmp_guest_file_seek(int64_t han=
dle, int64_t offset,
>      if (ret =3D=3D -1) {
>          error_setg_errno(err, errno, "failed to seek file");
>      } else {
> -        seek_data =3D g_malloc0(sizeof(GuestFileRead));
> +        seek_data =3D g_new0(GuestFileSeek, 1);
>          seek_data->position =3D ftell(fh);
>          seek_data->eof =3D feof(fh);
>      }
> -- =

> 1.8.1.4

