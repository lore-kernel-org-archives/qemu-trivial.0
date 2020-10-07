Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQCXL-0001Zp-QS
	for mharc-qemu-trivial@gnu.org; Wed, 07 Oct 2020 12:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQCXJ-0001Uf-Nz
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2020 12:43:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQCXH-0000yW-P6
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2020 12:43:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602089007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Qv1qn82YLRFHmBycsrSc4fqvKuCS0ltG4NeYle3TGY=;
 b=NhGqzp3Mb/oxRG0JFTUXCVNdSYArUJG//eopVUlkjJ3HtQcwzMhNS6LBy7yv9vwHEKZd89
 VEXnTF1vgmr2nlwx5aL/om1/w2q7H00uVfbXu6VvshhbpoIsTxFpBXXq7qLf8Wsrc4EhvW
 +BUSoaAVPTrEcXAYVjPOA89WpC8O5Q8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-kpjpnuP7P62SmZrjHjsEdg-1; Wed, 07 Oct 2020 12:43:24 -0400
X-MC-Unique: kpjpnuP7P62SmZrjHjsEdg-1
Received: by mail-wm1-f70.google.com with SMTP id y83so1044384wmc.8
 for <qemu-trivial@nongnu.org>; Wed, 07 Oct 2020 09:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Qv1qn82YLRFHmBycsrSc4fqvKuCS0ltG4NeYle3TGY=;
 b=Kw92Fl460AA5Wwc0Ub1d/tPzqUr4+TMFJ7HVeuKOcVQQ/2D6Gtxs1cgeYUWpCHbsVD
 +14T2rVwRgD458e+kTRazXAgtosA+PnQeLM855yJ/m+lH2CHYSVI6a2Ik7s8euD+nbp6
 qkAcVbX1ynf6GenBqZuOk0EMSQIWyUXBlVsDVY8rypu6GY5hApHmpvEmHVakxXRHo+8G
 kJ4xuV9s4yQMmkJ/dp93GvsqKC6GLtFB7tGgwDd0HQuPyA1S26FfgXmCw9IfZ01H6rd7
 SPjUpj/uNfRw4APFnX7KiSuvF5SchdzzFILWTd97sWlzBtS5oR22gyLShIijj0gP7+fa
 wGaw==
X-Gm-Message-State: AOAM532YB1dWd8Rq4sbefFJGm/TiVtAb3CInR6y3xxxj6Z+4N3KcaYuP
 MFDKwGn5+TNJlJlDN4BQ2gBx2ThjlSnrBXG/im3BgOYgfvKiYYNHxXGS6oekEV1o6IzUKMZwJxR
 qsxmGv5+HDOhzVEM7Hw==
X-Received: by 2002:adf:a3d4:: with SMTP id m20mr4871265wrb.29.1602089002729; 
 Wed, 07 Oct 2020 09:43:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8OLbOaEGGUoFP9QIBFl+kfBue1OI+r0n5042LURkN3BSQ8zaWIGZXa1STk+Wt0VJ3f6pxxg==
X-Received: by 2002:adf:a3d4:: with SMTP id m20mr4871248wrb.29.1602089002498; 
 Wed, 07 Oct 2020 09:43:22 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d2f4:5943:190c:39ff?
 ([2001:b07:6468:f312:d2f4:5943:190c:39ff])
 by smtp.gmail.com with ESMTPSA id x15sm4032599wrr.36.2020.10.07.09.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2020 09:43:21 -0700 (PDT)
Subject: Re: [PATCH v6] scripts: Convert qemu-version.sh to qemu-version.py
To: luoyonggang@gmail.com, qemu-level <qemu-devel@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>
References: <20201007162138.425-1-luoyonggang@gmail.com>
 <CAE2XoE9sf0p5QuG=dSqbOvmGvbzDaEBN8qSG1ejM=RH+D+zq1g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <798fb17d-fcf5-3234-1e17-37b3c0a18b8e@redhat.com>
Date: Wed, 7 Oct 2020 18:43:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE9sf0p5QuG=dSqbOvmGvbzDaEBN8qSG1ejM=RH+D+zq1g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:44:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
X-List-Received-Date: Wed, 07 Oct 2020 16:43:30 -0000

On 07/10/20 18:23, 罗勇刚(Yonggang Luo) wrote:
>> +    if not pkgversion and os.path.exists('.git'):
>> +        # The quote of v* should preserve, otherwise git command
> would fail
>> +        pc = subprocess.run(['git', 'describe', '--match', "'v*'",
> '--dirty', '--always'],
>> +                            stdout=subprocess.PIPE,
> stderr=subprocess.DEVNULL, encoding='utf8')

It's a total mess.

On Linux, if you use 'v*' git is invoked with an argument that looks
like 'v*', that is as if you used \'v\*\' on bash.

On Windows, wildcard expansion is done by the program so you need to
pass a quoted value to stop the wildcard expansion.

I have no idea how to fix it.  Probably it can be made to work using a
string argument and "shell=True", but at this point it makes more sense
to keep the shell script version.

Paolo


