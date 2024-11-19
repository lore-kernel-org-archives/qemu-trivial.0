Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tDJYX-00033e-C0
	for mharc-qemu-trivial@gnu.org; Tue, 19 Nov 2024 03:25:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tDJYT-00032V-08
 for qemu-trivial@nongnu.org; Tue, 19 Nov 2024 03:25:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tDJYQ-0001QB-Rb
 for qemu-trivial@nongnu.org; Tue, 19 Nov 2024 03:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732004744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=M2yfTqQ3vppzhEcSaKHEuAeOjvgmEvwTo7J10wQXAEA=;
 b=AF1RVQk5najeCWsDn38sshB2FGVxGZJiPcQVExP+xT+gYg4fRFnOARFwr03YTwwaXKWt2l
 XXzxzaQVYQC09mnE1kjvTmhAD0aGUArm7rMuItbpv1ILWWzVD9NQIJEngExaUzAhCD3YwY
 1T/S8JXWv496gU02JxjPnUPIcO3zJg4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-_dLC91nINsqX2kiEMOetCg-1; Tue, 19 Nov 2024 03:25:42 -0500
X-MC-Unique: _dLC91nINsqX2kiEMOetCg-1
X-Mimecast-MFC-AGG-ID: _dLC91nINsqX2kiEMOetCg
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38243a4ba7cso380903f8f.1
 for <qemu-trivial@nongnu.org>; Tue, 19 Nov 2024 00:25:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732004742; x=1732609542;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M2yfTqQ3vppzhEcSaKHEuAeOjvgmEvwTo7J10wQXAEA=;
 b=hdGQdP2T34a9R/1XreCyGyPg1hBmGeq0f7vgqNNiMHOPfsmRbJeKJet1CVhZryKJqw
 XuDds9OxjBUTVwaf4M36bV6H5u66WqVA96tekkAKhdekUuCft3Nmm73Ma1hH41kao2SD
 IEPpi+PjNNJ2x1g/ZAbDyz+chtJPPChOLee5sSOBSI+NLUTOwS7L0cu4e5RrN6dKniMu
 U19bSDf2TNoNEQ5OC+4jAzGgZVjV203w1P9JRC7JtuFAZc0tBVrPCVJyWAWwv0L8CDWm
 pahylU2OmeOKmJfbIa5Bf5lpJYSsylsWd+QRMbtv+0cTwtm00kNafNsZtpvj/WGQmfVg
 KaMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKlvbiqteoyi4Zr0ZIIdVbNPEY33FZbYDUmD6Vk0JcCGYJDIH6EEuk61jbNm/RB8ATP/t2HRDvkTvUQWc=@nongnu.org
X-Gm-Message-State: AOJu0YxacJy03oV7bJpkZqqzNT4GUUUvmHqGaUH3OCQsBsg1bUBBAFoi
 HHpiEoP5SweUFdV+ZyXy/WKSSwqZ2/XVjrdu430pbT5IOZgAwtZShfaXI3S2QRgNty4JIK6bV2S
 Vd0FVHo/NTl3JEpt75Vg8MNH7vylAXziRRCUkYtYHO4Hz7pKKikV/4cg=
X-Received: by 2002:a05:6000:1a8d:b0:382:4a9d:28fa with SMTP id
 ffacd0b85a97d-3824a9d2e2cmr2959116f8f.30.1732004741680; 
 Tue, 19 Nov 2024 00:25:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8dI5KHcJ/zF4h2C03vqIEFYlrRZWdPOeEefTL+b5F4Ol/8OdNPhLHyQC0HZV+hhrCaKwx7w==
X-Received: by 2002:a05:6000:1a8d:b0:382:4a9d:28fa with SMTP id
 ffacd0b85a97d-3824a9d2e2cmr2959076f8f.30.1732004741317; 
 Tue, 19 Nov 2024 00:25:41 -0800 (PST)
Received: from [10.33.192.239] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ada3e65sm15033314f8f.13.2024.11.19.00.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2024 00:25:40 -0800 (PST)
Message-ID: <f438cd57-3eb6-40be-84d1-1aecd499904e@redhat.com>
Date: Tue, 19 Nov 2024 09:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] docs/devel: remove dead video link for sourcehut
 submit process
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Melnychenko <andrew@daynix.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, alex.bennee@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fabiano Rosas <farosas@suse.de>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Yuri Benditovich <yuri.benditovich@daynix.com>,
 manos.pitsidianakis@linaro.org, qemu-block@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk
 <kkostiuk@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, gustavo.romero@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
 <20241118172357.475281-2-pierrick.bouvier@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241118172357.475281-2-pierrick.bouvier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mIp5KgKkyR9K5UWzHYuiAITO3zG9fPfGXKKsDOZId_4_1732004742
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Tue, 19 Nov 2024 08:25:50 -0000

On 18/11/2024 18.23, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   docs/devel/submitting-a-patch.rst | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
> index 83e9092b8c0..349c32ee3a9 100644
> --- a/docs/devel/submitting-a-patch.rst
> +++ b/docs/devel/submitting-a-patch.rst
> @@ -252,10 +252,7 @@ patches to the QEMU mailing list by following these steps:
>   #. Send your patches to the QEMU mailing list using the web-based
>      ``git-send-email`` UI at https://git.sr.ht/~USERNAME/qemu/send-email
>   
> -`This video
> -<https://spacepub.space/videos/watch/ad258d23-0ac6-488c-83fc-2bacf578de3a>`__
> -shows the web-based ``git-send-email`` workflow. Documentation is
> -available `here
> +Documentation for sourcehut is available `here
>   <https://man.sr.ht/git.sr.ht/#sending-patches-upstream>`__.
>   
>   .. _cc_the_relevant_maintainer:

Reviewed-by: Thomas Huth <thuth@redhat.com>


