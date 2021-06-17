Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ltsgB-0008Hk-9s
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jun 2021 10:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltsgA-0008GR-JE
 for qemu-trivial@nongnu.org; Thu, 17 Jun 2021 10:07:34 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:47046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltsg7-0002Os-GZ
 for qemu-trivial@nongnu.org; Thu, 17 Jun 2021 10:07:34 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a11so6938851wrt.13
 for <qemu-trivial@nongnu.org>; Thu, 17 Jun 2021 07:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=KAqFma5/2Au8a0Y03sz1UO4KzUh/FoiX2O/oIqbuN0M=;
 b=vT3iF1syYwmE+J/5jDXA+2+X9m0/Ip45OTH7okyE9xPVM6lhx8VR83RoUC7byZ0MFT
 NPDfBkPn1aLrDvaymOwb8s55yRYTCOzMm1xELyjHbeNb/Nag24v3CDpL9r5DdHDBAq8b
 Y8DHauPZWDwCnEazp/reJGoWQMlXqCxkqzuC8rrIpL0AtiUYWPyC4k5i75VsebIWRSeE
 49rBxbEpHw7Q/SMHkq4VlpavLdVf1VGbqbIfB21Uof8WkLgorwfjgfwLwXUgRVJJ3EEZ
 hLE+zE64CGV1iFvo45+gK6dEsneWMt5ALSkeiq8qo3UAZB0dRtMVn/PTwSvMhASFrUSX
 U5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=KAqFma5/2Au8a0Y03sz1UO4KzUh/FoiX2O/oIqbuN0M=;
 b=bMUmLSplIoSJvz94DxqyWY4m+aEFA2IFx3/zSsqbP0Qtu4KhKpUedFQ3oEoPwE/mDn
 e1whHQFA+28S8PNCO+WYZD7iJqUFifiZ1UL0C9i7ra0C3Rez/6dmVwv+VxlgKLscsw7w
 TrPbJB2nL7r0cGj/CxDBoolkL9aA/T3/F49DYcXjWW4NZbUJcHP1LVNkD9XVspuliCvf
 /Vbmnwxq9GnmHVSO8tkkDNpTFgf3q604y7U02TNXGlLs1EPkR8K++W6+/h4iJKT4vSVw
 3usp7R+FpSaCNzgl22UuGoHK1kW6X6brAI1SM/G7sJIoq/277MTqO+fjlRsIqcTLqX7r
 dwnA==
X-Gm-Message-State: AOAM532i9VILmaFGuG6ieFjaTGVO3GY9Iu108hAnHrvQmCw86JMz277g
 Ud65QhWvmvIqN/UD8edtJIlwXA==
X-Google-Smtp-Source: ABdhPJx4GqjdG8X89SqZjxmavMvdL/Hk7vZE2pu8jNUxBL5S1lHZbV0Boump5qyLbTrYak9uSar8eg==
X-Received: by 2002:adf:e68a:: with SMTP id r10mr5985870wrm.326.1623938848789; 
 Thu, 17 Jun 2021 07:07:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k5sm5492325wmk.11.2021.06.17.07.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 07:07:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 35C511FF7E;
 Thu, 17 Jun 2021 15:07:27 +0100 (BST)
References: <20210614144245.17660-1-alex.bennee@linaro.org>
 <17fb7318-14ba-bd77-aeaf-ad9ec33118f8@vivier.eu>
 <874kdwg1bl.fsf@linaro.org>
 <104b4a05-fe6f-cb58-b803-70dc8c5e50d8@vivier.eu>
 <3005eb50-fa4b-4e10-2182-102e71f71f59@vivier.eu>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] linux-user/trace-events: fix minor typo in format
 string
Date: Thu, 17 Jun 2021 15:06:38 +0100
In-reply-to: <3005eb50-fa4b-4e10-2182-102e71f71f59@vivier.eu>
Message-ID: <871r90fuu8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
X-List-Received-Date: Thu, 17 Jun 2021 14:07:34 -0000


Laurent Vivier <laurent@vivier.eu> writes:

> Le 17/06/2021 =C3=A0 14:20, Laurent Vivier a =C3=A9crit=C2=A0:
>> Le 17/06/2021 =C3=A0 13:47, Alex Benn=C3=A9e a =C3=A9crit=C2=A0:
>>>
>>> Laurent Vivier <laurent@vivier.eu> writes:
>>>
>>>> Le 14/06/2021 =C3=A0 16:42, Alex Benn=C3=A9e a =C3=A9crit=C2=A0:
>>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>>>
>>>>> ---
>>>>> v2
>>>>>   - fix typo in summary :-O
>>>>> ---
>>>>>  linux-user/trace-events | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/linux-user/trace-events b/linux-user/trace-events
>>>>> index 1ec0d11ee3..e7d2f54e94 100644
>>>>> --- a/linux-user/trace-events
>>>>> +++ b/linux-user/trace-events
>>>>> @@ -11,7 +11,7 @@ user_do_rt_sigreturn(void *env, uint64_t frame_addr=
) "env=3D%p frame_addr=3D0x%"PRIx
>>>>>  user_do_sigreturn(void *env, uint64_t frame_addr) "env=3D%p frame_ad=
dr=3D0x%"PRIx64
>>>>>  user_force_sig(void *env, int target_sig, int host_sig) "env=3D%p si=
gnal %d (host %d)"
>>>>>  user_handle_signal(void *env, int target_sig) "env=3D%p signal %d"
>>>>> -user_host_signal(void *env, int host_sig, int target_sig) "env=3D%p =
signal %d (target %d("
>>>>> +user_host_signal(void *env, int host_sig, int target_sig) "env=3D%p =
signal %d (target %d)"
>>>>>  user_queue_signal(void *env, int target_sig) "env=3D%p signal %d"
>>>>>  user_s390x_restore_sigregs(void *env, uint64_t sc_psw_addr, uint64_t=
 env_psw_addr) "env=3D%p frame psw.addr 0x%"PRIx64 " current psw.addr 0x%"P=
RIx64
>>>>>=20=20
>>>>>
>>>>
>>>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>>>
>>> Are you going to queue or shall I add it to my pile of "misc"?
>>>
>>>
>>=20
>> You can put it in your pile if you think you're going to do a pull reque=
st soon.
>>=20
>> I don't plan to do a trivial branch pull request before next week.
>
> But I'll try to do a linux-user one before...

Go for it, I have nothing cooking at the moment apart from a massive
re-base of the ARM refactor series :-/

--=20
Alex Benn=C3=A9e

