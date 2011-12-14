Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RalHD-00026o-NT
	for mharc-qemu-trivial@gnu.org; Wed, 14 Dec 2011 04:37:27 -0500
Received: from eggs.gnu.org ([140.186.70.92]:37434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RalH6-0001fy-KX
	for qemu-trivial@nongnu.org; Wed, 14 Dec 2011 04:37:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RalH5-0002Ef-SB
	for qemu-trivial@nongnu.org; Wed, 14 Dec 2011 04:37:20 -0500
Received: from mail-iy0-f173.google.com ([209.85.210.173]:37426)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RalGw-0002DS-7X; Wed, 14 Dec 2011 04:37:10 -0500
Received: by iagj37 with SMTP id j37so1107800iag.4
	for <multiple recipients>; Wed, 14 Dec 2011 01:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=c8omZ0H3QxPcARzbpMtEHPtwR7Scra3gLMpv5nEytsg=;
	b=AIZUsGrfGSg4JkalRxVoz01iKPb5slDlQDJEdGLSrr+jlkfckHUCMqF3VYrony+NwD
	nkOD/Rf8eYwGATQqo/k2P6xtxRdnFSHhX2L7hY0r4z0U513XfuCott2GT2YY0Cy23+i4
	HifS4WzkQwQLqTMHSlwhLVoXrf7v7Z4PlO90w=
MIME-Version: 1.0
Received: by 10.50.160.161 with SMTP id xl1mr23378900igb.5.1323855429270; Wed,
	14 Dec 2011 01:37:09 -0800 (PST)
Received: by 10.231.19.138 with HTTP; Wed, 14 Dec 2011 01:37:08 -0800 (PST)
In-Reply-To: <1323844224-22432-1-git-send-email-sw@weilnetz.de>
References: <1323844224-22432-1-git-send-email-sw@weilnetz.de>
Date: Wed, 14 Dec 2011 09:37:08 +0000
Message-ID: <CAJSP0QVsJAztRBrxYTRLjaTwgA4FeBpYjeH8z8vErrLB8NcFOw@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] doc: Remove Symbian Virtual Platform
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
X-List-Received-Date: Wed, 14 Dec 2011 09:37:26 -0000

On Wed, Dec 14, 2011 at 6:30 AM, Stefan Weil <sw@weilnetz.de> wrote:
> Commit d396a657baec8c6b7aa0c888746e0e2f78303650 removed the code
> for SVP, so the documentation needs this update.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> =A0qemu-doc.texi | =A0 23 -----------------------
> =A01 files changed, 0 insertions(+), 23 deletions(-)

Thank you, I only did a case-sensitive git grep syborg and missed
this!  Will merge into trivial-patches tree.

Stefan

