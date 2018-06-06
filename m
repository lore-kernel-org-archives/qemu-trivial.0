Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQak1-0003D2-HW
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jun 2018 11:52:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fQajy-0003BG-TC
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:52:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fQajy-0005wF-7f
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:52:50 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:33663)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fQajx-0005vr-Vx; Wed, 06 Jun 2018 11:52:50 -0400
Received: by mail-lf0-x244.google.com with SMTP id y20-v6so9920352lfy.0;
	Wed, 06 Jun 2018 08:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=aJo4tZW25bINjMZeaBm92HZLVj7b1iV9Z6m+bmvpcrA=;
	b=kEn6Ba2iiTbmz9jrK9UeDk6Qd4J1JoSUo2MZZ7qDmpYuSSHD/xHh8eJrYawZj6nGv2
	Cc1UiXpB1SSKc6V042p1lKvyv2jzU7wXDHJfSDZkAELJ9mfiiQ3tSTtB+EmSfxQDrxTe
	tBDmYcVrWxLzDEGYZviTGMbxZOWxHAv+tV4szijLlYP4BdziNciYAj8uZsrROxTUQCIe
	TtaVI5pj4kwHG/pA1zo1TnJUcf0WFjFm9vTj6CxXskbPMW9qdt8mq1wVroQFyegtpSCP
	y6Pq/BIGyPlcJnPsVMfLbqfFfJc3DcX4IeH5XwhlxOEXwiofEontr5VKsWIoSwmSiZBA
	CmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=aJo4tZW25bINjMZeaBm92HZLVj7b1iV9Z6m+bmvpcrA=;
	b=Q7n2a4bwHWb2wYFAmYIJ5cJxQlYt9r4aw+ZyLaRIIsQUtof9bx4fBlsSYrGuwIu853
	x7HjxgB8VBrlXfXT58aSgnrfTJVxYCvk5PoD62N4JJEhSJT6xp2ai+TF61D3vHguMDYJ
	S2MGxy6o0eRLwI1ZyBgamtSZKiDEh0Uk05I2b26XmjRmWNuIN1VtWTGim/J78pT3lsaz
	j0KgTabvSReJfWL3t+V5Xol/aIW+pi+0oEcWerYgGYdafM8CkuVs08qPqrPwSZxRrIXm
	vxf1JABuWXOyfTW3ZPYJK7RdTpf+6unCr8iL5X14gjF7Mq65pzOUAzG5FbgafBVlGQhW
	ev0A==
X-Gm-Message-State: APt69E3uVvf02l2Y/auVAGW1DITZpApgavP/bS+kMrH7MHCu4LwHCvHO
	nO11Xznu2L8YyRTkmaRkZsZDRY4SZXyihlrHUSWJNg==
X-Google-Smtp-Source: ADUXVKJTwzqa5bfj3ZRfDia7wTvzAfD2ZvPxQdniYjskdTlnYuYl4mL/aCPk4ZXAmkWmPtgdS7TfwC98SBEKPc9WjkU=
X-Received: by 2002:a2e:9744:: with SMTP id f4-v6mr2475328ljj.5.1528300368600; 
	Wed, 06 Jun 2018 08:52:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:20e2:0:0:0:0:0 with HTTP;
	Wed, 6 Jun 2018 08:52:18 -0700 (PDT)
In-Reply-To: <20180606152128.449-6-f4bug@amsat.org>
References: <20180606152128.449-1-f4bug@amsat.org>
	<20180606152128.449-6-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Jun 2018 08:52:18 -0700
Message-ID: <CAKmqyKMcru62C=vUamPyR+CayG-aN3kW9RW7+RCYFY2kt5_T2w@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Alistair Francis <alistair@alistair23.me>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 05/11] hw/core/register: Add
 trailing '\n' to qemu_log() call
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
X-List-Received-Date: Wed, 06 Jun 2018 15:52:51 -0000

On Wed, Jun 6, 2018 at 8:21 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/core/register.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/core/register.c b/hw/core/register.c
> index 0741a1af32..d2d1636250 100644
> --- a/hw/core/register.c
> +++ b/hw/core/register.c
> @@ -96,7 +96,7 @@ void register_write(RegisterInfo *reg, uint64_t val, ui=
nt64_t we,
>      if (test) {
>          qemu_log_mask(LOG_UNIMP,
>                        "%s:%s writing %#" PRIx64 " to unimplemented bits:=
" \
> -                      " %#" PRIx64 "",
> +                      " %#" PRIx64 "\n",
>                        prefix, reg->access->name, val, ac->unimp);
>      }
>
> --
> 2.17.1
>
>

