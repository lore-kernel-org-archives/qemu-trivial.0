Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rjfVN-0001OA-4l
	for mharc-qemu-trivial@gnu.org; Mon, 11 Mar 2024 09:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1rjfVE-0001K5-Gw
 for qemu-trivial@nongnu.org; Mon, 11 Mar 2024 09:15:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1rjfVB-0003ET-GM
 for qemu-trivial@nongnu.org; Mon, 11 Mar 2024 09:15:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710162935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Avp14Xh3earAWU8RRCCJSsK7gNBFC151UXNJX1hknBw=;
 b=QYFigreostNpKLkKPZS6gD12QssgCttyLwwMl7tSx+iNA5ajaRFD0uhoSryo62kE/zewjE
 uPko2193Pgd2ef2Dnjcq7okBeDuBYI1FtFOZYCRd9Plakz767p2CcDTraYrg+Lv52OWESY
 JG5RQzMtPujJ/rNlGvkCz7adhaEyPzg=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-CRc39FNUPNKtkhmLMTGiRw-1; Mon, 11 Mar 2024 09:15:22 -0400
X-MC-Unique: CRc39FNUPNKtkhmLMTGiRw-1
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-7dc03020e3bso121629241.0
 for <qemu-trivial@nongnu.org>; Mon, 11 Mar 2024 06:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710162921; x=1710767721;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Avp14Xh3earAWU8RRCCJSsK7gNBFC151UXNJX1hknBw=;
 b=rSXH8Idw1Sq56I3/HT0PblwpWNymjooxx+rXnq9TGauNePRULaAwpBEMCrf/1d+9WG
 GvFKoM/Wtc8KmxN2ZDSZXdxpM5Evtg7B0Czb9wuQI4G7nfcPHUt3Zose9DVjObgZsrqj
 e1LAYwdrlDEwJDl/ZrFgN0YbE6o+jwqdjclkrycSFjVvFdj0oYERMl8e5DKmMYo9nb11
 yCBgtG55fuJu/59hFZMWl+DSl1sdwYI+mcnVG+tdqgnvtyoMLC0zcBszg4keLMskw9HW
 EDvTJ3zS9p0Bt2ll4J4krHasoMqRXUv1KkKCwqhtB40mjh0/JV7lbVEMrz1xanJIpXwr
 yPSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsX2plqX3TMB/otB5nlM6LtvB1tDRHqKOo7OjzhqzEHCBxvUpqhIQK4R91V8CUhbLp55g0jfL/XiQL8/VsMDUbjSSJT0YFBA==
X-Gm-Message-State: AOJu0YwEYYmDt3G6AsHgar41OP+uWWb0PFaOButckSqkTyHeI/TYoHol
 rvgr4Itm8X9fjGwLnTUQ/2HTodhYNukEaUltm+QzRs5esiMrOm12cpUwnsucFtdWRaB/UaBf0z5
 DSuJ2w41EnGMm8A4ouJPD2rGU0Osny5XQXqvLfgOAdOtbqbUQFmbsZXo=
X-Received: by 2002:a05:6122:2654:b0:4c8:e3a0:6631 with SMTP id
 dr20-20020a056122265400b004c8e3a06631mr2685560vkb.1.1710162921602; 
 Mon, 11 Mar 2024 06:15:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtCLrJKIS1Wi6/y/EWPiHE4VW0pE6ZdoIfGUBYvPosRcJOxxDd5umEbSrEjqft++NxGufLug==
X-Received: by 2002:a05:6122:2654:b0:4c8:e3a0:6631 with SMTP id
 dr20-20020a056122265400b004c8e3a06631mr2685520vkb.1.1710162921179; 
 Mon, 11 Mar 2024 06:15:21 -0700 (PDT)
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com.
 [99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 fp4-20020a0561223a0400b004d13bb918c4sm597683vkb.33.2024.03.11.06.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 06:15:20 -0700 (PDT)
Date: Mon, 11 Mar 2024 09:15:19 -0400
From: Peter Xu <peterx@redhat.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Fabiano Rosas <farosas@suse.de>
Subject: Re: [PATCH] migration: Fix format in error message
Message-ID: <Ze8D5xYwXfTNHCob@x1n>
References: <20240311123439.16844-1-anthony.perard@citrix.com>
MIME-Version: 1.0
In-Reply-To: <20240311123439.16844-1-anthony.perard@citrix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.029,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 11 Mar 2024 13:15:47 -0000

On Mon, Mar 11, 2024 at 12:34:39PM +0000, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@citrix.com>
> 
> In file_write_ramblock_iov(), "offset" is "uintptr_t" and not
> "ram_addr_t". While usually they are both equivalent, this is not the
> case with CONFIG_XEN_BACKEND.
> 
> Use the right format. This will fix build on 32-bit.
> 
> Fixes: f427d90b9898 ("migration/multifd: Support outgoing mapped-ram stream format")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Rather than waiting for a trivial pull, I'll queue this for 9.0.  Thanks.

-- 
Peter Xu


