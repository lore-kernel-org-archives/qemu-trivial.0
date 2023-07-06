Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qHNk3-0006mC-TK
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jul 2023 08:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1qHNk0-0006lU-7x
 for qemu-trivial@nongnu.org; Thu, 06 Jul 2023 08:05:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1qHNjy-0005hT-KP
 for qemu-trivial@nongnu.org; Thu, 06 Jul 2023 08:05:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688645141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dpsrKkCdFTvbHEAcFl7IrATej5Z/ON7JWoq5B6JCjlY=;
 b=DC2pvxH+Olem2GTjIJFZfmlhLKnRRDHdhQAgSvRM0hXj4WcqXXyPDTa01j+9wkYpj1A2h/
 FD9E7DKyx7N07eDsoP7anhcGwhJ5Fhi1NaiwhNv8/41b6F3+bFZ1M8v4rkVMmL/eyTsflA
 7Ic9jjKGSg3kM/u6sEbRbVXmX+IzxuM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-XiU3rKNkPO6O_xnmqPZ1HQ-1; Thu, 06 Jul 2023 08:05:39 -0400
X-MC-Unique: XiU3rKNkPO6O_xnmqPZ1HQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-403838e9f4dso1979451cf.1
 for <qemu-trivial@nongnu.org>; Thu, 06 Jul 2023 05:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688645139; x=1689249939;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dpsrKkCdFTvbHEAcFl7IrATej5Z/ON7JWoq5B6JCjlY=;
 b=bgEAGCp84ieBGi19vAbvuVi022QqXq5Q5mlNz+8+UhlNNdPsuIjvNFEHxsC72zl1Vs
 4F9JaRHoUrK7wCtQeO5yAMbXSag1ge5ak+tmxEbgyWmpqH4W9KBcfFv51xe+eAMMN1Dy
 E9wATo4sY7PmZfLXt2LY/6xwsmenSMnpaiJDQ9UB4MXpOTSF2DQ7600evGRj4ng7jDdK
 9DskPOYk3Y3z5uk9hNFxoKQuWAPIkoTGL0rypo+6ERlncy2sy6Z/jxTAVlixhTKdFJu7
 ZjPPK6Ed46LsCW2uK13+dL7R7MZEvLmB6r4Vr14enx34tGkrshC+2/Di1sQwvRwyukXM
 YJRA==
X-Gm-Message-State: ABy/qLbj9Eb/lPdMjtSQ0gALh1Sz3rahwzUuOZTgzjsHbQOBOsY7LQik
 qIy31FVhLbDwYTwP4dBqv+oR+Fe+RYiURM4DMcaHM8mWjJuqbGZnEwNeC/kwNzwEJA0L3F/zb6G
 LSvkRturNaEROobTgRA==
X-Received: by 2002:a05:6214:1c49:b0:635:e528:521a with SMTP id
 if9-20020a0562141c4900b00635e528521amr1586990qvb.5.1688645139189; 
 Thu, 06 Jul 2023 05:05:39 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFlsxr6GMPcji8rAk4rAan61aATxlSig5GOGe0alNSt2WYJ6xtV+YjURmZ8yc0S3BEILUT6Uw==
X-Received: by 2002:a05:6214:1c49:b0:635:e528:521a with SMTP id
 if9-20020a0562141c4900b00635e528521amr1586970qvb.5.1688645138865; 
 Thu, 06 Jul 2023 05:05:38 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com.
 [99.254.144.39]) by smtp.gmail.com with ESMTPSA id
 f3-20020a0cf3c3000000b00635ef3a34ebsm798290qvm.48.2023.07.06.05.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 05:05:38 -0700 (PDT)
Date: Thu, 6 Jul 2023 08:05:37 -0400
From: Peter Xu <peterx@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, qemu-trivial@nongnu.org
Subject: Re: [PATCH 0/2] migration: trivialities
Message-ID: <ZKauEVBEYTcRqR+p@x1n>
References: <20230706102937.82490-1-lersek@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230706102937.82490-1-lersek@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 06 Jul 2023 12:05:44 -0000

On Thu, Jul 06, 2023 at 12:29:35PM +0200, Laszlo Ersek wrote:
> SSIA; originally for RHBZ#2018404 (hence the links in the commit
> messages).
> 
> Cc: Juan Quintela <quintela@redhat.com> (maintainer:Migration)
> Cc: Leonardo Bras <leobras@redhat.com> (reviewer:Migration)
> Cc: Peter Xu <peterx@redhat.com> (reviewer:Migration)
> Cc: qemu-trivial@nongnu.org
> 
> Laszlo Ersek (2):
>   migration: factor out "resume_requested" in qmp_migrate()
>   migration: unexport migrate_fd_error()

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


