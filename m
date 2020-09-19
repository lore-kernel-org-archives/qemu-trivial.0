Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kJeON-0004pV-NX
	for mharc-qemu-trivial@gnu.org; Sat, 19 Sep 2020 11:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kJeOM-0004pE-Dx
 for qemu-trivial@nongnu.org; Sat, 19 Sep 2020 11:03:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kJeOK-0007XY-Mm
 for qemu-trivial@nongnu.org; Sat, 19 Sep 2020 11:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600527787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=swnZwxpLtegqnt3wqlIj88WC1uyZ0o0GcFQvA+vaVG0=;
 b=C0rNhfrzfkDNWjBdoJ8SHktiFrq9YkZqxB+szTI3eZB0L6PnuOf70i0QYUqKO4+yrYsc5n
 D0IUOxn1FDqKDFm17gVFRSbE8cauthbNv33TpoW00C9E4RLefxZ/aLn+bM9rR5CfM4v4U6
 0oOhSYRUoM+aDg8LOMfCzrVCZ3uGnlQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-rJwZlBGFNZqV-qfRRdHmKQ-1; Sat, 19 Sep 2020 11:03:03 -0400
X-MC-Unique: rJwZlBGFNZqV-qfRRdHmKQ-1
Received: by mail-wr1-f72.google.com with SMTP id 33so3555582wre.0
 for <qemu-trivial@nongnu.org>; Sat, 19 Sep 2020 08:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=swnZwxpLtegqnt3wqlIj88WC1uyZ0o0GcFQvA+vaVG0=;
 b=hKsa7+0jtjg3e2tZed3bvoERjYwMG5qJIpIRwOjsxBK0J4wdsJbh/ZcicFp5J1TQ3W
 15KuK9djfC3PDbxYwF4Yq4IJoVHQu2xjMIRJMM9WgQDWUYyrVp19x4GJHyKrn/eLFK+U
 THPpWUUbGUJQUKmusKrqB/MorsRWitya3Z+5qOjo6ugwch8qJ1zRJ8gq7PbE2pY5mClp
 jzOv34MdrDmi9HPIVRHpIRUtFsHVUoEAVXuHc0/JAuRb1rRb7wGmQmWnHhY3D//XvxUZ
 33tWcHO/ksxTiszyiX5W7Vok9RBGmAZiQPby6p6rF5BeKDf7BmsALIR6ce2a0RyPhCu/
 aeKg==
X-Gm-Message-State: AOAM531jkQS4mQqYp/E36d34Uwxu6Rqcp28exo09XVywJHbvCQYJjBaZ
 ppI6M0iwFtdME+i7orpLA9RzO/Q9d3QbvY66zEufoXU74Hagzm3pcVtkMNPAjS+WUqVlul+IcdQ
 Gg/cVOe5/qzXKlNvyaw==
X-Received: by 2002:a5d:430d:: with SMTP id h13mr46093037wrq.41.1600527782294; 
 Sat, 19 Sep 2020 08:03:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0kSk7q48TAWNdhwdlBBtXpJHBo6w1kdCcYFYPPGV3Sh7upF+q0adtu9byTpinDmMAsfPm/A==
X-Received: by 2002:a5d:430d:: with SMTP id h13mr46093013wrq.41.1600527782096; 
 Sat, 19 Sep 2020 08:03:02 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:b20a:b600:521c:512d?
 ([2001:b07:6468:f312:b20a:b600:521c:512d])
 by smtp.gmail.com with ESMTPSA id z127sm11129054wmc.2.2020.09.19.08.03.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Sep 2020 08:03:01 -0700 (PDT)
Subject: Re: [PATCH v5 0/4] Fixes curses on msys2/mingw
To: luoyonggang@gmail.com, qemu-level <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200918160250.1141-1-luoyonggang@gmail.com>
 <CAE2XoE9Vf3Zixv6Ds0BmO9O5EWWjPbG-0EkP0BEbPikuCc4SVg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5c0699e8-62ef-8f29-182f-a0744c727bae@redhat.com>
Date: Sat, 19 Sep 2020 17:03:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE9Vf3Zixv6Ds0BmO9O5EWWjPbG-0EkP0BEbPikuCc4SVg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/19 11:03:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 19 Sep 2020 15:03:10 -0000

On 18/09/20 18:10, 罗勇刚(Yonggang Luo) wrote:
> 
>> Yonggang Luo (4):
>>   curses: Fixes compiler error that complain don't have langinfo.h on
>>     msys2/mingw
>>   curses: Fixes curses compiling errors.
>>   win32: Simplify gmtime_r detection not depends on if  _POSIX_C_SOURCE
>>     are defined on msys2/mingw
>>   configure: Fixes ncursesw detection under msys2/mingw by convert them
>>     to meson

Hi, patches 1-3 are okay, but for patch 4 I think it's better to wait
for Meson 0.56 which will likely embed all the magic needed to test
curses (https://github.com/mesonbuild/meson/pull/7757).

Paolo


