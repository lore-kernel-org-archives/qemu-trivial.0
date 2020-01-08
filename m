Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipAxN-0002DJ-GQ
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jan 2020 08:01:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50758)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1ipAxK-0002BG-CA
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 08:01:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ipAxI-0002Hu-Ld
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 08:01:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51172
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1ipAxI-0002GM-GZ
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 08:01:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578488459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DuKdJ5EMmauu8fuUdgvvxNkg6Zi25dABtjs1O3aj4xc=;
 b=AxRCSRSKJWkY/wftaazADNBprjTH+GIi41IPEmazzRqrh81B5rojIwZxgRgNVBpmw5U1q0
 nXROj+ZWbSKw4QFWFyXL/+LXvLOzTFteRrblpi4lyoJTTpsV66vhQMOuzNZA2pUmvotDaR
 P+P5Uj8wrBwgdrl/HYFpvAConmGtb0c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-G7nXX5-4Mb29OmD5oIQwKw-1; Wed, 08 Jan 2020 08:00:51 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2672E800D4E;
 Wed,  8 Jan 2020 13:00:50 +0000 (UTC)
Received: from gondolin (dhcp-192-245.str.redhat.com [10.33.192.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 191E460E1C;
 Wed,  8 Jan 2020 13:00:48 +0000 (UTC)
Date: Wed, 8 Jan 2020 14:00:46 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH v1 41/59] intc/s390_flic_kvm.c: remove unneeded label in
 kvm_flic_load()
Message-ID: <20200108140046.0682253d.cohuck@redhat.com>
In-Reply-To: <20200106182425.20312-42-danielhb413@gmail.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-42-danielhb413@gmail.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: G7nXX5-4Mb29OmD5oIQwKw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
X-List-Received-Date: Wed, 08 Jan 2020 13:01:03 -0000

On Mon,  6 Jan 2020 15:24:07 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> 'out' label can be replaced by 'return' with the apropriate
> value that is set by 'r' right before the jump.
> 
> Christian Borntraeger <borntraeger@de.ibm.com>

I think something went wrong here; adding some cc:s.

> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/intc/s390_flic_kvm.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/intc/s390_flic_kvm.c b/hw/intc/s390_flic_kvm.c
> index dddd33ea61..2e1e70c61d 100644
> --- a/hw/intc/s390_flic_kvm.c
> +++ b/hw/intc/s390_flic_kvm.c
> @@ -439,17 +439,14 @@ static int kvm_flic_load(QEMUFile *f, void *opaque, size_t size,
>      count = qemu_get_be64(f);
>      len = count * sizeof(struct kvm_s390_irq);
>      if (count == FLIC_FAILED) {
> -        r = -EINVAL;
> -        goto out;
> +        return -EINVAL;
>      }
>      if (count == 0) {
> -        r = 0;
> -        goto out;
> +        return 0;
>      }
>      buf = g_try_malloc0(len);
>      if (!buf) {
> -        r = -ENOMEM;
> -        goto out;
> +        return -ENOMEM;
>      }
>  
>      if (qemu_get_buffer(f, (uint8_t *) buf, len) != len) {
> @@ -460,7 +457,6 @@ static int kvm_flic_load(QEMUFile *f, void *opaque, size_t size,
>  
>  out_free:
>      g_free(buf);
> -out:
>      return r;
>  }
>  

Looks fine to me; will apply unless someone sees an issue.


