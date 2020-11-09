Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kc8B4-0000yL-Su
	for mharc-qemu-trivial@gnu.org; Mon, 09 Nov 2020 09:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kc8B3-0000uk-2r
 for qemu-trivial@nongnu.org; Mon, 09 Nov 2020 09:29:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kc8B1-0000ku-42
 for qemu-trivial@nongnu.org; Mon, 09 Nov 2020 09:29:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604932186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yt9RHEnl6S+jO0PexpG+/9I29yVsoTM1GQpu2G9TTZM=;
 b=RUijfHD4HSQqFPnfEkKB+IBl/2UPKlvyeKU4W/UfGK1Q94O7c/I2Aw6iuKuVUoHZAhKHAy
 0oKaBDel62IwTk2Nhq9+cJXt5qWV+0g2XP3FjSlVMyV383HPTmg9yOIkST7cgWDYqtayjF
 klQFYm2s6NPANDmVjIW6MnVoXwoAs2E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-GHIwSGv7Pv-_9-UNrW_y0w-1; Mon, 09 Nov 2020 09:29:42 -0500
X-MC-Unique: GHIwSGv7Pv-_9-UNrW_y0w-1
Received: by mail-wr1-f72.google.com with SMTP id p16so1767422wrx.4
 for <qemu-trivial@nongnu.org>; Mon, 09 Nov 2020 06:29:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yt9RHEnl6S+jO0PexpG+/9I29yVsoTM1GQpu2G9TTZM=;
 b=Gg5BTrKmaL0bOLkUWEhM2HE8bVm8vxEmwTP7700jhsUnQSnkfhPZRFh5VU4PPwRatL
 7YpDldgThPjRzM18+dYgdzwrYMZetjGxkrtyFo2qsMPki8JrRZANuKJmVu/LIu+LCNEk
 TfWDxVVAOVR7K+RoZ5mnitEK7VBJ5IuBo/uOlyvczXvDpKwfaEDzFWDjuHpoIhEMXjAX
 0q8JE61U6ii2pnE8uBl0ZJKTA+RtvVk7Uvf5zaV0T0tv3xY1sY2yKxbRmJO6y5w58VDd
 mVYylUGDgq2s/2lLUmOT3K0WcYIYsw45IS+onxE/Q4KQJw4HV8SxFBMtNrbPV3jOk8Ds
 y9xw==
X-Gm-Message-State: AOAM533UxwL/N9ejqO3T5GnHk7TjnbztbXAefvY21NQpwrs7S3gRuP/Y
 B9tCDPqoYcwWmjIs6Cn4rXlzZAnzgcrIzkY92M5OxLb/38fcTcFwmg/1inSrK8PPKxagmlSl1+K
 +CMSwCPjtq+WQPOC8aA==
X-Received: by 2002:a5d:530c:: with SMTP id e12mr12210233wrv.355.1604932181560; 
 Mon, 09 Nov 2020 06:29:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUhmnhLWslF1fmr4oNowneHZenkLqm0b1jIesecXhdgCrLTS/qfCMZGP2UAVhJUU0tU2cNmQ==
X-Received: by 2002:a5d:530c:: with SMTP id e12mr12210215wrv.355.1604932181430; 
 Mon, 09 Nov 2020 06:29:41 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id s4sm6589736wro.10.2020.11.09.06.29.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 06:29:37 -0800 (PST)
Subject: Re: [PATCH-for-5.2 2/4] hw/display/cirrus_vga: Fix hexadecimal format
 string specifier
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>, Gerd Hoffmann
 <kraxel@redhat.com>, Dov Murik <dovmurik@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>
References: <20201103112558.2554390-1-philmd@redhat.com>
 <20201103112558.2554390-3-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d7953f0d-1eb3-26cc-5f1f-64bf0ac9f6ac@redhat.com>
Date: Mon, 9 Nov 2020 15:29:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201103112558.2554390-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 00:04:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 09 Nov 2020 14:29:49 -0000

Hi Gerd,

On 11/3/20 12:25 PM, Philippe Mathieu-Daudé wrote:
> The '%u' conversion specifier is for decimal notation.
> When prefixing a format with '0x', we want the hexadecimal
> specifier ('%x').
> 
> Inspired-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/display/cirrus_vga.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
> index e14096deb46..fdca6ca659f 100644
> --- a/hw/display/cirrus_vga.c
> +++ b/hw/display/cirrus_vga.c
> @@ -2105,7 +2105,7 @@ static void cirrus_vga_mem_write(void *opaque,
>      } else {
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "cirrus: mem_writeb 0x" TARGET_FMT_plx " "
> -                      "value 0x%02" PRIu64 "\n", addr, mem_value);
> +                      "value 0x%02" PRIx64 "\n", addr, mem_value);
>      }
>  }
>  
> 

This patch (and previous one) missed your latest ui pull
request. As there is no qemu-trivial@ pull request during
freeze/rc, can you queue these patches via your tree?

Thanks,

Phil.


