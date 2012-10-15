Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TNY7Z-0006a1-0M
	for mharc-qemu-trivial@gnu.org; Sun, 14 Oct 2012 20:01:25 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1TNY7V-0006Qs-Oz
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 20:01:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1TNY7U-0002ZP-Ra
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 20:01:21 -0400
Received: from cantor2.suse.de ([195.135.220.15]:41828 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1TNY7S-0002Yi-Cf; Sun, 14 Oct 2012 20:01:18 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id EE7E3A0FF5;
	Mon, 15 Oct 2012 02:01:16 +0200 (CEST)
Message-ID: <507B5248.9020600@suse.de>
Date: Mon, 15 Oct 2012 02:01:12 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120825 Thunderbird/15.0
MIME-Version: 1.0
To: Blue Swirl <blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
	<9b4ee7a47d8bc116e20f236a1ad9ed73a695123e.1350244587.git.blauwirbel@gmail.com>
	<CAFEAcA_M58F9F-NTY81Fau9_iH_s76f0KHQ_L5TOoC8+naWB6Q@mail.gmail.com>
	<CAAu8pHu5cuBML84JehNbXXsbuJ=3KwauuAvOYP=+VH-Y_GQ+-g@mail.gmail.com>
In-Reply-To: <CAAu8pHu5cuBML84JehNbXXsbuJ=3KwauuAvOYP=+VH-Y_GQ+-g@mail.gmail.com>
X-Enigmail-Version: 1.4.4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 10/11] arm: add missing
 static and remove unused functions
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
X-List-Received-Date: Mon, 15 Oct 2012 00:01:23 -0000

Am 14.10.2012 22:33, schrieb Blue Swirl:
> On Sun, Oct 14, 2012 at 8:09 PM, Peter Maydell <peter.maydell@linaro.or=
g> wrote:
>> Please don't delete this function, it is the public facing interface
>> for allowing board models to attach NAND devices to the GPMC. This
>> might not be used by anything currently in mainline, but it is used
>> by the omap3 beagle and overo board models in qemu-linaro (and which
>> I will upstream eventually, honest).
>=20
> It could be re-added with the boards, or just disabled now with #if 0/#=
endif.

#if 0 would make things worse, since then no compile-time checking of
the code is performed and it just rots, as seen with DPRINTF().

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

