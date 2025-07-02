Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uWs3x-0005ZO-MI
	for mharc-qemu-trivial@gnu.org; Wed, 02 Jul 2025 03:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uWs3v-0005Yj-Ta
 for qemu-trivial@nongnu.org; Wed, 02 Jul 2025 03:39:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uWs3o-0000qO-EH
 for qemu-trivial@nongnu.org; Wed, 02 Jul 2025 03:39:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751441955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MFFC24a42677G3+CnjlHRqWhcJLJq82C9B9KVkAooNM=;
 b=FMTP1zEkg76CWoXIxoc9S6cGlnG7ZQ4xd6/azu55VmAvrw+uqeW3R5hdKo8piUTDSVIuyC
 JfVthAWbmCahNwx6MZ+8fw3nFE3ZEEUGncv2WdRCEaMOi2Zr1fF0A12rJO7cLS8J1Ja/qD
 tLuiJdo8SBWdzdBAkYig2dq4sm3vGMk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-AaoXnTOnM9i0XJf8Od6oBw-1; Wed, 02 Jul 2025 03:39:14 -0400
X-MC-Unique: AaoXnTOnM9i0XJf8Od6oBw-1
X-Mimecast-MFC-AGG-ID: AaoXnTOnM9i0XJf8Od6oBw_1751441953
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-453817323afso38883135e9.1
 for <qemu-trivial@nongnu.org>; Wed, 02 Jul 2025 00:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751441953; x=1752046753;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MFFC24a42677G3+CnjlHRqWhcJLJq82C9B9KVkAooNM=;
 b=pnoey81/lNV4+kOz8W1oR45Bqdox7Z1KbzLVW1XNBpmBxckGbrYnqvfo1/RHTt1H3A
 cTOrJnRLExQggxrBlwdaP3XzxpaSKsTM2B3EzlG6KgR65boBF0Jb1Mx4/51BRfvmdB4S
 W1EMu+hu9IPxY6b/2XCz2K50ekEPKdsaONErfo/Db0yFAbOKLS6zW13oYBczT3FaDkpx
 k3uxT/XlhSpgwkUTmXyPHgXBaaVzmxrhaqf0zfEGoC/kSo4CY5WgEkN23d8/NmD+g/oh
 kptljE+NJh06VQPj2Toc79pzX9Li55r4tdDQwITzbPgaLaQ7YBUdd/iwnDbeHe4y+Z7+
 rhjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFw1Rm+kMfUo+QCGQI1cl9XAk7XcgPgL3aO4zZUvK0JGtB7pezYJSdgkmko5/BttpLZ75GBnJxFRr4UeY=@nongnu.org
X-Gm-Message-State: AOJu0YwcJUB4EhgkHoTfbHklXiw9wNm+JZkeF9bzTOwxZj8IVCNEVpDR
 /ctqs+1c3C9NS/hA49Wa7hPnn/3VBnyclI9RPmKpHN7VVPB42xOxhY9yZVkwwS1LHcpuekPiumn
 gbhqVVfbpfA2E2inJxeMlCpxMBmrSjQ8U0t10ENWdk6ropotMKSan1j07sCI=
X-Gm-Gg: ASbGncveGqqLQ7RB4UdF8P2JTs6OJM8QcXt0XD3xqCXjOQZomKc7p5bqNRATSff+rPi
 rIySe8RnhBhlodVFGICKb/vv9NJ0AbHOs1AN5Iief1K87VOKwooTIYOmadEh3zqJTLftChyS3lJ
 I4fNWEvraW9pJsX1qJqqEKiSEO6KPPTjxbCnQ6Nq0drxHKDqkKwXocBIH6gEasMd2hTH/B0Kj5k
 zEmbYJtIr+v3pKhsfBBCzF5Jtis0J2yzyTDKEHGKevJcReLcpQQnNGL6RmFtICAhUMduTNH3ROL
 ZxNvzGvsjrcRu+51eSWA/z+OnOWJ7f+7ltFldNGcuqMCAxISbgvPL+MpLIcieA==
X-Received: by 2002:a05:600c:8212:b0:43c:fe15:41dd with SMTP id
 5b1f17b1804b1-454a36ddc52mr19288775e9.6.1751441952679; 
 Wed, 02 Jul 2025 00:39:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHC2bP1Kz4XeukoshoBgagEE4nuhX+ShqgPuG/7LrCtZT9jr/5GuwsYa/a2qr65eIrItc54dg==
X-Received: by 2002:a05:600c:8212:b0:43c:fe15:41dd with SMTP id
 5b1f17b1804b1-454a36ddc52mr19288445e9.6.1751441952232; 
 Wed, 02 Jul 2025 00:39:12 -0700 (PDT)
Received: from [192.168.0.6] (ltea-047-064-114-041.pools.arcor-ip.net.
 [47.64.114.41]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a406489sm192948635e9.27.2025.07.02.00.39.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 00:39:11 -0700 (PDT)
Message-ID: <3b98464f-54f8-4977-9e87-a144277da264@redhat.com>
Date: Wed, 2 Jul 2025 09:39:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/kvm: Adjust the note about the minimum required
 kernel version
To: Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-stable@nongnu.org,
 qemu-trivial@nongnu.org
References: <20250702060319.13091-1-thuth@redhat.com>
 <aGTU2enBBQj7lu3E@intel.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <aGTU2enBBQj7lu3E@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NyLyj5jwierZEEEZsI9WcCVKoeEwP8AN7uF-4i-fTL0_1751441953
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 02 Jul 2025 07:39:24 -0000

On 02/07/2025 08.42, Zhao Liu wrote:
> On Wed, Jul 02, 2025 at 08:03:19AM +0200, Thomas Huth wrote:
>> Date: Wed,  2 Jul 2025 08:03:19 +0200
>> From: Thomas Huth <thuth@redhat.com>
>> Subject: [PATCH] accel/kvm: Adjust the note about the minimum required
>>   kernel version
>>
>> From: Thomas Huth <thuth@redhat.com>
>>
>> Since commit 126e7f78036 ("kvm: require KVM_CAP_IOEVENTFD and
>> KVM_CAP_IOEVENTFD_ANY_LENGTH") we require at least kernel 4.4 to
>> be able to use KVM. Adjust the upgrade_note accordingly.
>> While we're at it, remove the text about kvm-kmod and the
>> SourceForge URL since this is not actively maintained anymore.
>>
>> Fixes: 126e7f78036 ("kvm: require KVM_CAP_IOEVENTFD and KVM_CAP_IOEVENTFD_ANY_LENGTH")
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   accel/kvm/kvm-all.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> I just mentioned the kernel version in another patch thread. I found
> x86 doc said it requires v4.5 or newer ("OS requirements" section in
> docs/system/target-i386.rst).

Looking at the original commit that introduced this message (commit 
483c6ad426db), this seems to apply to x86 only ... I guess there's a chance 
that KVM still works with kernel 4.4 on other architectures.
But I don't mind too much - we can also say 4.5 here to have a unified 
value. Paolo, any preferences?

  Thomas


