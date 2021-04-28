Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbmfZ-000491-0J
	for mharc-qemu-trivial@gnu.org; Wed, 28 Apr 2021 12:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbmfW-00045e-E0
 for qemu-trivial@nongnu.org; Wed, 28 Apr 2021 12:04:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbmfR-0000wz-7Q
 for qemu-trivial@nongnu.org; Wed, 28 Apr 2021 12:04:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619625839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VWzv79dhOfCvbQC5r24ANwFDN3FblWj9S+W4LOJP8aI=;
 b=AH0atEHN9RLYYW31H/+XOzi+f7mVc13bfyYmpTdFcqIRLCxaC8Kx2owtN7tSpAcDQzeF2t
 B8fKBI3vkH7tcWTtPofsopk2hunOP4nmN2nQft8piHpti2zu2dEkeZ49pReLk/KNTVj7FM
 8+wgHiBolxSG41nctPe2471PKy+VCaY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-535Jp2zqNQa0crzypFZa8w-1; Wed, 28 Apr 2021 12:03:57 -0400
X-MC-Unique: 535Jp2zqNQa0crzypFZa8w-1
Received: by mail-wr1-f69.google.com with SMTP id
 88-20020adf95610000b029010758d8d7e2so10920117wrs.19
 for <qemu-trivial@nongnu.org>; Wed, 28 Apr 2021 09:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VWzv79dhOfCvbQC5r24ANwFDN3FblWj9S+W4LOJP8aI=;
 b=cRKpBb1U/uWFdnLVlWaYTRa5ZG3V8En17VKBh2BGYSlXPEc56x2PyfQT+YDbsmp0kX
 IxdkYQQKc0HG6yazY3lcWqDtWhLbQSei5vRrzmldF6jmLjDfDNk6rOh/8W/9aS+1wxSN
 yyx+7Axt5skJtiPMfbL/ZJ61pXRYIT10O/80SMqOcLPRGyHvquNditX/dLKLIsa7vQiZ
 8OFZlK885bfZMGYmHj2Y3f2aPex2PbTqKXzRAH/g3mJCjY4mcJiBN7r7vF3nUj8Vk2Gb
 XL/8fawP2jcF+mq2WfoaVPpi4sKGiE156DVsLnR+Ib5uNHO2CKz6L9LoNTK0KdvKaxDo
 Db5w==
X-Gm-Message-State: AOAM533fKhOscsnslzXYdJgFTIUJG8vTQuEutOtykMBgziRR2iwJufXF
 C9SOlo/LKlJoRLyAM3GGweZbknDzT8z2IZPJwRi0QMYtobg/zabOzpOXUo6nRT7TQu/WW/PjQGV
 5Qr4E14itQBkR7xPjXg==
X-Received: by 2002:adf:cd89:: with SMTP id q9mr10555909wrj.147.1619625836256; 
 Wed, 28 Apr 2021 09:03:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw72dT/vsBEmhvsKrpp4jzv5dcu3oWBRWtHufZX4h+LqPGakBcS3KpBll1myBCN/rVv9xbJPA==
X-Received: by 2002:adf:cd89:: with SMTP id q9mr10555887wrj.147.1619625836111; 
 Wed, 28 Apr 2021 09:03:56 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id x64sm107562wmg.46.2021.04.28.09.03.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 09:03:55 -0700 (PDT)
Subject: Re: [PATCH] accel: kvm: clarify that extra exit data is hexadecimal
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org
References: <20210428142431.266879-1-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5fbad3c6-0219-9dad-2a04-98198dacb01f@redhat.com>
Date: Wed, 28 Apr 2021 18:03:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428142431.266879-1-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 28 Apr 2021 16:04:07 -0000

On 4/28/21 4:24 PM, David Edmondson wrote:
> When dumping the extra exit data provided by KVM, make it clear that
> the data is hexadecimal.
> 
> At the same time, zero-pad the output.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>  accel/kvm/kvm-all.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


