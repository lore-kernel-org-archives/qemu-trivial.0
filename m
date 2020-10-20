Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUroa-0000gm-4M
	for mharc-qemu-trivial@gnu.org; Tue, 20 Oct 2020 09:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kUroZ-0000eM-4V
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 09:36:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kUroR-0001qO-9I
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 09:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603200986;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=WNph9JNPyDlTmoFt7Hkz5LTTjWqoSXX5bPdP6enjm9E=;
 b=NI7TfV4mO4gf8WxQJ2AeezFQGIIIuVB9Edmrdr//1fvRAfyJmjXwA25Itv8rnG25KMDjjL
 6Vhu2+NJEoxVda0fuh+mYnb/VO5h4+0JvFznlc1zi2tkgh9+ZX/sxOOUEngiHQTimIjlW/
 aC6HTOdJgn6TjpUQ8ub6NqJkapv15Rg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-IFVzuc2TPPmlh8YFHh5GlA-1; Tue, 20 Oct 2020 09:36:23 -0400
X-MC-Unique: IFVzuc2TPPmlh8YFHh5GlA-1
Received: by mail-wm1-f72.google.com with SMTP id y83so406083wmc.8
 for <qemu-trivial@nongnu.org>; Tue, 20 Oct 2020 06:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=WNph9JNPyDlTmoFt7Hkz5LTTjWqoSXX5bPdP6enjm9E=;
 b=jTBBNC5n4JL+c5e+9/QLSgBXO8y9+ppxEOQ2wIfU8OuesdxfmSKOGWAcXseDk43sWH
 95njnwYQ73v/Ngl5+ZCVNFRTG4spXqk8B6PW2H0x98rQQ9PUykHdQ3+9kkWDDRCgCZ4U
 XPa8jt7Q2NM9pYOK/9hhaVbH+07jpG25LKwFRg6UHrc8lSWNnZwoGQwzvIuzkbowvQNB
 o8aK1W1hyf/i0NpIbKA9/FHIIphq4S2qJpOXoZYU0EzTmWF7U8iMf3i6pJcVCdxj/FKw
 pKNux1TukQ5Bl97GWUIDplSE7IiWLpf7digMICksS+2Omrx2zOeAVjJUaCdPvxejm3z2
 bsJg==
X-Gm-Message-State: AOAM532IQ8JAN+Nu3+8B50tzWe61RW/OI7BmlSXyRlbI8iDm6J0R3Roj
 rF4S9YM1+cdfbQrPXt2PcnUwnLpgORLqDOU/Ym21gtbXE/aN28djhusYC121mq79wXO14aTj5Kl
 cbmKCMkVxD62aF8Eb/A==
X-Received: by 2002:adf:9793:: with SMTP id s19mr3674012wrb.139.1603200981920; 
 Tue, 20 Oct 2020 06:36:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0Kdtmoceh1VbFtj4WsVFH4s1/mwIdVEVxPEN03/g3K2rrBVdB3lX4y505PKLUCjyno8N2vw==
X-Received: by 2002:adf:9793:: with SMTP id s19mr3673993wrb.139.1603200981768; 
 Tue, 20 Oct 2020 06:36:21 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id g17sm3282321wrw.37.2020.10.20.06.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 06:36:21 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Bihong Yu <yubihong@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, <dgilbert@redhat.com>,
 <alex.chen@huawei.com>, <wanghao232@huawei.com>, <zhengchuan@huawei.com>,
 <armbru@redhat.com>
Subject: Re: [PATCH v3 3/8] migration: Add spaces around operator
In-Reply-To: <1603163448-27122-4-git-send-email-yubihong@huawei.com> (Bihong
 Yu's message of "Tue, 20 Oct 2020 11:10:43 +0800")
References: <1603163448-27122-1-git-send-email-yubihong@huawei.com>
 <1603163448-27122-4-git-send-email-yubihong@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Tue, 20 Oct 2020 15:36:20 +0200
Message-ID: <87a6whc94b.fsf@secure.mitica>
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
X-List-Received-Date: Tue, 20 Oct 2020 13:36:35 -0000

Bihong Yu <yubihong@huawei.com> wrote:
> Signed-off-by: Bihong Yu <yubihong@huawei.com>
> Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  migration/migration.c    |  4 ++--
>  migration/postcopy-ram.c |  2 +-
>  migration/ram.c          |  2 +-
>  migration/savevm.c       |  2 +-
>  migration/vmstate.c      | 10 +++++-----
>  5 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Juan Quintela <quintela@redhat.com>


