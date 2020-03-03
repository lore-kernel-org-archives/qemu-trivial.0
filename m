Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j955o-0002u9-VV
	for mharc-qemu-trivial@gnu.org; Tue, 03 Mar 2020 05:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58942)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j955i-0002sB-Gj
 for qemu-trivial@nongnu.org; Tue, 03 Mar 2020 05:47:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j955h-0003AA-Ej
 for qemu-trivial@nongnu.org; Tue, 03 Mar 2020 05:47:58 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28008
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j955h-00039j-AA
 for qemu-trivial@nongnu.org; Tue, 03 Mar 2020 05:47:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583232476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aFJjO3UnXVF3Co+ygtuv2sFeTJ2dkpMZTNWugLuGLUg=;
 b=RpulnNvuS8Wol+7O3PfdJ8GM3Nn5Pb1TAzldqbJEYMRoCxI3kiuvDK25Ee6LGDZ407LtIQ
 PxB5wmZdKnA1SKHMNpPg3SZt0LPfIWMofJb3sSxp9APx6kmwmHYkZYl+LpebViWF2iFild
 5jF7lSPsiB55FEbmMdKmDYLXaJ829GU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-ELaTtCDgPd2xWex4wX3TWA-1; Tue, 03 Mar 2020 05:47:55 -0500
X-MC-Unique: ELaTtCDgPd2xWex4wX3TWA-1
Received: by mail-wr1-f72.google.com with SMTP id m13so1046956wrw.3
 for <qemu-trivial@nongnu.org>; Tue, 03 Mar 2020 02:47:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aFJjO3UnXVF3Co+ygtuv2sFeTJ2dkpMZTNWugLuGLUg=;
 b=VILOGNbYpJ4STbkWMi+mEqbSXVcvt1Fx8lfeyAeIr19ePgWcLXQymopiVq6y2GozTC
 8cHDSj1o/JnouTM4Au19rlwIWKUZsFk7QCCM8E+gp9V1taZ91EUkA9AXhdBPJwHhRzo/
 I/iHnw07uvbvZSD6RFHphBcxvBV/6gPedIQvwIJpBxsxF0mefysXWwCl8CYBNpzyjvoI
 qKasf5BXZT4NP843oC6o3+bfNRkxWFpWMn35FlFcQYKwmp01E62IeRdk3Apxo3udfYTh
 MORVmztUjVaZSplD5x5ODb9Emml/KK2VMn6wTz6S8pntFj6TaNIrqxImlF/lFxRiSrTF
 dI7w==
X-Gm-Message-State: ANhLgQ2k6q6VXJoA/i9uqlK170pqK1RVY9IiijQweXUBcat9NA6WFDw7
 +WiEm5qoj5bXtxm6xOF9UNqYnnESAaiAjweWg4QvuXK8G6M2ehOnGi/LPqWi3e9tOeWFZ2JKUIJ
 PJzQo3yNiyE9K9zPWIA==
X-Received: by 2002:adf:dd05:: with SMTP id a5mr4926467wrm.108.1583232474315; 
 Tue, 03 Mar 2020 02:47:54 -0800 (PST)
X-Google-Smtp-Source: ADFU+vt/x54kIF9e78cpVM4FARmhf8GV5XDs/mpU2UKd0yahcX6ZWYUhi7tvNEHOQidNaOWPjZsyhw==
X-Received: by 2002:adf:dd05:: with SMTP id a5mr4926449wrm.108.1583232474023; 
 Tue, 03 Mar 2020 02:47:54 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:9def:34a0:b68d:9993?
 ([2001:b07:6468:f312:9def:34a0:b68d:9993])
 by smtp.gmail.com with ESMTPSA id z135sm889900wmc.20.2020.03.03.02.47.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 02:47:53 -0800 (PST)
Subject: Re: [PATCH] target/i386/hax-posix: fix two 'format-truncation'
 compile warnings
To: pannengyuan@huawei.com, rth@twiddle.net, ehabkost@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 zhang.zhanghailiang@huawei.com, euler.robot@huawei.com
References: <20200224065139.19567-1-pannengyuan@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a6e307a4-a66d-2297-5d62-6be910353d67@redhat.com>
Date: Tue, 3 Mar 2020 11:47:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224065139.19567-1-pannengyuan@huawei.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Tue, 03 Mar 2020 10:47:59 -0000

On 24/02/20 07:51, pannengyuan@huawei.com wrote:
> diff --git a/target/i386/hax-posix.c b/target/i386/hax-posix.c
> index a5426a6dac..197d5bc0f9 100644
> --- a/target/i386/hax-posix.c
> +++ b/target/i386/hax-posix.c
> @@ -121,7 +121,8 @@ static char *hax_vm_devfs_string(int vm_id)
>          return NULL;
>      }
>  
> -    snprintf(name, sizeof HAX_VM_DEVFS, "/dev/hax_vm/vm%02d", vm_id);
> +    int len = snprintf(name, sizeof HAX_VM_DEVFS, "/dev/hax_vm/vm%02d", vm_id);
> +    assert(len < sizeof HAX_VM_DEVFS);
>      return name;
>  }
>  
> @@ -140,8 +141,9 @@ static char *hax_vcpu_devfs_string(int vm_id, int vcpu_id)
>          return NULL;
>      }
>  
> -    snprintf(name, sizeof HAX_VCPU_DEVFS, "/dev/hax_vm%02d/vcpu%02d",
> -             vm_id, vcpu_id);
> +    int len = snprintf(name, sizeof HAX_VCPU_DEVFS, "/dev/hax_vm%02d/vcpu%02d",
> +                       vm_id, vcpu_id);
> +    assert(len < sizeof HAX_VCPU_DEVFS);
>      return name;
>  }
>  
> 

Julio Faracco has posted a fix for the same bug.  The best change is
actually to switch to g_strdup_printf.

Paolo


