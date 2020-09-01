Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kCz2t-00054b-53
	for mharc-qemu-trivial@gnu.org; Tue, 01 Sep 2020 01:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kCz2r-00053V-Bp
 for qemu-trivial@nongnu.org; Tue, 01 Sep 2020 01:41:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34733
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kCz2o-0005G5-Kj
 for qemu-trivial@nongnu.org; Tue, 01 Sep 2020 01:41:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598938880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RYlsWrzS2kGQZya8FtD/Y/cxGtKRBvdXYfzLOXngaXE=;
 b=aaj9U/jOw1kUQvie5XxL/7KZrzo5cH3sRCOLOPVrF30xLvLaxmG90fx3M5Z24glWRBLaFh
 +nOHM/QZciJ609YcnQve1F+OTwpWgp6w3EMLZdt6VzpUmBiUUVwR4IB7H4MGJYkZHKUUxn
 0Tl5LMOaB7KJhutKELmO24TlN8IPAlM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-rC4WNTs6NFq1KrcVyEQRLw-1; Tue, 01 Sep 2020 01:41:19 -0400
X-MC-Unique: rC4WNTs6NFq1KrcVyEQRLw-1
Received: by mail-wm1-f71.google.com with SMTP id w3so53833wmg.4
 for <qemu-trivial@nongnu.org>; Mon, 31 Aug 2020 22:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RYlsWrzS2kGQZya8FtD/Y/cxGtKRBvdXYfzLOXngaXE=;
 b=cc58N3bfVJltLWdSsrBgdloBFkEwtRdM0PrFnDY3ieJgd+dla7h9rXVAKFqucRPzzt
 +G6DJBe556Ey25jP+v9MGD8nyW1WhZPp/UG9xMDBGFArX+t2gWWfeGZTr8lEXm98bgRU
 vk14wh+zH5m+aTW910Mf6y/WLawr6z8hOtijSJmj18pzM+lNQv1N5CXJAFG0VW2MYmKK
 pFEPFDwZ47rK5H8igyKLXyUdp40X40pSn+6r2vfdYZ+/tyPNjNByvQtTEePCOaG+gT+/
 DXPavQ+xhPb6yPKNdo2UKVRs/esfYA3DQ5m8LB4Yf3SkSmzCZlJ37gvFLBHl+n/W4YE1
 Kz1w==
X-Gm-Message-State: AOAM532Ms5MaCakEDuIqyYkGajooN79G2Cjclyicq9V13xjIO95gpqQH
 LKDxP79GChATXYcOhErGnfVThO+unzgh6nmkrVuAJDidojnDoKaefPdJunC8f9iiyNA8BCCJseZ
 F8Xv2asyNsnL51YyyuQ==
X-Received: by 2002:adf:8544:: with SMTP id 62mr4673397wrh.262.1598938877923; 
 Mon, 31 Aug 2020 22:41:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTCnvXqwWmX2FwR9yeSzqZnsOo/bl3Mk2caZAmttvGHcFg5xyiQM3lTiRaV3wPAzucyTUAzw==
X-Received: by 2002:adf:8544:: with SMTP id 62mr4673370wrh.262.1598938877623; 
 Mon, 31 Aug 2020 22:41:17 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:a2d9:71bf:36d7:4ea8?
 ([2001:b07:6468:f312:a2d9:71bf:36d7:4ea8])
 by smtp.gmail.com with ESMTPSA id q12sm345514wrn.94.2020.08.31.22.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2020 22:41:17 -0700 (PDT)
Subject: Re: [PATCH] docs/system: Fix grammar in documentation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Stefan Weil <sw@weilnetz.de>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20200827173051.31050-1-sw@weilnetz.de>
 <CAAdtpL508gaCmuencEu31H0bcQorUhywUXGkD-3ZukafjsdLzw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2857607d-30ff-6d31-c57b-f2b009ca8ae8@redhat.com>
Date: Tue, 1 Sep 2020 07:41:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAAdtpL508gaCmuencEu31H0bcQorUhywUXGkD-3ZukafjsdLzw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 22:05:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.13, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Tue, 01 Sep 2020 05:41:26 -0000

On 31/08/20 22:01, Philippe Mathieu-Daudé wrote:
> 
> 
> Le jeu. 27 août 2020 19:31, Stefan Weil <sw@weilnetz.de
> <mailto:sw@weilnetz.de>> a écrit :
> 
>     Signed-off-by: Stefan Weil <sw@weilnetz.de <mailto:sw@weilnetz.de>>
> 
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org
> <mailto:f4bug@amsat.org>>
> 
>     ---
>      docs/system/build-platforms.rst | 6 +++---
>      1 file changed, 3 insertions(+), 3 deletions(-)
> 
>     diff --git a/docs/system/build-platforms.rst
>     b/docs/system/build-platforms.rst
>     index c2b92a9698..9734eba2f1 100644
>     --- a/docs/system/build-platforms.rst
>     +++ b/docs/system/build-platforms.rst
>     @@ -57,12 +57,12 @@ macOS
>      -----
> 
>      The project supports building with the two most recent versions of
>     -macOS, with the current homebrew package set available.
>     +macOS, with the current Homebrew package set available.
> 
>      FreeBSD
>      -------
> 
>     -The project aims to support the all the versions which are not end of
>     +The project aims to support all versions which are not end of
>      life.
> 
>      NetBSD
>     @@ -75,5 +75,5 @@ new major version is released.
>      OpenBSD
>      -------
> 
>     -The project aims to support the all the versions which are not end of
>     +The project aims to support all versions which are not end of
>      life.
>     -- 
>     2.28.0
> 
> 

Cc: qemu-trivial@nongnu.org


