Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gonqc-0002jD-Oy
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 06:16:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gonqa-0002ho-Pw
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 06:16:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gonqa-0004sw-1a
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 06:16:00 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55807)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gonqZ-0004sV-Qb
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 06:15:59 -0500
Received: by mail-wm1-f68.google.com with SMTP id y139so21021102wmc.5
	for <qemu-trivial@nongnu.org>; Wed, 30 Jan 2019 03:15:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=stThTJA0u2eV38ylV0YiCVUcVZKSzKzcxOxvxqR9BNY=;
	b=qruWYnP/spQuGHHWanTORA49rvQ4yVt4VoXVQwBjJrxX3ubakeGSkkrCI8Gc2AsVYb
	vdP+eKtoOLB4K5dvn/z5Q7HY6BH5YPYOYoHwDNHaytUKKJKLN3dXuE4YoIIttNom/iC7
	doSP284IJH+U4+j7SbO7BRiy7qH9ExP/jdo7NYt2afgn7CjpKFQZQEgtSxqAev+cM1dP
	dL/ydHMxjQGGHVEz3SI2FccPwS+p9rvtdSYb14+D3XK1YJGLtqNahZKjAsVchFGLNhLU
	U72c1dzmQkaTMgPGC2tIkVrmu96jp4zsCDYFWiMnpBW/gLU10NnWsJY5D9lmFaBRRBn0
	+W/g==
X-Gm-Message-State: AJcUukcj5+eiIXYUKfIJjsOyjpHySNy72y7ZEudRlOz1voWFzcFb2wIl
	rVxAh9ZQ38fE0pPomlRipCTg4w==
X-Google-Smtp-Source: ALg8bN4MpyoQ/kNkWzeybsPJU/y/fKjQDGuPktaZgUmmcNE3CgMLyM27vgfq8C4ElsyykG0yjgvYAw==
X-Received: by 2002:a1c:b456:: with SMTP id d83mr25951940wmf.115.1548846958722;
	Wed, 30 Jan 2019 03:15:58 -0800 (PST)
Received: from [10.32.224.134] (red-hat-inc.vlan560.asr1.mad1.gblx.net.
	[159.63.51.90])
	by smtp.gmail.com with ESMTPSA id w16sm1179608wrp.1.2019.01.30.03.15.57
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 03:15:58 -0800 (PST)
To: Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: imammedo@redhat.com, mst@redhat.com
References: <20190130030207.6770-1-richardw.yang@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <3e847da2-8ced-fefd-b566-30093d9fe331@redhat.com>
Date: Wed, 30 Jan 2019 12:15:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190130030207.6770-1-richardw.yang@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] i386,
 acpi: cleanup build_facs by removing second unused argument
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
X-List-Received-Date: Wed, 30 Jan 2019 11:16:01 -0000

On 1/30/19 4:02 AM, Wei Yang wrote:
> The second argument of build_facs() is not used, just remove it.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/i386/acpi-build.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 236a20eaa8..023729c1f2 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -292,7 +292,7 @@ static void acpi_align_size(GArray *blob, unsigned align)
>  
>  /* FACS */
>  static void
> -build_facs(GArray *table_data, BIOSLinker *linker)
> +build_facs(GArray *table_data)
>  {
>      AcpiFacsDescriptorRev1 *facs = acpi_data_push(table_data, sizeof *facs);
>      memcpy(&facs->signature, "FACS", 4);
> @@ -2643,7 +2643,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>       * requirements.
>       */
>      facs = tables_blob->len;
> -    build_facs(tables_blob, tables->linker);
> +    build_facs(tables_blob);
>  
>      /* DSDT is pointed to by FADT */
>      dsdt = tables_blob->len;
> 

