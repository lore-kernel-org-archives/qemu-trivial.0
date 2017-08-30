Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dn4Mj-0001PT-Or
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 10:53:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dn4Mi-0001PN-Ht
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 10:53:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dn4Me-000220-Dm
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 10:53:12 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:38610)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dn4Me-00021r-89; Wed, 30 Aug 2017 10:53:08 -0400
Received: by mail-qk0-x243.google.com with SMTP id o63so5442690qkb.5;
	Wed, 30 Aug 2017 07:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=YcBFut5fEB8mwXC5BcZgQOEcPUQ3ADwBAoKSu5458yo=;
	b=Sz3n7V+JEylvUWIHQRCNazcRgp5HZY2Iwl+lRE1NARDcKNG7TJqj1rAnQjDbq/2xH5
	wNen+a12djrBVXaSb6P5cV3yfCsv1CWoTwlTZza6MR7FRXSQG0tW3T1f0ylcz4SMemht
	xBbTBYSZtIO+RlUtbO3uEdL+yBvYw53A7b7LmXBsPcoaO74RtXR+Ur4WHzNFNNaBBm5s
	CLJOiRRKwTOhn8IQewaE410zABiTbZ7cCumeuUsnuwn3sUslpdCsZ5UDz3BMsRDOeDPI
	ygKVmZIlNSmFiUdhlNRLPcLLGi8CkbTReNHceIh3vx3BhKtcboHSqEDLSsf9Pdv9hz91
	j7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YcBFut5fEB8mwXC5BcZgQOEcPUQ3ADwBAoKSu5458yo=;
	b=ZBOnqLD2pnII5y/ohGCKlOtDPlMqkYmpHdSFnmGnj75h26YTMNaCvt8vL5xo44PQ2G
	GDal0BoFdOtBGMFcnvK2dNWjgz24LecsVdUDzB7N6IQlgx5JcxAoJaXRe5WQqs+v/qUQ
	+FaRuYffnIHnRr/qD+EZVHyWcU3u0E3SVrjy+VOTAxJBlSISZKi+NTEmh9C407P9P6uL
	WUQh+vBOQTRqhLNG0gMK9M5c1hEZr58OTKHcIHbPPNWlJcQD1Sv1DK6Ipl90q0hA6HE7
	qjte3/bHSLV8V/IJSNOD/8d+tvEIh9A1QZfPr31z8pdJQXbKpKKn1hXvPz7ucxKWRVxM
	V+vw==
X-Gm-Message-State: AHYfb5hAa4A5UpUeobn0wvuMX3x0amNh9VcHGbVC+uqf/HPhK+3w9YwS
	TZfAn++bPN4s1hPKueGV8Bhh
X-Received: by 10.55.93.67 with SMTP id r64mr10350078qkb.358.1504104787586;
	Wed, 30 Aug 2017 07:53:07 -0700 (PDT)
Received: from [192.168.43.33] ([170.51.34.109])
	by smtp.gmail.com with ESMTPSA id
	j61sm3693824qte.30.2017.08.30.07.53.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 07:53:07 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <1504100343-26607-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b98a4c56-f386-f827-5aa7-9a00e6fdf790@amsat.org>
Date: Wed, 30 Aug 2017 11:53:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1504100343-26607-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-trivial] [PATCH for-2.11] hw/misc/ivshmem: Fix
 ivshmem_recv_msg() to also work on big endian systems
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
X-List-Received-Date: Wed, 30 Aug 2017 14:53:13 -0000

On 08/30/2017 10:39 AM, Thomas Huth wrote:
> The "slow" ivshmem-tests currently fail when they are running on a
> big endian host:
> 
> $ uname -m
> ppc64
> $ V=1 QTEST_QEMU_BINARY=x86_64-softmmu/qemu-system-x86_64 tests/ivshmem-test -m slow
> /x86_64/ivshmem/single: OK
> /x86_64/ivshmem/hotplug: OK
> /x86_64/ivshmem/memdev: OK
> /x86_64/ivshmem/pair: OK
> /x86_64/ivshmem/server-msi: qemu-system-x86_64:
>   -device ivshmem-doorbell,chardev=chr0,vectors=2: server sent invalid ID message
> Broken pipe
> 
> The problem is that the server side code in ivshmem_server_send_one_msg()
> correctly translates all messages IDs into little endian 64-bit values,
> but the client side code in the ivshmem_recv_msg() function does not swap
> the byte order back. Fix it by passing the value through le64_to_cpu().

Yes, we lack BE testing :(

I read we can run docker on s390x, I wonder if we can ask for a FOSS 
account on some to run the test suite.

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   hw/misc/ivshmem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
> index 47a015f..b3ef3ec 100644
> --- a/hw/misc/ivshmem.c
> +++ b/hw/misc/ivshmem.c
> @@ -653,7 +653,7 @@ static int64_t ivshmem_recv_msg(IVShmemState *s, int *pfd, Error **errp)
>       } while (n < sizeof(msg));
>   
>       *pfd = qemu_chr_fe_get_msgfd(&s->server_chr);
> -    return msg;
> +    return le64_to_cpu(msg);
>   }
>   
>   static void ivshmem_recv_setup(IVShmemState *s, Error **errp)
> 

