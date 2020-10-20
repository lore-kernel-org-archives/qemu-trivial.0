Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUro7-0000Uw-Gd
	for mharc-qemu-trivial@gnu.org; Tue, 20 Oct 2020 09:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kUro2-0000Ti-Nq
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 09:36:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kUrny-0001mX-Ib
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 09:36:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603200956;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Q5wF88JL0QdclagRgYtwbNc7/5Wm60uvA6tierOxAx0=;
 b=iLD21+nataqeFnj/E252k4KPsUsjp6o13soZZ73VmRh7tba12FOyPtbihuvC5BBpnRz3Ct
 F/1de0TiukKyAHe3TnDzGZLB+/nooU2zWfxsZzbQWr5MTqcBcDvPmTb4xY2E9ChxnrDUMp
 xCh2lf8qZXmFbcB2PafqUbalMFN+DBA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-w2WGjEHAM4yqCfnXM-abWA-1; Tue, 20 Oct 2020 09:35:55 -0400
X-MC-Unique: w2WGjEHAM4yqCfnXM-abWA-1
Received: by mail-wm1-f70.google.com with SMTP id s25so466649wmj.7
 for <qemu-trivial@nongnu.org>; Tue, 20 Oct 2020 06:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=Q5wF88JL0QdclagRgYtwbNc7/5Wm60uvA6tierOxAx0=;
 b=F6ljTMNluXeoTWT7CedNLGylWGBd4ek3Oy67Zi3pPZ30QmD86dLNudWCdhWMTfgqn1
 OCtKuqmRYhGdMFTBAl9swsjNkwMWrHd+YtmNuc8Iz2TjUO91TdFnp97+incJstP5Kltp
 1DUYIqcXjCPRASOKETnbNmwigh7SRQXd305oj6de5ZpjVWKRWCakwDZu62Z6P+0m4u0l
 4C3ysbSm9DdXnRAtYO0C5sf81WLW+Z6eG/xtGDQveyX5Wz8/qF6ha4BYlSQ60383/xHR
 HqGcWD0q0Z71/j94yu1bMKjbOvao83Vde50y0HpEom7i6mrEKR+uhuIeYB3X5zpdKk1E
 Tk9g==
X-Gm-Message-State: AOAM532ZbINItwJ9Iu5namiuDDsPkpkptlW/uUrickOOJEl6M7BxlVPh
 MuW10H3zXAhccCubpX3Z7C3PFNuMShJ6ZjHSJIrYrnFe2HPw16sM4Ps5rgzM/IQT9S5zxT6cFhX
 5TRKQW+V6fd0ZM/Q3iQ==
X-Received: by 2002:a5d:508f:: with SMTP id a15mr3554249wrt.417.1603200954480; 
 Tue, 20 Oct 2020 06:35:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygfuIA4S9Djbbzb4bVWZf46V23omw/G9jODXA8FbJyrijiF4N6dFT0WX8z63R/ZCRxMlxCtg==
X-Received: by 2002:a5d:508f:: with SMTP id a15mr3554238wrt.417.1603200954336; 
 Tue, 20 Oct 2020 06:35:54 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id w11sm3086515wrs.26.2020.10.20.06.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 06:35:53 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Bihong Yu <yubihong@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, <dgilbert@redhat.com>,
 <alex.chen@huawei.com>, <wanghao232@huawei.com>, <zhengchuan@huawei.com>,
 <armbru@redhat.com>
Subject: Re: [PATCH v3 5/8] migration: Add braces {} for if statement
In-Reply-To: <1603163448-27122-6-git-send-email-yubihong@huawei.com> (Bihong
 Yu's message of "Tue, 20 Oct 2020 11:10:45 +0800")
References: <1603163448-27122-1-git-send-email-yubihong@huawei.com>
 <1603163448-27122-6-git-send-email-yubihong@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Tue, 20 Oct 2020 15:35:52 +0200
Message-ID: <87eeltc953.fsf@secure.mitica>
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
X-List-Received-Date: Tue, 20 Oct 2020 13:36:06 -0000

Bihong Yu <yubihong@huawei.com> wrote:
> Signed-off-by: Bihong Yu <yubihong@huawei.com>
> Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


