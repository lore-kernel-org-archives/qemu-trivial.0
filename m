Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g8Swc-0000q4-Ac
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2018 12:27:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g8Swa-0000p7-Hb
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 12:27:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g8SwZ-0001S1-Lp
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 12:27:12 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:36942)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1g8SwX-0001Jd-QJ; Fri, 05 Oct 2018 12:27:10 -0400
Received: by mail-lj1-x243.google.com with SMTP id 63-v6so12154536ljs.4;
	Fri, 05 Oct 2018 09:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VG1B0lgAJgpl4a5MF/GCbp0tOThVj769ldiO6qknT40=;
	b=UkAgY6pRKIoNJzat7dfkBCiW5Pe9bm+iOlFhfTOzeS2NB1gAdgkKj6D3QQo0iBRcpY
	etMTetTYwSc9GLIg4q+qYjP0Yw3Eb1pxMBuktNAjUh6k8BWaJjMKhA6hC1epJVFmaOwT
	ApjhUXbhpS3llQldqM3liEDyn1YhhXBniZRLFUMWwl7fUO6gRdARF0kXqkG+bs0lQzr2
	WNJqXbd7g/Au8AcscRvHZGOqzXdZ+nbtTV8Vf7lgKK3vxq8P7RRuTQeH9m0YmBg/KSQl
	rEoRVc4SqLa8e8ohEq8+jtoJLw0BQqhMGR3v1ckNm7H/l1bbrsrSz+jUAY/wZVAJDqru
	FuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VG1B0lgAJgpl4a5MF/GCbp0tOThVj769ldiO6qknT40=;
	b=s2Lm4BJg7W+CXuxZ3M+NlzE3qvcQ1QFcJP6meLApd0tDrGERv4XeR3LEEhHl0yxZtr
	a9pF1/594llyjzkKSFBDG6HmHoSCAXaDUYiQ0bqkVRC74f/Z4RAzDqE49UUrcqn6w4xz
	7VQnDrVCU4cHFrcYoD+H/yL2sfclDjUWDqTUznlTm1YrLSRp/0qfkaQOr0kiCc7yBLL1
	1KA0jSZClT5Dx5X0ZrRYRBP2c9Vf/z69M7a1uDuENZECJW85yAWg4526MHIQliz9vxma
	YdwcjLVtbCydUx4GGvmsD7O+0LIw0OYJCmhPQCRgsjNwYDvBdO+j/q7BNm17cekBUn/v
	Hv9Q==
X-Gm-Message-State: ABuFfohNvhg97Nmbl5ELwL21jS6MXVwxql8D+LAnE3JIXucpbiyiEXRO
	h0clwa0Jw1Sj1TegM5kER1AVrMfbezaQRQp4xkg=
X-Google-Smtp-Source: ACcGV61FFjPG13cVZBKNafD8bzNQ6X4NaW1JypicIhYygvgiJO3cXgIJU/JvaZiqSJp69Hi1ATJPrKYab1Wjcsaa8sE=
X-Received: by 2002:a2e:4255:: with SMTP id
	p82-v6mr5952006lja.58.1538756828281; 
	Fri, 05 Oct 2018 09:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <1538732546-2284-1-git-send-email-thuth@redhat.com>
In-Reply-To: <1538732546-2284-1-git-send-email-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Oct 2018 09:26:41 -0700
Message-ID: <CAKmqyKMThBh1+pEPFn5sVgGPRDF-zFoDXpO9iO_=hYKNEJhEZw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/core/generic-loader: Set
 a category for the generic-loader device
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
X-List-Received-Date: Fri, 05 Oct 2018 16:27:13 -0000

On Fri, Oct 5, 2018 at 2:52 AM Thomas Huth <thuth@redhat.com> wrote:
>
> Each device that is instantiatable by the users should be marked with
> a category. Since the generic-loader does not fit anywhere else, put
> it into the MISC category.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/core/generic-loader.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
> index fde32cb..be29ae1 100644
> --- a/hw/core/generic-loader.c
> +++ b/hw/core/generic-loader.c
> @@ -204,6 +204,7 @@ static void generic_loader_class_init(ObjectClass *klass, void *data)
>      dc->unrealize = generic_loader_unrealize;
>      dc->props = generic_loader_props;
>      dc->desc = "Generic Loader";
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>  }
>
>  static TypeInfo generic_loader_info = {
> --
> 1.8.3.1
>
>

