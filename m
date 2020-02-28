Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7dO8-0002rG-I9
	for mharc-qemu-trivial@gnu.org; Fri, 28 Feb 2020 06:01:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35245)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j7dO6-0002pb-8L
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:00:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j7dO5-0000SV-6N
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:00:58 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46842
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j7dO5-0000Qu-2A
 for qemu-trivial@nongnu.org; Fri, 28 Feb 2020 06:00:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582887656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jfZmSGFNoPSeMpuEFjx9/0pexvj/cvJVsdMXjMUDfnE=;
 b=FtkhNpNTgB1Y1esuGLhit/vglDrsnHdODhfI5gsEV0Ov65deBzQ0vgkPaV1LarUmIywyE6
 SWjl4ygitrKb5+8cPdiu9dItMJLvePdW9W3n7HGAZFqz+TqsT0K04lr7Ku4XcH/OYq2QLs
 lspKuFLJYTsT8PU8Ej3guB3B/W1vuYo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-ecNWX04iOU6urCsyEIk7Hg-1; Fri, 28 Feb 2020 06:00:53 -0500
X-MC-Unique: ecNWX04iOU6urCsyEIk7Hg-1
Received: by mail-wr1-f70.google.com with SMTP id p11so1176559wrn.10
 for <qemu-trivial@nongnu.org>; Fri, 28 Feb 2020 03:00:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jfZmSGFNoPSeMpuEFjx9/0pexvj/cvJVsdMXjMUDfnE=;
 b=H8amXf3A6sdT6eV2U4XvFRMRaBMicgq+8eXXnybandHo/iID10nRUBV0rbDi9RkLML
 tdskD2rjnlhXGxyeixDqaJFP1Zvt9g+AlSaUr284xvDo1naxG5n6UkNEDNultblTPExX
 q2tyo08+q8KdHJ9AVfhCqadKn4lT5QDI7VvXYTGe8PyYmJ7Gu6FTqSoJ8tSHqXMZPS4o
 5aG00HBMHBv2Jyk1EiYZNtxgXUAe9dNSrrihYDbdMI51qVN7g2Q4LGwe7Ct2y/Bbn4bJ
 5tYiEbLG0wD1rq41ixeWMITKco1TfMn+JNyGO/7Zk36IMoArzqyxI3R8r8wGag8CVKki
 Bl5g==
X-Gm-Message-State: APjAAAXWqBq9t2XdO8WEdupy0DF7LcWfnKdxzxvhCMcTUfUFpPjgjs3T
 jkLDqgdjzUh5yk2/aI6Zy2MNDxMpe0ioRI0KWERj5vwVSuJxP85ihb+jfUTs42OgLkxFmH+HEDn
 rEF6U0QOxWvh1FcEjXw==
X-Received: by 2002:a7b:c216:: with SMTP id x22mr4461793wmi.51.1582887652096; 
 Fri, 28 Feb 2020 03:00:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqwWw8dbOB0STLUEq7UjBJN1f7pRWXqGPjgsHntMIKXGzkvYp/c5ys8zVacZjYJC+OQqNNyCng==
X-Received: by 2002:a7b:c216:: with SMTP id x22mr4461769wmi.51.1582887651782; 
 Fri, 28 Feb 2020 03:00:51 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:d0d9:ea10:9775:f33f?
 ([2001:b07:6468:f312:d0d9:ea10:9775:f33f])
 by smtp.gmail.com with ESMTPSA id y7sm15117834wmd.1.2020.02.28.03.00.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2020 03:00:51 -0800 (PST)
Subject: Re: [PATCH V2] MAINTAINERS: Add entry for Guest X86 HAXM CPUs
To: Colin Xu <colin.xu@intel.com>, qemu-devel@nongnu.org, philmd@redhat.com
Cc: wenchao.wang@intel.com, hang.yuan@intel.com, qemu-trivial@nongnu.org
References: <20200228012046.6629-1-colin.xu@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9c32d7c2-d8af-45c6-4578-34c79bd7a2a0@redhat.com>
Date: Fri, 28 Feb 2020 12:00:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200228012046.6629-1-colin.xu@intel.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
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
X-List-Received-Date: Fri, 28 Feb 2020 11:00:59 -0000

On 28/02/20 02:20, Colin Xu wrote:
> HAXM covers below files:
> include/sysemu/hax.h
> target/i386/hax-*
> 
> V2: Add HAXM github page for wiki and issue tracking.
> 
> Cc: Wenchao Wang <wenchao.wang@intel.com>
> Cc: Hang Yuan <hang.yuan@intel.com>
> Reviewed-by: Hang Yuan <hang.yuan@intel.com>
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  MAINTAINERS | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index df1786db3207..c45f1421eab5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -435,6 +435,17 @@ F: include/hw/block/dataplane/xen*
>  F: include/hw/xen/
>  F: include/sysemu/xen-mapcache.h
>  
> +Guest CPU Cores (HAXM)
> +---------------------
> +X86 HAXM CPUs
> +M: Wenchao Wang <wenchao.wang@intel.com>
> +M: Colin Xu <colin.xu@intel.com>
> +L: haxm-team@intel.com
> +W: https://github.com/intel/haxm/issues
> +S: Maintained
> +F: include/sysemu/hax.h
> +F: target/i386/hax-*
> +
>  Hosts
>  -----
>  LINUX
> 

Queued, thanks.

Paolo


