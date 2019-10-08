Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHryA-0008WU-UF
	for mharc-qemu-trivial@gnu.org; Tue, 08 Oct 2019 12:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37463)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iHry6-0008SD-7h
 for qemu-trivial@nongnu.org; Tue, 08 Oct 2019 12:04:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iHry5-0000TD-6c
 for qemu-trivial@nongnu.org; Tue, 08 Oct 2019 12:04:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50520)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iHry4-0000RW-Uk
 for qemu-trivial@nongnu.org; Tue, 08 Oct 2019 12:04:09 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C42A610F09
 for <qemu-trivial@nongnu.org>; Tue,  8 Oct 2019 16:04:07 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id r21so1185580wme.5
 for <qemu-trivial@nongnu.org>; Tue, 08 Oct 2019 09:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MdUjv1wz6a+TmCSH/uKuHv7YSpyCcEFbmfP7SGZy2+Y=;
 b=NYJJPvNXXtEWu62O1GZDWrTCqZm5GCtYt9VQtUI+hhSc+Opxc0vo7Ek5mbviZSAmCy
 Z6covv+pcxG2QNiTQGZROyJS9cScwqKEzNUYNO1fMIb2mDriJ9bTJ9zH20q8W8FmHRtS
 JVkodIvOJIg749x/KjzoFKrcT6N1PdtmFfQo3Pa29rQKUHjxjS+wBeodg+KbfSlwTCeA
 vt5nEBdfMT9X5XASL8bkwdyFa6KXmjsz1AMV31gbHTjsH8UdvttYwlwgYkHCZdrVX8Gd
 3pARKxK4WGkLPq/i8W6Q96BEsGQr7HN7fgbZ8Bzu/I6L9WyWoWstrAtuTh3GVGc5PjUU
 QZlA==
X-Gm-Message-State: APjAAAUbUA1by32Glc/+zE1vmyfSd2uuggmePmTgKvBv9DW6hTw0nBCb
 1ekMOKDUfsQ/HVgyQmBv+pBsiVF5LQ5sLi2/oNPgo8R5cv5WCk2ebC9MqgBx993coes0UvARR4C
 LXmX3ZfZoHSW6YDAiAw==
X-Received: by 2002:a1c:f011:: with SMTP id a17mr4299247wmb.18.1570550646430; 
 Tue, 08 Oct 2019 09:04:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwoQctdt9ue/mHNaqI6m6lnzJQNtk0WMvhfpgZmzLGHkFgrHM0ARdvmRR9AQfY6mwUSWLqD7g==
X-Received: by 2002:a1c:f011:: with SMTP id a17mr4299220wmb.18.1570550646133; 
 Tue, 08 Oct 2019 09:04:06 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:f4b0:55d4:57da:3527?
 ([2001:b07:6468:f312:f4b0:55d4:57da:3527])
 by smtp.gmail.com with ESMTPSA id b5sm3130822wmj.18.2019.10.08.09.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2019 09:04:05 -0700 (PDT)
Subject: Re: [PATCH v2] Makefile: Remove generated files when doing
 'distclean' (and 'clean')
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Cc: Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20191008082815.8267-1-thuth@redhat.com>
 <CAL1e-=gYkhM99Ee0LxZJ5dCjeEdC08G4_Tm3WCZpCSWvJ=b26Q@mail.gmail.com>
 <4bfea125-eb63-f4a2-bca0-bce462f73d89@redhat.com>
 <CAFEAcA_+V7SNsxPSgsd04s8f7PnP3qdyXMp6NvS2inHjE08pJw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <ce8a2b1b-6104-761e-6c67-0467c0e168dd@redhat.com>
Date: Tue, 8 Oct 2019 18:04:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_+V7SNsxPSgsd04s8f7PnP3qdyXMp6NvS2inHjE08pJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Tue, 08 Oct 2019 16:04:13 -0000

On 08/10/19 14:41, Peter Maydell wrote:
> The autoconf manual suggests some heuristics:
>  - If make built it, and it is commonly something that one would want
>    to rebuild (for instance, a .o file), then mostlyclean should delete it.
>  - Otherwise, if make built it, then clean should delete it.
>  - If configure built it, then distclean should delete it.
>  - If the maintainer built it (for instance, a .info file), then
>    maintainer-clean should delete it. However maintainer-clean should
>    not delete anything that needs to exist in order to run
> './configure && make'.
> 
> Not all of that applies for QEMU, but it seems like a reasonable
> set of ideas.

Right, considering we don't have mostlyclean, it boils down to "if make
built it, then clean should delete it; if configure built it, then
distclean should delete it".

Paolo

