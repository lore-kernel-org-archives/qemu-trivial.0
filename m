Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ltqUf-0001jR-Ju
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jun 2021 07:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltqUd-0001iU-LX
 for qemu-trivial@nongnu.org; Thu, 17 Jun 2021 07:47:31 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltqUb-0001lS-Hk
 for qemu-trivial@nongnu.org; Thu, 17 Jun 2021 07:47:31 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso6183607wmg.2
 for <qemu-trivial@nongnu.org>; Thu, 17 Jun 2021 04:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=97nQg0jygz82rW1L13AA0TgpnBBGpn+/RmGZCsrffS8=;
 b=Ogsgwd4sWwYm+9SxvkVZd9q+dBZUEnao5SMn3TXVcdi7K/RomLeKKtjoekwWrnVj0F
 i6vRTqwpVj0x7dqtMv5lx7pVHpCR3dXLl+C1Ifidf8pjftcs2IAwJLS3lhPzxWK4ggoI
 EOqRJ5t0idNhVwfmfg/+mtViuBGsBbM3aD/+/L6j7RShDuRQYOB9wjtLrICymTpBQv2J
 DKK3Ytgg++9wDtrb7ODFBoE8ZQZ6HJtyjK6sH2w4TPZ1qkBPaTNgMiTSMTEaYodHc7ky
 bKFrVawQ+aAmw8hXHKHkR5cKyQ4gw3u5bLUa2j4g+C9ImiipTRiaBct2+PYrSvjmRt8U
 DhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=97nQg0jygz82rW1L13AA0TgpnBBGpn+/RmGZCsrffS8=;
 b=nJ4t238KUt4B7GN83s+ANHz/+5+rfTFfanSG/tFBwWSHq+fuAsnYA1SBclRTDUIfcU
 Uwfe6ATaIQUTCx2IFXt8//h6Tc6qoCjjIqvPsSACrESG4BTkmUyrg7yiOqd4fFD7qIzu
 NQ4jOYHU8YwC+PVS7vEn5VmShvHeOzwOxVGWSIx6gIFjRbjcVRkh8Zb/Cyi91exF/Kvi
 /E1+bltKEAjR+QUKHWhn+6yLm8aEpLJ1j2waA9xN1Oe78PWF0j8hSKhyaRJxfsSMp1fK
 OzExzO0kSxpuelR1M75LxhITxbRB871EYECCTjIzukA7erRJYsCKzgxAkFUpUrj2znb8
 es8Q==
X-Gm-Message-State: AOAM533n9bSqbRbbib7ZFsFW/EAXNpQVl7+oBaoN5qYf1o3ftUo530EP
 1Wm0X9G7du4wxct1jKc8McXY1w==
X-Google-Smtp-Source: ABdhPJxOTR8UVKbRUhpmf8MP5Ela5EuWFfWSLIwNYyTC68bKKHpbAoVVKhdagxqRY+IfmAk3FV32OQ==
X-Received: by 2002:a05:600c:218a:: with SMTP id
 e10mr3769436wme.183.1623930447867; 
 Thu, 17 Jun 2021 04:47:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k36sm4303022wms.30.2021.06.17.04.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:47:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2DD621FF7E;
 Thu, 17 Jun 2021 12:47:26 +0100 (BST)
References: <20210614144245.17660-1-alex.bennee@linaro.org>
 <17fb7318-14ba-bd77-aeaf-ad9ec33118f8@vivier.eu>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH v2] linux-user/trace-events: fix minor typo in format
 string
Date: Thu, 17 Jun 2021 12:47:11 +0100
In-reply-to: <17fb7318-14ba-bd77-aeaf-ad9ec33118f8@vivier.eu>
Message-ID: <874kdwg1bl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 17 Jun 2021 11:47:31 -0000


Laurent Vivier <laurent@vivier.eu> writes:

> Le 14/06/2021 =C3=A0 16:42, Alex Benn=C3=A9e a =C3=A9crit=C2=A0:
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>=20
>> ---
>> v2
>>   - fix typo in summary :-O
>> ---
>>  linux-user/trace-events | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/linux-user/trace-events b/linux-user/trace-events
>> index 1ec0d11ee3..e7d2f54e94 100644
>> --- a/linux-user/trace-events
>> +++ b/linux-user/trace-events
>> @@ -11,7 +11,7 @@ user_do_rt_sigreturn(void *env, uint64_t frame_addr) "=
env=3D%p frame_addr=3D0x%"PRIx
>>  user_do_sigreturn(void *env, uint64_t frame_addr) "env=3D%p frame_addr=
=3D0x%"PRIx64
>>  user_force_sig(void *env, int target_sig, int host_sig) "env=3D%p signa=
l %d (host %d)"
>>  user_handle_signal(void *env, int target_sig) "env=3D%p signal %d"
>> -user_host_signal(void *env, int host_sig, int target_sig) "env=3D%p sig=
nal %d (target %d("
>> +user_host_signal(void *env, int host_sig, int target_sig) "env=3D%p sig=
nal %d (target %d)"
>>  user_queue_signal(void *env, int target_sig) "env=3D%p signal %d"
>>  user_s390x_restore_sigregs(void *env, uint64_t sc_psw_addr, uint64_t en=
v_psw_addr) "env=3D%p frame psw.addr 0x%"PRIx64 " current psw.addr 0x%"PRIx=
64
>>=20=20
>>=20
>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Are you going to queue or shall I add it to my pile of "misc"?


--=20
Alex Benn=C3=A9e

