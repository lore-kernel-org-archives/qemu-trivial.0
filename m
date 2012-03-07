Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5IOS-0001kQ-KY
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2012 10:03:08 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cyfdecyf@gmail.com>) id 1S5IOI-0001jg-Qw
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 10:03:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cyfdecyf@gmail.com>) id 1S5INu-0001T4-Bo
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 10:02:58 -0500
Received: from mail-ey0-f173.google.com ([209.85.215.173]:48489)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cyfdecyf@gmail.com>) id 1S5INu-0001Rx-2U
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 10:02:34 -0500
Received: by eaaf11 with SMTP id f11so1655213eaa.4
	for <qemu-trivial@nongnu.org>; Wed, 07 Mar 2012 07:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=xl+0PmQpeA8WlLsvU3OnIab1DrwPKsxIyFNY6wt4UI4=;
	b=YgzXMNdPS72CwArYcZUfpu4xOYBDJrNeq7/bEEMShoAPKAvwaCIItDBDyTsfVMS9wx
	KzF5QpOayJ73ljK2K7NHBaWJ3pOrTOAegqIRLlMyh+ivDyxJ0QNLD3NYptR/Orq2q9fl
	NuniQNV7evYC8NOixC45NkXbli2RsiDWSnhfL0jeexr3BRgKvVASGkDIi2XDHFz4T6hK
	XyurwdCediil2vYtEcNuB49T8u2soYivHektCwf2wrLFkLN2G8Efdm8evyxNpFf2m1n6
	/WTdCuZ1oQQNeeZLG74WxLQYgJS1ucDV3S+Vhzi5hGYByMYhx9p4QsEAD2vZl0PfYG/0
	zNEQ==
Received: by 10.213.114.78 with SMTP id d14mr629462ebq.47.1331132551276; Wed,
	07 Mar 2012 07:02:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.213.13.138 with HTTP; Wed, 7 Mar 2012 07:02:00 -0800 (PST)
In-Reply-To: <20120307111529.GA1754@stefanha-thinkpad.localdomain>
References: <1331040285-17807-1-git-send-email-cyfdecyf@gmail.com>
	<20120307111529.GA1754@stefanha-thinkpad.localdomain>
From: Chen Yufei <cyfdecyf@gmail.com>
Date: Wed, 7 Mar 2012 23:02:00 +0800
Message-ID: <CAAoCq2tVYNQE3RZazxdND+KTcUPnUhtJyA0T=krZnx5UCqJw=Q@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Remove type field in ModuleEntry as it's
 not used.
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
X-List-Received-Date: Wed, 07 Mar 2012 15:03:07 -0000

Thanks your info. I followed the instruction in Pro Git and thought
`git send-email` will send the email to my draft box for later
editing.

I'll re-send the patch.

On Wed, Mar 7, 2012 at 7:15 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Tue, Mar 06, 2012 at 09:24:45PM +0800, Chen Yufei wrote:
>> ---
>> =C2=A0module.c | =C2=A0 =C2=A01 -
>> =C2=A01 files changed, 0 insertions(+), 1 deletions(-)
>
> I forgot to mention, please CC qemu-devel@nongnu.org. =C2=A0All QEMU patc=
hes
> should be on that list, qemu-trivial allows you to request that the
> patch is merged through the trivial tree, but everything still needs to
> be on qemu-devel.

--=20
Best regards,
Chen Yufei

