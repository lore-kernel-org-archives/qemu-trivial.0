Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZK427-0002D8-1p
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jul 2015 08:30:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ZK423-0002BS-Bg
	for qemu-trivial@nongnu.org; Tue, 28 Jul 2015 08:30:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ZK422-00089R-HP
	for qemu-trivial@nongnu.org; Tue, 28 Jul 2015 08:30:55 -0400
Received: from mail-ob0-x236.google.com ([2607:f8b0:4003:c01::236]:34172)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1ZK41s-00081O-Cd; Tue, 28 Jul 2015 08:30:44 -0400
Received: by obre1 with SMTP id e1so82861201obr.1;
	Tue, 28 Jul 2015 05:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=MSdBZXmOvRvsILDnDkfSMKD3IGgvgFW2gzRyG5C0oK0=;
	b=J44Qsipeyc0oA7LZXh1jmQbhfXqrFbrOyw5xcZJjsTYph6OitumqO/BKYBkwMBsXVX
	kiro0Suh2Ht7LC8ErxptHRWudnGqq9GyUqSoyV5VxIc3Y/f/aJbXZ4KeDxnxfKy7yOSN
	VuukPiFjCpMc6ao1zodwTa8z9GBYBJOhrOfcK5QUYr/vvgklbWb949KeRWaXTETI9iA4
	p1yczGOA7W5lebACOJc+39TZJqWlZh8XEbTrTIgSNErcaXP8ws9G4HVxDXNQm8jGRyUd
	87I1km2DLLPk+/nzJxNsuL7QoKC/syW3iZyKR07Y1md8V2TCrW4OEIrO8HALPft6ek9F
	2yVw==
MIME-Version: 1.0
X-Received: by 10.182.213.227 with SMTP id nv3mr33104317obc.10.1438086643824; 
	Tue, 28 Jul 2015 05:30:43 -0700 (PDT)
Received: by 10.76.22.164 with HTTP; Tue, 28 Jul 2015 05:30:43 -0700 (PDT)
In-Reply-To: <cff8241a8e30f0d39e0f50a435965cdd130cd5d5.1436279924.git.DirtY.iCE.hu@gmail.com>
References: <cff8241a8e30f0d39e0f50a435965cdd130cd5d5.1436279924.git.DirtY.iCE.hu@gmail.com>
Date: Tue, 28 Jul 2015 13:30:43 +0100
Message-ID: <CAJSP0QXj07FKi9g0B6mF9nbZi-inPQMEFrVZ_a6w5WPwbJycLQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?UTF-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::236
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] opts: produce valid
	command line in qemu_opts_print
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
X-List-Received-Date: Tue, 28 Jul 2015 12:30:56 -0000

On Tue, Jul 7, 2015 at 3:42 PM, K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.i=
ce.hu@gmail.com> wrote:
> This will let us print options in a format that the user would actually
> write it on the command line (foo=3Dbar,baz=3Dasd,etc=3Ddef), without
> prepending a spurious comma at the beginning of the list, or quoting
> values unnecessarily.  This patch provides the following changes:
> * write and id=3D, if the option has an id
> * do not print separator before the first element
> * do not quote string arguments
> * properly escape commas (,) for QEMU
>
> Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com=
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Feel free to send a "Ping" email reply if your patches haven't been
reviewed after about 1 week.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

