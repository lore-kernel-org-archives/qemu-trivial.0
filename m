Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dzNaP-0005aT-Lu
	for mharc-qemu-trivial@gnu.org; Tue, 03 Oct 2017 09:50:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dzNaI-0005QZ-PJ
	for qemu-trivial@nongnu.org; Tue, 03 Oct 2017 09:50:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dzNaH-0006ac-VU
	for qemu-trivial@nongnu.org; Tue, 03 Oct 2017 09:50:06 -0400
Received: from mail-wr0-x236.google.com ([2a00:1450:400c:c0c::236]:56206)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dzNaH-0006aG-Od
	for qemu-trivial@nongnu.org; Tue, 03 Oct 2017 09:50:05 -0400
Received: by mail-wr0-x236.google.com with SMTP id l39so6366885wrl.12
	for <qemu-trivial@nongnu.org>; Tue, 03 Oct 2017 06:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ub+VX+r1TiJwDC2KEX8g3NxCD9LY8EylwOwS0KBdOE8=;
	b=JFEcvh0kn8l2jrTL0qyaQak+1MnjzcN6iNk64urol1gf/yptEkiRziCpMMnQVaFT4S
	ziCh2sSJGTlctkVr4WpQZcGVUMH56tcoxwbszxrczsC16wi2RYf0uXfv8QYSdnV+dCze
	v5GOt3cZC4WTJcV63lF7xWZ0bDt9IHKiuqm+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ub+VX+r1TiJwDC2KEX8g3NxCD9LY8EylwOwS0KBdOE8=;
	b=iJtWzfSGHjp7nUKNWqimoZtQdZJRf4jI3d92s89N1KQ6vleH0Rb3112WRUOsbNFaUE
	WaJB+a2Bx0k28kUdhp4Q64Npll5Nz77ulSmrbtY57EHFc7iPy6QyvDFd0nwTDDmWSKTw
	du9qAAeWZXY0SZjc/QgeedavjicbWmNULisGLxdT7EodICT9Q9sNp2KkykGM04PJe4nb
	pKnSjfTlZJZcS88OzXoF0/ShpFWGYzA38ziLu+11gGR5uQH99byT17hjdeC7sfLkkG/i
	P1rQOzG/uE/hnoGyw/FlOE78Z28YWkeagLqkrajSbg75FKWUKE9KDxW6DwCZ8fw1dYZ1
	0GmQ==
X-Gm-Message-State: AMCzsaUCI6uqipPkPhtkOK31oImRZUlvNNoU1pIYg1fduvTyKvg4cjcb
	LfyM5eOa9Qp76US5FW55v0tuowmO4oj/sL13hD2Lug==
X-Google-Smtp-Source: AOwi7QBL1xMS0yyZKdyR1II6SN5j592c1lg33CL0KxRC3qap66IFos7SnJ+3Qpo88UU9n8DSykTARnZ21HgitrGCW3U=
X-Received: by 10.223.195.194 with SMTP id d2mr498838wrg.173.1507038604650;
	Tue, 03 Oct 2017 06:50:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Tue, 3 Oct 2017 06:49:16 -0700 (PDT)
In-Reply-To: <1506441116-16627-1-git-send-email-thuth@redhat.com>
References: <1506441116-16627-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Oct 2017 14:49:16 +0100
Message-ID: <CAFEAcA-V5QRwBCCEvekUvTcVtt58y=1McU41LY0z3XP-JyQsXA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::236
Subject: Re: [Qemu-trivial] [PATCH] hw/arm/xlnx-zynqmp: Mark the "xlnx,
 zynqmp" device with user_creatable = false
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Oct 2017 13:50:12 -0000

On 26 September 2017 at 16:51, Thomas Huth <thuth@redhat.com> wrote:
> The device uses serial_hds in its realize function and thus can't be
> used twice. Apart from that, the comma in its name makes it quite hard
> to use for the user anyway, since a comma is normally used to separate
> the device name from its properties when using the "-device" parameter
> or the "device_add" HMP command.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/xlnx-zynqmp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 2b27daf..d4b6560 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -440,6 +440,8 @@ static void xlnx_zynqmp_class_init(ObjectClass *oc, void *data)
>
>      dc->props = xlnx_zynqmp_props;
>      dc->realize = xlnx_zynqmp_realize;
> +    /* Reason: Uses serial_hds in realize function, thus can't be used twice */
> +    dc->user_creatable = false;
>  }
>
>  static const TypeInfo xlnx_zynqmp_type_info = {



Applied to target-arm.next, thanks.

-- PMM

