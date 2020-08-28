Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kBaOW-0005oT-3U
	for mharc-qemu-trivial@gnu.org; Fri, 28 Aug 2020 05:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kBaOU-0005mp-K1
 for qemu-trivial@nongnu.org; Fri, 28 Aug 2020 05:09:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55035
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kBaOR-0002Ox-Qb
 for qemu-trivial@nongnu.org; Fri, 28 Aug 2020 05:09:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598605794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=quwABx0Fo6f1jKo3zGWrVxb+C7c3VPi5/w0oHKS2yNc=;
 b=KW95Z3oYUCl3RQHtMiCag+V2sJfabLKqvUHRwRxrdd/9h6iYsV6kXilMymrn9q7QGEsGrq
 PlLX3TfrYEIcPcP7IsQPFeqDmPpo0A/iOJmJ9WCkdwlQddNSH+dv/IFVX6+d+wX4EVCRDK
 /eF0X/VLrFkZVVnXP1yqLcDGQCfSt/A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-smyvQdkPPnSaFt6HkFOkLg-1; Fri, 28 Aug 2020 05:09:52 -0400
X-MC-Unique: smyvQdkPPnSaFt6HkFOkLg-1
Received: by mail-wr1-f71.google.com with SMTP id z1so204084wrn.18
 for <qemu-trivial@nongnu.org>; Fri, 28 Aug 2020 02:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=J5v3Ti6swFBgpT18Yym5OHIK3PkjljTxnSeQWNfDM6Q=;
 b=OcSn7uzqlxhTNfMIsNBCJuQrArpQmBcXnBknMzpmY9/k0eK0zYz2qVMg2StT+c8iuG
 UxDe2zd67E+6dpJAw0Bsz1B3vOZFFwRv9AlrfEvXaj+E3FQcoFtD70dLs+5OcwJyYg1X
 4+4I7HPTA8/vmEnAFvcIYohDEa+0KXSn5axPW8AamcolGo6WQrEuN/6zFv4jW/+enFR6
 XqthCyfGWjJsT+oFR/L66+DH2F7DJXhKeUPZ7bAk38VFxBW5tP5VtXiEzFXTAN0Vjhen
 aAjaQ4gjM7dz0CfPUiKD73BAfS4Mb93CqXzCZIu8hzxySNNULtDY6BBINgVXObZdbaeO
 3pWg==
X-Gm-Message-State: AOAM5322DeYwqpjFFye6j6IG5g+vAjZT6uv/uY/JAPmz7Kh0/q1A23is
 otZUa+8lefL+QUb2b6uryijDGE8C1rZGKWjBGteDfpYjcgoM0PFimiBf1x3+O+f8trd0xcgPKjY
 i6GDwNriYDZFCjo5f8Q==
X-Received: by 2002:a5d:544a:: with SMTP id w10mr558613wrv.317.1598605791427; 
 Fri, 28 Aug 2020 02:09:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxdtRQHYIsImYUVCEdLRDYMfDUg7MVPtmviXLbfXcg8qcGx9DScvNaml4t2Pk1WGM+/2unvg==
X-Received: by 2002:a5d:544a:: with SMTP id w10mr558588wrv.317.1598605791160; 
 Fri, 28 Aug 2020 02:09:51 -0700 (PDT)
Received: from steredhat ([5.170.38.42])
 by smtp.gmail.com with ESMTPSA id y16sm842548wrr.83.2020.08.28.02.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 02:09:50 -0700 (PDT)
Date: Fri, 28 Aug 2020 11:09:47 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Li Zhijian <lizhijian@cn.fujitsu.com>,
 qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Zhang Chen <chen.zhang@intel.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 0/2] util/hexdump: Cleanup qemu_hexdump()
Message-ID: <20200828090947.k7enk535sce64h4h@steredhat>
References: <20200822180950.1343963-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200822180950.1343963-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 04:08:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 28 Aug 2020 09:09:58 -0000

On Sat, Aug 22, 2020 at 08:09:48PM +0200, Philippe Mathieu-Daudé wrote:
> - Pass const void* buffer
> - Reorder arguments
> 
> Supersedes: <20200822150457.1322519-1-f4bug@amsat.org>
> 
> Philippe Mathieu-Daudé (2):
>   util/hexdump: Convert to take a void pointer argument
>   util/hexdump: Reorder qemu_hexdump() arguments
> 
>  include/qemu-common.h    |  3 ++-
>  hw/dma/xlnx_dpdma.c      |  2 +-
>  hw/net/fsl_etsec/etsec.c |  2 +-
>  hw/net/fsl_etsec/rings.c |  2 +-
>  hw/sd/sd.c               |  2 +-
>  hw/usb/redirect.c        |  2 +-
>  net/colo-compare.c       | 24 ++++++++++++------------
>  net/net.c                |  2 +-
>  util/hexdump.c           |  4 +++-
>  util/iov.c               |  2 +-
>  10 files changed, 24 insertions(+), 21 deletions(-)
> 
> -- 
> 2.26.2
> 
> 

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


