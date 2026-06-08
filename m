Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51547CD8C9D
	for <qemu-trivial@archiver.kernel.org>; Mon,  8 Jun 2026 13:33:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wWa6l-0005Jd-Mi; Mon, 08 Jun 2026 09:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wWa6W-0005Hu-Ag
 for qemu-trivial@nongnu.org; Mon, 08 Jun 2026 09:33:24 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wWa6T-0004Ko-LM
 for qemu-trivial@nongnu.org; Mon, 08 Jun 2026 09:33:23 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-4602e2a0372so3039366f8f.3
 for <qemu-trivial@nongnu.org>; Mon, 08 Jun 2026 06:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780925599; x=1781530399; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O3k2lmka5DP8ABrv8IqZP/8L7S+qHmwHHkFgZrzJZGs=;
 b=oR6QIlgsRfTDEvnWXCfzY/MQzMetRkp8yG+zkVcEqC9ghUxHXk3JCzse9Nj3AqFUhf
 IydcBd5J2XwUESz8bPZGFPqSqZrz5aq36KEXkhd5ELLoMAIk5AbuwY7Zz0PkYHwH5Ys+
 d/SlO92PKSRXz4napjPCWm+R27HAOwMmcGhunNvxdGQ9NZlYnTDrapPU3G116GhicxZX
 eZhFxaqBeXZrHfRoxWCCIZCAzMMG6490IhbnmMn1X5EVRBQzVMKpk8uJtEw6vr0oG6bD
 omFtU8/nYWPZn9L9RnwjUdnxY/fxWdOhn5W9xwNPZ0h7sQjGyziMhL0nVHZ0vZMky9dJ
 66RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780925599; x=1781530399;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O3k2lmka5DP8ABrv8IqZP/8L7S+qHmwHHkFgZrzJZGs=;
 b=VuNyMp/HiF+zkFBLaQGiRHZ/Hi89Nh6gFmOLb8pju3RDrKmawDXZtx9zpxeSx6OAzV
 CDIquNRKFKQJOQ051BjANmI1bq+XmlStmJ1DeaGi6dpllIPxrX6nt89FclFZf2tPSqVs
 UI7fExGq3i7rF7AlV/Jtzh8nK8DeL6m9YpXB42H23VTXl3twUWlhfpq8H4V2dMrYCoZ/
 pA5x+3Z6KAnuqcyA7t5mAjTU+zEwhj3eHzKVEiJCgBxHcKSvHoNi1Jwqt9VfaZL0hbK6
 MGODwF+hoto2SCqtyAWUxnrqkPDSDQ6+ygD/YCACx4BMzGzK8C2wkmSuRmOEvMNO7vul
 oZ1w==
X-Forwarded-Encrypted: i=1;
 AFNElJ94tqEeWy9/4KWCJO6skKdGAt2XPwRo2BuZ1tqJV1imJZZrLAMHZMLkI6MAZTIItBqEevRLFOg/uUfMqDI=@nongnu.org
X-Gm-Message-State: AOJu0Yx3cOKJVQfKddkn7NltyupkbBzAaJcSVBaljA98kvuIMGWMywrg
 zXsSz4uyi/YoN2cM3fIKzCJZrE/EehU/2R/xqVEbCSzOq9+gX0JeF78tlaIFqujw4BM=
X-Gm-Gg: Acq92OEPzyRCMp7q5BkfEzhY/2Bk2uaUT9uhKfOguREkQs+82NgWQLaABvte/HutiBy
 dq44scarRpou508rN3xkbjM9CY10QqwCMs1evxr4nX7j0qxzW3+FnUciIE7AdKSgkEmNCGcrgLf
 v+KlgsvjDdHT9N/uLcrY3hNDXsFY9Ph6DWfHjG3EJslIm0f/uxuyN5e05L8bD52AWZFnD3clViX
 wdQk8+vL8Vk+N7DMacKrh3A/36MpbF8kAm6r8fllQo/t/D5SdWlv3suLmIph1/EtdC88zgr8Ii9
 tgDAKsPmruRpL4WL5Qaz+2GaENyKhAv4lJw0rfblZqa3AWlZGSaJz347TyY5lABH0HFgLwkp3QJ
 jLeBRYxVtluf6TafljiNiCzZFQYrMX3rZBlTYRUnijvlX12cEXmwEAQG4qIwA/lhxmi7zp29ZQ1
 noX3vAoLpae8DcbhSLfwQoAuvPyHy7AK+XpA==
X-Received: by 2002:a5d:58f8:0:b0:460:42c:1133 with SMTP id
 ffacd0b85a97d-46030510ae2mr17945870f8f.14.1780925599328; 
 Mon, 08 Jun 2026 06:33:19 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f351d69sm95131754f8f.29.2026.06.08.06.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 06:33:18 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 883EA5F7DE;
 Mon, 08 Jun 2026 14:33:17 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Lucas Cardoso <luc.fast2004@gmail.com>,  qemu-devel@nongnu.org,
 kraxel@redhat.com,  qemu-trivial@nongnu.org,  marcandre.lureau@redhat.com
Subject: Re: [PATCH v2] hw/audio/fmopl.c: Convert malloc, free to g_malloc0,
 g_new and g_free
