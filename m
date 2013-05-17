Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UdG03-0007RP-0Y
	for mharc-qemu-trivial@gnu.org; Fri, 17 May 2013 04:26:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UdFzv-0007J9-3j
	for qemu-trivial@nongnu.org; Fri, 17 May 2013 04:26:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UdFzq-0002aC-FR
	for qemu-trivial@nongnu.org; Fri, 17 May 2013 04:26:43 -0400
Received: from cantor2.suse.de ([195.135.220.15]:52217 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UdFze-0002Z7-8C; Fri, 17 May 2013 04:26:26 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 4E799A3B99;
	Fri, 17 May 2013 10:26:25 +0200 (CEST)
Message-ID: <5195E9AD.7040509@suse.de>
Date: Fri, 17 May 2013 10:26:21 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Anthony Green <green@moxielogic.com>
References: <1368597869-30405-1-git-send-email-hutao@cn.fujitsu.com>
	<CAFEAcA-vp5bPwmAZj3a6HH71XkZJizQNSSTbFdrSOU60QWZRGw@mail.gmail.com>
In-Reply-To: <CAFEAcA-vp5bPwmAZj3a6HH71XkZJizQNSSTbFdrSOU60QWZRGw@mail.gmail.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, Hu Tao <hutao@cn.fujitsu.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-moxie: replace
 target_phys_addr_t with hwaddr
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
X-List-Received-Date: Fri, 17 May 2013 08:26:49 -0000

Anthony G.,

Am 15.05.2013 10:23, schrieb Peter Maydell:
> On 15 May 2013 07:04, Hu Tao <hutao@cn.fujitsu.com> wrote:
>> target_phys_addr_t has been already replaced by hwaddr, but this
>> one is introduced after.
>>
>> Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
>=20
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>=20
> This doesn't cause compile errors because it's in a bit
> of code that can never get compiled (it's inside a
> CONFIG_USER_ONLY block but there is no moxie-linux-user
> target in configure).

A similar issue had come up before and I don't remember seeing a clear
answer:

Are you planning to actually implement moxie-linux-user and enable it by
default, so that we can catch any errors? Or should we rather drop any
such unused CONFIG_USER_ONLY code from target-moxie?

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

