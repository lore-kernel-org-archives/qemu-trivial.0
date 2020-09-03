Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kDpqn-0004yM-OM
	for mharc-qemu-trivial@gnu.org; Thu, 03 Sep 2020 10:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDpqm-0004xn-I9
 for qemu-trivial@nongnu.org; Thu, 03 Sep 2020 10:04:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDpqk-00049m-Tq
 for qemu-trivial@nongnu.org; Thu, 03 Sep 2020 10:04:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599141866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KdQFCDIP0td3Ke7dofGMgnpeuH8euYaUWYxZlPQaTSQ=;
 b=GexLvQ7vcRxtaR8uPVjOPYTtcfB/x+XuadHlwlB/KqqqjALFLoBD4yTJGs29GYi6Cl7v4g
 OEhQCWYGNqXphmS3hlvwmIXoTjy1dcu1mditlrYx6a8N8NpZR7wad6cM3eKuODmoARtIsG
 XgvhWeQe6AlFtka3c8QnyL8R49aTJSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-MZw3ByHdNduATz1d207kTg-1; Thu, 03 Sep 2020 10:04:19 -0400
X-MC-Unique: MZw3ByHdNduATz1d207kTg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8CBE18BA285;
 Thu,  3 Sep 2020 14:04:17 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-114-10.ams2.redhat.com [10.36.114.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E2A95C1C2;
 Thu,  3 Sep 2020 14:04:06 +0000 (UTC)
Subject: Re: [PATCH 2/2] hw/timer/hpet: Fix DPRINTF format string
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20200903134506.440082-1-philmd@redhat.com>
 <20200903134506.440082-3-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <12e0c867-4d8d-43ef-1ba1-6696619947d0@redhat.com>
Date: Thu, 3 Sep 2020 16:04:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200903134506.440082-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 04:23:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.403, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 03 Sep 2020 14:04:28 -0000

On 03/09/2020 15.45, Philippe Mathieu-Daudé wrote:
> Fix building with HPET_DEBUG enabled:
> 
>   hw/timer/hpet.c:512:73: error: format specifies type 'unsigned int' but the argument has type 'uint64_t' (aka 'unsigned long') [-Werror,-Wformat]
>       DPRINTF("qemu: Enter hpet_ram_writel at %" PRIx64 " = %#x\n", addr, value);
>                                                             ~~~           ^~~~~
>                                                             %#lx
>   hw/timer/hpet.c:655:21: error: format specifies type 'unsigned int' but the argument has type 'uint64_t' (aka 'unsigned long') [-Werror,-Wformat]
>                       value, s->hpet_counter);
>                       ^~~~~
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Keep trace-events conversion as ByteSizeTask.
> ---
>  hw/timer/hpet.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
> index b683f64f1d3..8115e42cff3 100644
> --- a/hw/timer/hpet.c
> +++ b/hw/timer/hpet.c
> @@ -495,7 +495,7 @@ static void hpet_ram_write(void *opaque, hwaddr addr,
>      HPETState *s = opaque;
>      uint64_t old_val, new_val, val, index;
>  
> -    DPRINTF("qemu: Enter hpet_ram_writel at %" PRIx64 " = %#x\n", addr, value);
> +    DPRINTF("qemu: Enter hpet_ram_writel at 0x%" HWADDR_PRIx " = 0x%#"PRIx64"\n", addr, value);
>      index = addr;
>      old_val = hpet_ram_read(opaque, addr, 4);
>      new_val = value;
> @@ -637,7 +637,7 @@ static void hpet_ram_write(void *opaque, hwaddr addr,
>              }
>              s->hpet_counter =
>                  (s->hpet_counter & 0xffffffff00000000ULL) | value;
> -            DPRINTF("qemu: HPET counter written. ctr = %#x -> %" PRIx64 "\n",
> +            DPRINTF("qemu: HPET counter written. ctr = %#" PRIx64 " -> %" PRIx64 "\n",
>                      value, s->hpet_counter);
>              break;
>          case HPET_COUNTER + 4:
> @@ -646,7 +646,7 @@ static void hpet_ram_write(void *opaque, hwaddr addr,
>              }
>              s->hpet_counter =
>                  (s->hpet_counter & 0xffffffffULL) | (((uint64_t)value) << 32);
> -            DPRINTF("qemu: HPET counter + 4 written. ctr = %#x -> %" PRIx64 "\n",
> +            DPRINTF("qemu: HPET counter + 4 written. ctr = %#" PRIx64 " -> %" PRIx64 "\n",
>                      value, s->hpet_counter);
>              break;
>          default:
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


