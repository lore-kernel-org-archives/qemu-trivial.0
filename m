Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kL3UC-0005IR-Id
	for mharc-qemu-trivial@gnu.org; Wed, 23 Sep 2020 08:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kL3UA-0005II-PA
 for qemu-trivial@nongnu.org; Wed, 23 Sep 2020 08:02:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kL3U8-0001YL-9p
 for qemu-trivial@nongnu.org; Wed, 23 Sep 2020 08:02:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600862575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=msS/G5bxiNgrv8OcnHCj3SXyDBzh/tqTF3WPL6ELImg=;
 b=f1XcCdhrLIbfrA6hWYCWqqTvRfCJIRPPUwhVldrjBm8D4iZekcplbaVjTNocz7NVDO507d
 Zreg23zG48CklFbYLtFbeKM9Vt7a02LNp6QP7YhjEokT24iWAgAADlKHnN8obp77xQDUQj
 ZtBtvl2+r5X1qwAWeE/o25bn1OVIp7U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-yMQ69qIuP4yx4hZPA-f0Yg-1; Wed, 23 Sep 2020 08:02:53 -0400
X-MC-Unique: yMQ69qIuP4yx4hZPA-f0Yg-1
Received: by mail-wr1-f71.google.com with SMTP id j7so8769878wro.14
 for <qemu-trivial@nongnu.org>; Wed, 23 Sep 2020 05:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=msS/G5bxiNgrv8OcnHCj3SXyDBzh/tqTF3WPL6ELImg=;
 b=bNn6d4F28znDWiFk9D5BnNC2EfFOpdncGC97DgUxH3k0b7bE6CWyQijqJCxf8dt0oF
 j9wGClhRmHSCon5jB+fSMFbWJRpGOWT0CVraHcN/OaJeeShHsUcs5O5z5syd+QEoZe5V
 /XVrr4/fB4PLv4bW+FujdbSwvZoZmu9eXHKWQtsdBd4y8DMmpOYbpGshlasQSXZT/MRY
 mrP/l5ew46DxUHkhyKt1bFxP+MuIzXI5BeD8czmJRr0MyCjKs1AZZOqXlTVJ+Izbt7Z5
 ZPuGRMsNxcpd6NU3TyvUVw+R4QafFcsQ3cJw9GnxmmygrwcOn1AqjFaVdjXSU8JrW2F7
 X7iw==
X-Gm-Message-State: AOAM5319biElS96IMLUJ4ZjjV5k0S1qtA7iJcw1tOVJvH+ub+2tFXXVs
 5MJosuo/0PmSQLJGjudFktX/sEa21WLiX1jEmne2kfosxaNcB+VSb083W5RaCA+/7di7vLZVboi
 tl2rlKh7pMQGpzizRpw==
X-Received: by 2002:adf:f24f:: with SMTP id b15mr460577wrp.301.1600862572350; 
 Wed, 23 Sep 2020 05:02:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6SansG3zPuqnv37AzSAGPXHMPTINuSo8Ro4AyHQUSutyIVtkM1WfnrTEmWVdwh+L8FT5lXw==
X-Received: by 2002:adf:f24f:: with SMTP id b15mr460548wrp.301.1600862572037; 
 Wed, 23 Sep 2020 05:02:52 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:15f1:648d:7de6:bad9?
 ([2001:b07:6468:f312:15f1:648d:7de6:bad9])
 by smtp.gmail.com with ESMTPSA id l10sm28480975wru.59.2020.09.23.05.02.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2020 05:02:51 -0700 (PDT)
Subject: Re: [PATCH] Add execute bit back to scripts/tracetool.py
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20200923103620.1980151-1-anthony.perard@citrix.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <94748953-43e7-fce4-3ec4-eb18678fbb76@redhat.com>
Date: Wed, 23 Sep 2020 14:02:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200923103620.1980151-1-anthony.perard@citrix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 23 Sep 2020 12:02:59 -0000

On 23/09/20 12:36, Anthony PERARD wrote:
> Commit a81df1b68b65 ("libqemuutil, qapi, trace: convert to meson")
> removed it without explanation and it is useful to be able to run a
> script without having to figure out which interpreter to use.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  scripts/tracetool.py | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  mode change 100644 => 100755 scripts/tracetool.py
> 
> diff --git a/scripts/tracetool.py b/scripts/tracetool.py
> old mode 100644
> new mode 100755
> 

Cc: qemu-trivial@nongnu.org


