Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1otUJg-0007QE-0o
	for mharc-qemu-trivial@gnu.org; Fri, 11 Nov 2022 08:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otUJd-0007Lf-31
 for qemu-trivial@nongnu.org; Fri, 11 Nov 2022 08:43:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otUJZ-0007wn-P7
 for qemu-trivial@nongnu.org; Fri, 11 Nov 2022 08:43:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668174201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=syLR1zyciTjJrOwgO3ABUDtAgzJbNH5vtuERySzP8ZQ=;
 b=DTzf4yhijezxXFAKiL5Ulwu50OH3mLgxjLcdKXIiEPQkQmd7QfAKotpIa64zlB02Lc2zjV
 jcq+2LFNVVVcDVNxEhn0Rum1+6ui8gM9xZlseFaLqblbIAXwkxKKLu54rbOjgrzb5j1Qpj
 bhWxo2JAqtZaksFO1KTfaI73RnKwI4c=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-rPxVJFz-OjuYxDHy-JxcWg-1; Fri, 11 Nov 2022 08:43:20 -0500
X-MC-Unique: rPxVJFz-OjuYxDHy-JxcWg-1
Received: by mail-qk1-f200.google.com with SMTP id
 bq13-20020a05620a468d00b006fa5a75759aso4785559qkb.13
 for <qemu-trivial@nongnu.org>; Fri, 11 Nov 2022 05:43:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=syLR1zyciTjJrOwgO3ABUDtAgzJbNH5vtuERySzP8ZQ=;
 b=GdbS0CLd1PrRWDJAP2w7IyT7fKhvjsfTx/NB4HReIdhc1su/SIe1qqTdRC4NDRvorC
 dwdPnUymsTuul6S8S+EQUtAbWNQt/DlzUtHbfHB9B1cmOVkIUhJipEbzPuvvC+Eb2E2c
 3pw4PcqsZZ24l6ee9BtZpKmmacz/t0g4p8+31EBks+bZF+22TyFbqddDZwgXgn0505br
 u0RGK1XEZxwfK6GNt53gFs8wjhaKcRPdn5EN8wWDyKBub1z8ZmaJ55Qfk6M3piN2koOY
 bIKkaA7w+oEbM+IM7tsMzrJqxie6X+QgNqTFzzTvnMfDOCAV+FKaPVORgFANxOrvLi5Q
 q5fA==
X-Gm-Message-State: ANoB5pnWpbKNSCxavh37VHkPehVOnV64Ysal4AQoybwjpokkzJDTqlp8
 yMutrk6mFN2ovvwDV7c7jvEoocvVqXUTn2ScoNRPyrGujz8noKINGypEbh4yqolKPKoBzLWebTO
 ApiLRSSPBTXZA1nrrgw==
X-Received: by 2002:ad4:536c:0:b0:4ad:68f8:1183 with SMTP id
 e12-20020ad4536c000000b004ad68f81183mr1892307qvv.49.1668174200268; 
 Fri, 11 Nov 2022 05:43:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4zeXw4CRGgKrb31jD+h2tdsJszXTKeOiKMJZ3Ua19AZ9P6YUUXn0I0W0Sl00kpeFuAkXQpAA==
X-Received: by 2002:ad4:536c:0:b0:4ad:68f8:1183 with SMTP id
 e12-20020ad4536c000000b004ad68f81183mr1892291qvv.49.1668174200045; 
 Fri, 11 Nov 2022 05:43:20 -0800 (PST)
Received: from [192.168.8.102] (tmo-100-234.customers.d1-online.com.
 [80.187.100.234]) by smtp.gmail.com with ESMTPSA id
 q6-20020a37f706000000b006ed61f18651sm1441797qkj.16.2022.11.11.05.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 05:43:19 -0800 (PST)
Message-ID: <7d7f6f77-63bd-2a32-19a3-6f9e09089ffd@redhat.com>
Date: Fri, 11 Nov 2022 14:43:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] acpi/tests/avocado/bits: some misc fixes
To: Ani Sinha <ani@anisinha.ca>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20221111123108.1231451-1-ani@anisinha.ca>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221111123108.1231451-1-ani@anisinha.ca>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Nov 2022 13:43:30 -0000

On 11/11/2022 13.31, Ani Sinha wrote:
> Most of the changes are trivial. The bits test timeout has now been increased
> to 110 seconds in order to accommodate slower systems and fewer unnecessary
> failures. Removed of the reference to non-existent README file in docs.
> 
> CC: Thomas Huth <thuth@redhat.com>
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>   changed from v1: address Thomas' suggestions.
> 
>   docs/devel/acpi-bits.rst   | 7 +++----
>   tests/avocado/acpi-bits.py | 5 +++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
> index c9564d871a..2c776ab166 100644
> --- a/docs/devel/acpi-bits.rst
> +++ b/docs/devel/acpi-bits.rst
> @@ -38,10 +38,9 @@ Under ``tests/avocado/`` as the root we have:
>      │ ├── bits-config
>      │ │ └── bits-cfg.txt
>      │ ├── bits-tests
> -   │ │ ├── smbios.py2
> -   │ │ ├── testacpi.py2
> -   │ │ └── testcpuid.py2
> -   │ └── README
> +   │   ├── smbios.py2
> +   │   ├── testacpi.py2
> +   │   └── testcpuid.py2

Thanks, that looks better now!

>      ├── acpi-bits.py
>   
>   * ``tests/avocado``:
> diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> index 8745a58a76..2edc36fc26 100644
> --- a/tests/avocado/acpi-bits.py
> +++ b/tests/avocado/acpi-bits.py
> @@ -385,8 +385,9 @@ def test_acpi_smbios_bits(self):
>           self._vm.launch()
>           # biosbits has been configured to run all the specified test suites
>           # in batch mode and then automatically initiate a vm shutdown.
> -        # sleep for maximum of one minute
> -        max_sleep_time = time.monotonic() + 60
> +        # sleep for maximum of a minute and 50 seconds in order to accommodate
> +        # even slower test setups.
> +        max_sleep_time = time.monotonic() + 110
>           while self._vm.is_running() and time.monotonic() < max_sleep_time:
>               time.sleep(1)
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>

(I sent my "misc fixes" pull request already, sorry ... I hope this can go 
via qemu-trival or another branch instead)


