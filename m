Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QK7fo-0002GG-Ce
	for mharc-qemu-trivial@gnu.org; Wed, 11 May 2011 07:33:48 -0400
Received: from eggs.gnu.org ([140.186.70.92]:58299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1QK7fm-0002Bq-Cc
	for qemu-trivial@nongnu.org; Wed, 11 May 2011 07:33:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1QK7fl-0005oB-Fd
	for qemu-trivial@nongnu.org; Wed, 11 May 2011 07:33:46 -0400
Received: from mail-vx0-f173.google.com ([209.85.220.173]:56448)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>)
	id 1QK7fj-0005nu-Cy; Wed, 11 May 2011 07:33:43 -0400
Received: by vxb37 with SMTP id 37so295817vxb.4
	for <multiple recipients>; Wed, 11 May 2011 04:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Ly1vjtGWsqwnDWkuVr/Q7RD1r7yjc7e84yJP9S31avc=;
	b=qzeROmADtl+ZVIzd/Tx5e9IYiZH7DmuW43wCG55mz8rsKlgauOdAoxUsI+xC5Ve/vP
	j7Vida8zkYBoK5NCFD/QGzRMFL1zP0k85Sqd7vexQlK7wU1jehRg9n4iQaL7zsB4rhKy
	H3fwPZMuMMCD7cdDZm0/Ab8lObg5pSKubW0pQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=hhf4XpNYknOw20LkIHuerYGPHzjKad8ItFwmNPBvTn4Wq+vyNB9ZJWdTBzAIU0IVag
	Mi+eqtEJTlwH7asK/YJnk9jXkMntBOjJXxgtI245XKwa0sGqUzSN9GCE7/ytXwm6YWaK
	dktASnfygcLbdbOpM1BEv/cetZ/hKMusA5XTQ=
MIME-Version: 1.0
Received: by 10.52.18.15 with SMTP id s15mr979673vdd.224.1305113622273; Wed,
	11 May 2011 04:33:42 -0700 (PDT)
Received: by 10.220.158.131 with HTTP; Wed, 11 May 2011 04:33:42 -0700 (PDT)
In-Reply-To: <4DC7D353.6020607@redhat.com>
References: <BANLkTik3hmvH6_tUuEZjR8j0L04PdCk7mw@mail.gmail.com>
	<4DC29287.5030106@redhat.com>
	<BANLkTik=gr0K9-_fOTqPQORo37xs2D+9Yg@mail.gmail.com>
	<4DC79DEC.50401@redhat.com>
	<BANLkTimMGis4pBnZvbP=KwKtaOp8rDCfBQ@mail.gmail.com>
	<4DC7D353.6020607@redhat.com>
Date: Wed, 11 May 2011 13:33:42 +0200
Message-ID: <BANLkTi=PJMUjFCF--N9F60GhT-04jAeFcg@mail.gmail.com>
From: Jan Vesely <jano.vesely@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.220.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] Bug #757654: UHCI fails to signal
	stall response patch
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
X-List-Received-Date: Wed, 11 May 2011 11:33:47 -0000

glad I could help

the original bug report is here: https://bugs.launchpad.net/qemu/+bug/75765=
4
should I update it? or will it be updated when the patch reaches master?

j.

On Mon, May 9, 2011 at 1:43 PM, Gerd Hoffmann <kraxel@redhat.com> wrote:
> On 05/09/11 12:16, Jan Vesely wrote:
>>
>> UHCI host controller status register indicates error and
>> an interrupt is triggered on BABBLE and STALL errors.
>
> Queued up.
>
> thanks,
> =C2=A0Gerd
>
>

