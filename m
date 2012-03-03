Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S3tCo-0004k0-LH
	for mharc-qemu-trivial@gnu.org; Sat, 03 Mar 2012 12:57:18 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51743)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1S3tCl-0004ak-Gq
	for qemu-trivial@nongnu.org; Sat, 03 Mar 2012 12:57:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1S3tCj-0005OZ-Mu
	for qemu-trivial@nongnu.org; Sat, 03 Mar 2012 12:57:15 -0500
Received: from mail-iy0-f173.google.com ([209.85.210.173]:62917)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1S3tCf-0005Nc-PD; Sat, 03 Mar 2012 12:57:09 -0500
Received: by iafj26 with SMTP id j26so3980672iaf.4
	for <multiple recipients>; Sat, 03 Mar 2012 09:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=vmvHZ4V90FfKHoJ8P+0tbMBpZqxpvKol84shfc+zoKE=;
	b=GwQbHv8H2+U1TT2MsolaeGq1f9fSNksx9kc7JTB8Q8pay3vSr3BAfie/SHvYP7ue9m
	WChYlEQDkms1PoxXKUVDiCYvC6f7uhMFVezutpxUDLfMZohlYJsbXGEV8bOCtekaz3WS
	viI8uXmENT8Aq8BL/q0lKKDxrw9neG1t4tw2DE2yxfU2cw7fcRTDldj3hJglcUdJD8mx
	jhRkf5Tl5L1AFKq83Yxq/dRDgwlXn8KAyB9+i2/wl975Jtqqdz8yCK6QiWwdoUNdXytL
	ltfdeXYgqugPk4Lp4KBzeNyLH2020YgqFP9LX70OL1z3jdttnOSBxLAdHrsZhTQUqxMi
	dxPQ==
Received: by 10.50.77.231 with SMTP id v7mr1831729igw.24.1330797427197; Sat,
	03 Mar 2012 09:57:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.22.40 with HTTP; Sat, 3 Mar 2012 09:56:47 -0800 (PST)
In-Reply-To: <4F4F44D6.2020907@siemens.com>
References: <4F4F44D6.2020907@siemens.com>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sat, 3 Mar 2012 17:56:47 +0000
Message-ID: <CAAu8pHt3CxDTqh-HJjE=z4LO1hg6WZqcqu0e=r8bzsySv3q8vw@mail.gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Roy Tam <roytam@gmail.com>,
	qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] usb: Fix signature of stub
	usb_host_device_open
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
X-List-Received-Date: Sat, 03 Mar 2012 17:57:17 -0000

Thanks, applied.

On Thu, Mar 1, 2012 at 09:43, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> This was a breakage of 3741715cf2.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
> =C2=A0usb-stub.c | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/usb-stub.c b/usb-stub.c
> index 9c3fcea..b4e10c1 100644
> --- a/usb-stub.c
> +++ b/usb-stub.c
> @@ -41,7 +41,7 @@ void usb_host_info(Monitor *mon)
> =C2=A0}
>
> =C2=A0/* XXX: modify configure to compile the right host driver */
> -USBDevice *usb_host_device_open(const char *devname)
> +USBDevice *usb_host_device_open(USBBus *bus, const char *devname)
> =C2=A0{
> =C2=A0 =C2=A0 return NULL;
> =C2=A0}
> --
> 1.7.3.4
>

