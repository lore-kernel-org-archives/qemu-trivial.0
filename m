Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUrnR-0008DR-Q1
	for mharc-qemu-trivial@gnu.org; Tue, 20 Oct 2020 09:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kUrnP-00088M-Pu
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 09:35:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kUrnO-0001YY-2Q
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 09:35:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603200920;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Q5wF88JL0QdclagRgYtwbNc7/5Wm60uvA6tierOxAx0=;
 b=VIiRJoWNSPPwz/cM3d7LrtuPHcb7mPmhhnzlUWThikGk+2KGYu3RU5FIn4mQE4UtZBHu7Z
 8XjLs/+Bk5VwAErwhV+0p/ZZUeKK0s8BynzI43hZX1QgGkRcD7/fOUe0BkiyCCu2xabikg
 U4LJet/1inB1tcKGGESKsKD3nsTTBPU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-8IZk7Lm0OweBGgN4SIN67g-1; Tue, 20 Oct 2020 09:35:19 -0400
X-MC-Unique: 8IZk7Lm0OweBGgN4SIN67g-1
Received: by mail-wr1-f69.google.com with SMTP id q15so832099wrw.8
 for <qemu-trivial@nongnu.org>; Tue, 20 Oct 2020 06:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=Q5wF88JL0QdclagRgYtwbNc7/5Wm60uvA6tierOxAx0=;
 b=VPNJr+ClTSBJmB8H7pUJzOhy/EqNMkKhGj459Zrm7TSY6ELiaUgx9fg9ynwxqbUtYd
 raF78b9COL7IZauTGqRhN1JN+gSb/eYiMf2ry1XU82SELoHQDsv4Vx4m26eIojy1Li3P
 bspb1tVfO2VfuxACKSsBmDkuYVSkwvuSMGDd+IHzBuY+bUzaGw9NGtucDOhyqiWo50rq
 W0zotePVHOa0L/7HKd4WwrPa6tTJMvNZXXW2gJzGgFEy7NA6ZgG/SHL91l5d+Ggkjrqn
 8CNwIMq/5MACAjTp/ViBXIck8p0XTRuX2IyZq7k9z9jTb07BRdpiyi/QkuvRJZ4KNUWe
 z4NQ==
X-Gm-Message-State: AOAM530LxeZOyYqby2D5+qJFPulM/E1+rm6kNJsg5DEpbNIPm2cwMsnK
 ebHIIS7zCV/SVgLCBWI8uElzdAv73wibAqNjj4SBpHqpjkY7HgOOmZlxpamFHerFbMDvKGmyTmA
 /O1wLOyl4Fr8FNcIlJg==
X-Received: by 2002:a5d:6247:: with SMTP id m7mr3627658wrv.34.1603200917794;
 Tue, 20 Oct 2020 06:35:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvv/yHLngktllT7hmArntYVn9XCmjNG2NP72AYA/kyEywBFYLrcvxhLbZqx6cFU+vQT96m1Q==
X-Received: by 2002:a5d:6247:: with SMTP id m7mr3627644wrv.34.1603200917652;
 Tue, 20 Oct 2020 06:35:17 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id e15sm2993329wro.13.2020.10.20.06.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 06:35:17 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Bihong Yu <yubihong@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, <dgilbert@redhat.com>,
 <alex.chen@huawei.com>, <wanghao232@huawei.com>, <zhengchuan@huawei.com>,
 <armbru@redhat.com>
Subject: Re: [PATCH v3 6/8] migration: Do not initialise statics and globals
 to 0 or NULL
In-Reply-To: <1603163448-27122-7-git-send-email-yubihong@huawei.com> (Bihong
 Yu's message of "Tue, 20 Oct 2020 11:10:46 +0800")
References: <1603163448-27122-1-git-send-email-yubihong@huawei.com>
 <1603163448-27122-7-git-send-email-yubihong@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Tue, 20 Oct 2020 15:35:16 +0200
Message-ID: <87k0vlc963.fsf@secure.mitica>
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
X-List-Received-Date: Tue, 20 Oct 2020 13:35:24 -0000

Bihong Yu <yubihong@huawei.com> wrote:
> Signed-off-by: Bihong Yu <yubihong@huawei.com>
> Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


