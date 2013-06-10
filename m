Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um0um-0002YR-5F
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 08:09:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Um0ui-0002XP-Cl
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 08:09:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Um0ug-0005O1-Iu
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 08:09:32 -0400
Received: from mail-bk0-x232.google.com ([2a00:1450:4008:c01::232]:54177)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Um0ug-0005Np-DZ
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 08:09:30 -0400
Received: by mail-bk0-f50.google.com with SMTP id ik8so1397670bkc.37
	for <qemu-trivial@nongnu.org>; Mon, 10 Jun 2013 05:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=ylttDbU/PUb4q4aP2T987UyMCSfiaq2z82M0BXdcC7Y=;
	b=Q+H8rgmvaF5fWHYQtOIsv++X+QC8SSFizy7bp+FGWLe3seg9WvoQny9rTxEw7TvOor
	Glc9mIp6ll45jqyDBGDsnVRbdt77mFyqpkIEVibsSMUvAgrklhqID0E72lg60jlJiRMo
	1tGhCBn+oe0v4BmbZlGmCasAb5Vf6XSwjT6GV002ItyBeWpQXtnX5dZ6JEizY8e4gFK/
	JXkbNL6p5ktpuUefoAGPW4mcqBan0nBd/pbJ45sToTySskiWcpz0vEgnG/mHuSmhM6pb
	FxO8AAiyuKFWOCncs8WBOwIdCGr2/ktVEycmnHwV9vXTPp7pIy/1fBWz5Jz6+WrjwSl0
	MXEA==
MIME-Version: 1.0
X-Received: by 10.205.46.131 with SMTP id uo3mr1440740bkb.43.1370866169562;
	Mon, 10 Jun 2013 05:09:29 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.204.35.136 with HTTP; Mon, 10 Jun 2013 05:09:29 -0700 (PDT)
In-Reply-To: <51B5BD52.3050906@suse.de>
References: <cover.1370236013.git.peter.crosthwaite@xilinx.com>
	<CAEgOgz5Voft7RUCnEbCmqEhwOkyzZ44EDRX62q7jbdCS8TBsQg@mail.gmail.com>
	<51B5BD52.3050906@suse.de>
Date: Mon, 10 Jun 2013 22:09:29 +1000
X-Google-Sender-Auth: o6PbKueTYw5MoLkG9763xgSK1ts
Message-ID: <CAEgOgz5-NB3+QXrkdEBz93V4PrqWKFcwK0KvTsLDR3Py1aAmnA@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQmUMAzf3TmD7ch33cL2VFojCxe3QKjuIrGpljAEPOt0KB1CyA9QrqvdTJUFtB8y3crvqQir
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::232
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
X-List-Received-Date: Mon, 10 Jun 2013 12:09:34 -0000

Hi Andreas,

On Mon, Jun 10, 2013 at 9:49 PM, Andreas F=E4rber <afaerber@suse.de> wrote:
> Am 10.06.2013 12:23, schrieb Peter Crosthwaite:
>> Ping!
>>
>> Any objections to this one going in? perhaps even via trivial queue?
>
> No strong objection, but you are using an unusual 12-char indentation in
> some places that you may want to check.
>

I use that indentation when a ? : operator continues to the next line.
What indentation scheme should be used in this instance?

Regards,
Peter

> Otherwise the cosmetic cleanup looks fine to me.
>
> Cheers,
> Andreas
>
>> On Mon, Jun 3, 2013 at 3:11 PM,  <peter.crosthwaite@xilinx.com> wrote:
>>> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>>>
>>> Some cosmetics, refactored to use util/fifo8 for the FIFO8, then
>>> factored out some common code.
>>>
>>> Tested as working on petalogix-ml605 machine model + Linux (has
>>> coverage of serial fifo usage).
>>>
>>>
>>> Peter Crosthwaite (3):
>>>   char/serial: cosmetic fixes.
>>>   char/serial: Use generic Fifo8
>>>   char/serial: serial_ioport_write: Factor out common code
>>>
>>>  hw/char/serial.c         | 128 +++++++++++++++++++--------------------=
--------
>>>  include/hw/char/serial.h |  15 ++----
>>>  2 files changed, 56 insertions(+), 87 deletions(-)
>>>
>>> --
>>> 1.8.3.rc1.44.gb387c77.dirty
>>>
>>
>
>
> --
> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg
>

