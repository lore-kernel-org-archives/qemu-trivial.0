Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZves-0008Fu-F2
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2020 07:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kZvep-0008Cn-Mp
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 07:43:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kZveo-0007kc-11
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 07:43:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604407401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rn9gc3ibgYP5yyzdUD+0i+5y3fmAU2EWC7mUiX0WCqI=;
 b=Wzf+H4lZa1lkmJqDetDODNnwvYKABhZ68kFQwcupS04cVmTJ4nKEom4S3lVHGR3yxWhzeO
 lUj9+tAW1dT5YanVgS50h/HEUER8fZnyCGECMtyN+QcUA5sZRF+3oyvHvZP21jAdRhSDfE
 fwvUyQWFRe9t4Ump5MZXmzTw1mmCK8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-JUVbyhckPJ2a6iBNBY_7fQ-1; Tue, 03 Nov 2020 07:43:17 -0500
X-MC-Unique: JUVbyhckPJ2a6iBNBY_7fQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40C561009E25;
 Tue,  3 Nov 2020 12:43:16 +0000 (UTC)
Received: from work-vm (ovpn-115-84.ams2.redhat.com [10.36.115.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFEE060BF1;
 Tue,  3 Nov 2020 12:42:58 +0000 (UTC)
Date: Tue, 3 Nov 2020 12:42:55 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dov Murik <dovmurik@linux.vnet.ibm.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH-for-5.2 1/4] hw/display/cirrus_vga: Remove debugging code
 commented out
Message-ID: <20201103124255.GE3566@work-vm>
References: <20201103112558.2554390-1-philmd@redhat.com>
 <20201103112558.2554390-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201103112558.2554390-2-philmd@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 03 Nov 2020 12:43:28 -0000

* Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> Commit ec87f206d70 ("cirrus: replace debug printf with trace points")
> forgot to remove this code once replaced. Do it now.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hw/display/cirrus_vga.c | 18 ------------------
>  1 file changed, 18 deletions(-)
> 
> diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
> index 722b9e7004c..e14096deb46 100644
> --- a/hw/display/cirrus_vga.c
> +++ b/hw/display/cirrus_vga.c
> @@ -2532,9 +2532,6 @@ static uint64_t cirrus_vga_ioport_read(void *opaque, hwaddr addr,
>  	case 0x3c5:
>  	    val = cirrus_vga_read_sr(c);
>              break;
> -#ifdef DEBUG_VGA_REG
> -	    printf("vga: read SR%x = 0x%02x\n", s->sr_index, val);
> -#endif
>  	    break;
>  	case 0x3c6:
>  	    val = cirrus_read_hidden_dac(c);
> @@ -2560,9 +2557,6 @@ static uint64_t cirrus_vga_ioport_read(void *opaque, hwaddr addr,
>  	    break;
>  	case 0x3cf:
>  	    val = cirrus_vga_read_gr(c, s->gr_index);
> -#ifdef DEBUG_VGA_REG
> -	    printf("vga: read GR%x = 0x%02x\n", s->gr_index, val);
> -#endif
>  	    break;
>  	case 0x3b4:
>  	case 0x3d4:
> @@ -2571,9 +2565,6 @@ static uint64_t cirrus_vga_ioport_read(void *opaque, hwaddr addr,
>  	case 0x3b5:
>  	case 0x3d5:
>              val = cirrus_vga_read_cr(c, s->cr_index);
> -#ifdef DEBUG_VGA_REG
> -	    printf("vga: read CR%x = 0x%02x\n", s->cr_index, val);
> -#endif
>  	    break;
>  	case 0x3ba:
>  	case 0x3da:
> @@ -2645,9 +2636,6 @@ static void cirrus_vga_ioport_write(void *opaque, hwaddr addr, uint64_t val,
>  	s->sr_index = val;
>  	break;
>      case 0x3c5:
> -#ifdef DEBUG_VGA_REG
> -	printf("vga: write SR%x = 0x%02" PRIu64 "\n", s->sr_index, val);
> -#endif
>  	cirrus_vga_write_sr(c, val);
>          break;
>      case 0x3c6:
> @@ -2670,9 +2658,6 @@ static void cirrus_vga_ioport_write(void *opaque, hwaddr addr, uint64_t val,
>  	s->gr_index = val;
>  	break;
>      case 0x3cf:
> -#ifdef DEBUG_VGA_REG
> -	printf("vga: write GR%x = 0x%02" PRIu64 "\n", s->gr_index, val);
> -#endif
>  	cirrus_vga_write_gr(c, s->gr_index, val);
>  	break;
>      case 0x3b4:
> @@ -2681,9 +2666,6 @@ static void cirrus_vga_ioport_write(void *opaque, hwaddr addr, uint64_t val,
>  	break;
>      case 0x3b5:
>      case 0x3d5:
> -#ifdef DEBUG_VGA_REG
> -	printf("vga: write CR%x = 0x%02"PRIu64"\n", s->cr_index, val);
> -#endif
>  	cirrus_vga_write_cr(c, val);
>  	break;
>      case 0x3ba:
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


