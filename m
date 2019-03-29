Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9niu-0002ED-EE
	for mharc-qemu-trivial@gnu.org; Fri, 29 Mar 2019 05:22:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1h9nir-0002DS-Lv
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 05:22:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1h9nip-0003hY-Rv
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 05:22:49 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:41986)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1h9nip-0003f6-EH
	for qemu-trivial@nongnu.org; Fri, 29 Mar 2019 05:22:47 -0400
Received: by mail-wr1-x441.google.com with SMTP id g3so1650555wrx.9
	for <qemu-trivial@nongnu.org>; Fri, 29 Mar 2019 02:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=F13ithmFYkyyQNO4MMkitcFJ7KY572Fb/XkvRlbKCiw=;
	b=OSD3k+nRYJ81FUw134HMXqpVhgxoAWxTvXDZTXeJgmKOk120b2OjxV3sNKWS4ZJrhY
	SC0m76vjXDehb3UmXdi3M0PInabOP1GFZRu5WUKQfPVX4aJFBvJHg6igsFTF2e4o7tW3
	9InRQAih+AbxoCfDdx0qxkZ/S3v2Db/XR32rSU7NWYM4pereGfMrDbOULJTMebvs7ArA
	gKQ0zfe2pJMbKbYGvCr+4oRqfwJq+VOVp0FM3Yyehuh6fCrZe7iu31Zdj2EEenB/FENV
	4bzxDJ2gFI/DHkjSFvHnpvpoSAm9/ssFxoQ/NZwfuKGscJegDv0Cqss7oMmTCL08IZEv
	nirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=F13ithmFYkyyQNO4MMkitcFJ7KY572Fb/XkvRlbKCiw=;
	b=J4OB1pI1XwpuO0oL2T3vMfwclDlN0PEfPme0lpdSWnetGYGXhcdTUoF4JKGNjVIFdV
	cP7KKq4onR5JEe1gDuuRCIG7sY7xXFjWXdhjMHs7SXcuUos/1dfyGjxOacaNP0U9scUr
	nlgS6XhLlDKk9Vwg7KaZPR9oUwuZwrROQ8mjFfdQgfTs8uoceZXEhve6MFMLL0bLWR8a
	c/uOYGdD4gOeuilmF5w3HJccHvyS6GmjH9NDyjDvXoJUqL19MqOQowoPyJNqwCel6/w4
	/MmCev2xci+emSrSPWtgNJDU6R4FmUZ/1NMrSNDaFGnb+sfzYvkBsF5LIoVAzwIes79d
	uFTw==
X-Gm-Message-State: APjAAAUUQVo8JR3BLfOvDeTc57dJ86bFtno1yekpzrAuZaNMmovB6myQ
	hi9y6BdtLSi8SSLxSAe4pa5Kxg==
X-Google-Smtp-Source: APXvYqxswE0hgaFhTYlhgtuXAtLldCHWIoMpfIbKBuI/C68fOLnBXhRDGvOHe9CVPqAF0lB1EKf2YA==
X-Received: by 2002:a5d:6682:: with SMTP id l2mr29239679wru.33.1553851363619; 
	Fri, 29 Mar 2019 02:22:43 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	c20sm2287597wre.28.2019.03.29.02.22.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 29 Mar 2019 02:22:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 53EDF1FF87;
	Fri, 29 Mar 2019 09:22:42 +0000 (UTC)
References: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
	<1553849325-44201-2-git-send-email-like.xu@linux.intel.com>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	like.xu@intel.com, Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
In-reply-to: <1553849325-44201-2-git-send-email-like.xu@linux.intel.com>
Date: Fri, 29 Mar 2019 09:22:42 +0000
Message-ID: <87imw2uja5.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/9] cpu/topology: add
 struct CpuTopology to MachineState
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
X-List-Received-Date: Fri, 29 Mar 2019 09:22:50 -0000


Like Xu <like.xu@linux.intel.com> writes:

> Signed-off-by: Like Xu <like.xu@linux.intel.com>
> ---
>  include/hw/arm/virt.h   | 2 +-
>  include/hw/boards.h     | 8 ++++++++
>  include/sysemu/sysemu.h | 2 +-
>  vl.c                    | 7 ++++++-
>  4 files changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 507517c..724da0c 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -123,7 +123,7 @@ typedef struct {
>      struct arm_boot_info bootinfo;
>      MemMapEntry *memmap;
>      const int *irqmap;
> -    int smp_cpus;
> +    unsigned int smp_cpus;

This seem unrelated to the rest of the change.

>      void *fdt;
>      int fdt_size;
<snip>
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index 6065d9e..c0d7d7c 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -100,7 +100,7 @@ extern const char *keyboard_layout;
>  extern int win2k_install_hack;
>  extern int alt_grab;
>  extern int ctrl_grab;
> -extern int smp_cpus;
> +extern unsigned int smp_cpus;

Along with this. Is this meant to align with what is currently defined
as smp_cpus in vl.c? Maybe these changes should be rolled together with
that before the patch to introduce the new topology structure?

--
Alex Benn=C3=A9e

