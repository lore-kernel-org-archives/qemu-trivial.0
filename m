Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QmjuH-000805-KI
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jul 2011 06:03:01 -0400
Received: from eggs.gnu.org ([140.186.70.92]:43230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QmjuE-0007sC-U6
	for qemu-trivial@nongnu.org; Fri, 29 Jul 2011 06:02:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QmjuE-0001qU-2g
	for qemu-trivial@nongnu.org; Fri, 29 Jul 2011 06:02:58 -0400
Received: from mail-gy0-f173.google.com ([209.85.160.173]:55391)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QmjuB-0001po-SX; Fri, 29 Jul 2011 06:02:55 -0400
Received: by gyg8 with SMTP id 8so2890283gyg.4
	for <multiple recipients>; Fri, 29 Jul 2011 03:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=+/CD8PzWif20eyzyrvVGwnk3BfPdMaPo08P2d3Jyp/Q=;
	b=xHm+hFWq5uaCo+u1yogXqF+HsACUMc0VmxUpDEG93Gx5T1hwrxZ8hbVY2eDNICKp9d
	XYsmD08E0ikh6UoPgRMFRaNuiwGkZmnN+n92t8QsNhbaaPuuZgNghQkzmT1aZtThPNEn
	k7h9W/IbKoMdc2qxZzUuPIUcILK5EjAW1gZ9I=
MIME-Version: 1.0
Received: by 10.147.87.16 with SMTP id p16mr854530yal.20.1311933773522; Fri,
	29 Jul 2011 03:02:53 -0700 (PDT)
Received: by 10.147.181.8 with HTTP; Fri, 29 Jul 2011 03:02:53 -0700 (PDT)
In-Reply-To: <1311790322-10889-1-git-send-email-freddy77@gmail.com>
References: <1311790322-10889-1-git-send-email-freddy77@gmail.com>
Date: Fri, 29 Jul 2011 11:02:53 +0100
Message-ID: <CAJSP0QXFz467=EFNxEBtBOF1QkEKNbK3JH3zUSA-R_HUn55L0w@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Frediano Ziglio <freddy77@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.160.173
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/3] small trivial patches
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
X-List-Received-Date: Fri, 29 Jul 2011 10:03:00 -0000

On Wed, Jul 27, 2011 at 7:11 PM, Frediano Ziglio <freddy77@gmail.com> wrote=
:
> Minor fixes and improves
>
> Frediano Ziglio (3):
> =A0block: removed unused function
> =A0block: typo fix
> =A0aio: always check paio_init result
>
> =A0block.c =A0 =A0 =A0 =A0 =A0 | =A0 13 -------------
> =A0block.h =A0 =A0 =A0 =A0 =A0 | =A0 =A02 --
> =A0block/raw-posix.c | =A0 13 ++++++-------
> =A03 files changed, 6 insertions(+), 22 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>

Please send block patches to Kevin even if they are trivial.  The
trivial-patches tree tries to stay out of the way of subsystems with
an active maintainer.

Stefan

