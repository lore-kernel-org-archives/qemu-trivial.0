Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k98gw-0004Nq-1c
	for mharc-qemu-trivial@gnu.org; Fri, 21 Aug 2020 11:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k98gu-0004LK-Lg
 for qemu-trivial@nongnu.org; Fri, 21 Aug 2020 11:10:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42383
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k98gs-0004Bx-W1
 for qemu-trivial@nongnu.org; Fri, 21 Aug 2020 11:10:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598022649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wOhC0A5tHx1/nYevk525JBIpOuyPxMXewPMHCSR4/SU=;
 b=F1AvH5sAZoCnD8JlyMfDYO0yKrlizJm/ePTf4zzi2Lzf6lofSUkhJV2/kYonUH6K+FWRbJ
 XiSDC86QwAF6I1pQS+3Uz5mk29kuCH8nQy99wdkipRVrSM9i/oxACAbAFp5XjFY2XtSMlp
 atxWhg8FVlCGe0C+TrTjnx80RraxOJU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-pFtzRDAKPyav8ImGSoSxLw-1; Fri, 21 Aug 2020 11:10:48 -0400
X-MC-Unique: pFtzRDAKPyav8ImGSoSxLw-1
Received: by mail-wr1-f71.google.com with SMTP id z1so628652wrn.18
 for <qemu-trivial@nongnu.org>; Fri, 21 Aug 2020 08:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wOhC0A5tHx1/nYevk525JBIpOuyPxMXewPMHCSR4/SU=;
 b=tJ62sfSSwsf/yWtG54dZyoWtFq9mbWITNQteeeg7vnSM6HduSgU36yVRl8bO/PHdXD
 BquqFnZtIazfTJI8gPouaxOBCCElMm1A5CF8zOrcmhpV+wJqgOAI8CSP3iy26tF7QkNz
 lfy9R8yase52L4tHDgzbZx15yFNolFndYpwVPa5HYpM8j7PHKeJ3aUmkE/ooW9yRvJqR
 mAN5fvDlqubzp5U/BCmt/6N8Ul5voqSsdLq322LapUzeSHWYyYu7LBnwi0AtNqvYolPy
 LAXP1mNnb+KjOe6BWP7RT846RqKsU4k8ZJ42nw9B+xnAhZ+RZMnVHP05nCr71B3OQ1wi
 G/dA==
X-Gm-Message-State: AOAM532XgaSPHCibhuOhXQjnvh4s2aarl1uddZ9BKpSyDzCHU6Qfh8hp
 7+t9oIwhyN3rXtQltw/HHfsQLM1QUt4daPvm5TiE/6PFlm2JZVg8JwxySnLX48zAd37ybTp1ECr
 yZ28CL9UjTCSQS5bOgA==
X-Received: by 2002:a1c:4844:: with SMTP id v65mr3740872wma.149.1598022646115; 
 Fri, 21 Aug 2020 08:10:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgt32T6E65beBkwOHK2lcvXQqlulz+Ryl29iqbe0ElnzdCqOxaSZYhQk+mkB8Zj/LsMXMwyw==
X-Received: by 2002:a1c:4844:: with SMTP id v65mr3740855wma.149.1598022645924; 
 Fri, 21 Aug 2020 08:10:45 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:1cc0:4e4e:f1a9:1745?
 ([2001:b07:6468:f312:1cc0:4e4e:f1a9:1745])
 by smtp.gmail.com with ESMTPSA id v29sm4779180wrv.51.2020.08.21.08.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2020 08:10:45 -0700 (PDT)
Subject: Re: [PATCH] meson: Fix --disable-tools --enable-system builds
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org
References: <20200821150556.1235625-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4ea6a347-6dbe-35d5-dc14-d191fa705216@redhat.com>
Date: Fri, 21 Aug 2020 17:10:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200821150556.1235625-1-philmd@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 23:41:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 21 Aug 2020 15:10:52 -0000

On 21/08/20 17:05, Philippe Mathieu-Daudé wrote:
> Fixes:
> 
>  $ ../configure --disable-tools --disable-user
>  ../tests/qemu-iotests/meson.build:7:0: ERROR: Unknown variable "qemu_block_tools".
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  meson.build | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 808f50b07ef..e76f8f6d084 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1062,12 +1062,13 @@ if 'CONFIG_GUEST_AGENT' in config_host
>    subdir('qga')
>  endif
>  
> +qemu_block_tools = []
>  if have_tools
>    qemu_img = executable('qemu-img', [files('qemu-img.c'), hxdep],
>               dependencies: [authz, block, crypto, io, qom, qemuutil], install: true)
>    qemu_io = executable('qemu-io', files('qemu-io.c'),
>               dependencies: [block, qemuutil], install: true)
> -  qemu_block_tools = [qemu_img, qemu_io]
> +  qemu_block_tools += [qemu_img, qemu_io]
>    if targetos == 'linux' or targetos == 'sunos' or targetos.endswith('bsd')
>      qemu_nbd = executable('qemu-nbd', files('qemu-nbd.c'),
>                 dependencies: [block, qemuutil], install: true)
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


