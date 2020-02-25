Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6Wlh-00017S-HM
	for mharc-qemu-trivial@gnu.org; Tue, 25 Feb 2020 04:44:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55551)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Wlc-00016r-5D
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 04:44:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6WlY-0001du-KL
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 04:44:40 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:45264
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6WlY-0001dK-Gm
 for qemu-trivial@nongnu.org; Tue, 25 Feb 2020 04:44:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582623875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SnSnCf77cP3jtgdk2KT6BnmYVBo/sB+FVKJkMdJbm9o=;
 b=JT9UhF+AQvUTJjYAuammoFPLiwc0+J2w2+0y9bPk2ix95FtOBo3csY1PVSKFvC5usHj4V+
 rM+5zxf2FXXWCZ3zo4hCXi9Syz8o5W61Mg1GjzbbbXkk1jg/sDcSFD7dVip844jIxRmMoe
 LJVquRq0BNlDlf2qLTBFXRqZSnWra8Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-CUcFyG6WNnmyc_JHnkeHxg-1; Tue, 25 Feb 2020 04:44:34 -0500
X-MC-Unique: CUcFyG6WNnmyc_JHnkeHxg-1
Received: by mail-ed1-f71.google.com with SMTP id be8so8669028edb.16
 for <qemu-trivial@nongnu.org>; Tue, 25 Feb 2020 01:44:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SnSnCf77cP3jtgdk2KT6BnmYVBo/sB+FVKJkMdJbm9o=;
 b=nk5fMcgEDsphqdzYxmJs6mo27A5Lb1KZeqtTlzNs8H5wRr5fAilDj7L6zjAe4pChxD
 MfxkWlukDFdHCb9di15g7OxVDi41PWyo00J/38D3v7y7vWUeCzDlyyblxFrTuOlRx0wA
 1DmcVKRd3Hr0WyHGBan++2ocOwU4Rl9PEE3E05Tmalw10ZTA9n4oaZTQPT9VGwBWQCwt
 QGY0ctVIhN5bNjbCs3yq4mKxXz40XYwAv8IPz1Tr5CwnG6xC+GQMwCQwEkpPuuaR1CQf
 Y2tBm9pgVdgHyqDcVnFYeZrHHZ+5W8EnZIrqZpfutADM4dWlYJ9poaSm7dnpcfeTLDYh
 jbGg==
X-Gm-Message-State: APjAAAX07/XjejYKWUmD5tzx/B4prrSfPD4/kdjgSNGxCv9kFoS/G46+
 bhjbOl6QCxRHWvagVujNT/r0F+5rez+Lgf2b9SSi3u3Qpy+nn+VT5c3Fo/VO1BI6xPCpGNVYTjB
 auV360oo7tY6+LlP31g==
X-Received: by 2002:a17:906:af66:: with SMTP id
 os6mr52289537ejb.87.1582623873233; 
 Tue, 25 Feb 2020 01:44:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqz1j3qmMGbEn0DBqhR0XHQr3EK4UGnbl98vBHWK24uCtlqz/KmUdpC+scgj86+1Nf8ao0vnng==
X-Received: by 2002:a17:906:af66:: with SMTP id
 os6mr52289516ejb.87.1582623872951; 
 Tue, 25 Feb 2020 01:44:32 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id q8sm92773edc.59.2020.02.25.01.44.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 01:44:32 -0800 (PST)
Subject: Re: [PATCH 13/13] monitor/hmp-cmds: Remove redundant statement in
 hmp_rocker_of_dpa_groups()
To: kuhn.chenqun@huawei.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20200225020937.25028-1-kuhn.chenqun@huawei.com>
 <20200225020937.25028-14-kuhn.chenqun@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1f4c5308-4a6f-fe1f-3832-f1c762b4c4c2@redhat.com>
Date: Tue, 25 Feb 2020 10:44:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225020937.25028-14-kuhn.chenqun@huawei.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Tue, 25 Feb 2020 09:44:43 -0000

On 2/25/20 3:09 AM, kuhn.chenqun@huawei.com wrote:
> From: Chen Qun <kuhn.chenqun@huawei.com>
> 
> Clang static code analyzer show warning:
> monitor/hmp-cmds.c:2867:17: warning: Value stored to 'set' is never read
>                  set = true;
>                  ^     ~~~~
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> ---
>   monitor/hmp-cmds.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 53bc3f76c4..84f94647cd 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -2864,7 +2864,6 @@ void hmp_rocker_of_dpa_groups(Monitor *mon, const QDict *qdict)
>   
>           if (group->has_set_eth_dst) {
>               if (!set) {
> -                set = true;
>                   monitor_printf(mon, " set");
>               }
>               monitor_printf(mon, " dst %s", group->set_eth_dst);
> 

Can you move the 'set' declaration to the for() statement and also 
remove the last "set = false;"?


