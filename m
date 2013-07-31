Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V4e6W-0005Df-Cs
	for mharc-qemu-trivial@gnu.org; Wed, 31 Jul 2013 17:38:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1V4e6O-0005DB-Cv
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 17:38:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1V4V8X-0007R9-9s
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 08:04:19 -0400
Received: from cantor2.suse.de ([195.135.220.15]:59007 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1V4V8K-0007MH-I4; Wed, 31 Jul 2013 08:04:00 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 79A7BA3B99;
	Wed, 31 Jul 2013 14:03:59 +0200 (CEST)
Message-ID: <51F8FD2C.1010002@suse.de>
Date: Wed, 31 Jul 2013 14:03:56 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
References: <1375266255-22207-1-git-send-email-mjt@msgid.tls.msk.ru>
	<51F8E68F.4030006@msgid.tls.msk.ru>
	<CAFEAcA8UZRQAv9NLRcyvUffXMKMM01FauUDvmxiGRwHJzmUM1g@mail.gmail.com>
In-Reply-To: <CAFEAcA8UZRQAv9NLRcyvUffXMKMM01FauUDvmxiGRwHJzmUM1g@mail.gmail.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-ga: build it even if
	!system
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
X-List-Received-Date: Wed, 31 Jul 2013 21:38:42 -0000

Am 31.07.2013 13:05, schrieb Peter Maydell:
> On 31 July 2013 11:27, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> 31.07.2013 14:24, Michael Tokarev wrote:
>>> Move qemu-ga build check out of if softmmu.. into if tools section.
>>> We want to build qemu-ga for _guest_ even if system build isn't
>>> done.  It is controlled separately using --enable-guest-agent.
>>
>> Actually the more I think about it... Maybe it shouldn't depend
>> on --enable-tools either, but should be an independent option.
>> Because it isn't really a tool.
>=20
> This seems to me to be unnecessarily breaking things down
> into very finely divided categories. I think putting it
> in --enable-tools is fine.

I disagree. Think about building a Windows guest agent: You don't need
qemu-img (tools) on a Windows guest, and mjt is right that it shouldn't
be coupled to building any qemu-system-*.

However it looks as if the linux/bsd/solaris checks got lost in the patch=
?

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

