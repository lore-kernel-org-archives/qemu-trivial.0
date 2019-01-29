Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goOmk-0007eF-13
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jan 2019 03:30:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1goOmh-0007dl-SF
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 03:30:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1goOmg-0006Yd-7x
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 03:30:19 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54505)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1goOmg-0006Y1-1c
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 03:30:18 -0500
Received: by mail-wm1-f65.google.com with SMTP id a62so16784577wmh.4
	for <qemu-trivial@nongnu.org>; Tue, 29 Jan 2019 00:30:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ldthWg0OPuf2RRF6686tHM3ja8RAbsukXxTMe1FINaE=;
	b=iehGS1gDfGoTQPM615qFGTQYc9hSN4QG6v96NqZCzoYR0ujL0n8tsyfO5X/gI5wnCw
	dewRWjXcIfhlrR3D7twxhbC+CqsLQLyFKb88AVURdg3X7vrQiKpXHKuKLzXoJiliwFV8
	x3pfyTXDmohSrph4FZYmgBxSojldGPXfDEiFqUhiFl1B16IV438HzkuCWJNZCnIsk7ii
	ylAiubDVVAxii9R0kIrg8XsQyvq+VYgSrfPsS6Y/q8tno35mqpyG1RyL/HQQP66pzf7i
	azpg9XpF1ru8RzXAJ/oSKYKu2/sVolMW2GV/VtqMaACJtxLi/pjTn7g+0rrGiidlAD10
	a3UQ==
X-Gm-Message-State: AJcUukdR169fdCtsn8kMm05NV8bACQ1kxtDEElnBO67KGQ8J3i92wAzM
	3SauT0XatekCD2MromJtOoE1vA==
X-Google-Smtp-Source: ALg8bN7RorR7TwJmDWYjyFjKxznn2TTfzN4DS1eMgPd+yakBmVfWwSuiuW/tXv/BeIocbXC1FA2DZA==
X-Received: by 2002:a1c:99ce:: with SMTP id b197mr20808879wme.75.1548750617153;
	Tue, 29 Jan 2019 00:30:17 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	n5sm116142964wrr.94.2019.01.29.00.30.16
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 00:30:16 -0800 (PST)
To: Wei Yang <richardw.yang@linux.intel.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: imammedo@redhat.com, laurent@vivier.eu, mst@redhat.com
References: <20190125060157.29935-1-richardw.yang@linux.intel.com>
	<20190129000820.31190-1-richardw.yang@linux.intel.com>
	<20190129000820.31190-4-richardw.yang@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <6226a33c-a72a-d7da-45ab-fadb5157e023@redhat.com>
Date: Tue, 29 Jan 2019 09:30:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190129000820.31190-4-richardw.yang@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 3/3] hw/acpi: remove
 unnecessary variable acpi_table_builtin
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
X-List-Received-Date: Tue, 29 Jan 2019 08:30:20 -0000

On 1/29/19 1:08 AM, Wei Yang wrote:
> acpi_table_builtin is now always false, it is not necessary to check it
> again.
> 
> This patch just removes it.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/acpi/core.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index e9b1a85e54..f9c96535d1 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -303,8 +303,6 @@ out:
>      error_propagate(errp, err);
>  }
>  
> -static bool acpi_table_builtin = false;
> -
>  unsigned acpi_table_len(void *current)
>  {
>      struct acpi_table_header *hdr = current - sizeof(hdr->_length);
> @@ -320,7 +318,7 @@ void *acpi_table_hdr(void *h)
>  
>  uint8_t *acpi_table_first(void)
>  {
> -    if (acpi_table_builtin || !acpi_tables) {
> +    if (!acpi_tables) {
>          return NULL;
>      }
>      return acpi_table_hdr(acpi_tables + ACPI_TABLE_PFX_SIZE);
> 

