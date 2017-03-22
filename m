Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cqjBw-0004bc-RJ
	for mharc-qemu-trivial@gnu.org; Wed, 22 Mar 2017 12:32:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cqjBv-0004Zx-0C
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 12:32:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cqjBo-000773-Vx
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 12:32:55 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:34799)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cqjBo-00076x-S4; Wed, 22 Mar 2017 12:32:48 -0400
Received: by mail-qk0-x244.google.com with SMTP id v127so26756507qkb.1;
	Wed, 22 Mar 2017 09:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=xfKu3++bA6FnUORhI96f99hTiN8zRZJ65kYcjGMMzyI=;
	b=JIejy1RlqvTAhyyGhxbjP/MALTwoI4JQ46uYJgxi9jM1nG9Zfs+EyU6e81ypiP32ye
	L1aZzcdQI04AcI95GBS9TzXqhcogUA3egecRqsT9iNIJm4XdXjjRbf1g8ybHTs6m9ASa
	31wfUrGNmyyRM5jfWMCWIx5o56wDg2lBzOK9Vjmq5x2FuvzlVbrDdPzkX2/BzapDZs6B
	DJhpZFMzjOhwWd/YhHTaDazCVfA8zyLNR7dI1rO15/Y0mVLSWXYuWAsgr6BzcCPjtdOq
	z8IXlNruipdxn/9vxOIIkqX0AcyyYoBSUNmbn+f1HtLUHtVvG17gyKsVrY9+8cOYk788
	cdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=xfKu3++bA6FnUORhI96f99hTiN8zRZJ65kYcjGMMzyI=;
	b=dLlVRpps8k5+KGWsmmWSwEi4cRjwu+HlXC71BjZJLrEOQdigl3TkkDaF7jtSzTOa3+
	R7eWeGPOp2Cxy2Lg7sZGliJPs4aH6lID0vMyIUnCyB4V01W/5t9jUPsvJYhUfgNX+h+a
	3jkhJdy06pexB9rLmjxwzqdbj17BppufzTMYP5AxPLt1hTORjt2uKE4VZgpbbjuoT9HJ
	F9KDmMr9K3mYC0+mH19+J58SvnSGR1I2qpgBSleIJcTxyCAFb/psXfv6/ldNbxOLichm
	iXhbvLecPqXWmU5dw0aI4Ptg+R8uOCuPUVruWVCla6bC8jt5g0ck3z+pfeTwXGXHji9/
	QvaA==
X-Gm-Message-State: AFeK/H0iXRQOCdg2ZoHROKuk1Kmtz9C/ZOEIGWSUXuMi/std0q83zVBAwH7wA3n2UnJUDg==
X-Received: by 10.55.18.91 with SMTP id c88mr3953111qkh.253.1490200368319;
	Wed, 22 Mar 2017 09:32:48 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	k62sm1310341qkd.21.2017.03.22.09.32.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Mar 2017 09:32:47 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20170322115241.2810-1-marcandre.lureau@redhat.com>
Cc: qemu-trivial@nongnu.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b8187938-4ab6-6915-d59b-5ca545502860@amsat.org>
Date: Wed, 22 Mar 2017 13:32:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170322115241.2810-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] doc: fix function spelling
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
X-List-Received-Date: Wed, 22 Mar 2017 16:32:56 -0000

On 03/22/2017 08:52 AM, Marc-André Lureau wrote:
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/io/channel.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/io/channel.h b/include/io/channel.h
> index 5d48906998..db9bb022a1 100644
> --- a/include/io/channel.h
> +++ b/include/io/channel.h
> @@ -315,7 +315,7 @@ ssize_t qio_channel_read(QIOChannel *ioc,
>                           Error **errp);
>
>  /**
> - * qio_channel_writev:
> + * qio_channel_write:
>   * @ioc: the channel object
>   * @buf: the memory regions to send data from
>   * @buflen: the length of @buf
>

