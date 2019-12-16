Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1igsT1-0003Ie-3P
	for mharc-qemu-trivial@gnu.org; Mon, 16 Dec 2019 10:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33436)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1igsSy-0003G6-Fy
 for qemu-trivial@nongnu.org; Mon, 16 Dec 2019 10:39:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1igsSx-0008Pu-GB
 for qemu-trivial@nongnu.org; Mon, 16 Dec 2019 10:39:24 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35141
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1igsSx-0008Ob-Ch
 for qemu-trivial@nongnu.org; Mon, 16 Dec 2019 10:39:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576510762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=buaMern/o9m9Y6G2SnlGPsf9M46QtSDj1V27n8M0xcc=;
 b=eiCUOWOWi5NEmrSbtlgJYa0oDJEn0tkoqGIFTBIFBF/XGQesUp4n+bdCDMP91kOQzvrXG7
 n1a5sJjHHA1FmGxjhygbGTQU+vnuFJ7JWF66FHJAQAMUlklpKwuJL9BBLF4aEnH8k8tP8r
 z5hds1jpDJR3eXFnKFp6KSfBCtVeUVo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-NlcVUgLBPOm8F5Ah76rWVQ-1; Mon, 16 Dec 2019 10:39:21 -0500
Received: by mail-wm1-f70.google.com with SMTP id w205so792121wmb.5
 for <qemu-trivial@nongnu.org>; Mon, 16 Dec 2019 07:39:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5hjbl7EKfl/UqTJ4jD9VwiBtzVvJh5drPvDVTAE8GKU=;
 b=e3iCYfBsKUdcSppiJyL5i8aiRveO4p9RpCDAHpOBygVkj4J2L5YkmIzKfrNT+4z4YQ
 N1wKAKYtaxPE8yhoeWst/tiqKu0FmbyLNzyA+0yhSaBa1ukHVyF0ZcOxbWN/Gu3Rw8aJ
 E8W9HJWoqVROdAmdGwC9W08RRm3onLIIlxpe4yBkaCRwxsnBqb2LCBfbkJjxCOzMLrlB
 vaGto8o7p6NZij1FsbSh9hyl0rowF3BeVgqYL5Hz9geDmyfnhTKwmT7ivgNSRBiwJ1o1
 LzjQ/be3LF1AzNqGrdUVPXnwKn3emPfC8nyT6n2usIEgsxwcuDlHg32a/AxQBQvmrG1o
 ZrEA==
X-Gm-Message-State: APjAAAV5iCQPVEO7G5I4mslBohvbkQLgU/tHZFSFlDWPx/tMZczFQBFC
 WB9TxCz/kpGC9Yjs+YqRtFMHpa13sPRN3LNSZVRby7PJ5X5i+9BPBuCnKB4nFVBa6xSX3ZjaGcw
 QFs+iYfchKOY+ViTR0A==
X-Received: by 2002:a1c:2089:: with SMTP id g131mr14704724wmg.63.1576510759882; 
 Mon, 16 Dec 2019 07:39:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqy0X7BZnLS0uyapIjvdin3N9St/Wgd5FbTEOaJGtsBZn5DkK0WodgMf2wNNwZp29Vo6XXyV4A==
X-Received: by 2002:a1c:2089:: with SMTP id g131mr14704712wmg.63.1576510759718; 
 Mon, 16 Dec 2019 07:39:19 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id q6sm23238017wrx.72.2019.12.16.07.39.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 07:39:19 -0800 (PST)
Subject: Re: [PATCH] qemu-doc: Remove the unused "Guest Agent" node
To: Thomas Huth <thuth@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>, 
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20191216132941.25729-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4578bf73-ffc8-9173-1aff-2508f85edde7@redhat.com>
Date: Mon, 16 Dec 2019 16:39:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191216132941.25729-1-thuth@redhat.com>
Content-Language: en-US
X-MC-Unique: NlcVUgLBPOm8F5Ah76rWVQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Dec 2019 15:39:25 -0000

On 12/16/19 2:29 PM, Thomas Huth wrote:
> The node has been removed from the texi file some months ago, so we
> should remove it from the menu section, too.
>=20
> Fixes: 27a296fce982 ("qemu-ga: Convert invocation documentation to rST")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   qemu-doc.texi | 1 -
>   1 file changed, 1 deletion(-)
>=20
> diff --git a/qemu-doc.texi b/qemu-doc.texi
> index 3ddf5c0a68..4b62b23264 100644
> --- a/qemu-doc.texi
> +++ b/qemu-doc.texi
> @@ -38,7 +38,6 @@
>   * Introduction::
>   * QEMU PC System emulator::
>   * QEMU System emulator for non PC targets::
> -* QEMU Guest Agent::
>   * QEMU User space emulator::
>   * System requirements::
>   * Security::
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


