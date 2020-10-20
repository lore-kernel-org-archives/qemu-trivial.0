Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUrnB-0007fO-8n
	for mharc-qemu-trivial@gnu.org; Tue, 20 Oct 2020 09:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kUrn9-0007dU-Lu
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 09:35:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kUrn7-0001Wu-TJ
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 09:35:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603200905;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=TCQt3FONooNUrwcwJvSPeVrxwiAZEYXC2/Olx6YiSrw=;
 b=EZslH6L8AX6+JmrvSy0uIMDZAA87zR/RHfHIMFJ5SVxRiON2hbn8QIs0Avc/gZNlHYrbCB
 I+pIiv0V1MBToSnXH3xbjll6oHge1Pha5bWOGsg8pHZEk1Qs+f+HmU9KLe1ldh11XzJzD2
 JEfXl33vrCOhGW7gFlIcUgeM7aZHeXU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-nvmN6TqiMoqrt0SWIJn2sA-1; Tue, 20 Oct 2020 09:35:01 -0400
X-MC-Unique: nvmN6TqiMoqrt0SWIJn2sA-1
Received: by mail-wm1-f70.google.com with SMTP id u5so406680wme.3
 for <qemu-trivial@nongnu.org>; Tue, 20 Oct 2020 06:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=TCQt3FONooNUrwcwJvSPeVrxwiAZEYXC2/Olx6YiSrw=;
 b=tviqD1D/lV1wL/oPOIh5ASe+0ZrMpKc2x8cN0p6Z1kWatuOstVhZ2I/nINoKEAsFcM
 t0NrMa4oHb+n36Ex8wHkBb4WOAwFhxf3/ihckAGYZlPdksg8c5Ip4evjAnTK7QcdoaIT
 pqKu0eBwlvwiCqNtlaOEbwveCNkFrRKhXDuqxDip8gfL0gz8z082NJ6HqJJMhg1fzFzd
 G/YZJuzGstqiPretbAZN+VQWISDsViXvxKCi4mwfomQnjLp9SkGUpqSQbDiLDXPyFdce
 UQh4Amg4SuSgl7LAMjSsI0gxwmEQ1LcI7yUlIpHpHGgClGAEWpVRAeP028qhFXd+K/et
 nqng==
X-Gm-Message-State: AOAM531MlRD0o1q1Yru1JcmT42xlCksCi4mcDyXrm9wFv5UowH/bgQjz
 4jkE0th/ds7J/EAQaXwxrJmvBV+yeseiFWc/Z3D3hiUwgD5GOiPPLmXsatSB7ICqnOieMnS/Cqu
 E9LU7VdRzo8x2MlCgjA==
X-Received: by 2002:adf:f50d:: with SMTP id q13mr3481805wro.215.1603200900556; 
 Tue, 20 Oct 2020 06:35:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzM/GnDCQ4m7b+MpWPAPM3oAsSrN8MQPR75P2R/SICDSlFYJ9eheUW4NH5XEsVxQ9KelXuYIA==
X-Received: by 2002:adf:f50d:: with SMTP id q13mr3481771wro.215.1603200900290; 
 Tue, 20 Oct 2020 06:35:00 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id 4sm2844570wrp.58.2020.10.20.06.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 06:34:59 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Bihong Yu <yubihong@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, <dgilbert@redhat.com>,
 <alex.chen@huawei.com>, <wanghao232@huawei.com>, <zhengchuan@huawei.com>,
 <armbru@redhat.com>
Subject: Re: [PATCH v3 1/8] migration: Do not use C99 // comments
In-Reply-To: <1603163448-27122-2-git-send-email-yubihong@huawei.com> (Bihong
 Yu's message of "Tue, 20 Oct 2020 11:10:41 +0800")
References: <1603163448-27122-1-git-send-email-yubihong@huawei.com>
 <1603163448-27122-2-git-send-email-yubihong@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Tue, 20 Oct 2020 15:34:58 +0200
Message-ID: <87o8kxc96l.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:16:16
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
X-List-Received-Date: Tue, 20 Oct 2020 13:35:08 -0000

Bihong Yu <yubihong@huawei.com> wrote:
> Signed-off-by: Bihong Yu <yubihong@huawei.com>
> Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  migration/block.c | 2 +-
>  migration/rdma.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Juan Quintela <quintela@redhat.com>


