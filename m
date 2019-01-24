Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmidU-0001SS-Mn
	for mharc-qemu-trivial@gnu.org; Thu, 24 Jan 2019 12:17:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33069)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gmidS-0001Qq-9P
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 12:17:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gmidQ-0005iz-Cz
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 12:17:50 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42453)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gmidQ-0005WL-6d
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 12:17:48 -0500
Received: by mail-wr1-f67.google.com with SMTP id q18so7326818wrx.9
	for <qemu-trivial@nongnu.org>; Thu, 24 Jan 2019 09:17:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jAp631Ydamo48ZqFv8IuH0AUk6xEY4k4UyejuJln6as=;
	b=YjugNnW+AoqnKqd+9yifP8chzhPzItds3A3A/R3m4bE+LCm79A+Tc6SMEb8XvkF26r
	k1we3s92gfP0MDHanIhPNyRydLZtbR51bXiFqeBiHCb/Rt3aUU2JkD6eNKYkzTPa18Ly
	Z40bV3bnusutxoT76u+UP+53wIBUz1yiDxTUB499LCqr72g75lfPwjv8HgLtXt1uiQIL
	aaR8c7Z6GpF4MlUt3wm81l+i818RB+rw0wKZL4ChkZSgBi4Qhoj+aCjxWEWbYQ99XLcS
	F9lC/CjlDEfCF+y27MzYiGmVEuJcWb6qlVHAjccbG7ZRxkXDoUvbh7X8Na74SMf/obu3
	1KLA==
X-Gm-Message-State: AJcUukdF/Kfgmoe3v5WQtfp4pZNIvGmAASI6DKfy/DmstPfb8n3EozYU
	9cK+AHePKE6Cfp5dps9Vcg3Y/Q==
X-Google-Smtp-Source: ALg8bN6/ajPvTLwyqAYMufa4rO7fNTBwzQG92RdQko+Ov+BRsYTvT3YZaeV+4PhbdCZcBtYWfJOXbA==
X-Received: by 2002:adf:82f1:: with SMTP id 104mr8363377wrc.131.1548350243526; 
	Thu, 24 Jan 2019 09:17:23 -0800 (PST)
Received: from [192.168.1.39] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	a12sm111497293wro.18.2019.01.24.09.17.22
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jan 2019 09:17:22 -0800 (PST)
To: kumar sourav <sourav.jb1988@gmail.com>, qemu-trivial@nongnu.org
Cc: thuth@redhat.com, f4bug@amsat.org, qemu-devel@nongnu.org
References: <20190124162045.10474-1-sourav.jb1988@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <242af973-21e9-9753-7263-839d118c7be5@redhat.com>
Date: Thu, 24 Jan 2019 18:17:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190124162045.10474-1-sourav.jb1988@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw: sd: set category of the
 sd memory card
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
X-List-Received-Date: Thu, 24 Jan 2019 17:17:51 -0000

On 1/24/19 5:20 PM, kumar sourav wrote:
> Sets the category of the sd memory card as DEVICE_CATEGORY_STORAGE.
> Devices should be assigned to one of DEVICE_CATEGORY_XXXX.
> 
> Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/sd/sd.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index d4356e9b73..aaab15f386 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -2121,6 +2121,7 @@ static void sd_class_init(ObjectClass *klass, void *data)
>      dc->vmsd = &sd_vmstate;
>      dc->reset = sd_reset;
>      dc->bus_type = TYPE_SD_BUS;
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>  
>      sc->set_voltage = sd_set_voltage;
>      sc->get_dat_lines = sd_get_dat_lines;
> 

