Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXkxb-0004gQ-3t
	for mharc-qemu-trivial@gnu.org; Fri, 14 Dec 2018 05:44:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gXkxZ-0004f7-Hx
	for qemu-trivial@nongnu.org; Fri, 14 Dec 2018 05:44:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gXkxU-0002B6-My
	for qemu-trivial@nongnu.org; Fri, 14 Dec 2018 05:44:45 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38046)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gXkxU-0002A6-H9
	for qemu-trivial@nongnu.org; Fri, 14 Dec 2018 05:44:40 -0500
Received: by mail-wm1-f66.google.com with SMTP id m22so5323264wml.3
	for <qemu-trivial@nongnu.org>; Fri, 14 Dec 2018 02:44:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tyVO/w8niLCXE/mPABpVMpKd0EIuRTtqxC1tFdOX5kk=;
	b=rxti55Ffa6renTn9cMYCV8zTu4VyuqC6iuKhF7XPw24/P+MFENjgPIQf+RCB8Ofwrd
	aeZWp87P3rDKJTtwqbf6bQTBamNXFppdEYWwO1vLP3EBAvsGyh2JSCu/PnWuYnWoHslJ
	OQn2aVnn+bMGbp63/7HpFEY6rgc2BuhQJbhzJVZtv5BkZDLHwaAQYWdgLHGtL5zjCpw8
	uBCgwx/HUwjHnPgAgdHjaoMvU8dvtJSVlTbhWFxx86AxngZQOQek3ayaqD/c6G77uvA8
	PJ27FvsLRPUUHQnSRGw7XzH+vNfyDbRsxpLUgtzr4Ksg4IrY/N/1zypwVtDDGw8EwEt9
	zMcQ==
X-Gm-Message-State: AA+aEWbfKj4ilqEnjr9uT5nnzNOYGqrxVPQ0BYyuTGtbUD3OcZtJ69/d
	L507qQIMPVaQw1DpmU48fFBNo5Y5QEE=
X-Google-Smtp-Source: AFSGD/WGTDLPznee9RILfm8/ns9I+N1JHGbJXZSlRm/whqnjHLAlq9DTr4US2Kk3xDMaizf+zxDzLA==
X-Received: by 2002:a1c:e488:: with SMTP id b130mr2844218wmh.124.1544784279229;
	Fri, 14 Dec 2018 02:44:39 -0800 (PST)
Received: from [192.168.1.34] (172.red-88-21-202.staticip.rima-tde.net.
	[88.21.202.172]) by smtp.gmail.com with ESMTPSA id
	b13sm2958668wrn.28.2018.12.14.02.44.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Dec 2018 02:44:38 -0800 (PST)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20181213173113.11211-1-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <8d75d922-5ee8-c313-53ba-308abe971e88@redhat.com>
Date: Fri, 14 Dec 2018 11:44:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181213173113.11211-1-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] error: Remove NULL checks
 on error_propagate() calls
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
X-List-Received-Date: Fri, 14 Dec 2018 10:44:46 -0000

On 12/13/18 6:31 PM, Markus Armbruster wrote:
> Patch created mechanically by rerunning:
> 
>   $  spatch --sp-file scripts/coccinelle/error_propagate_null.cocci \
>             --macro-file scripts/cocci-macro-file.h \
>             --dir . --in-place
> 
> Whitespace tidied up manually.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  blockdev.c              | 4 +---
>  hw/s390x/s390-pci-bus.c | 4 +---
>  qga/commands-posix.c    | 7 ++-----
>  3 files changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/blockdev.c b/blockdev.c
> index 81f95d920b..5f2cbe352d 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -992,9 +992,7 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type,
>      blk = blockdev_init(filename, bs_opts, &local_err);
>      bs_opts = NULL;
>      if (!blk) {
> -        if (local_err) {
> -            error_propagate(errp, local_err);
> -        }
> +        error_propagate(errp, local_err);
>          goto fail;
>      } else {
>          assert(!local_err);
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 060ff062bc..98c9d6206a 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -731,9 +731,7 @@ static void s390_pcihost_realize(DeviceState *dev, Error **errp)
>  
>      css_register_io_adapters(CSS_IO_ADAPTER_PCI, true, false,
>                               S390_ADAPTER_SUPPRESSIBLE, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -    }
> +    error_propagate(errp, local_err);
>  }
>  
>  static int s390_pci_msix_init(S390PCIBusDevice *pbdev)
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 1877976522..2e719d9b6b 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -1573,10 +1573,7 @@ static bool systemd_supports_mode(SuspendMode mode, Error **errp)
>          return true;
>      }
>  
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -    }
> -
> +    error_propagate(errp, local_err);
>      return false;
>  }
>  
> @@ -1782,7 +1779,7 @@ static void guest_suspend(SuspendMode mode, Error **errp)
>      if (!mode_supported) {
>          error_setg(errp,
>                     "the requested suspend mode is not supported by the guest");
> -    } else if (local_err) {
> +    } else {
>          error_propagate(errp, local_err);
>      }
>  }
> 

