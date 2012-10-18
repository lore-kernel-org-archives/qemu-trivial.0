Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TOq6a-0004La-JX
	for mharc-qemu-trivial@gnu.org; Thu, 18 Oct 2012 09:25:44 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1TOq6U-00044T-IK
	for qemu-trivial@nongnu.org; Thu, 18 Oct 2012 09:25:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1TOq6Q-0006m7-Hk
	for qemu-trivial@nongnu.org; Thu, 18 Oct 2012 09:25:38 -0400
Received: from cantor2.suse.de ([195.135.220.15]:36967 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1TOq6M-0006lA-IY; Thu, 18 Oct 2012 09:25:30 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id B8CB8A37E0;
	Thu, 18 Oct 2012 15:25:28 +0200 (CEST)
Message-ID: <50800309.5040706@suse.de>
Date: Thu, 18 Oct 2012 15:24:25 +0200
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121010 Thunderbird/16.0.1
MIME-Version: 1.0
To: Kevin Wolf <kwolf@redhat.com>
References: <1350220128-10140-1-git-send-email-thardeck@suse.de>
	<1350220128-10140-3-git-send-email-thardeck@suse.de>
	<507EC7FF.90603@suse.de> <1359569.y3MYGdvym5@thinktank.site>
	<507FDD38.2010009@redhat.com>
In-Reply-To: <507FDD38.2010009@redhat.com>
X-Enigmail-Version: 1.5a1pre
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Tim Hardeck <thardeck@suse.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] qemu queue: fix
	uninitialized removals
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
X-List-Received-Date: Thu, 18 Oct 2012 13:25:42 -0000

Am 18.10.2012 12:43, schrieb Kevin Wolf:
> Am 17.10.2012 23:24, schrieb Tim Hardeck:
>> On Wednesday 17 October 2012 17:00:15 Andreas F=E4rber wrote:
>>> Am 14.10.2012 15:08, schrieb Tim Hardeck:
>>>> When calling QTAILQ_REMOVE or QLIST_REMOVE on an unitialized list
>>>> QEMU segfaults.
>>>
>>> Can this be reproduced by a user today? Or is this just fixing the ca=
se
>>> that a developer forgot to initialize a list?
>> I am not sure but in this case it happened during an early VNC connect=
ion=20
>> state failure which most likely wouldn't happen to regular users.
>> I triggered it while working on the VNC connection part.
>>
>> The issue could most likely be also fixed in the VNC connection initia=
lization=20
>> process but if this changes doesn't have a relevant performance impact=
 they=20
>> might prevent some other/future crashes.
>=20
> At the same time, it could be hiding real bugs, where ignoring the
> QLIST_REMOVE() isn't the right fix. I can see your point, but I would b=
e
> careful with making interfaces less strict.

What I don't get is, why is avoiding a NULL pointer dereference any
better from accessing random memory through an uninitialized pointer? Or
am I getting "uninitialized" wrong?

> In any case, I don't think this qualifies for qemu-trivial, Andreas.

Maybe not, but we don't have a clear maintainer that I'm aware of, and
no one else reviewed it for several days before I did. ;)

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

