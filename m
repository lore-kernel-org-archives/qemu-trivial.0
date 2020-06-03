Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jgLbb-0004WD-BY
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2020 01:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jgLbZ-0004Tz-K6
 for qemu-trivial@nongnu.org; Wed, 03 Jun 2020 01:06:21 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:52078
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jgLbY-0007FI-V1
 for qemu-trivial@nongnu.org; Wed, 03 Jun 2020 01:06:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591160779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vHCnmTHhUO6Ty+LJKao770znh8X+NBqjpuCl1/GoNcY=;
 b=gAURGdpv0YXmI+kSlN08prSWCyII4hAjG2Z5/tUVhjNAT5UDmv4wlad/X9gKkdjH13w80T
 mHv6ppq1dGl3tnN79V86UKTfe+rZ4JvxoBG0LlJsi8/Ocb+O6jkmP94hTr/Ap4VqmMCnAa
 uwtAluCco7cEXO19RsxKici0/xJsqNs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-je29acX_N-CfCQPedGJ2wQ-1; Wed, 03 Jun 2020 01:06:17 -0400
X-MC-Unique: je29acX_N-CfCQPedGJ2wQ-1
Received: by mail-wr1-f69.google.com with SMTP id p9so583277wrx.10
 for <qemu-trivial@nongnu.org>; Tue, 02 Jun 2020 22:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vHCnmTHhUO6Ty+LJKao770znh8X+NBqjpuCl1/GoNcY=;
 b=h8czJN5HqgCpHFFnb1TzzqLkcXam/hCANSu14g2/MzP629sFYEVgv1iTCBBVuduaX2
 tO8mrrFviQGt2Pl75ZRzGFwO9rGQcc0hO6/mw30XJYrFt0B8APdzbFd9Mnnvu0Y0skmr
 LphZ301eq8ynPUtvYbcw3x3boA4NcC9GMrqrDUrpij424kvPzph0ZBVbs53qIwuP8xIo
 OKAXYpp2Do18UO/h2YcwWMzyBMlFHlvrZsNlAm1/hu2CxwWq4rO57yEp7L+jL7wPypqI
 eAKN39fOZfZAqI8I7SomfTOiDj5AqU+HD5OjgICy51zcFUYQ8PlpDyVirIqYRz0BC9D0
 rWsA==
X-Gm-Message-State: AOAM533BRkE2Q+wJ57snnol610dpBqYJrGB+FBPT/8r1269cYvTqEeIl
 rnHrdrIDqGKjuh4Owz3CYOej6zDNjxIAmQNQgCWUH8WZcjrY9z14Pgb0JxmX+a+hrYwqJxKrOoq
 A7x+R7D5+JDTYs0cVTA==
X-Received: by 2002:a5d:518b:: with SMTP id k11mr31722475wrv.58.1591160776595; 
 Tue, 02 Jun 2020 22:06:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNtJomm93d+A1c8knffSgNQYZZ7Wic9F6MBszuJIJPwOFAe+amMmLpCK+5cSms0ZGossiUuA==
X-Received: by 2002:a5d:518b:: with SMTP id k11mr31722459wrv.58.1591160776387; 
 Tue, 02 Jun 2020 22:06:16 -0700 (PDT)
Received: from [192.168.1.43] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id a3sm1386341wrp.91.2020.06.02.22.06.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 22:06:15 -0700 (PDT)
Subject: Re: [PATCH] net: Do not include a newline in the id of -nic devices
To: Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org
References: <20200518074352.23125-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <db954c99-53f8-bc6c-3dd5-23928c52e31a@redhat.com>
Date: Wed, 3 Jun 2020 07:06:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200518074352.23125-1-thuth@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 01:04:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 03 Jun 2020 05:06:21 -0000

On 5/18/20 9:43 AM, Thomas Huth wrote:
> The '\n' sneaked in by accident here, an "id" string should really
> not contain a newline character at the end.
> 
> Fixes: 78cd6f7bf6b ('net: Add a new convenience option "--nic" ...')
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  net/net.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/net.c b/net/net.c
> index 38778e831d..cbeeeadff8 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1506,7 +1506,7 @@ static int net_param_nic(void *dummy, QemuOpts *opts, Error **errp)
>      /* Create an ID if the user did not specify one */
>      nd_id = g_strdup(qemu_opts_id(opts));
>      if (!nd_id) {
> -        nd_id = g_strdup_printf("__org.qemu.nic%i\n", idx);
> +        nd_id = g_strdup_printf("__org.qemu.nic%i", idx);
>          qemu_opts_set_id(opts, nd_id);
>      }
>  
> 

ping?


