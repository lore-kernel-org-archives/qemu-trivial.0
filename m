Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V9iAL-0001Wf-4h
	for mharc-qemu-trivial@gnu.org; Wed, 14 Aug 2013 16:59:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1V9iAE-0001PG-Ij
	for qemu-trivial@nongnu.org; Wed, 14 Aug 2013 16:59:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1V9iA8-0004Pl-Mh
	for qemu-trivial@nongnu.org; Wed, 14 Aug 2013 16:59:30 -0400
Received: from cantor2.suse.de ([195.135.220.15]:58647 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1V9i9c-0004Dl-UP; Wed, 14 Aug 2013 16:59:00 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id D5AE2A5211;
	Wed, 14 Aug 2013 22:58:51 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: text/plain; charset=us-ascii
From: Alexander Graf <agraf@suse.de>
In-Reply-To: <CAFEAcA_m6Af5tRB=s0h0TiO6ghbKi+hVvtnB2f3CeAtY2S7UbQ@mail.gmail.com>
Date: Wed, 14 Aug 2013 22:58:48 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <B8F69B83-8EC9-4337-99BF-B18B84CB7531@suse.de>
References: <CAKyx-3MMkqKw3GXxSR=NizeBHhE+pYyONUX+0mtOgu5h3kix9g@mail.gmail.com>
	<CAFEAcA8VPg-WDf+Xf3j=7Q--NJgc1+2n6zg6M=pX+idkA-zyEw@mail.gmail.com>
	<358B0F62-7043-432E-8B49-F95CD1B82443@gmail.com>
	<CAFEAcA8Gh+jys24Ejjp+6ccTxQFhmvdhmfvzEO_B04yzredL=A@mail.gmail.com>
	<9A748A2F-42CF-4600-AE57-5B013DBC02F2@gmail.com>
	<CAFEAcA81WMKSYnPWFrAF79qOxumtLRHEQjif1RSMO4yxvVc1-A@mail.gmail.com>
	<2A318D54-11AD-4C05-B5A3-54F35E906571@gmail.com>
	<BC63267D-24B2-4823-9AAB-71722C1DB9D8@suse.de>
	<CA+aC4kuJG0_uOYJRf21Kirp2pMxp-VG0ztXQESht=-1hh=zEqA@mail.gmail.com>
	<CAFEAcA_m6Af5tRB=s0h0TiO6ghbKi+hVvtnB2f3CeAtY2S7UbQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.1278)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-devel qemu-devel <qemu-devel@nongnu.org>,
	Programmingkid <programmingkidx@gmail.com>,
	"qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
	Anthony Liguori <anthony@codemonkey.ws>,
	=?iso-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-ppc] [PATCH v2] Adds the
	ability to use the command key in the guest operating system.
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
X-List-Received-Date: Wed, 14 Aug 2013 20:59:36 -0000


On 14.08.2013, at 22:52, Peter Maydell wrote:

> On 14 August 2013 21:44, Anthony Liguori <anthony@codemonkey.ws> =
wrote:
>> I'm confident there's a way to get hardware keycodes on OS X.  There
>> is on every other UI platform that I know of.  That's the best way to
>> solve this.
>=20
> Sure, but that doesn't answer the fundamental question of "when
> should the OS's window/menu accelerator operate the OS menu and
> when should it be passed to the guest as a raw key". However you
> get the keycodes you still have that choice.

The normal rule of thumb IIRC is when mouse grab is active, everything =
goes into the guest.


Alex


