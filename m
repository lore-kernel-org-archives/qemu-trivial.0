Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um0bf-0005QI-IC
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 07:49:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Um0bc-0005MZ-1C
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 07:49:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Um0ba-0006av-Uv
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 07:49:47 -0400
Received: from cantor2.suse.de ([195.135.220.15]:44362 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Um0bX-0006Zh-7b; Mon, 10 Jun 2013 07:49:43 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id A41A4A5077;
	Mon, 10 Jun 2013 13:49:41 +0200 (CEST)
Message-ID: <51B5BD52.3050906@suse.de>
Date: Mon, 10 Jun 2013 13:49:38 +0200
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
References: <cover.1370236013.git.peter.crosthwaite@xilinx.com>
	<CAEgOgz5Voft7RUCnEbCmqEhwOkyzZ44EDRX62q7jbdCS8TBsQg@mail.gmail.com>
In-Reply-To: <CAEgOgz5Voft7RUCnEbCmqEhwOkyzZ44EDRX62q7jbdCS8TBsQg@mail.gmail.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com, aliguori@us.ibm.com,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1 0/3] Serial cleanup
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
X-List-Received-Date: Mon, 10 Jun 2013 11:49:50 -0000

Am 10.06.2013 12:23, schrieb Peter Crosthwaite:
> Ping!
>=20
> Any objections to this one going in? perhaps even via trivial queue?

No strong objection, but you are using an unusual 12-char indentation in
some places that you may want to check.

Otherwise the cosmetic cleanup looks fine to me.

Cheers,
Andreas

> On Mon, Jun 3, 2013 at 3:11 PM,  <peter.crosthwaite@xilinx.com> wrote:
>> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>>
>> Some cosmetics, refactored to use util/fifo8 for the FIFO8, then
>> factored out some common code.
>>
>> Tested as working on petalogix-ml605 machine model + Linux (has
>> coverage of serial fifo usage).
>>
>>
>> Peter Crosthwaite (3):
>>   char/serial: cosmetic fixes.
>>   char/serial: Use generic Fifo8
>>   char/serial: serial_ioport_write: Factor out common code
>>
>>  hw/char/serial.c         | 128 +++++++++++++++++++-------------------=
---------
>>  include/hw/char/serial.h |  15 ++----
>>  2 files changed, 56 insertions(+), 87 deletions(-)
>>
>> --
>> 1.8.3.rc1.44.gb387c77.dirty
>>
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

