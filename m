Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIFqh-0005Bs-7M
	for mharc-qemu-trivial@gnu.org; Mon, 14 May 2018 11:57:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fIFqe-00059E-GV
	for qemu-trivial@nongnu.org; Mon, 14 May 2018 11:57:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fIFqd-0006hE-MW
	for qemu-trivial@nongnu.org; Mon, 14 May 2018 11:57:16 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:42325)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fIFqd-0006h2-Hn
	for qemu-trivial@nongnu.org; Mon, 14 May 2018 11:57:15 -0400
Received: by mail-oi0-x243.google.com with SMTP id t27-v6so11139772oij.9
	for <qemu-trivial@nongnu.org>; Mon, 14 May 2018 08:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bvdiIjB3tgsGBL4XQ8Rr/emGnBKnxfsCGESGEmDq1zw=;
	b=d35n6Gf5YP6/4losh1jhc6tjl0YGvog1Rnq8RJMysRjxSD039HZZr3Eang33JZD0Ee
	3iAtNs5Ia5ybHq0vl+DriWm/2QLzb1b/4Yz2tX/YPIX75DPpvw1i1L6msLfSGqawoKCq
	Ry2ZU4UJpe6FT1K7cElvBJEwCK6tpWCLf1QQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bvdiIjB3tgsGBL4XQ8Rr/emGnBKnxfsCGESGEmDq1zw=;
	b=WIPV1PydKMpT910NZTTUeJXk9zrkehMldzYoqaQNlTvTB4LJUtlm62W1JS0FFmLClp
	BiylMANqbA69hV4jWcLGzieJ6ArCohGnKKcI5pXnGPyd5URgG0MQOrtfEf5zzesDxjTh
	PUmEPJDGklfjrRVLhPMoMYhvdBf/nDBLdC3l20r3FstLS2LCLVxHdCyE3f8e9ewT1kdx
	41ui31cZNgv2g+wz9ojHyDx5T4yMb75d/P5HOuHgpZGspbAuP5Z5bC7gs8QEPpdKSJ1I
	GGST5AMS4jGmx9fp1dtylJy7ejT6/5i6+VVJocKQ359jSo4i1HCPCs8deflAsr4oXXoj
	8dqQ==
X-Gm-Message-State: ALKqPwfxD6dv5tYqXaWi5HKiJ52LeH/VN8Rf7MK6XsHzzOIwbzxebDLa
	eEJXggCTh9dobK8CdKJ8o4h1qL+zPcYPADOOkvjzjg==
X-Google-Smtp-Source: AB8JxZpqywW4Wb3J9mq+FKvHj73m9pZxSGhStqGnEOpZwFzG/klFmUPgtCBchyVa8nxpHnDAe/02ZXATZWVYgzkUDNA=
X-Received: by 2002:aca:538b:: with SMTP id
	h133-v6mr7176300oib.252.1526313434786; 
	Mon, 14 May 2018 08:57:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Mon, 14 May 2018 08:56:54
	-0700 (PDT)
In-Reply-To: <CACKT+Ap2MHCrSCT-0_=KG9UrGAtO7F3EGue6-63-XJxry9=C=w@mail.gmail.com>
References: <CACKT+Ap2MHCrSCT-0_=KG9UrGAtO7F3EGue6-63-XJxry9=C=w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 May 2018 16:56:54 +0100
Message-ID: <CAFEAcA-nnU2E6CKPiGqoAq1sSYtvf4Hxp3MtYiCvigr4i8-+Ow@mail.gmail.com>
To: Jonathan Marler <johnnymarler@gmail.com>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alexander Graf <agraf@suse.de>, QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] handle all
 fdt_get_phandle_errors
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
X-List-Received-Date: Mon, 14 May 2018 15:57:17 -0000

On 4 May 2018 at 19:37, Jonathan Marler <johnnymarler@gmail.com> wrote:
> Signed-off-by: Jonathan Marler <johnnymarler@gmail.com>

Hi; thanks for this patch.

> ---
>  device_tree.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/device_tree.c b/device_tree.c
> index 52c3358..2b75905 100644
> --- a/device_tree.c
> +++ b/device_tree.c
> @@ -379,8 +379,12 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const char
> *path)
>
>      r = fdt_get_phandle(fdt, findnode_nofail(fdt, path));
>      if (r == 0) {
> -        error_report("%s: Couldn't get phandle for %s: %s", __func__,
> -                     path, fdt_strerror(r));
> +        error_report("%s: Node %s does not have a 'phandle'", __func__,
> +                     path);
> +        exit(1);
> +    }
> +    if (r == -1) {
> +        error_report("%s: Couldn't get phandle for %s", __func__, path);
>          exit(1);
>      }

Could you explain in what situation this is needed? The documentation
for fdt_get_phandle() says
 * returns:
 *      the phandle of the node at nodeoffset, on success (!= 0, != -1)
 *      0, if the node has no phandle, or another error occurs

which I interpret to mean that it is not possible for it to return -1.

thanks
-- PMM

