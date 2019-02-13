Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtscj-0004SZ-Is
	for mharc-qemu-trivial@gnu.org; Wed, 13 Feb 2019 06:22:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtsch-0004ST-AR
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 06:22:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtscd-0005Ba-0n
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 06:22:38 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40351)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gtscX-00055t-TZ
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 06:22:31 -0500
Received: by mail-wr1-f68.google.com with SMTP id q1so2034981wrp.7
	for <qemu-trivial@nongnu.org>; Wed, 13 Feb 2019 03:22:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4Gn4jcBb7nr9tKRwaIYKT6OVxHFbH22OgWwsrWsxCgY=;
	b=b0LUignsduiKgIROdqyNjEUIcdglkAZvoo4NrYr5hUMgi9HXgVGYgGETlcf9TcycMd
	gvGvhnyjLT2RKfFWIgJ8W1tWrWIJYPpWs8T5Wpoleqw3gmU75M0O029IV3LRhSBF7rmc
	3CGKhNnC0S8OLZZGmiFFovGN0/2wJ+3+DQEFhGWkk3rfBHnyvXSIn71nyyLtv0wILjG2
	1EXendmhIYRmKxK2dkHsGxU0w4FNg5zEOqc7Wveg0s7iFUQogg64mRT7UOwKJvH7RY4C
	os6KG/DYnsTYGMorgsGy7UgNkIsEd1vByU4QeKg6C0KLpktw5rikpluXz4yVYUXk3Ttw
	SRxg==
X-Gm-Message-State: AHQUAuYPk5nI7p/R+mgM9t2Yw5TfW0jDqy+brQnRsUb/vauI/CsJsuXe
	NdMRMnmztN2j32TrAQrSa+8f9kN2ifw=
X-Google-Smtp-Source: AHgI3IYgHIEkpB4EdA8w1c2ANcWa/NC3RCAzH8RzT/lEpKnprx/UbtSxF/iyCvqnaj7p6KK/B5L0Mg==
X-Received: by 2002:adf:fb0d:: with SMTP id c13mr7260738wrr.285.1550056944998; 
	Wed, 13 Feb 2019 03:22:24 -0800 (PST)
Received: from [10.32.224.152] (red-hat-inc.vlan560.asr1.mad1.gblx.net.
	[159.63.51.90]) by smtp.gmail.com with ESMTPSA id
	r70sm2570167wme.46.2019.02.13.03.22.23
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 03:22:24 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>, pbonzini@redhat.com,
	yang.zhong@intel.com, qemu-trivial@nongnu.org
References: <1550041639-10232-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <baa367e4-459c-98cd-6a50-2a656a52ff54@redhat.com>
Date: Wed, 13 Feb 2019 12:22:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1550041639-10232-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-trivial] [PATCH] hw/sparc64: Explicitly set
 default_display = "std"
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
X-List-Received-Date: Wed, 13 Feb 2019 11:22:40 -0000

On 2/13/19 8:07 AM, Thomas Huth wrote:
> The sun4uv_init() function expects vga_interface_type to be either
> VGA_STD or VGA_NONE and sets up a stdvga device or no vga card
> accordingly.
> However, the code in vl.c prefers the Cirrus VGA card to stdvga if
> it is available and the user and the machine did not specify anything
> else.
> So far this has not been a problem, since the Cirrus VGA was not linked
> into the sparc64 target. But with the upcoming Kconfig build system,
> all theoretically possible PCI cards will be enabled by default, so the
> Cirrus VGA card might become available on the sparc64 target, too. vl.c
> then picks the wrong card, causing sun4uv_init() to abort.
> Thus let's make it explicit that we always want stdvga for sparc64 and
> so set default_display = "std" for these machines.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/sparc64/sun4u.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> index ff24d9b..399f2d7 100644
> --- a/hw/sparc64/sun4u.c
> +++ b/hw/sparc64/sun4u.c
> @@ -797,6 +797,7 @@ static void sun4u_class_init(ObjectClass *oc, void *data)
>      mc->default_boot_order = "c";
>      mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-UltraSparc-IIi");
>      mc->ignore_boot_device_suffixes = true;
> +    mc->default_display = "std";
>      fwc->get_dev_path = sun4u_fw_dev_path;
>  }
>  
> @@ -820,6 +821,7 @@ static void sun4v_class_init(ObjectClass *oc, void *data)
>      mc->max_cpus = 1; /* XXX for now */
>      mc->default_boot_order = "c";
>      mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Sun-UltraSparc-T1");
> +    mc->default_display = "std";
>  }
>  
>  static const TypeInfo sun4v_type = {
> 

