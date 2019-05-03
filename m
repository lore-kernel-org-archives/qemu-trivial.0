Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMay5-0005dX-2o
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 12:23:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hMay2-0005c5-4t
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 12:23:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hMaxz-0007RR-0n
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 12:23:21 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52181)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hMaxy-0007Ps-RI
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 12:23:18 -0400
Received: by mail-wm1-f68.google.com with SMTP id t76so7816164wmt.1
	for <qemu-trivial@nongnu.org>; Fri, 03 May 2019 09:23:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=M8WgKMHGzcbGODR9dlVFSGXZfHqiB8f0FlklaO2r7VE=;
	b=oQZSvMlZ7DRNvQKKZsVWjZKdDv3P8OhfTQv5faJjrZ4VzThFHpnXRU80ywt7IKFag3
	kWOdneBbirLbsY2ACfAWktc50gaklWS176NlSp2pWmufFBIIs1nQfhHIX65iDdi1TpcP
	NR4rps0AmlMV5y1PkZkQpPrW6dqXvl1EWbtt3vtaFDMjBRSF1o9RqBJAS5Z51SjXmzxs
	w2xNiFRGgutsiSvuxY+UosVSWmeeqidwTOFiQJINNd7zFiS+ZNkd0NfvgWUh8hZUw2pM
	ZYQqj03VDUq0TxmALjTGBLMw0jYNgG0FgY/DEV4PMMk9qF/5aoYn0HCxI64S09JsZK3a
	pRhA==
X-Gm-Message-State: APjAAAWU69OIAHkBF6K1nd91zgrHZhN8y0dH2OVlzNT66tPxS+IEYSZu
	pD2ovNeL/HI3izhiQyEH2N9QbA==
X-Google-Smtp-Source: APXvYqz8vBxL/1QRATJFWVv+CkMOrPGhOudx04VsCjyj54tgb6MYR8JkYlqOlzd2l3Nygiw42SL5ig==
X-Received: by 2002:a1c:e085:: with SMTP id x127mr7336885wmg.140.1556900597449;
	Fri, 03 May 2019 09:23:17 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	a184sm1934471wmh.36.2019.05.03.09.23.16
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 May 2019 09:23:16 -0700 (PDT)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu trival <qemu-trivial@nongnu.org>,
	Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>, 
	Cao Jiaxi <driver1998@foxmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20190503002206.9751-1-driver1998@foxmail.com>
	<20190503003618.10089-1-driver1998@foxmail.com>
	<aa0dce0b-1be0-7247-8f81-c4f265ba0009@redhat.com>
	<CAFEAcA9a8oQHe+cbSotO+BR2-iqgKOBV5Pg4n1aOBY7_tnvqFg@mail.gmail.com>
	<CAJ+F1CL+2YGHMZteU74y9a61rW6fXLDxcb4KGzPBEAL6878Ujg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <a6456256-cda6-0604-6602-2102d47ac006@redhat.com>
Date: Fri, 3 May 2019 18:23:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CL+2YGHMZteU74y9a61rW6fXLDxcb4KGzPBEAL6878Ujg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 1/4] QEMU_PACKED: Remove
 gcc_struct attribute in Windows non x86 targets
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 03 May 2019 16:23:23 -0000

On 5/3/19 5:56 PM, Marc-André Lureau wrote:
> Hi
> 
> Le ven. 3 mai 2019 à 17:23, Peter Maydell <peter.maydell@linaro.org> a
> écrit :
> 
>> On Fri, 3 May 2019 at 06:07, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> On 03/05/2019 02.36, Cao Jiaxi wrote:
>>>> gcc_struct is for x86 only, and it generates an warning on ARM64
>> Clang/MinGW targets.
>>>>
>>>> Signed-off-by: Cao Jiaxi <driver1998@foxmail.com>
>>>> ---
>>>>  contrib/libvhost-user/libvhost-user.h | 2 +-
>>>>  include/qemu/compiler.h               | 2 +-
>>>>  scripts/cocci-macro-file.h            | 7 ++++++-
>>>>  slirp/src/util.h                      | 2 +-
>>>>  4 files changed, 9 insertions(+), 4 deletions(-)
>>
>>>> diff --git a/slirp/src/util.h b/slirp/src/util.h
>>>> index 01f1e0e068..278828fe3f 100644
>>>> --- a/slirp/src/util.h
>>>> +++ b/slirp/src/util.h
>>>> @@ -43,7 +43,7 @@
>>>>  #include <netinet/in.h>
>>>>  #endif
>>>>
>>>> -#if defined(_WIN32)
>>>> +#if defined(_WIN32) && (defined(__x86_64__) || defined(__i386__))
>>>>  # define SLIRP_PACKED __attribute__((gcc_struct, packed))
>>>>  #else
>>>>  # define SLIRP_PACKED __attribute__((packed))
>>>>
>>>
>>> The slirp code is currently on its way into a separate module, so you
>>> might need to provide that hunk to the libslirp folks again... I'm
>>> putting the slirp maintainers on CC:, maybe they can pick it up from
>> here.
>>
>> Yes, the slirp module has now landed in master, so this patch
>> definitely needs to be split into two. I've kept in my
>> target-arm.next tree the parts which are applicable to
>> the QEMU repo itself (ie everything except the slirp/ change),
>> so we just need a new patch for the slirp submodule part.
>>
>> Marc-André, Samuel -- what's the process for submitting and
>> getting reviewed changes to the slirp submodule now it's a
>> separate project ?
>>
> 
> It's hosted on gitlab.freedesktop.org, with some CI. It's fine to send
> patches on qemu devel, as long as Samuel or I are in CC. But in the long
> term, I think gitlab MR will be favoured (after a while using it, I think
> gitlab is better than ML for patches & bug tracking tbh)

Except when working offline (or with poor intermittent link).

