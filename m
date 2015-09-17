Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zcbu1-0001w4-QQ
	for mharc-qemu-trivial@gnu.org; Thu, 17 Sep 2015 12:19:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56876)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <grangeleo@gmail.com>) id 1Zcbtz-0001vN-GM
	for qemu-trivial@nongnu.org; Thu, 17 Sep 2015 12:19:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <grangeleo@gmail.com>) id 1Zcbtt-0003Qe-UQ
	for qemu-trivial@nongnu.org; Thu, 17 Sep 2015 12:19:15 -0400
Received: from mail-wi0-x22b.google.com ([2a00:1450:400c:c05::22b]:34369)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <grangeleo@gmail.com>) id 1Zcbtt-0003Pi-Ho
	for qemu-trivial@nongnu.org; Thu, 17 Sep 2015 12:19:09 -0400
Received: by wicfx3 with SMTP id fx3so31005376wic.1
	for <qemu-trivial@nongnu.org>; Thu, 17 Sep 2015 09:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=KA3ibpw7qYVTuwY4DROEKdzktkQnJSmy8xaXTBf8/bM=;
	b=cFyQUY+ZU2eGUIwOi8FFx9ESkQS7oIZIWxXJU9kAet241Vr7qq0UpNIFYUHyozlaDt
	oNhx+gh3ZwzbeoWJpHontBxHgvmwp1wYQKGEwUrb2VTnqyatqth6qYl+5kV0Vy5i3sM8
	d/zuBB065Q4dcQZyk4dJTKTjCNQCVkBb5UqPJx+0ztdFPn8zDPg2GCfjlRXNBRIB/xq6
	hjnqust5x3f0IuuLSEj2/llbJy/6gKblPzur2HWDQiqDIqqInsmV9A0FZUpA0QZLo9xQ
	osTfBiVgme6HZfE6LJKC8SZW2C80qTZZUScE5gSMEw4XAuBrVK8j29+EVHatPdmUDcVh
	ahhQ==
X-Received: by 10.180.182.107 with SMTP id ed11mr9282979wic.52.1442506747449; 
	Thu, 17 Sep 2015 09:19:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.93.9 with HTTP; Thu, 17 Sep 2015 09:18:48 -0700 (PDT)
In-Reply-To: <1438875392-9620-1-git-send-email-grangeleo@gmail.com>
References: <1438875392-9620-1-git-send-email-grangeleo@gmail.com>
From: =?UTF-8?Q?L=C3=A9o_Grange?= <grangeleo@gmail.com>
Date: Thu, 17 Sep 2015 18:18:48 +0200
Message-ID: <CAAOQwLqXeshTGTYxc+Hq62t+mvi=0nbHDg3Z+=87mCGXwYPFTQ@mail.gmail.com>
To: qemu-trivial@nongnu.org, mjt@tls.msk.ru
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22b
Subject: Re: [Qemu-trivial] [PATCH][TRIVIAL] spice: fix checking for surface
	bpp match
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
X-List-Received-Date: Thu, 17 Sep 2015 16:19:16 -0000

Ping, as I had no feedback about this small patch.
Please tell me if I need to do anything else.


2015-08-06 17:36 GMT+02:00 Leo Grange <grangeleo@gmail.com>:
> Spice surface_switch fast-path was checking only width/height matching,
> which leads to a crash when surface bpp has been increased but size
> didn't change (and probably other issues if bpp has been decreased).
>
> Signed-off-by: Leo Grange <grangeleo@gmail.com>
> ---
>  ui/spice-display.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/ui/spice-display.c b/ui/spice-display.c
> index 0360abf..d1e0972 100644
> --- a/ui/spice-display.c
> +++ b/ui/spice-display.c
> @@ -406,10 +406,11 @@ void qemu_spice_display_switch(SimpleSpiceDisplay *ssd,
>      SimpleSpiceUpdate *update;
>      bool need_destroy;
>
> -    if (surface && ssd->surface &&
> +    if (surface && ssd->surface && ssd->ds &&
>          surface_width(surface) == pixman_image_get_width(ssd->surface) &&
> -        surface_height(surface) == pixman_image_get_height(ssd->surface)) {
> -        /* no-resize fast path: just swap backing store */
> +        surface_height(surface) == pixman_image_get_height(ssd->surface) &&
> +               surface_bits_per_pixel(surface) == surface_bits_per_pixel(ssd->ds)) {
> +        /* no-resize and no bpp change fast path: just swap backing store */
>          dprint(1, "%s/%d: fast (%dx%d)\n", __func__, ssd->qxl.id,
>                 surface_width(surface), surface_height(surface));
>          qemu_mutex_lock(&ssd->lock);
> --
> 2.5.0
>

