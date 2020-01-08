Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ip8RZ-0002S9-Db
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jan 2020 05:20:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38776)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ip8RX-0002RQ-CO
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 05:20:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ip8RW-0006Ij-9q
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 05:20:03 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:42889
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ip8RW-0006IC-76
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 05:20:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578478801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RyBoWiJBCGcCVZtfCvXOgqZ1bALhwvzfRBQWkDGDhZ0=;
 b=Ebm9ja1e1/ynJB9WysapSynY08JdiXwT1jEFUkIQGW6b5qALeTZ0Q0vlVUohmrViyaT/DD
 Ky9h/Nhm+ayLl5LrkgnmtA+wAlzhdHjgewxFhscAUYMGFN3nVqrAEzuosnecGuw2EybeKf
 D05cPnZEOXFyZ7dJIMho/7nm8TcOWVo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-64uEsaJMN-qg4BBr64SouQ-1; Wed, 08 Jan 2020 05:19:58 -0500
Received: by mail-wr1-f71.google.com with SMTP id v17so1238044wrm.17
 for <qemu-trivial@nongnu.org>; Wed, 08 Jan 2020 02:19:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MGh33mR6NswKUUpxwqC4QRAUC3uTpwR2Lqx2wgrWhLE=;
 b=I/JyQUuPT5B+/pmVTpdhhEcDt+ASql2bIlrnv+Xktkgx35/DwU7DsKvuPxvl70IXFF
 WZI77QKwaWZtDLLvPoQpiA2wa9MqhjPxMcANCQH/WNGH/yckiHT79n/rBD8KOn4qPpLj
 kM1gI5WvaKDArzV64xXYaemGnTIOrAj9N1vNAVDLYtuomfdqFVXLh5P8Lw1305yZtF2M
 UuzCMCvzgN1XLHHAmhS5FWlsQ3EPxu1qIwCZhxPx+qrbo6B1hnFmvnwRvIsrkTTnuvez
 f7hEdy2fzvoCwsVLAsLBNSMr+PIBtfMpiF/R4XkX+3LdadFVUgvHK1P70PH/pTmd3DDo
 E4UA==
X-Gm-Message-State: APjAAAX+61xOgT7/Xdkv5g1tdRF8ML2yfQRYNKqOp1mHRc4oWTq28v5b
 gBu9hS+lWJlRsLyEvMDoaoqjnUagfjGoTNje55QVyX0k0urjYXNblXUESwTh9Bjz84zFgQObESj
 5N9xHAK3a+0wOgxh7PA==
X-Received: by 2002:a05:600c:22d3:: with SMTP id
 19mr2850864wmg.92.1578478797630; 
 Wed, 08 Jan 2020 02:19:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqw09wPkTE7qbwqVzc4YyGvTHKXy7oGU+OhfLnJBBVagVDaTCu839U3u/J3EnPMGTyLSfevqcg==
X-Received: by 2002:a05:600c:22d3:: with SMTP id
 19mr2850840wmg.92.1578478797423; 
 Wed, 08 Jan 2020 02:19:57 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id k13sm3535273wrx.59.2020.01.08.02.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2020 02:19:56 -0800 (PST)
Subject: Re: [PATCH v2] arm/translate-a64: fix uninitialized variable warning
To: pannengyuan@huawei.com, peter.maydell@linaro.org
Cc: zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Euler Robot <euler.robot@huawei.com>
References: <20200108023915.52288-1-pannengyuan@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d15cbc0a-d2c6-d845-0d8b-6846d66f4c1c@redhat.com>
Date: Wed, 8 Jan 2020 11:19:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200108023915.52288-1-pannengyuan@huawei.com>
Content-Language: en-US
X-MC-Unique: 64uEsaJMN-qg4BBr64SouQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Wed, 08 Jan 2020 10:20:04 -0000

On 1/8/20 3:39 AM, pannengyuan@huawei.com wrote:
> From: Pan Nengyuan <pannengyuan@huawei.com>
>=20
> Fixes:
> target/arm/translate-a64.c: In function 'disas_crypto_three_reg_sha512':
> target/arm/translate-a64.c:13625:9: error: 'genfn' may be used uninitiali=
zed in this function [-Werror=3Dmaybe-uninitialized]
>      genfn(tcg_rd_ptr, tcg_rn_ptr, tcg_rm_ptr);
>      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> qemu/target/arm/translate-a64.c:13609:8: error: 'feature' may be used uni=
nitialized in this function [-Werror=3Dmaybe-uninitialized]
>      if (!feature) {
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> ---
> Changes v2 to v1:
> - add a default label to fix uninitialized warnings(suggested by Richard =
Henderson)
> ---
>   target/arm/translate-a64.c | 2 ++
>   1 file changed, 2 insertions(+)
>=20
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index d4bebbe629..63a3d26687 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -13585,6 +13585,8 @@ static void disas_crypto_three_reg_sha512(DisasCo=
ntext *s, uint32_t insn)
>               feature =3D dc_isar_feature(aa64_sha3, s);
>               genfn =3D NULL;
>               break;
> +        default:
> +            g_assert_not_reached();
>           }
>       } else {
>           switch (opcode) {
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


