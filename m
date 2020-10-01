Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kO2YW-0003dM-O6
	for mharc-qemu-trivial@gnu.org; Thu, 01 Oct 2020 13:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kO2YU-0003aQ-Aw
 for qemu-trivial@nongnu.org; Thu, 01 Oct 2020 13:39:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kO2YO-0005nT-Q3
 for qemu-trivial@nongnu.org; Thu, 01 Oct 2020 13:39:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601573977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vdKnzQC7OvgfaF8qc5DfBGDdy/pgB0tgqxXcU+y1lJE=;
 b=M7g4MSkNj7P5uC8hV/qpFAc89K8yWqC/4P0InCDGAwvGN5m8AKGKyoVl9dea+qiyJvqEsz
 q6f+AUnluhzvKNrYJYFm+RjdWBZ0dxw0Qh0hZd1kwvWordj2AfZDfq+3Q4YPWEp4ZoWeQZ
 nLfC9rqAb6uyEmRckRWhDFjLmgznIiA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-2g5HNhFOODSWKHWwcJ0rrA-1; Thu, 01 Oct 2020 13:39:36 -0400
X-MC-Unique: 2g5HNhFOODSWKHWwcJ0rrA-1
Received: by mail-wm1-f70.google.com with SMTP id f2so550089wml.6
 for <qemu-trivial@nongnu.org>; Thu, 01 Oct 2020 10:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vdKnzQC7OvgfaF8qc5DfBGDdy/pgB0tgqxXcU+y1lJE=;
 b=lBDm7HrBMGK9vc9i74gONHSH0AyDevP7xfHLSiXqRxHwJPrUP5iHRPsFFVItlBVuwn
 SMWKXHIOKN8I0LKwEykU96Mo1IOIeyfcQF6DLwIBt0T8pMh0LxvZTnDH9+fKtOthZNzP
 i/ZOBIjzAlGJxOqtMo6ftFk5FovvCxoIr/FXG8nfAB853ygKAYSclT/HX7ripoWUps/T
 znZNBqqDyo7bZI1KsuVUTAWHhqmaARd7mP9tX+j0KvrrQztuS03HhHWK93eMuqUqd/04
 hm6GTu022QG5kf/vHLmiveCo+eVYN8/hFBMKp74/UwJc/Aw/cvr/fM3udMf2voYkbE5k
 ebZw==
X-Gm-Message-State: AOAM533o+ZeEvCJb2Oe/yCYge5szUpJ2er+ykfCDkGghlcEYxiBLewBg
 UUk3WXb/6cEhOecFo7SYgND5Vc4d3DjUKgcrKosoJ95iBiXGgEISnMxFrVObZgRXERFxiJsAEj2
 WQwT1dc/IdV+5gHGsAA==
X-Received: by 2002:adf:9e05:: with SMTP id u5mr10214100wre.78.1601573975185; 
 Thu, 01 Oct 2020 10:39:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFG38XqySDse+n104PsikO+ZWX3Zb+X+g2Q5vs3MUFXtf0TsqsOYGaXAUT97M7FsvnWe8idQ==
X-Received: by 2002:adf:9e05:: with SMTP id u5mr10214075wre.78.1601573974925; 
 Thu, 01 Oct 2020 10:39:34 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:86de:492a:fae3:16f2?
 ([2001:b07:6468:f312:86de:492a:fae3:16f2])
 by smtp.gmail.com with ESMTPSA id o129sm996755wmb.25.2020.10.01.10.39.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 10:39:34 -0700 (PDT)
Subject: Re: [PATCH v6 0/4] Fixes curses on msys2/mingw
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Gerd Hoffmann
 <kraxel@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
References: <20201001173230.829-1-luoyonggang@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <89710921-1d64-14fd-f8ce-05ee58f412c5@redhat.com>
Date: Thu, 1 Oct 2020 19:39:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201001173230.829-1-luoyonggang@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 04:25:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.26, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
X-List-Received-Date: Thu, 01 Oct 2020 17:39:46 -0000

On 01/10/20 19:32, Yonggang Luo wrote:
> And also convert related configure script to meson.
> V5-V6
> Dropping configure: Fixes ncursesw detection under msys2/mingw by convert the=
> m to meson first.
> That need the meson 0.56 upstream to fixes the curses detection.
> Add
> * configure: fixes indent of $meson setup
> 
> Yonggang Luo (4):
>   configure: fixes indent of $meson setup
>   curses: Fixes compiler error that complain don't have langinfo.h on
>     msys2/mingw
>   curses: Fixes curses compiling errors.
>   win32: Simplify gmtime_r detection not depends on if  _POSIX_C_SOURCE
>     are defined on msys2/mingw
> 
>  configure                 | 42 ++++-----------------------------------
>  include/sysemu/os-win32.h |  4 ++--
>  ui/curses.c               | 14 ++++++-------
>  util/oslib-win32.c        |  4 ++--
>  4 files changed, 15 insertions(+), 49 deletions(-)
> 
> --=20
> 2.28.0.windows.1
> 
> 

Looks good (though there is no conversion to meson yet in this version).

Not trivial, but perhaps Gerd can take it?

Paolo


