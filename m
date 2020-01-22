Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iu4nL-0000HY-HZ
	for mharc-qemu-trivial@gnu.org; Tue, 21 Jan 2020 20:26:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38865)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iu4nI-0000Fr-KQ
 for qemu-trivial@nongnu.org; Tue, 21 Jan 2020 20:26:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iu4nH-00043o-HT
 for qemu-trivial@nongnu.org; Tue, 21 Jan 2020 20:26:56 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:46045)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iu4nH-00043X-Cd
 for qemu-trivial@nongnu.org; Tue, 21 Jan 2020 20:26:55 -0500
Received: by mail-pg1-x541.google.com with SMTP id b9so2489430pgk.12
 for <qemu-trivial@nongnu.org>; Tue, 21 Jan 2020 17:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pp16kqLpiEIyAGHOLDB5F5XDcQRr9/fLT5GRMKH+yXw=;
 b=ILxg713aGeQ9egQymNxSuXStlT2t0GFABSc4CbfRZRht+coExjcQeM0JWc5uIAz5I0
 ohnnXAsVueVr1NZx1pEIApH1JdQDWZmnyrrTkTDUqgDK50iCXPpDgvgjt7pxII0rSqvu
 n4pTuk3HMCPTyQ31PGXyeZGJ57M63fyvaIBrgtQ7/diaZY5Qfe7ArF+q6Im+3WYNRPQp
 2WlzbQpeTABa0j2j1srD7QBdUAux0ygDOAWHo5fMWxPZE6p7aDqEUrGZk+PaPqBy0nWC
 d09H3cQ74Z25rAZVkMwT7D4H3lq/W/VBZZyu443/Kgrv+8fEZ9N5svzTEttvUad74NOM
 R7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pp16kqLpiEIyAGHOLDB5F5XDcQRr9/fLT5GRMKH+yXw=;
 b=VLvWMqmzv02E5M4FWOEnKhg3b4JZOFwfPsI57SmGICR5WTXOGzGcpewDuIh467lDNO
 KLbrWlYdIytbkXyCr2nP6ZAErTC2zw4UOvPxn1iVe9up3eoWKimIzW8PIoU2L7Tm7K5b
 9sHMCvSvFw4Nim3HnbjJk4CEkEHVpegyDfjzMQct6Z3jCBpAEtOT3WzMqVr2lC3dFCEw
 Bj/FNtGK0xi2SMjy+tCh5F1OVncKo6eBGp5DzDPzjI/rQ6eBoc34Cp2p6nxq8sxI8BPA
 C6YXtJKgektgYl+ZjFsSg16AvHiLqJN3WTCoByv0iqkOV5GZ/UKsoPsB9pq9wf7TN9Cp
 rh7g==
X-Gm-Message-State: APjAAAWz4x4WmJsJF6+YdgAT3Ccq7VJIlkHgFVV0yzFvvuxfeMYMpN9k
 Xb/W86iiEJ+6YtmkxI7maQeI3iAWRak=
X-Google-Smtp-Source: APXvYqxQHZFHoqWoh/O4jd1powqUGPfcr+QqKjgiXNsCW39l4cU8zwA6SYVXdVi+SLLMiYWDaFLz2g==
X-Received: by 2002:a63:5b0a:: with SMTP id p10mr8370478pgb.228.1579656413790; 
 Tue, 21 Jan 2020 17:26:53 -0800 (PST)
Received: from [10.5.50.117] (rrcs-173-198-77-92.west.biz.rr.com.
 [173.198.77.92])
 by smtp.gmail.com with ESMTPSA id u3sm43802068pga.72.2020.01.21.17.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 17:26:52 -0800 (PST)
Subject: Re: [PATCH] scripts/git.orderfile: Display decodetree before C source
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Sven Schnelle <svens@stackframe.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Hildenbrand <david@redhat.com>, Stafford Horne <shorne@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20191230082856.30556-1-philmd@redhat.com>
 <4bf7c585-fe7f-c574-d706-2317e6bcbceb@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <404a7378-5ad4-1a5a-e280-551293cf970b@linaro.org>
Date: Tue, 21 Jan 2020 15:26:48 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <4bf7c585-fe7f-c574-d706-2317e6bcbceb@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-List-Received-Date: Wed, 22 Jan 2020 01:26:57 -0000

On 1/18/20 12:09 AM, Philippe Mathieu-Daudé wrote:
> Cc'ing qemu-trivial@
> 
> On 12/30/19 9:28 AM, Philippe Mathieu-Daudé wrote:
>> To avoid scrolling each instruction when reviewing tcg
>> helpers written for the decodetree script, display the
>> .decode files (similar to header declarations) before
>> the C source (implementation of previous declarations).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Queued to tcg-next, since no one else has picked this up.


r~

