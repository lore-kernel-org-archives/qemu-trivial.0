Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R32fQ-0000K3-UV
	for mharc-qemu-trivial@gnu.org; Mon, 12 Sep 2011 05:19:04 -0400
Received: from eggs.gnu.org ([140.186.70.92]:58599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R32fN-00005C-Ei
	for qemu-trivial@nongnu.org; Mon, 12 Sep 2011 05:19:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R32fK-00064a-WE
	for qemu-trivial@nongnu.org; Mon, 12 Sep 2011 05:19:01 -0400
Received: from mail-gx0-f174.google.com ([209.85.161.174]:39046)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1R32fI-000641-Cz; Mon, 12 Sep 2011 05:18:56 -0400
Received: by gxk21 with SMTP id 21so3494893gxk.5
	for <multiple recipients>; Mon, 12 Sep 2011 02:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=geFHTrdcLuiKjcYRuNHA7WQNtmMdY00KVyhMT7b8+x8=;
	b=S8NLB3orPhLWCW09peuLClkjWYTraGMRiC3hI35qpzLHrxKd/uK1h6ZiSyQIuidlKp
	13JVv2ZyG+shqfr1bGLPrLKfGs8b6Kioi+JUWXQu990G/8BdwloIAv25ooy0IEm/ZU5o
	l7i9fPO72GXW+JCnzgsTmiQP9H7sbUNxNbA08=
MIME-Version: 1.0
Received: by 10.236.200.137 with SMTP id z9mr24361760yhn.27.1315819134413;
	Mon, 12 Sep 2011 02:18:54 -0700 (PDT)
Received: by 10.147.125.2 with HTTP; Mon, 12 Sep 2011 02:18:54 -0700 (PDT)
In-Reply-To: <9A366686-E936-42A4-BC3C-AC80D7CE0D52@web.de>
References: <1315688954-14621-1-git-send-email-weil@mail.berlios.de>
	<68748506-3E70-4AF2-AA49-5A23141725DA@suse.de>
	<9A366686-E936-42A4-BC3C-AC80D7CE0D52@web.de>
Date: Mon, 12 Sep 2011 10:18:54 +0100
Message-ID: <CAJSP0QW9=hL7gVrY0T7TSpxOXc+ynJrL572rZ36r04a-nm22cA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.174
Cc: Blue Swirl <blauwirbel@gmail.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Stefan Weil <weil@mail.berlios.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-doc: Remove URL which
 is no longer available
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
X-List-Received-Date: Mon, 12 Sep 2011 09:19:03 -0000

On Mon, Sep 12, 2011 at 12:04 AM, Andreas F=E4rber <andreas.faerber@web.de>=
 wrote:
> Am 11.09.2011 um 22:39 schrieb Alexander Graf:
>
>> Am 10.09.2011 um 23:09 schrieb Stefan Weil <weil@mail.berlios.de>:
>>
>>> http://perso.magic.fr/l_indien/ was removed several years ago.
>>> There is obviously no mirror or any other replacement for it.
>>
>> I would prefer to see the sources in a public git repo and to have
>> ppc_rom.bin rebuilt from that. IIUC Andreas is already working on this.
>
> Yes, I set up http://repo.or.cz/w/openhackware.git today.
>
> We'll look into the build and the patches referenced by Blue over the nex=
t
> days.
>
> @Stefan H.: Please disregard this patch, I intend to supply an alternativ=
e
> one. If we urgently need to apply a change, we should at least keep the U=
RL
> where it was formerly accessible, so that the interested reader has a cha=
nce
> to look it up in the Internet Archive.

Okay, ignoring this one for now.

Stefan

