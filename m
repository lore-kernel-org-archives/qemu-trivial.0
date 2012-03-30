Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SDZXd-000287-QM
	for mharc-qemu-trivial@gnu.org; Fri, 30 Mar 2012 06:58:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SDZXZ-0001tg-Tg
	for qemu-trivial@nongnu.org; Fri, 30 Mar 2012 06:58:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SDZXY-0003Sn-4c
	for qemu-trivial@nongnu.org; Fri, 30 Mar 2012 06:58:45 -0400
Received: from mail-lpp01m010-f45.google.com ([209.85.215.45]:45154)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SDZXX-0003SQ-Py
	for qemu-trivial@nongnu.org; Fri, 30 Mar 2012 06:58:44 -0400
Received: by lahe6 with SMTP id e6so615814lah.4
	for <multiple recipients>; Fri, 30 Mar 2012 03:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=fB0rsqNlfdQyzIGbyeWgMyHF+vxwgO1nwjpS9PnEpD0=;
	b=Nt8EJe/q7lwrJ+P8XdTT3qijhpg7mJNgBInV+l7tQvmsyr2VG3pAsnsueud5Qt4Vqp
	itJglvYorxQe9M5ih/phvV4HmcXC0+vfDkopzb9rAEhtl+kLq2411Wdo8YtS2mDp3GdH
	DXLSqej71F6rRXGB5P321Vt5ue6BGMU9rImai55ebXwklxgnK8BN8fipWArdTs5Ji08I
	OyoIRq812p/r5t00EZSqUgPrsBbgmIsCKKr1waMOnChWUIP4l9YL1PoHGAzyu6plu54X
	iXaAjOg6G2+gJukcQX4/7LWmfOW9bkvQHghB2F9avT/MpzuLF/BL0nTKUrWqBZcULhMU
	655g==
MIME-Version: 1.0
Received: by 10.152.129.137 with SMTP id nw9mr1835105lab.48.1333105120452;
	Fri, 30 Mar 2012 03:58:40 -0700 (PDT)
Received: by 10.112.80.167 with HTTP; Fri, 30 Mar 2012 03:58:40 -0700 (PDT)
In-Reply-To: <1333056937-14748-1-git-send-email-alevy@redhat.com>
References: <1332944776-4037-1-git-send-email-alevy@redhat.com>
	<1333056937-14748-1-git-send-email-alevy@redhat.com>
Date: Fri, 30 Mar 2012 11:58:40 +0100
Message-ID: <CAJSP0QVxDZowFxtWxapiOOXwcHT+0kiEutTntcHDfuN5=Zu4LA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alon Levy <alevy@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.45
Cc: qemu-trivial@nongnu.org, qemu@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v3 1/2] tracetool: dtrace: handle in and
 next reserved words
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
X-List-Received-Date: Fri, 30 Mar 2012 10:58:47 -0000

On Thu, Mar 29, 2012 at 10:35 PM, Alon Levy <alevy@redhat.com> wrote:
> Signed-off-by: Alon Levy <alevy@redhat.com>
> ---
>
> I think I need a qemu-trivial-review too ;)
>
> v3:
> =A0added self =A0 =A0(Lee Essen)
> =A0use post '_' =A0(Stefan Hajnoczi)
> =A0use case/esca (Eric Blake & Peter Maydell)
>
> =A0scripts/tracetool | =A0 10 ++++++----
> =A01 file changed, 6 insertions(+), 4 deletions(-)

Thanks, I have merged this patch.

Stefan

