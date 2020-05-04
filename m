Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVa2R-0003iJ-5d
	for mharc-qemu-trivial@gnu.org; Mon, 04 May 2020 08:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVa2Q-0003fv-0N
 for qemu-trivial@nongnu.org; Mon, 04 May 2020 08:17:34 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:41204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVa2O-0000X5-15
 for qemu-trivial@nongnu.org; Mon, 04 May 2020 08:17:33 -0400
Received: by mail-ot1-x332.google.com with SMTP id c3so8634352otp.8
 for <qemu-trivial@nongnu.org>; Mon, 04 May 2020 05:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dGfKgcJj7oYnARI4vDwaTmVA0K9Rg0bpOoviI7+r8Eo=;
 b=itJYXknHOuo0DXxI59qJ/R48gh7xwh6FNKZZN4Ko35/fdxCyEXMVc8aD0GC6tj9A39
 0JbQzJoD4vI87dAsdQnNy8EMMbWY4nrlEPNZMCly6Es7AK6hGvsQ0tOBWbwWfRqntyZy
 UOXRRwg8HD0QGO9aZlAu7f8NgHt8Uzn39KNahzcxrJ8CWZur0fh0N9JYqzJuwz7JwCTv
 SyPep82SzCKhWOfdaBvKcgxmPRZt91NW60sdvXKvc5AD/QvOva8SSDDxgFYoZDU1Hgsu
 p9eQKM9hh2QrR8eWcHdD3w5OSkdl1WNCtaw3XsSGew0ZbaeNEl8IwlhAkWTrUy7hlQO3
 z6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dGfKgcJj7oYnARI4vDwaTmVA0K9Rg0bpOoviI7+r8Eo=;
 b=SBnYvJWpRbCWUeoF1W5F8s22qFOjsP1jcs3dzmPILyTaE0RsFzcS90V9uEho48drWS
 sJPaMySSgI6iceoKbvIbqY19FLfkjwjLWF0nQc2PB9vvvbxIwFGLNBjAZkK0NtIuc58f
 9dUepr6r+NBzjidOOP4+s2ZMuzhaeNsG5BbrJ0l1oKTM/Lhz7of85cER/8FmqYeGECrY
 n+mRKPsbpebTra9fZJTXtk4/dFWi8CUUkqMwrNri5fTSkS28UV14Pl02Why/+86IMit9
 /IQZeLK/BPRK/V37qd8yNthMZlYFtJJrJysosFGbD03WuNsnvX76VB/Fd1YdiOS/Td7D
 eMeA==
X-Gm-Message-State: AGi0PuYVC+eU8ulEF/yMFcwQVbF4Pi2X1NQhVPHojb6R3KCg84B4EgXl
 YnDC4vw0gDa7HZm/MMb8CTH0vEbVfsAnXbViZVaL+Q==
X-Google-Smtp-Source: APiQypKFQA0VU5i4CDlmI79Z+wiJCff9wGF/nQ+FfvjN+wIs2zXSQoCsPxqbkzUerlnOhSWrg6Mp48DtDxf33ix4Uv8=
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr13756837otj.91.1588594650616; 
 Mon, 04 May 2020 05:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200504115758.283914-1-laurent@vivier.eu>
In-Reply-To: <20200504115758.283914-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 May 2020 13:17:19 +0100
Message-ID: <CAFEAcA_FDt+1+ezAyRE-fwdd=VuG5YNThkKiHHTUOYqtRHLoyg@mail.gmail.com>
Subject: Re: [PULL 00/20] Trivial branch for 5.1 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x332.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 04 May 2020 12:17:34 -0000

On Mon, 4 May 2020 at 13:05, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 2ef486e76d64436be90f7359a3071fb2a56ce835:
>
>   Merge remote-tracking branch 'remotes/marcel/tags/rdma-pull-request' into s=
> taging (2020-05-03 14:12:56 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-5.1-pull-request
>
> for you to fetch changes up to 4341a0106781043a708c061b676312e5bb5d4488:
>
>   hw/timer/pxa2xx_timer: Add assertion to silent static analyzer warning (202=
> 0-05-04 12:06:21 +0200)
>
> ----------------------------------------------------------------
> trivial patches (20200504)
>
> Silent static analyzer warning
> Remove dead assignments
> Support -chardev serial on macOS
> Update MAINTAINERS
> Some cosmetic changes


Compile failure, OSX:
/Users/pm215/src/qemu-for-merges/block/file-posix.c:1620:9: error:
unused variable 'ret' [-Werror,-Wunused-variable]
    int ret;
        ^

Compile failure, aarch32 (but probably the result of whatever
crypto options/dependent libraries are on that setup):

In file included from /home/peter.maydell/qemu/crypto/cipher.c:157:0:
/home/peter.maydell/qemu/crypto/cipher-builtin.c: In function
'qcrypto_cipher_aes_xts_encrypt':
/home/peter.maydell/qemu/crypto/cipher-builtin.c:136:36: error:
passing argument 1 of 'qcrypto_cipher_aes_ecb_encrypt' discards
'const' qualifier from pointer target type
[-Werror=discarded-qualifiers]
     qcrypto_cipher_aes_ecb_encrypt(&aesctx->enc, src, dst, length);
                                    ^
/home/peter.maydell/qemu/crypto/cipher-builtin.c:77:13: note: expected
'AES_KEY * {aka struct aes_key_st *}' but argument is of type 'const
AES_KEY * {aka const struct aes_key_st *}'
 static void qcrypto_cipher_aes_ecb_encrypt(AES_KEY *key,
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/peter.maydell/qemu/crypto/cipher-builtin.c: In function
'qcrypto_cipher_aes_xts_decrypt':
/home/peter.maydell/qemu/crypto/cipher-builtin.c:147:36: error:
passing argument 1 of 'qcrypto_cipher_aes_ecb_decrypt' discards
'const' qualifier from pointer target type
[-Werror=discarded-qualifiers]
     qcrypto_cipher_aes_ecb_decrypt(&aesctx->dec, src, dst, length);
                                    ^
/home/peter.maydell/qemu/crypto/cipher-builtin.c:103:13: note:
expected 'AES_KEY * {aka struct aes_key_st *}' but argument is of type
'const AES_KEY * {aka const struct aes_key_st *}'
 static void qcrypto_cipher_aes_ecb_decrypt(AES_KEY *key,
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

thanks
-- PMM

