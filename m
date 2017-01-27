Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cX9af-000547-Qt
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2017 11:41:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cX9ad-00052v-Jh
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2017 11:41:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cX9ac-0003lI-SD
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2017 11:41:31 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:35867)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cX9ab-0003kA-0q; Fri, 27 Jan 2017 11:41:29 -0500
Received: by mail-oi0-x241.google.com with SMTP id u143so20923984oif.3;
	Fri, 27 Jan 2017 08:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=GoeUSroY9BwLELsIYuQGEXZWWh5+rRii07oc9VDuzw0=;
	b=cdV/5cuOJlo08X7QfFBKdXQS5gJtVLFUdPfuKXqv0Gr/UPYlSHuvrvSzy4nJ4bcuhV
	xOGd8z3FDxDUOUEQ+jb4XQP+bDY7kMO/VcXbHqiVQZ7eNx+JQQ3G5yndxLxRygFThkPm
	36u3l6uOsPkfBiraRzj0SNpn20S47JYTwxFqmkNMSEWrVzgUiMlDTBo6FpHjlQTlIUsz
	AAWJXldLHy7BP9EcPM6J5Nml1UMgszXzCJMDtshbyWRc2wo/TyeLYh5fjdVS6DFQHOKi
	OAmOM5HJc6Ook0E6k8fIi6EJePMLXuaSXeHO6X/ztt6h7HxvTVKc5XPtfS9SpIJvKOZF
	pZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=GoeUSroY9BwLELsIYuQGEXZWWh5+rRii07oc9VDuzw0=;
	b=E8+NMr1HGpA/cKoikUEESvFVhWUQvTZ0J5SBR+S6fe6FxEZg2LzY/DvRxT8ORmd8xe
	Ajuak3DBx5x9/KQr7qiybw0c9JAN5dndWveNwB8z5sBkD6sdiTGtz3lh9/s4MZhLTQw1
	cuH5SOT0/hq9XLkheP7EJ9OXk8EyCaOavlp4/l8emYsr1LA6KGkHR6swmh0QNvnDIlRS
	99jDsMrKCPtBMI8g9hMXq0UJ8dt9ovr44ZbmLjOoYnhEor+9RlzLas/33ysYEcF9uGyw
	Gd8PRBO+qwwsafczdztKm+jyduNOAsFyOpssQmXp0IqVlQsIakBeb/djuAXRZUHx8F3+
	Fm1Q==
X-Gm-Message-State: AIkVDXIdQtJNF7oW5KpBF04o9H/Lp2OWRjzSGMLs9kx7+ZPUrl2ykgDkwLnyOuoQju2FHVJNSWeIAd1bSxTWwQ==
X-Received: by 10.202.76.146 with SMTP id z140mr5371155oia.68.1485535286737;
	Fri, 27 Jan 2017 08:41:26 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.182.98.133 with HTTP; Fri, 27 Jan 2017 08:40:56 -0800 (PST)
In-Reply-To: <1485528688-29914-1-git-send-email-thuth@redhat.com>
References: <1485528688-29914-1-git-send-email-thuth@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 27 Jan 2017 08:40:56 -0800
X-Google-Sender-Auth: fmoka8uNYDjFCVo2v9mdy2dIbRw
Message-ID: <CAKmqyKOGTgKfGdjX4AYvh_yz=mSAgSdAWV=58=0s4w7LXjy2qw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/core/or-irq: Mark the
 device with cannot_instantiate_with_device_add_yet
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
X-List-Received-Date: Fri, 27 Jan 2017 16:41:32 -0000

On Fri, Jan 27, 2017 at 6:51 AM, Thomas Huth <thuth@redhat.com> wrote:
> The "or-irq" device is just used internally. It's strange to
> see this device showing up in the "-device ?" help text. Let's mark it
> with cannot_instantiate_with_device_add_yet to hide it from the users.

I agree that it is strange to be showing up to users, but is this
really the best way to do this?

I thought we were trying to get rid of
cannot_instantiate_with_device_add_yet. Would it maybe be better to
have an internal filed that sets this device as internal?

Thanks,

Alistair

>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/core/or-irq.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/core/or-irq.c b/hw/core/or-irq.c
> index 1ac090d..2487fa3 100644
> --- a/hw/core/or-irq.c
> +++ b/hw/core/or-irq.c
> @@ -89,6 +89,9 @@ static void or_irq_class_init(ObjectClass *klass, void *data)
>      dc->props = or_irq_properties;
>      dc->realize = or_irq_realize;
>      dc->vmsd = &vmstate_or_irq;
> +
> +    /* It's just used internally, and should not be exposed to users */
> +    dc->cannot_instantiate_with_device_add_yet = true;
>  }
>
>  static const TypeInfo or_irq_type_info = {
> --
> 1.8.3.1
>
>

