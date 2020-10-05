Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPUjv-0002WF-Qt
	for mharc-qemu-trivial@gnu.org; Mon, 05 Oct 2020 13:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kPUju-0002W3-O0
 for qemu-trivial@nongnu.org; Mon, 05 Oct 2020 13:57:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kPUjq-0001Db-V1
 for qemu-trivial@nongnu.org; Mon, 05 Oct 2020 13:57:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601920649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ze0C/DVcbiRiaHhfa4sNq78h7LWTBiuGCch2lXCrZBE=;
 b=azlWjAAkcNjfTMzhPWTt9ze//9o81XVZtNVIoXeZOD/UOO9/r/bB3X8UVeAvT3KErnjTDI
 Ex0YhAKzTHW2uFh6v1NRD82dSYlRR+XZi/MucHvVdjNmP0lrQcEPErmHt4VBRQDsrkEMuX
 NuG+7QmOsEWM1gmofaHQfYQcxgAYFWA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-zquqRLwnM9qnhoa38RNxHQ-1; Mon, 05 Oct 2020 13:57:27 -0400
X-MC-Unique: zquqRLwnM9qnhoa38RNxHQ-1
Received: by mail-wr1-f70.google.com with SMTP id d13so4289201wrr.23
 for <qemu-trivial@nongnu.org>; Mon, 05 Oct 2020 10:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=78pmVB4h/dcMlGig4farxYjPAwUL5UZuJXAWiwPuVqg=;
 b=QihqtUhQzgdpYcKea3SYrwsQG0eqjq8Y2OwH3nswR9jQMcLHK7gt1nq2T2OTaMKTaB
 xBRq2OW3cX56VosZD8ZOM8I4XZPLz/HH92YNe893gyrDm+s0PesJm0kC9euJJs5tzuAO
 mwbfW/JAIy8bw33yn9X8tFD9WrxL9B5GYPTFC0fxbinj5rU2EnrsKj7zQ896pwxH+E9v
 f8TW4kx2zRbqReLyvbQE3lK7F/Gg1pkAxOjn51THPdDxms4TnYrbdmf63G7W0qKwxZDV
 S5DsCENqprpB+qSm7D6FX3q8Hrl1MJj3DEzejFDIg7zwgose31DvUZPRT5Cr3RSii1Sr
 BxCg==
X-Gm-Message-State: AOAM5319tpr8zFHzxPIrKbr/VFKUD5kpOiLhST7/O7Rnt5G1NXhKNjOZ
 juPISzP/ZbuMqCYVgLkdSGcWGB95gXOEEcqMN7o7hIDu0P8XL0tvkOMQ6pf0W/NFiYHVi4PkrrI
 27N2cWffN3LsCltKsRw==
X-Received: by 2002:a1c:ed09:: with SMTP id l9mr540721wmh.89.1601920646242;
 Mon, 05 Oct 2020 10:57:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgJAu0tJ5FggTGjnAv/rZ1SgBnSG3NxbQrK24dbtbT81cM+nlMV7XqA+JyC2cNn+WeiWd6kA==
X-Received: by 2002:a1c:ed09:: with SMTP id l9mr540702wmh.89.1601920645973;
 Mon, 05 Oct 2020 10:57:25 -0700 (PDT)
Received: from redhat.com (bzq-79-179-71-128.red.bezeqint.net. [79.179.71.128])
 by smtp.gmail.com with ESMTPSA id i33sm954876wri.79.2020.10.05.10.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 10:57:25 -0700 (PDT)
Date: Mon, 5 Oct 2020 13:57:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] softmmu/memory: Log invalid memory accesses
Message-ID: <20201005135652-mutt-send-email-mst@kernel.org>
References: <20201005152725.2143444-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201005152725.2143444-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 01:25:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 05 Oct 2020 17:57:35 -0000

On Mon, Oct 05, 2020 at 05:27:25PM +0200, Philippe Mathieu-Daudé wrote:
> Log invalid memory accesses with as GUEST_ERROR.
> 
> This is particularly useful since commit 5d971f9e67 which reverted
> ("memory: accept mismatching sizes in memory_region_access_valid").
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Paolo's tree I assume?

> ---
>  softmmu/memory.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index fa280a19f7..403ff3abc9 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -14,6 +14,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/log.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
>  #include "exec/memory.h"
> @@ -1353,10 +1354,18 @@ bool memory_region_access_valid(MemoryRegion *mr,
>  {
>      if (mr->ops->valid.accepts
>          && !mr->ops->valid.accepts(mr->opaque, addr, size, is_write, attrs)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "Invalid access at addr "
> +                                       "0x%" HWADDR_PRIX ", size %u, "
> +                                       "region '%s', reason: rejected\n",
> +                      addr, size, memory_region_name(mr));
>          return false;
>      }
>  
>      if (!mr->ops->valid.unaligned && (addr & (size - 1))) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "Invalid access at addr "
> +                                       "0x%" HWADDR_PRIX ", size %u, "
> +                                       "region '%s', reason: unaligned\n",
> +                      addr, size, memory_region_name(mr));
>          return false;
>      }
>  
> @@ -1367,6 +1376,13 @@ bool memory_region_access_valid(MemoryRegion *mr,
>  
>      if (size > mr->ops->valid.max_access_size
>          || size < mr->ops->valid.min_access_size) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "Invalid access at addr "
> +                                       "0x%" HWADDR_PRIX ", size %u, "
> +                                       "region '%s', reason: invalid size "
> +                                       "(min:%u max:%u)\n",
> +                      addr, size, memory_region_name(mr),
> +                      mr->ops->valid.min_access_size,
> +                      mr->ops->valid.max_access_size);
>          return false;
>      }
>      return true;
> -- 
> 2.26.2


