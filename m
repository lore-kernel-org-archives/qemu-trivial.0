Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1StNhB-0006LO-I2
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jul 2012 14:49:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1StNh8-0006CZ-OC
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2012 14:49:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1StNh7-0007Cb-L7
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2012 14:49:26 -0400
Received: from mail-yw0-f45.google.com ([209.85.213.45]:36877)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1StNh4-0007Bh-Oi; Mon, 23 Jul 2012 14:49:22 -0400
Received: by yhpp34 with SMTP id p34so5924510yhp.4
	for <multiple recipients>; Mon, 23 Jul 2012 11:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=yOWGMjgwvaZ1HD0d8ITP5qguj2IW9qk/viuZ1d9/PWA=;
	b=InWQDGplRUuFKlsUPdln23fvFxeui6Yp2dunMPhUaSeOuXetRU9/BK7E6mYKMo5391
	ymm2d2blCAwds2X1E6qj1upnxaRJ7AsFMcVT2e7Rf3ldqBe03unSOJE6Mf7rfGyVwWj3
	z3ekzI3HumH56QLAkHgWg5vtxuh+K5m6TBnBEfVV78wAKB2tSnwMbfXAG9TioOPJQCFN
	EYuVfWy16Y4guvDe6PQrR58/QiMXWyjfppnFfplQHuxuq8HhSyrlqKXWDShlLjRtY/JV
	4tpX0E66KU3quAWs/UEvBaRfx3V43x3aocQ2I38xEU/HCLzROoDlfkfMTVA4RfZ/RZZn
	EaqQ==
Received: by 10.50.181.225 with SMTP id dz1mr46695igc.2.1343069361966; Mon, 23
	Jul 2012 11:49:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.38.68 with HTTP; Mon, 23 Jul 2012 11:49:00 -0700 (PDT)
In-Reply-To: <1342818289-31860-1-git-send-email-sw@weilnetz.de>
References: <1342818289-31860-1-git-send-email-sw@weilnetz.de>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Mon, 23 Jul 2012 18:49:00 +0000
Message-ID: <CAAu8pHvCJKqnb5t8GiDDRmkOS9zB5Q+b1yeAACYmc9phtioB=Q@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.213.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qdev: Fix Open Firmware
	comment
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
X-List-Received-Date: Mon, 23 Jul 2012 18:49:28 -0000

On Fri, Jul 20, 2012 at 9:04 PM, Stefan Weil <sw@weilnetz.de> wrote:
> Commit 0d936928ef87ca1bb7b41b5b89c400c699a7691c removed code,
> but left the related comment at a location where it no longer
> belongs to.
>
> The patch moves the comment to the correct callback and improves the text.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/qdev.h |   11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/hw/qdev.h b/hw/qdev.h
> index 247dd1e..a2cbd9d 100644
> --- a/hw/qdev.h
> +++ b/hw/qdev.h
> @@ -78,12 +78,6 @@ struct DeviceState {
>      int alias_required_for_version;
>  };
>
> -/*
> - * This callback is used to create Open Firmware device path in accordance with
> - * OF spec http://forthworks.com/standards/of1275.pdf. Indicidual bus bindings
> - * can be found here http://playground.sun.com/1275/bindings/.
> - */
> -
>  #define TYPE_BUS "bus"
>  #define BUS(obj) OBJECT_CHECK(BusState, (obj), TYPE_BUS)
>  #define BUS_CLASS(klass) OBJECT_CLASS_CHECK(BusClass, (klass), TYPE_BUS)
> @@ -95,6 +89,11 @@ struct BusClass {
>      /* FIXME first arg should be BusState */
>      void (*print_dev)(Monitor *mon, DeviceState *dev, int indent);
>      char *(*get_dev_path)(DeviceState *dev);
> +    /*
> +     * This callback is used to create Open Firmware device path in accordance
> +     * with OF spec http://forthworks.com/standards/of1275.pdf. Individual bus
> +     * bindings can be found at http://playground.sun.com/1275/bindings/.
> +     */

The links are dead. Since you are improving the text, maybe you could
find archived versions.

>      char *(*get_fw_dev_path)(DeviceState *dev);
>      int (*reset)(BusState *bus);
>  };
> --
> 1.7.10
>
>

