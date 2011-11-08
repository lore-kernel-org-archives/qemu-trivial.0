Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNlVr-0008Us-AT
	for mharc-qemu-trivial@gnu.org; Tue, 08 Nov 2011 08:14:51 -0500
Received: from eggs.gnu.org ([140.186.70.92]:37542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNlVj-00080s-OH
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 08:14:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNlVf-0006PP-SC
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 08:14:43 -0500
Received: from mail-wy0-f173.google.com ([74.125.82.173]:55216)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RNlVa-0006OX-Ki; Tue, 08 Nov 2011 08:14:34 -0500
Received: by wyh22 with SMTP id 22so478176wyh.4
	for <multiple recipients>; Tue, 08 Nov 2011 05:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=hZ6jt9AEpgus5uLR9CFl6CesLBgACG2RTvYvxpIeJeM=;
	b=MZdPn9MyNfc6iiVfo7al/hbn1bZOdK3maP0nzcJWrZxB20s8Pnj7AFUGzfpm6rA1ei
	+LmbiawRGJNuQ+i6vcGvtBNgLbykQXqwF7at/H2jx29QYReEEA4vUkueHqlLMZQOFKjh
	lDYGLQ0L5ZNhQT2nvL4RvKokCvuSJOsROaZJ4=
MIME-Version: 1.0
Received: by 10.180.93.168 with SMTP id cv8mr13030308wib.36.1320758073377;
	Tue, 08 Nov 2011 05:14:33 -0800 (PST)
Received: by 10.180.85.165 with HTTP; Tue, 8 Nov 2011 05:14:32 -0800 (PST)
In-Reply-To: <1320756321-8059-1-git-send-email-armbru@redhat.com>
References: <1320756321-8059-1-git-send-email-armbru@redhat.com>
Date: Tue, 8 Nov 2011 13:14:32 +0000
Message-ID: <CAJSP0QXBVX-Tmg9+nJbCo6vVGarDgaPOe7rtR7Z0WVwD+np0_g@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, berrange@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] ui/vnc: Convert sasl.mechlist to
 g_malloc() & friends
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
X-List-Received-Date: Tue, 08 Nov 2011 13:14:49 -0000

On Tue, Nov 8, 2011 at 12:45 PM, Markus Armbruster <armbru@redhat.com> wrot=
e:
> Fixes protocol_client_auth_sasl_mechname() not to crash when malloc()
> fails. =A0Spotted by Coverity.
> ---
> =A0ui/vnc-auth-sasl.c | =A0 19 +++++--------------
> =A01 files changed, 5 insertions(+), 14 deletions(-)

Looks good, please add Signed-off-by.

Stefan

