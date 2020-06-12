Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jjgFt-0006Iv-Dt
	for mharc-qemu-trivial@gnu.org; Fri, 12 Jun 2020 05:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjgFr-0006Ik-Sf
 for qemu-trivial@nongnu.org; Fri, 12 Jun 2020 05:45:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49524
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjgFp-0007Pd-CF
 for qemu-trivial@nongnu.org; Fri, 12 Jun 2020 05:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591955140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ozsvLs5qelBHfjKOA5cneiBnDKaNpMO/sFFObBQ6CrA=;
 b=WiSXwXHBJi9I74KASOICEK75rb4wmqX+4IQjTcg9DOOa5259vZPMvEo08RtnvICbsJxmdC
 xlYZWohdU6gP3S1/PpDvMSa1kk2792E619+JaKx+Q+ng88i+a+Mz9X/GNVaaAjWb43KtmG
 llVgALhL2uy29FKT5S74aU0pyhmQcfI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-HDi_Ymm2P8mk7qb_dTmtPg-1; Fri, 12 Jun 2020 05:45:33 -0400
X-MC-Unique: HDi_Ymm2P8mk7qb_dTmtPg-1
Received: by mail-wr1-f71.google.com with SMTP id s17so3683354wrt.7
 for <qemu-trivial@nongnu.org>; Fri, 12 Jun 2020 02:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ozsvLs5qelBHfjKOA5cneiBnDKaNpMO/sFFObBQ6CrA=;
 b=Gs0uglSXqCMNxDfap2K3ARfTFKX0yXnQFQ72oj6gwgjyQXB1rm/jnMOeJOjqnkszir
 yroE+sdGnAV/lvMahNaMtWtKfx6sibI/FXZ/1qUML0VwmN6GyiytPujyrsP+yRoV/oUV
 G/eRwnfLb5CCJM3+gjEc9A+Z0OWkucRdJAeQTL/PgTSzSNRXixOiHbDjPmLnh5iScNou
 qCxb6xS1vU0PW7ugBVs7S+axIw6lR6cV2CICb35OGsxEVX/M9x4A1CfUb/3dAwTG6+ho
 g34dDafjXAv/mKaRoaOrlAiNzlVEpBBx9BnoLIwA/DcUDxoVBU7+Cs6BMjGGWx2r/ozz
 OmOA==
X-Gm-Message-State: AOAM533msPfPbscYBlGoupzdndEgsw8cb/8NkwjV3A98rvdjjXUtwoeq
 EnQ44vL5oDiDiSKLQi0xxrVXwfe5MONWILleklAogczliLfkHuL0oLXOTWTdNqZtYvw0sMP8Tmd
 ZtjDhDY8Sz4AclzZggQ==
X-Received: by 2002:a1c:b703:: with SMTP id h3mr12043999wmf.81.1591955131912; 
 Fri, 12 Jun 2020 02:45:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3RggoPXO8D5hpvlqlUJUXusgBrmdvxQ8YSvCtG/KA1hzoieOF6vMD/lv5Spx4NZyOUTn8/w==
X-Received: by 2002:a1c:b703:: with SMTP id h3mr12043977wmf.81.1591955131654; 
 Fri, 12 Jun 2020 02:45:31 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:29ed:810e:962c:aa0d?
 ([2001:b07:6468:f312:29ed:810e:962c:aa0d])
 by smtp.gmail.com with ESMTPSA id s8sm9168414wrm.96.2020.06.12.02.45.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2020 02:45:31 -0700 (PDT)
Subject: Re: [PATCH 1/1] util/getauxval: Porting to FreeBSD getauxval feature
To: David CARLIER <devnexen@gmail.com>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
 Thomas Huth <thuth@redhat.com>
References: <CA+XhMqwHSBd_TSFqipO6bn=hVSV8+Mdm3y=_i6gQoGBxRsjS0g@mail.gmail.com>
 <e7df4877-7700-ea36-ceb0-3bf84fec8df8@vivier.eu>
 <CA+XhMqxTU6PUSQBpbA9VrS1QZfqgrCAKUCtUF-x2aF=fCMTDOw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0c53d8c5-1298-8017-e2ea-ff4119fae830@redhat.com>
Date: Fri, 12 Jun 2020 11:45:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CA+XhMqxTU6PUSQBpbA9VrS1QZfqgrCAKUCtUF-x2aF=fCMTDOw@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/12 03:11:46
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
X-List-Received-Date: Fri, 12 Jun 2020 09:45:44 -0000

On 12/06/20 10:46, David CARLIER wrote:
> From d7f9d40777d1ed7c9450b0be4f957da2993dfc72 Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Fri, 12 Jun 2020 09:39:17 +0100
> Subject: [PATCH] util/getauxval: Porting to FreeBSD getauxval feature
> 
> FreeBSD has a similar API for auxiliary vector.
> 
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  util/getauxval.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/util/getauxval.c b/util/getauxval.c
> index 36afdfb9e6..b124107d61 100644
> --- a/util/getauxval.c
> +++ b/util/getauxval.c
> @@ -98,6 +98,16 @@ unsigned long qemu_getauxval(unsigned long type)
>      return 0;
>  }
> 
> +#elif defined(__FreeBSD__)
> +#include <sys/auxv.h>
> +
> +unsigned long qemu_getauxval(unsigned long type)
> +{
> +    unsigned long aux = 0;
> +    elf_aux_info(type, &aux, sizeof(aux));
> +    return aux;
> +}
> +
>  #else
> 
>  unsigned long qemu_getauxval(unsigned long type)
> 

Queued, thanks.

Paolo


