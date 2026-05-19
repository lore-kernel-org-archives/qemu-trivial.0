Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95764CD4F57
	for <qemu-trivial@archiver.kernel.org>; Tue, 19 May 2026 12:16:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wPJMM-0006AH-HR; Tue, 19 May 2026 08:15:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wPJMK-00069c-Sx
 for qemu-trivial@nongnu.org; Tue, 19 May 2026 08:15:40 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wPJMI-0004ho-Vp
 for qemu-trivial@nongnu.org; Tue, 19 May 2026 08:15:40 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4890d945eb4so24139175e9.0
 for <qemu-trivial@nongnu.org>; Tue, 19 May 2026 05:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779192937; x=1779797737; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w2NQjIjyumK2mXUiLmWfCFhx1hgkbPYL7k4RdOc49DU=;
 b=Eq8jLyuE83Q6thM63MlzCW7VmEpbr6kSQdsBaaVNmwN7J/mxE+0pr1djdBv+c+wbVc
 tNRGCvVLWtWZ0GN1tgTXJ1FFTz2hxYrov9gs7JRSP8hf0o+G1CWZf96AyjbnN+jKzvBi
 chrojKzWOcLdtI3VdVeEdFHoVxqDVSOJdRoGYST50tzFITRYple1FbRtcDWefcRPZvpO
 pOONwErVcLuDkl/IVabn9xsNcoGH6j/Rl4A92xfya0ODE/T/vMeZiGvAJK0i8JA8ExTF
 c5+tLUDVV/HUPAXqps8+hzML2yAKrKZgAZ59xsxyW/x2JxxVNUr/u/ncVwEgxPcA5/CY
 iTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779192937; x=1779797737;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w2NQjIjyumK2mXUiLmWfCFhx1hgkbPYL7k4RdOc49DU=;
 b=Ej7tDoe+9GCIGU3oze8rCmXw00APve7G8PTIs0aL4Zj8xKao6VVCuqq9FCAp1w3/0c
 M0b1pIIy6Txw1QZvv+BnxoehU2qJUrUS5JI9VUN4/mCvHUJidwbXeuAFyqukd2NXKIWE
 rw9l1TMB1FNOpO6Qs0HqV6WZJZmqI2qbA0Q/5Y1LZmPhoAcnRqtbFrzp25PH9NgRGbC4
 3q9ooN6CstEGqoap8/YqJxWT6DJbhxfqOXM4JD9uPb7YMyOgDHP73NQe+ZW6BN4k5zkw
 YzKR1R6M9GZfw5BLI7qohKpSCF0m4CgYGPYV7YRKQN7/aicCKkMIq4y428p3RgPMBfzk
 nxLg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8kQ/WK1dmAxESmPsGkQcXkyGZ9KjdN3rvW/J+/QO2JVJEUiSEAh1yMQYQLEbqVeiF0wg43S8E04r0Ze/s=@nongnu.org
X-Gm-Message-State: AOJu0YyJmqDd6VTvvVvjdHDMwEKChtpiDJtn4MxsIpWUGQn8CoAHI+1U
 0J5LCBCEN9fJwO4lS5d4ikdxni+GqQlWzbmdzPBOeOG52D2LytDZHzr/txpwKPsX7C0=
X-Gm-Gg: Acq92OEa67dDnONS98JIBRP/50sZ+JQjv2K+LTZDqBVGbANKF5gGM5oJzTxf/IPaD4W
 rHEOi4Svhq7xGZF2GLsF1sqgdpRNaSekizV/72rSbvFwl8LwGslaDJqk7H4lPaii1m7Y2kSXMlE
 +isSF+AQJ/d5DAB33vgDaOVqC3XM9U9WIsnqwDojEXC4TN259TT6jyEKGoFsCR/xaqTuA3hAiOh
 sX03CJZ1J0EHaXHBhOmvKfgP7DvnLVmIVGWuKymkDBPikvKL4hDAub5obI+OkRn+4HZDabl4U/j
 CteDzzGIAZo3dPRSuByLc+N4O3OYlcUY52v7/qpAVlstQJuKx3TP2WERXk9Q3zQ+PqEmh66X1JL
 /zjzoiORRC5cNKXFpcqFFQHiwwD1V1yjROFurdi6ERUGvKihtVMAbaPlRWhbnfwwAVSWZRA8chF
 MscAAZJ6rKSvtZXexv0CzEpZM=
X-Received: by 2002:a05:600c:609b:b0:485:3c2e:60d5 with SMTP id
 5b1f17b1804b1-48fe4cadfeemr292665445e9.2.1779192936657; 
 Tue, 19 May 2026 05:15:36 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48feaa2949asm153832375e9.1.2026.05.19.05.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2026 05:15:35 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E2BAB5F81D;
 Tue, 19 May 2026 13:15:33 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  qemu-devel@nongnu.org,  qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,  Cornelia Huck
 <cohuck@redhat.com>,  qemu-s390x <qemu-s390x@nongnu.org>
