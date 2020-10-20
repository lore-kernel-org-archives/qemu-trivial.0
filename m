Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUreP-00073z-4h
	for mharc-qemu-trivial@gnu.org; Tue, 20 Oct 2020 09:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kUreK-0006xH-MX
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 09:26:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kUreI-0000Ob-7n
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 09:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603200356;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=UlDK1olgJUApIwQTgWSVFA6CQ9RzT4SJkpi8TsZ/nWA=;
 b=NnfmuRZsEw24UXr6GpE/piovjbXd7zLgbMtB4ABDcSN4dh9+jyASacJIUE3bETo+Vo5ZYZ
 fNCz6BTW/0C6jG4rpoWsM6mhplENK/N4KFsLaugeO7MGEo560Y4IroHBMr3eEVenhOyFrE
 SwYIMfWsn5sso6wfCYJq1tDC+KY8oXE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-wH8kyvkHMtKUrwSvz4fBWg-1; Tue, 20 Oct 2020 09:25:54 -0400
X-MC-Unique: wH8kyvkHMtKUrwSvz4fBWg-1
Received: by mail-wm1-f70.google.com with SMTP id f2so396069wml.6
 for <qemu-trivial@nongnu.org>; Tue, 20 Oct 2020 06:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=UlDK1olgJUApIwQTgWSVFA6CQ9RzT4SJkpi8TsZ/nWA=;
 b=Rq6+Kx55TG9xCEuWC0GDJMpjeAKW9W9d3E6N1u2gCcywS1MU+OyKThm94NGAMpM/Qb
 IBMK/Ka63essObEkkY9D7TBo7Qh9a6TmMqAmD495uk2thMhYCAWflmdR1po1zM49bXRW
 ZKKx4CBAJ0Fz2Miad64PGrp+hOE/3S4sEWdomSrtz0FzCTq+0f/A15apfDijRrLM6Vc3
 xHcTfcb/pCg5lLxoC/dI+M590P4AVDHr+Zr5NF3UYE5lFg6uBqRwe7D8wrPutKInFNil
 REcIQyqIG8nxUU67GU9DXDTSR8hT4R0zrO08E0hvfCkN7bYNDCr8oCadcWObSNHuoM+9
 R2Cg==
X-Gm-Message-State: AOAM533u0NTJ3Bp32HP4gMaEBw0fE2UleVqQnmcgwQlQc9CRzQ5nKRRP
 FzgVptJKGQKXFZDtrchDQsJT0/91KEFaDuY1BCZOKKepK5g0drAwjHoEbvgdhtouyHHc72VEwOE
 mpTNsEehrG1C5nspjEw==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr3023060wmp.187.1603200353249; 
 Tue, 20 Oct 2020 06:25:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEQuuG5670QZuuWsE/1fLsUk6TZfYXbE+bXjgp9UEaso5Fx8r7shZuum7wxvFAiN61bGqAWw==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr3023039wmp.187.1603200352973; 
 Tue, 20 Oct 2020 06:25:52 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id 133sm1856765wmb.2.2020.10.20.06.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 06:25:52 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Bihong Yu <yubihong@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, <dgilbert@redhat.com>,
 <alex.chen@huawei.com>, <wanghao232@huawei.com>, <zhengchuan@huawei.com>,
 <armbru@redhat.com>
Subject: Re: [PATCH v3 2/8] migration: Don't use '#' flag of printf format
In-Reply-To: <1603163448-27122-3-git-send-email-yubihong@huawei.com> (Bihong
 Yu's message of "Tue, 20 Oct 2020 11:10:42 +0800")
References: <1603163448-27122-1-git-send-email-yubihong@huawei.com>
 <1603163448-27122-3-git-send-email-yubihong@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Tue, 20 Oct 2020 15:25:51 +0200
Message-ID: <87sga9c9ls.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:15:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 20 Oct 2020 13:26:01 -0000

Bihong Yu <yubihong@huawei.com> wrote:
> Signed-off-by: Bihong Yu <yubihong@huawei.com>
> Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  migration/block.c | 2 +-
>  migration/ram.c   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Juan Quintela <quintela@redhat.com>


