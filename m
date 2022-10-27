Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1onweX-0008EJ-3d
	for mharc-qemu-trivial@gnu.org; Thu, 27 Oct 2022 02:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onwdo-0007yO-LN
 for qemu-trivial@nongnu.org; Thu, 27 Oct 2022 02:45:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onwdj-0004px-AN
 for qemu-trivial@nongnu.org; Thu, 27 Oct 2022 02:45:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666853116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eyuZewm8j3DxJ1fNrIalYCNlhZN8CvYyPVErdB/G9aI=;
 b=C59I/IwZVEM89O1uznB5NENdzripSTY9HTD7OhpfGlCC3OT6ltbaW9tFobRGa8xitg+54z
 +I2XJcm7D8WRWYHgbTkLSX8ydP7oaP0c4CzRM3mCdIRj6onWZ3NuOFKvBEu311bf+juP21
 lSyMAkKwcVHbSWMRFVpSP+qp1o2grn8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-417--BIHCNwUN4WYS3R7qUJmtw-1; Thu, 27 Oct 2022 02:45:15 -0400
X-MC-Unique: -BIHCNwUN4WYS3R7qUJmtw-1
Received: by mail-wm1-f70.google.com with SMTP id
 f7-20020a7bcd07000000b003c6e73579d3so254632wmj.8
 for <qemu-trivial@nongnu.org>; Wed, 26 Oct 2022 23:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eyuZewm8j3DxJ1fNrIalYCNlhZN8CvYyPVErdB/G9aI=;
 b=3fCuPJNHUHDa1QCFjR7pdJ/GGSU/MvqpnjF8Hvnv7gDHiaaOuOwM6AJxuri7f2Fxe6
 DXt0dJsCfrbB6mqM22vEf3fbej8DzClbip6TpAGvC/FRx8RSJG1svXQYVFzDYgarAgNZ
 SzhLXy6kraPCsVPH13Q5eDmJH9uvUDyPgKS0+2jNsStVCKCY4ErBmYyfxxDyOAjAt4Tu
 ta5kUjGIODm+8pVPZmyqXZAUPZ0vAP2qNaBHJPX/uH+ZLK6EexnT18naZh3G8sETUabE
 V7C1gdxj0WdwtWdL2aJa84LZdTKgooS4wou0lRX7J2ToEdNYWJDzHh3nf7xwo0A8U9/8
 +Jww==
X-Gm-Message-State: ACrzQf1pBEJc/1zzOt7fvGGIJ1DWMnqXXZNYV56FuEa4sHcvr6xjKurg
 yKAC4ALHBkJuCUe7PFCb9FPo7zjTl9ub0uCVoNardG7DONDHadAa5sKntYHtE1A84ZXVlXPVq5t
 InY2KFdzIvVYJ590t0Q==
X-Received: by 2002:a5d:59a7:0:b0:230:3652:1aa with SMTP id
 p7-20020a5d59a7000000b00230365201aamr30794920wrr.308.1666853114465; 
 Wed, 26 Oct 2022 23:45:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4qqVuIK4mps7HIaZRE/r8oW0D3A5gY59EPvRu+3KfGU/wsOLM0MpBIkVriL+8p1Q07e53KqA==
X-Received: by 2002:a5d:59a7:0:b0:230:3652:1aa with SMTP id
 p7-20020a5d59a7000000b00230365201aamr30794905wrr.308.1666853114220; 
 Wed, 26 Oct 2022 23:45:14 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-195.web.vodafone.de.
 [109.43.176.195]) by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c1d1200b003a342933727sm4161437wms.3.2022.10.26.23.45.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 23:45:13 -0700 (PDT)
Message-ID: <aa279055-33c9-4129-9796-c307008a1fb9@redhat.com>
Date: Thu, 27 Oct 2022 08:45:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/3] target/s390x: Rename insn-data/format.def ->
 insn-data/format.h.inc
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 qemu-trivial@nongnu.org
References: <20221025235006.7215-1-philmd@linaro.org>
 <20221025235006.7215-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221025235006.7215-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 27 Oct 2022 06:45:35 -0000

On 26/10/2022 01.50, Philippe Mathieu-Daudé wrote:
> We use the .h.inc extension to include C headers. To be consistent
> with the rest of the codebase, rename the C headers using the .def
> extension.
> 
> IDE/tools using our .editorconfig / .gitattributes will leverage
> this consistency.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/s390x/tcg/{insn-data.def => insn-data.h.inc}    |  2 +-
>   .../s390x/tcg/{insn-format.def => insn-format.h.inc}   |  0
>   target/s390x/tcg/translate.c                           | 10 +++++-----
>   3 files changed, 6 insertions(+), 6 deletions(-)
>   rename target/s390x/tcg/{insn-data.def => insn-data.h.inc} (99%)
>   rename target/s390x/tcg/{insn-format.def => insn-format.h.inc} (100%)

Reviewed-by: Thomas Huth <thuth@redhat.com>


