Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W1Hjr-0004II-LH
	for mharc-qemu-trivial@gnu.org; Thu, 09 Jan 2014 10:41:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1W1Hjk-0004HP-CV
	for qemu-trivial@nongnu.org; Thu, 09 Jan 2014 10:41:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1W1Hjf-0005Q5-CP
	for qemu-trivial@nongnu.org; Thu, 09 Jan 2014 10:41:36 -0500
Received: from mail-wi0-f182.google.com ([209.85.212.182]:47986)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1W1Hjf-0005NT-7S
	for qemu-trivial@nongnu.org; Thu, 09 Jan 2014 10:41:31 -0500
Received: by mail-wi0-f182.google.com with SMTP id en1so3630341wid.15
	for <qemu-trivial@nongnu.org>; Thu, 09 Jan 2014 07:41:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=FojM2nRfgfgt4K8EHQgENze8uU7v/Wn/clB4+S3iTbo=;
	b=F86ss062DySYoyKqENiEtJABzsru7hvzK1HaBwkD2bIAnoATsbti8VCW2jAGBIOQgS
	foiH//ZEWwy69Bveo+WBtGituxt5Zu7BfzGYcBxZSMRokKp9YdK12JeunuL/RtrjyMfe
	yFlZT2RcSzsj5GmA4YG66j1De/r7QAdpnahRKaiEpvBGRiTCZ2dX5BeOYLMD4sZtLFKa
	g+tUadtASCE28GGN0jAJ2Xe/PVE14k4szyMNb7Mf15g8yepusClP7bujL6ej4ZZC77ld
	og3SIgAnOBzE7hSUQVYbfAzJRB3XE7lvUPBkJHCQmHYdnE1BVbFYRTlFpx75FokvVJwt
	QAbQ==
X-Gm-Message-State: ALoCoQlAQ2kIX+SmYqj6Od+7l6Ky4p0dfvDVQ3v5/FRcLOZv/BY3nCCbT/h7VGBPdl1jyK9VMCbU
MIME-Version: 1.0
X-Received: by 10.180.76.103 with SMTP id j7mr3852682wiw.58.1389282089667;
	Thu, 09 Jan 2014 07:41:29 -0800 (PST)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.227.13.9 with HTTP; Thu, 9 Jan 2014 07:41:29 -0800 (PST)
In-Reply-To: <20140109095816.409cd2a9@redhat.com>
References: <20140109095816.409cd2a9@redhat.com>
Date: Fri, 10 Jan 2014 01:41:29 +1000
X-Google-Sender-Auth: kLp8jD_XhXDXoWr9ZYg3tOX7qeM
Message-ID: <CAEgOgz7rTzxU9MSbRiWzU2CgZiHfH3drSe5tOuY7v-u=84v7Yw@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Luiz Capitulino <lcapitulino@redhat.com>,
	qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.182
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtio-balloon: don't
	hardcode config size value
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
X-List-Received-Date: Thu, 09 Jan 2014 15:41:41 -0000

On Fri, Jan 10, 2014 at 12:58 AM, Luiz Capitulino
<lcapitulino@redhat.com> wrote:
> Use sizeof(strucy virtio_balloon_config) instead.
>

"struct".

> Signed-off-by: Luiz capitulino <lcapitulino@redhat.com>

Otherwise:

Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

> ---
>
> I have no idea which queue this should go through...
>

Trivial?

Regards,
Peter

>  hw/virtio/virtio-balloon.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index d9754db..a470a0b 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -263,7 +263,7 @@ static void virtio_balloon_get_config(VirtIODevice *vdev, uint8_t *config_data)
>      config.num_pages = cpu_to_le32(dev->num_pages);
>      config.actual = cpu_to_le32(dev->actual);
>
> -    memcpy(config_data, &config, 8);
> +    memcpy(config_data, &config, sizeof(struct virtio_balloon_config));
>  }
>
>  static void virtio_balloon_set_config(VirtIODevice *vdev,
> @@ -272,7 +272,7 @@ static void virtio_balloon_set_config(VirtIODevice *vdev,
>      VirtIOBalloon *dev = VIRTIO_BALLOON(vdev);
>      struct virtio_balloon_config config;
>      uint32_t oldactual = dev->actual;
> -    memcpy(&config, config_data, 8);
> +    memcpy(&config, config_data, sizeof(struct virtio_balloon_config));
>      dev->actual = le32_to_cpu(config.actual);
>      if (dev->actual != oldactual) {
>          qemu_balloon_changed(ram_size -
> @@ -343,7 +343,8 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
>      VirtIOBalloon *s = VIRTIO_BALLOON(dev);
>      int ret;
>
> -    virtio_init(vdev, "virtio-balloon", VIRTIO_ID_BALLOON, 8);
> +    virtio_init(vdev, "virtio-balloon", VIRTIO_ID_BALLOON,
> +                sizeof(struct virtio_balloon_config));
>
>      ret = qemu_add_balloon_handler(virtio_balloon_to_target,
>                                     virtio_balloon_stat, s);
> --
> 1.8.1.4
>
>

