Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UoTgb-0005Zd-Pw
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jun 2013 03:17:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UoTgZ-0005Vj-8c
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 03:17:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UoTgY-0005KC-1L
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 03:17:07 -0400
Received: from cantor2.suse.de ([195.135.220.15]:54530 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UoTgT-0005JZ-Kt; Mon, 17 Jun 2013 03:17:01 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id ABB60A50E4;
	Mon, 17 Jun 2013 09:17:00 +0200 (CEST)
Message-ID: <51BEB7EA.9050300@suse.de>
Date: Mon, 17 Jun 2013 09:16:58 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <CAEgEybqrZ50JD5jmf9ge2g1VgNB5XE4wLkfxvB6qBe89vjP8Zw@mail.gmail.com>
	<51BE5EE8.5070607@suse.de> <51BEB4A7.4000806@redhat.com>
In-Reply-To: <51BEB4A7.4000806@redhat.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: Vladimir Senkov <hangup@gmail.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	qemu-trivial <qemu-trivial@nongnu.org>, qemu-stable@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] copy&paste error in serial.c causes a crash when
 attempting to read from UART (if there is no data to be read)
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
X-List-Received-Date: Mon, 17 Jun 2013 07:17:08 -0000

Am 17.06.2013 09:03, schrieb Paolo Bonzini:
> Il 17/06/2013 02:57, Andreas F=E4rber ha scritto:
>>>> From 032bdc94c6369aa7b578182cdad8038ebb2b8cd1 Mon Sep 17 00:00:00 20=
01
>>>> From: Vladimir Senkov <hangup@gmail.com <mailto:hangup@gmail.com>>
>>>> Date: Sun, 16 Jun 2013 20:30:52 -0400
>>>> Subject: [PATCH] fixed a copy&paste error in serial.c
>>>>
>>>> Signed-off-by: Vladimir Senkov <hangup@gmail.com <mailto:hangup@gmai=
l.com>>
>> Patch is HTML-damaged unfortunately, we recommend git-send-email:
>> http://wiki.qemu.org/Contribute/SubmitAPatch
>>
>> But since the patch is so trivial, maybe Peter or Michael can fix it u=
p?
>=20
> And also add Cc: qemu-stable.

I interpreted this as a regression through Peter's serial patches that
went in via trivial pull last week, but I may well be wrong. :)

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

