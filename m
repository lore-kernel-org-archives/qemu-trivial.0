Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCgJG-0007JO-41
	for mharc-qemu-trivial@gnu.org; Fri, 13 Mar 2020 05:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36763)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jCgJE-0007JH-DO
 for qemu-trivial@nongnu.org; Fri, 13 Mar 2020 05:08:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jCgJD-0001JA-DK
 for qemu-trivial@nongnu.org; Fri, 13 Mar 2020 05:08:48 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:46901)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1jCgJD-0001F4-4G
 for qemu-trivial@nongnu.org; Fri, 13 Mar 2020 05:08:47 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MBltK-1j2nt12rxU-00CBlp; Fri, 13 Mar 2020 10:08:43 +0100
Subject: Re: Missing unlock_user_struct , Deadlock
To: Mansour Ahmadi <mansourweb@gmail.com>, qemu-trivial@nongnu.org
References: <CAGT9xrAYkEMy=Yd1exCyqoq8xsiM9a7kVnG0LfdiisCpn+jiuA@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <d32cda89-7212-27e6-25e2-a2b9c8014ebb@vivier.eu>
Date: Fri, 13 Mar 2020 10:08:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAGT9xrAYkEMy=Yd1exCyqoq8xsiM9a7kVnG0LfdiisCpn+jiuA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wzvoHjCbFD4trzTNqsynDnycc+6KsEFr4XfXTc7ryppw/P1mhDv
 ZEqKJ6AtlgXDSAePgyQFZdhPS+n6FvGOAIEGmVnrvCOHqlKyTjqwmNteowllcRE3RwtOTvx
 1tWFGEq3dD10WLZQObaYeC8FRvoAG15POGTTFLDhpDfXll6zta+Lp1fe8YYwlTmu3ofSbmf
 z3gS9BRQCuR1yCNpKMsVA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5aO4Y6fUEpQ=:O9Fsz0qyyGr1Q9qAIidYy7
 DfkpBhqfmDCY8gdDYad/CPXYvBifdoB22cUA6wP4ZSRTBKIQQtsFVcixzXa0HJ4qwd/tgGSa3
 2kLK93s1QzSL6jfj+fVEFrHkHCCUIVHqTEWZdyDYO6T4+UeASigVxqFwNFozhWCAClQWl/shs
 +7/IQCWC3WwbfbmCMpJWNeBV69sWoW6hmm2rbch6VP2VbnRb+ABw2B0J7fgQh3Rhsc1GNvNbj
 UBSAp4YsDpdpuONwEA3XSg3SQzf0jd25UoKxJ4o6e2uKtfrRpZKG+eTx8Ns8Or4s5tgeHYPqv
 6Dubfnwb+MnVr14AlL7GV7LaHjlabam/w4EM4ZKpMVbQ9+HnM9oz4YitR4WNTmzP93M6Q2+Kn
 lhLgs0Lb+nBV+MfIBRpNQlI5q7fCRMxhqLu1SPYCAO6pxuQn0SFOpH2mAq6wTGbvMOxvm0jlg
 7AgAqzS993BiriXKZv0URZTkBVBw2gk/0zPS4MlYXzag3JCc20aQCZJSmA2uirGhbmOKgqjV5
 AdxkfR6+rM3R636d+jYLo6UhO7CkSKu/sKqxqoaYs4HE3X1tk+W+Jkk9ki2qj1c7wa6mpGTfB
 iTZxTgMDecjfFY4dyNTTj9kfeaE86eaR2MHhJllDInUjEnKDA9JNNi5TZCJrg64SYlBQx9f0d
 aPk4E5xSJx1RnAQMC41Cb9AOsZxGYEsKAA+Lz2n5LFd0mXiNZBkwMoU0kaMRh33vcooJiEg80
 FiiyKAC4gKP7hfn2XfeYrk3BnsEJkgfE72qigI7rG+08wRNwYWYOW5RGb5t/fFqJnNub3oKpA
 5nwm2Bmo51egU1g+1DbA5YlWgagFC5UEKaM1BSqlUxlG4pyJBe0romAllwlsrfoT3HIckvd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
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
X-List-Received-Date: Fri, 13 Mar 2020 09:08:49 -0000

Le 13/03/2020 à 05:52, Mansour Ahmadi a écrit :
> Hi
> 
> In the case of badframe, user struct is not unlocked here and may lead
> to deadlock:
> 
> https://github.com/qemu/qemu/blob/d4f7d56759f7c75270c13d5f3f5f736a9558929c/linux-user/m68k/signal.c#L380

badframe is called if lock fails, so no need to unlock.

> In similar case, it in unlocked correctly:
> https://github.com/qemu/qemu/blob/d4f7d56759f7c75270c13d5f3f5f736a9558929c/linux-user/sh4/signal.c#L303

ditto

Thanks,
Laurent

