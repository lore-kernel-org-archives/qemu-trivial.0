Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goOjb-0006Fk-Gj
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jan 2019 03:27:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1goOjX-0006Bw-CZ
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 03:27:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1goOjW-0004lo-Os
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 03:27:03 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39356)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1goOjW-0004lQ-Jj
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 03:27:02 -0500
Received: by mail-wr1-f65.google.com with SMTP id t27so20962198wra.6
	for <qemu-trivial@nongnu.org>; Tue, 29 Jan 2019 00:27:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CMcVFJFZwXuVgeG1bg0SVZIwp2k/rHKrvF/eEyJdnuw=;
	b=QZTmYuA5jXqSfbtmba8LxyGX5P13pQyhqoGQbNmqiUYmFokIyUGAwtfsBZyzizViT9
	Fd9nrrVmKcPAfyJg3J71Bbgm52LYsjeOC0+An+GNyp/NC480jscCL8MwTda5sR35oHKR
	zQS6egiGGmOjezgxC82MHzIQKadmt4fRI9XzJvTGPtV+cxEqp3Y2ujxyESQ2zOFSW18B
	luDcjdiC4JxGgfpzjzWSsWNZsQ6Ha3nBsTtlK8A9V6NHMSNmTat4fiEfGjtRictZzzTd
	UroJ77KlL396MqejMFvLUigRh2NcubvpAkW18+wR37BYUA+CqgWMfkqmSK7+TkANBmzN
	bjtw==
X-Gm-Message-State: AJcUukfBZGWhcTwXYviUeRlJL4eYSn4/eSKJGQnUZ26Qp6f/Rs7RW+4m
	dtaiARO8ZYdIqpVy2Dh2L6Z9UA==
X-Google-Smtp-Source: ALg8bN61MInsfWk+9CqyQue9bA6EiuL3hx35mes3KFbM9k110+KTa6TCu+WjZ52cfYlOwGamthI3jw==
X-Received: by 2002:adf:e983:: with SMTP id h3mr24009527wrm.232.1548750421575; 
	Tue, 29 Jan 2019 00:27:01 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	f14sm97917777wrv.56.2019.01.29.00.27.00
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 00:27:01 -0800 (PST)
To: Wei Yang <richardw.yang@linux.intel.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: imammedo@redhat.com, laurent@vivier.eu, mst@redhat.com
References: <20190125060157.29935-1-richardw.yang@linux.intel.com>
	<20190129000820.31190-1-richardw.yang@linux.intel.com>
	<20190129000820.31190-3-richardw.yang@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <1c83e805-a049-3401-1d1f-4fe4749e78b2@redhat.com>
Date: Tue, 29 Jan 2019 09:27:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190129000820.31190-3-richardw.yang@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 2/3] hw/acpi: remove
 unused function acpi_table_add_builtin()
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
X-List-Received-Date: Tue, 29 Jan 2019 08:27:04 -0000

On 1/29/19 1:08 AM, Wei Yang wrote:
> Function acpi_table_add_builtin() is not used anymore.
> 
> Remove the definition and declaration.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/acpi/core.c         | 6 ------
>  include/hw/acpi/acpi.h | 1 -
>  2 files changed, 7 deletions(-)
> 
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index d6f0709691..e9b1a85e54 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -305,12 +305,6 @@ out:
>  
>  static bool acpi_table_builtin = false;
>  
> -void acpi_table_add_builtin(const QemuOpts *opts, Error **errp)
> -{
> -    acpi_table_builtin = true;
> -    acpi_table_add(opts, errp);
> -}
> -
>  unsigned acpi_table_len(void *current)
>  {
>      struct acpi_table_header *hdr = current - sizeof(hdr->_length);
> diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
> index c20ace0d0b..4a8bbaf1b5 100644
> --- a/include/hw/acpi/acpi.h
> +++ b/include/hw/acpi/acpi.h
> @@ -190,7 +190,6 @@ uint8_t *acpi_table_first(void);
>  uint8_t *acpi_table_next(uint8_t *current);
>  unsigned acpi_table_len(void *current);
>  void acpi_table_add(const QemuOpts *opts, Error **errp);
> -void acpi_table_add_builtin(const QemuOpts *opts, Error **errp);
>  
>  typedef struct AcpiSlicOem AcpiSlicOem;
>  struct AcpiSlicOem {
> 

