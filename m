Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kOP90-0002Q0-Ry
	for mharc-qemu-trivial@gnu.org; Fri, 02 Oct 2020 13:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kOP8y-0002NA-P5
 for qemu-trivial@nongnu.org; Fri, 02 Oct 2020 13:46:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kOP8u-0004Of-3l
 for qemu-trivial@nongnu.org; Fri, 02 Oct 2020 13:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601660810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JphseXmbF3DtuDEJXKV9gUbNcfK1JdNueUI5kBWrZ6U=;
 b=Kk4935gRFZr3XKz89Xs9v3tpeuc1dEH4ZpSvhCgUBx3p6Noj8c0kp06e0lKYYGF8nSlyA8
 t38ecpdraqgDwm9dWxw3UT3oyzf8s9HOpCTcOZJ5s3flawvcDwbhITr1/A1zEZKyjmR3ie
 M7CiWRqBgLYE3Y2UX69seKukUA9f8hg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-M6cLRlDVNrKmBzxGQnTnbg-1; Fri, 02 Oct 2020 13:46:49 -0400
X-MC-Unique: M6cLRlDVNrKmBzxGQnTnbg-1
Received: by mail-wr1-f70.google.com with SMTP id g6so823590wrv.3
 for <qemu-trivial@nongnu.org>; Fri, 02 Oct 2020 10:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JphseXmbF3DtuDEJXKV9gUbNcfK1JdNueUI5kBWrZ6U=;
 b=YJ3sn/cfQ/X2+CB42XGupjtv/kXDwabTxFglMcTJnfJ3LZY++IUOgIaxGV2upvIV9Y
 8B/5jNXOrmqaioW1uv32VnojHiKVy6iMzomKifsa8jKDr3vxYTOsodqTsMnX+RBFqFi6
 yAjAwWDMm0Yo7Tu8P7jBeMMlu+2qr8ssuJCFNwBGT7kvKqLnAZdNF3jl4EiZtgvkLXm4
 TSZMHsKHUbFi8tPwU3ViKNyObcljUSErXHTd/YiIiOMBBnz3Bux7i+TWqIgjarNkEm25
 tM8dVVvMmtFlclLZpa3HJ+fqOfaI+QWy601UaeudJ2YNE5f4rYx8Z6rtajZA6fmHVdV0
 LGRQ==
X-Gm-Message-State: AOAM5304vL71n2PgonSNsUcdShLUhLVJuHwsYg8rswTRVrvEgX55+/KZ
 2JZ7BifawrUtwkY3NOfeszBcracnjoXNK/vq6BlVD1i6bXEU04hhbIfTNiqi2QKClpMPi8rXJYd
 uVorQq5NJWQKF6wZabw==
X-Received: by 2002:adf:e304:: with SMTP id b4mr4157948wrj.141.1601660808177; 
 Fri, 02 Oct 2020 10:46:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIXv8Krjg/M3yd2GwEJCyCdMoQMHrSvUAWbEKaXesI5nekXgSLkmKWsaeHNUxhSep6fnzg6w==
X-Received: by 2002:adf:e304:: with SMTP id b4mr4157930wrj.141.1601660807978; 
 Fri, 02 Oct 2020 10:46:47 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:47e0:e742:75ba:b84d?
 ([2001:b07:6468:f312:47e0:e742:75ba:b84d])
 by smtp.gmail.com with ESMTPSA id v9sm2908093wrv.35.2020.10.02.10.46.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 10:46:47 -0700 (PDT)
Subject: Re: [PATCH v6 2/4] curses: Fixes compiler error that complain don't
 have langinfo.h on msys2/mingw
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Cc: qemu-level <qemu-devel@nongnu.org>, QEMU Trivial
 <qemu-trivial@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201001173230.829-1-luoyonggang@gmail.com>
 <20201001173230.829-3-luoyonggang@gmail.com>
 <20201002153559.GJ2338114@redhat.com>
 <CAE2XoE_z3j+_+Oh1Kn-GSAT4q0_nXnT0sLHMLCw0+r1o0WBJSA@mail.gmail.com>
 <20201002164232.GO2338114@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6574b572-4bc9-3cbb-dbc6-3e4a1da695b6@redhat.com>
Date: Fri, 2 Oct 2020 19:46:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201002164232.GO2338114@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 23:37:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.256, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
X-List-Received-Date: Fri, 02 Oct 2020 17:46:57 -0000

On 02/10/20 18:42, Daniel P. Berrangé wrote:
> I don't see why the configure change has any dependancy on meson 0.56.
> It just requires you to remove the mentioned header file and function
> from the configure check. This patch needs to include that or it is
> incomplete IMHO

I agree, moving the check to Meson is waiting for 0.56 but for now the
configure check needs to be maintained.

Paolo