Subject: Re: [PATCH] system/rtc: Fix a possible year-2038 integer overflow
 problem
In-Reply-To: <b70b35ef-1761-4624-9f98-7c1ae161ed9a@redhat.com> (Thomas Huth's
 message of "Tue, 19 May 2026 11:26:15 +0200")
References: <20260518160255.1844308-1-thuth@redhat.com>
 <ags5_IDkvxClCdHm@redhat.com> <ags7xIsUG2DqX5vu@redhat.com>
 <dbc6464c-2685-46c4-803c-6af53d345083@linaro.org>
 <c9fa27e3-0939-4490-b350-7a625ebcdcdb@redhat.com>
 <b70b35ef-1761-4624-9f98-7c1ae161ed9a@redhat.com>
User-Agent: mu4e 1.14.1; emacs 30.1
Date: Tue, 19 May 2026 13:15:33 +0100
Message-ID: <87mrxvbnoa.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

Thomas Huth <thuth@redhat.com> writes:

> On 19/05/2026 11.18, Thomas Huth wrote:
>> On 19/05/2026 10.24, Philippe Mathieu-Daud=C3=A9 wrote:
>>> On 18/5/26 18:18, Daniel P. Berrang=C3=A9 wrote:
>>>> On Mon, May 18, 2026 at 05:10:36PM +0100, Daniel P. Berrang=C3=A9 wrot=
e:
>>>>> On Mon, May 18, 2026 at 06:02:55PM +0200, Thomas Huth wrote:
>>>>>> From: Thomas Huth <thuth@redhat.com>
>>>>>>
>>>>>> rtc_realtime_clock_offset is initialized with:
>>>>>>
>>>>>> =C2=A0=C2=A0 rtc_realtime_clock_offset =3D
>>>>>> qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
>>>>>>
>>>>>> And QEMU_CLOCK_REALTIME might be based on gettimeofday() in certain
>>>>>> cases (see get_clock_realtime() in include/qemu/timer.h). So this
>>>>>> counter will exceed 32 bits in the year 2038, thus we should not
>>>>>> store this value in a normal integer variable. Change it to an int64=
_t
>>>>>> to fix the problem.
>>>>>> And while we're at it, also adjust the nearby rtc_host_datetime_offs=
et
>>>>>> variable to be on the safe side in the related code.
>>>>>>
>>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>>> ---
>>>>>> =C2=A0 system/rtc.c | 4 ++--
>>>>>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>>>>
>>>> Actually on second reading I think this patch is not quite right.
>>>> The code which uses the value is:
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 time_t value =3D qemu_clock_get_ms(clock) / 1=
000;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 switch (clock) {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 case QEMU_CLOCK_REALTIME:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value -=3D rtc_realti=
me_clock_offset;
>>>>
>>>>
>>>> On 64-bit platforms 'int' was 64-bit already and so was time_t so we
>>>> have no bug to fix.
>>>>
>>>> On 32-bit platforms the patch fixes 'int' to 'int64' which is fine
>>>> but that int64 value is then subtracted from time_t which is usually
>>>> going to be 32-bit again, unless the OS was built with 64-bit time_t
>>>> on 32-bit which almost no one does.
>>>>
>>>> IOW we only platform this fixes is 32-bit OS with 64-bit time_t.
>>>
>>> "32-bit *host* OS".
>>>
>>> Per ./configure script, we still allow:
>>> - x86_64 x32 ABI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (CPU_CFLAGS=3D"-mx32")
>> We should maybe deprecate that x32 ABI ...
>>=20
>>> - sparc32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 (CPU_CFLAGS=3D"-m32 -mv8plus -mcpu=3Dultrasparc")
>> ... and that one as well?
>>=20
>>> - s390=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (CPU_CFLAGS=3D"-m31")
>> Uh, we really still allow 31-bit s390 hosts here? I think this could
>> be removed nowadays, also upstream kernel recently ditched the
>> 31-bit userspace:
>>  =C2=A0https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/
>> commit/?id=3D8e0b986c59c67e08ada646249f834655a9e6da16
>> Question is whether we can remove it immediately, or whether it
>> needs to be deprecated first?
>
> Ah, wait, we completely disallow disallow 32-bit hosts nowadays:
>
>  https://gitlab.com/qemu-project/qemu/-/commit/372ec46b9f1215f48a4717f2b7=
ed969f65bfadc6
>
> ... so these checks in the configure script are just dead code
> nowadays that could be removed now? Or is there still some hidden
> magic here that depends on these lines?

Didn't we re-enable 32 bit hosts for qemu-img and friends?
>
>  Thomas

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

