Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jo2Gg-0004ul-Ip
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jun 2020 06:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jo2Ge-0004qe-MY
 for qemu-trivial@nongnu.org; Wed, 24 Jun 2020 06:04:32 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54279
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jo2Gc-0004ac-Gp
 for qemu-trivial@nongnu.org; Wed, 24 Jun 2020 06:04:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592993069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DrlLKbmx0SnzBtD9RdfOsTeO6TB+WXsuU6tuMoJeYkU=;
 b=Q/78Pne3wjyqSnfJNyBU4+X0eNywwKINtnH6f7LgBNQR/aYbVy76MmiVABTQPP/UFWXfi3
 lgSX8Eq2qURnpUc30XzaLmgBoiWkarNpc+hxu3QtKov3hE0syhlvxXD5XKZrMOKd5x0oOA
 9JtgVCjbuHFRq59CKbvDOBM1Sa9DGXU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-niQMs2XKM2CyqklqAeMe5g-1; Wed, 24 Jun 2020 06:04:28 -0400
X-MC-Unique: niQMs2XKM2CyqklqAeMe5g-1
Received: by mail-wm1-f69.google.com with SMTP id c66so2169025wma.8
 for <qemu-trivial@nongnu.org>; Wed, 24 Jun 2020 03:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=DrlLKbmx0SnzBtD9RdfOsTeO6TB+WXsuU6tuMoJeYkU=;
 b=nzDe9MCql2c1ClDHfob/qGjBrzj+r75aQfwmuQNBYeVBFbEZ8xzMldUVA/ic59d3n2
 oxH9c9ESwOhAlEwxS5IX4VEppJ+xPdOgJ8Q2Sk5LC0iN+D+kxnXaH8rGZMa9EVVO7gmE
 vpnhC4ryfqvjPvi143GH3WTCuG81q6Qqa6F6DuLbWUeCiQEi9Q3gOD08Q0GfrcIbFhuP
 S0L5dXVhHd8uPPQNY3vLVRHMspm0w4sydcM1h4kZK51nx2KyXpIHMnVuEe6oxzr9PRbn
 oYzGtcHRei+V5U4etua1d/GlcEKykHkipUK25g13tl7XS/3dsSO0An6pl5V27eQgd4z9
 YMIQ==
X-Gm-Message-State: AOAM530NIGCtPEx/oCypOtUaBGWFzkswKIQXaz6f95L7OxQYzUDSx3ba
 /oKIdQJbewfiAVFEWUbx56vjJHcnulVCrwq+B02IfunCSy/cGluXALtMjLyAKsLxBEDbhWS07FA
 qBbSSr87WWCgq2PdObA==
X-Received: by 2002:a1c:1984:: with SMTP id 126mr27376564wmz.147.1592993067254; 
 Wed, 24 Jun 2020 03:04:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlVOPmttgWPw9spC6LPocJyrnWkQBwuo9Z7V8xyGKgsNe6Qt5HyDEYHqaWo2U8egvU3QNmFw==
X-Received: by 2002:a1c:1984:: with SMTP id 126mr27376547wmz.147.1592993067072; 
 Wed, 24 Jun 2020 03:04:27 -0700 (PDT)
Received: from [192.168.1.40] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id v20sm27001002wrb.51.2020.06.24.03.04.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2020 03:04:26 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Cover pip requirements.txt
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20200605163748.15345-1-philmd@redhat.com>
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
Message-ID: <d15e1a9a-4cf1-356b-bf51-bda47a2840e2@redhat.com>
Date: Wed, 24 Jun 2020 12:04:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200605163748.15345-1-philmd@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 01:59:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 24 Jun 2020 10:04:33 -0000

Cleber are you OK with this?

On 6/5/20 6:37 PM, Philippe Mathieu-Daudé wrote:
> Add an entry in 'Python scripts' to cover the requirements.txt
> file added in commit 213137217a6 (this file contains a list of
> Python packages used by our test suite).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3e7d9cb0a5..fc4148fba3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2219,6 +2219,7 @@ S: Odd fixes
>  F: python/qemu/*py
>  F: scripts/*.py
>  F: tests/*.py
> +F: tests/requirements.txt
>  
>  Benchmark util
>  M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 