In-Reply-To: <252f4369-68c4-4b34-a076-9c844b25720e@tls.msk.ru> (Michael
 Tokarev's message of "Mon, 8 Jun 2026 12:49:54 +0300")
References: <20260428162048.2995097-1-luc.fast2004@gmail.com>
 <252f4369-68c4-4b34-a076-9c844b25720e@tls.msk.ru>
User-Agent: mu4e 1.14.1; emacs 30.1
Date: Mon, 08 Jun 2026 14:33:17 +0100
Message-ID: <87y0gp17j6.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Michael Tokarev <mjt@tls.msk.ru> writes:

> On 28.04.2026 19:20, Lucas Cardoso wrote:
>> In accordance with QEMU's coding style guidelines, replace raw memory
>> allocation functions (malloc/free) with their GLib equivalents
>> (g_new/g_malloc0/g_free/g_clear_pointer).
>> Also removes the old generic error-handling code from
>> OPLOpenTable(), since the Glib functions abort the program automatically
>> if memory is exhausted.
>> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/1798
>> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> Signed-off-by: Lucas Cardoso <luc.fast2004@gmail.com>
>> ---
>> v2:
>> - After some studying, I decided to follow Marc-Andr=C3=A9's feedback to=
 use g_clear_pointer() instead of g_free(), on the OPLCloseTable function.
>>   hw/audio/fmopl.c | 43 ++++++++++++-------------------------------
>>   1 file changed, 12 insertions(+), 31 deletions(-)
>> diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
>
>> +    TL_TABLE =3D g_new(int32_t, TL_MAX * 2);
>> +    SIN_TABLE =3D g_new(int32_t *, SIN_ENT * 4);
>> +    AMS_TABLE =3D g_new(int32_t, AMS_ENT * 2);
>> +    VIB_TABLE =3D g_new(int32_t, VIB_ENT * 2);
>
>
> How about this:
>
> diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
> index a63ad0f04d..91a41f5fa9 100644
> --- a/hw/audio/fmopl.c
> +++ b/hw/audio/fmopl.c
> @@ -175,18 +175,18 @@ static const int32_t SL_TABLE[16]=3D{
>  /* TotalLevel : 48 24 12  6  3 1.5 0.75 (dB) */
>  /* TL_TABLE[ 0      to TL_MAX          ] : plus  section */
>  /* TL_TABLE[ TL_MAX to TL_MAX+TL_MAX-1 ] : minus section */
> -static int32_t *TL_TABLE;
> +static int32_t TL_TABLE[TL_MAX*2];
>
>  /* pointers to TL_TABLE with sinwave output offset */
> -static int32_t **SIN_TABLE;
> +static int32_t *SIN_TABLE[SIN_ENT * 4];
>
>  /* LFO table */
> -static int32_t *AMS_TABLE;
> -static int32_t *VIB_TABLE;
> +static int32_t AMS_TABLE[AMS_ENT * 2];
> +static int32_t VIB_TABLE[VIB_ENT * 2];
>
>  /* envelope output curve table */
>  /* attack + decay + OFF */
> -static int32_t *ENV_CURVE;
> +static int32_t ENV_CURVE[2 * EG_ENT + 1];
>

I'm not sure if its worth permanently growing .bss for a device that in
all probability won't be used.
>> @@ -1081,11 +1065,8 @@ FM_OPL *OPLCreate(int clock, int rate)
>>   	/* allocate OPL state space */
>>   	state_size  =3D sizeof(FM_OPL);
>>   	state_size +=3D sizeof(OPL_CH)*max_ch;
>> -	/* allocate memory block */
>> -	ptr =3D malloc(state_size);
>> -	if(ptr=3D=3DNULL) return NULL;
>> -	/* clear */
>> -	memset(ptr,0,state_size);
>> +    /* allocate memory block and zero-initialize */
>> +    ptr =3D g_malloc0(state_size);
>>   	OPL        =3D (FM_OPL *)ptr; ptr+=3Dsizeof(FM_OPL);
>>   	OPL->P_CH  =3D (OPL_CH *)ptr; ptr+=3Dsizeof(OPL_CH)*max_ch;
>>   	/* set channel state pointer */
>> @@ -1128,7 +1109,7 @@ void OPLDestroy(FM_OPL *OPL)
>>   	}
>>   #endif
>>   	OPL_UnLockTable();
>> -	free(OPL);
>> +    g_free(OPL);
>>   }
>
> And this is a 2-piece allocation in one go.  Which is,
> by the way, is also fixed-size (state_size is constant).
> I'd either split it into two separate allocations, or better yet,
> made OPL->P_CH an array (instead of a pointer.
>
> This whole file needs quite some care.  Incomplete or wrong or out of
> place comments, mix of different coding styles, tricky allocations like
> this one which don't need to be tricky, etc..  Many different things.

Yeah I just scanned though:

  /* lock/unlock for common table */
  static int OPL_LockTable(void)
  {
          num_lock++;
          if(num_lock>1) return 0;
          /* first time */
          cur_chip =3D NULL;
          /* allocate total level table (128kb space) */
          if( !OPLOpenTable() )
          {
                  num_lock--;
                  return -1;
          }
          return 0;
  }


which needless to say is faking a lock with num_lock++ which should
totally be using qemu_mutex - although even that might need some
handling to make sure its initialised properly.

>
> I dunno...
>
> /mjt

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

