Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUrq1-0002vi-TE
	for mharc-qemu-trivial@gnu.org; Tue, 20 Oct 2020 09:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kUrpq-0002sC-QO
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 09:37:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kUrpn-0001yB-I4
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 09:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603201069;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Q5wF88JL0QdclagRgYtwbNc7/5Wm60uvA6tierOxAx0=;
 b=WuSlEYSYQQ6WyicxKyWNIrpPg+LtiQdfK5SHG5n+/YxIig3IN0SOTNFCxFa4cGSWi9LhLz
 zalcDa2Zx36IqSY2Q1I+L82e3+V4r62Pc/Ne4NaK/maer41zJkmHJsskVxlDDRiO14Dg+N
 XJiHO8spIZhmGZRGJ1fwfk4XA8/5a5g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-QZk_LOtxNQywlG1Ef35Ghg-1; Tue, 20 Oct 2020 09:37:48 -0400
X-MC-Unique: QZk_LOtxNQywlG1Ef35Ghg-1
Received: by mail-wm1-f72.google.com with SMTP id g71so474199wmg.2
 for <qemu-trivial@nongnu.org>; Tue, 20 Oct 2020 06:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=Q5wF88JL0QdclagRgYtwbNc7/5Wm60uvA6tierOxAx0=;
 b=FxaNx0KTaaOFR5+x/Fa83V3aiExsXnXJGu4kbYuq+nvVPWeTIuogdaBIktj5sCPFoo
 wCwH27Pu7ihiz/bMhoT3Dk1XnqzNI0H1FvXpTcA7WD2a2baxMl8yTnCWPgUKUhHURDr+
 S1g3McUUpVnEU12ujwQiRyK0s0C6DWausrd7EMC0cKLdyLUsroOfQkdEk1zCoAf/h9Wx
 me15Y966Qw7f/v2zQiiHcYQezv4x31GIkBaxKjluGolKthBw+z4xymeasvwXwiMK50sv
 H67LDtQw5ExfaRf15V3FuxUm2anTfUqJnxM3ar9oSbg2Qj81Kezs7kcudMIaC3hfKp3H
 aOrA==
X-Gm-Message-State: AOAM530QfSjgjl98nsIpxXyI7NB+iPMtk7zc1xg1PTw81tBkmcVqbY73
 2/eMf6RVlAeHFAvMzOpDLhwEkL/yVaWUdp1Ft3OuSs05aifuO6E1+b6hmiJldReJfIZY6Yd5bma
 6OlKf2dBpTb5e7FHMOA==
X-Received: by 2002:adf:f903:: with SMTP id b3mr3695471wrr.142.1603201066870; 
 Tue, 20 Oct 2020 06:37:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNL5nS+K8fS7CPdrqCU6BXLyASYXLanWpDlMyDFb1YjqQ+6h7ljb46l1skumtpKGC2SxzG8g==
X-Received: by 2002:adf:f903:: with SMTP id b3mr3695460wrr.142.1603201066732; 
 Tue, 20 Oct 2020 06:37:46 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id 40sm3257225wrc.46.2020.10.20.06.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 06:37:46 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Bihong Yu <yubihong@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, <dgilbert@redhat.com>,
 <alex.chen@huawei.com>, <wanghao232@huawei.com>, <zhengchuan@huawei.com>,
 <armbru@redhat.com>
Subject: Re: [PATCH v3 4/8] migration: Open brace '{' following struct go on
 the same line
In-Reply-To: <1603163448-27122-5-git-send-email-yubihong@huawei.com> (Bihong
 Yu's message of "Tue, 20 Oct 2020 11:10:44 +0800")
References: <1603163448-27122-1-git-send-email-yubihong@huawei.com>
 <1603163448-27122-5-git-send-email-yubihong@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Tue, 20 Oct 2020 15:37:45 +0200
Message-ID: <875z75c91y.fsf@secure.mitica>
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
X-List-Received-Date: Tue, 20 Oct 2020 13:38:03 -0000

Bihong Yu <yubihong@huawei.com> wrote:
> Signed-off-by: Bihong Yu <yubihong@huawei.com>
> Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


