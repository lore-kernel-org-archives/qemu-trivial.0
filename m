Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qoix7-0008U4-PG
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2023 07:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qoiwy-0008Nj-Nk
 for qemu-trivial@nongnu.org; Fri, 06 Oct 2023 07:24:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qoiws-0003jJ-6q
 for qemu-trivial@nongnu.org; Fri, 06 Oct 2023 07:24:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696591483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6e/EMotEwSXSOiI2L39PVpR+XEjPqZDPJaQ//0h1Ctg=;
 b=H9RW3dJuvlnLXXVqyDPi1H2l+qEdjW5FiGCICOyzsykAXF6UW7E7LsT9TVkxjs+/5+yxN1
 li1zHOZTicrNwUz4Q4HUo3goC5FumefEAVE6z6s6ZoSTCQhVO1mH3NEEHId81yEL4dWTFS
 8yj/MJiJikhZa21C55XqDuqcn/0uTW0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-Q8dsaNW3OLSRnxOfFfDkHw-1; Fri, 06 Oct 2023 07:24:42 -0400
X-MC-Unique: Q8dsaNW3OLSRnxOfFfDkHw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-327cd5c7406so1316099f8f.3
 for <qemu-trivial@nongnu.org>; Fri, 06 Oct 2023 04:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696591481; x=1697196281;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6e/EMotEwSXSOiI2L39PVpR+XEjPqZDPJaQ//0h1Ctg=;
 b=N94zKLZcx8hriUBjHTNxi5q9QXaqL9ICd29GTjF+1QtAnP5cx9pM1umG+srz0w2FIh
 sIjWdYtw5OpJsEnNtNXEL2KG5D30QTfGUDi8fDHthCdkhA8EmZHJYXIuNipLpnpgwRxF
 XgIoB0Aq1NbN7C/FIIhbaGjbtFmqfUtAnh+JCYosNKH62IGhinCsT9t7WPk0syPtKI2v
 dsVySpOS5eKguj7KqtGMaa/2cNgEPL7wAtRnwrX/N9mJwBee1tq9YCA9ZmH/SbilUq1l
 2ZOHdYfSNPmZB+kJShh18RbUf0YD0tKc0ZGmAcJDAqTIafCl9V7X/hKd/UivAxIAqQD/
 ldyg==
X-Gm-Message-State: AOJu0Yz6Ed17/0mdpCgSLxOqgOV7oVTfMSBULodXXD1j1HPHaU4fSfc4
 fYhs3pSr8gTygJWWAOmSRrUW7j5G05ClHhlfqsoH92SFSYCi+XMjFiU7ZEiPDSegTFjq8leFKwu
 MyjWz6FZm95rgyArLJw==
X-Received: by 2002:a5d:61ce:0:b0:31a:d8c0:cb8b with SMTP id
 q14-20020a5d61ce000000b0031ad8c0cb8bmr7505646wrv.25.1696591480946; 
 Fri, 06 Oct 2023 04:24:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEirOZC5ZmGtl/95doCwj7iGowOMti0i4kcOZDvVzX3lWoa2NmFNWD4a9L/w4p7TC44/RyTbQ==
X-Received: by 2002:a5d:61ce:0:b0:31a:d8c0:cb8b with SMTP id
 q14-20020a5d61ce000000b0031ad8c0cb8bmr7505632wrv.25.1696591480597; 
 Fri, 06 Oct 2023 04:24:40 -0700 (PDT)
Received: from redhat.com ([2a02:14f:170:ca0a:84b4:d350:99ea:3666])
 by smtp.gmail.com with ESMTPSA id
 e14-20020adffd0e000000b00315af025098sm1442485wrr.46.2023.10.06.04.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 04:24:38 -0700 (PDT)
Date: Fri, 6 Oct 2023 07:24:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/virtio/vhost: Silence compiler warnings in vhost code
 when using -Wshadow
Message-ID: <20231006072416-mutt-send-email-mst@kernel.org>
References: <20231004114809.105672-1-thuth@redhat.com>
 <18f1faab-71f4-4dbd-a319-fcd65721f58b@tls.msk.ru>
 <87h6n4p1ts.fsf@pond.sub.org>
 <29a2a188-ec5b-452f-be63-92e8f0ec7110@tls.msk.ru>
MIME-Version: 1.0
In-Reply-To: <29a2a188-ec5b-452f-be63-92e8f0ec7110@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 06 Oct 2023 11:25:00 -0000

On Fri, Oct 06, 2023 at 01:45:51PM +0300, Michael Tokarev wrote:
> 06.10.2023 11:55, Markus Armbruster пишет:
> > Michael Tokarev <mjt@tls.msk.ru> writes:
> > 
> > > Applied to my trivial-patches tree, thanks!
> > > 
> > > Marcus, you picked up previous patches of this theme, --
> > > you can continue this tradition if you like :)
> > 
> > I intend to post a pull request for the -Wshadow patches that have
> > R-bys.  I'm also tracking the unreviewed ones, and hope they get
> > reviewed.
> 
> Ahh, ok.
> 
> I've added my own R-bys for the ones I picked up, and for this one
> by Thomas too:
> 
> Reviewed-By: Michael Tokarev <mjt@tls.msk.ru>
> 
> /mjt

it would be better to deal with all of them in one place tbh.

-- 
MST


