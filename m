Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UlzFv-0001QA-44
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 06:23:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UlzFr-0001Q2-Lw
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 06:23:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UlzFp-00048w-1S
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 06:23:15 -0400
Received: from mail-bk0-x233.google.com ([2a00:1450:4008:c01::233]:59027)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UlzFo-00048c-Q4
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 06:23:12 -0400
Received: by mail-bk0-f51.google.com with SMTP id ji1so2449106bkc.38
	for <qemu-trivial@nongnu.org>; Mon, 10 Jun 2013 03:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=EplwBcHLXJIGq4DQ3Vj6/kWOux/HS0W1jE7o6zl8d2Y=;
	b=Vr3glv9SWDwxeOo6lYye88eSdrBGR4yDvlAJhbEwBNYsxgVPjnW1j0QeZsbjDwUgFK
	UgNfK+rstkxcwPqgsl9XMuFXr8/ujUULUDOCYQ3857hSzvecnCygRIyZ2QyGoPko6CVM
	YllkTPQTCip8jTD+W1vJkI1gdeTfSM9i/RGAIaG9FquVMlFt9qS6Bb/RyHlXjEQHXsW3
	xvM0GXskQTH8MQaf7ICuzllSWKj+bS1vib84QgHI9g7cNPttMXZak6LnzC6jqErtT5Ut
	8DHh3hgHKwYG9PjPBN9aOMZbCdBrQ6TQxD4r39cDKgkz1UrJOJIV7wrwqi33++Knuilt
	Thxw==
MIME-Version: 1.0
X-Received: by 10.205.34.132 with SMTP id ss4mr1393305bkb.125.1370859791660;
	Mon, 10 Jun 2013 03:23:11 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.204.35.136 with HTTP; Mon, 10 Jun 2013 03:23:11 -0700 (PDT)
In-Reply-To: <cover.1370236013.git.peter.crosthwaite@xilinx.com>
References: <cover.1370236013.git.peter.crosthwaite@xilinx.com>
Date: Mon, 10 Jun 2013 20:23:11 +1000
X-Google-Sender-Auth: OZxmx9rfV4f60_HGE3wW83sr0ms
Message-ID: <CAEgOgz5Voft7RUCnEbCmqEhwOkyzZ44EDRX62q7jbdCS8TBsQg@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset=ISO-8859-1
X-Gm-Message-State: ALoCoQmzjbByu8XdQU5JMhES5CpbN+p808X4Xylq8tskUQgI5ZjLNR5mdNoCb8YJlQ5EMvrUkiQq
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::233
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com, aliguori@us.ibm.com,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: Re: [Qemu-trivial] [PATCH v1 0/3] Serial cleanup
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
X-List-Received-Date: Mon, 10 Jun 2013 10:23:18 -0000

Ping!

Any objections to this one going in? perhaps even via trivial queue?

Regards,
Peter

On Mon, Jun 3, 2013 at 3:11 PM,  <peter.crosthwaite@xilinx.com> wrote:
> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>
> Some cosmetics, refactored to use util/fifo8 for the FIFO8, then
> factored out some common code.
>
> Tested as working on petalogix-ml605 machine model + Linux (has
> coverage of serial fifo usage).
>
>
> Peter Crosthwaite (3):
>   char/serial: cosmetic fixes.
>   char/serial: Use generic Fifo8
>   char/serial: serial_ioport_write: Factor out common code
>
>  hw/char/serial.c         | 128 +++++++++++++++++++----------------------------
>  include/hw/char/serial.h |  15 ++----
>  2 files changed, 56 insertions(+), 87 deletions(-)
>
> --
> 1.8.3.rc1.44.gb387c77.dirty
>

