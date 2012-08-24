Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4w55-0002si-Rh
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2012 11:45:55 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T4w53-0002sb-BD
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 11:45:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T4w52-0006kY-5v
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 11:45:53 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:59653)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T4w51-0006kQ-UF
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 11:45:52 -0400
Received: by iakx26 with SMTP id x26so3476053iak.4
	for <qemu-trivial@nongnu.org>; Fri, 24 Aug 2012 08:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=SiG9hHAQfrbNzZB/VjIICsXKeCtZzx20bioA/2ZnOyw=;
	b=OsEmg8CSWu3+3OLP0WJU27QZpPK+9TsnXrR6PBmoObAck0Wj5HGFLWwmZwstd2fucb
	h72hXMdtZFh25X6PrPoLlH14QJcODsZMLIo2r0NF5ChqoHPxmqcnSuSVYi/tXBwoSMal
	8gR9huef8i6cXxwO3OjjMQe/AtEkT9cswY/ntJvlTru51+CvBvdUxuaYeqgAqmoxdR/l
	gKjSs4ecJpipqjQfuu3lEIO0sqyBap/nsG52X6Cufp1hOQ9woIM81qxSIdkrEQj+Hy4v
	JtmdYOUZbctKajGpjXQzUPMX8rW7Lx+IFRwduorLO8UwXR4DO0XoDQdZB9jrAnY6ve3z
	VISA==
MIME-Version: 1.0
Received: by 10.43.132.70 with SMTP id ht6mr4788559icc.14.1345823150774; Fri,
	24 Aug 2012 08:45:50 -0700 (PDT)
Received: by 10.50.160.161 with HTTP; Fri, 24 Aug 2012 08:45:50 -0700 (PDT)
In-Reply-To: <Pine.GSO.4.64.1208241714240.16113@mono>
References: <Pine.GSO.4.64.1208230207120.26411@mono>
	<20120824112647.GK10867@stefanha-thinkpad.localdomain>
	<Pine.GSO.4.64.1208241714240.16113@mono>
Date: Fri, 24 Aug 2012 16:45:50 +0100
Message-ID: <CAFEAcA-qY2UyAAXBoHwGy0fMqmTFu6zwx4E8SRwLE7S+NZm=-w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnUK5cKIx2u+I2pgepLfOpwnxmkHxvde0vynCGfgDQ45S3YbtmQQmEbr9xAzeGKkhHNjyUl
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] console: Cleanup
 computation of bytes per pixel and add missing cases
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
X-List-Received-Date: Fri, 24 Aug 2012 15:45:54 -0000

On 24 August 2012 16:24, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> The above
> bits_per_pixel=16 for 15 bpp case was there already I just added a comment
> marking it as suspicious but I'm not sure how to resolve that.

It is certainly a bug somewhere, since ds_get_bits_per_pixel() just
returns the pixelformat bits_per_pixel field, and code like hw/pl110.c
assumes that that can be 15 and that that implies that the pixel
format is as per rgb_to_pixel15() in pixel_ops.h. So one end of
that or the other is wrong.

I think all this code needs careful auditing to (a) clearly define
what "bpp" means and what "depth" means (assuming we need to distinguish;
IME they are usually supposed to be synonyms!) and (b) make sure that
everything that accesses one or the other is actually using the
right one...

-- PMM

