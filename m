Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rjbHg-00026U-U7
	for mharc-qemu-trivial@gnu.org; Mon, 11 Mar 2024 04:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rjbHf-000267-O4
 for qemu-trivial@nongnu.org; Mon, 11 Mar 2024 04:45:23 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rjbHT-0004Rw-Q9
 for qemu-trivial@nongnu.org; Mon, 11 Mar 2024 04:45:16 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33e9dfd343fso63312f8f.0
 for <qemu-trivial@nongnu.org>; Mon, 11 Mar 2024 01:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710146708; x=1710751508; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YqRWKpf3wPnvG+NAnIxIBlxW5VBhFD7P+Nga7DrY8YA=;
 b=gdR1NXLSux7z2F5/AMwsoSn+nKgsKhkLxcyBFJj2AmSvIY4gwtaZVkUvqYkMnH1qur
 7lJDvY7XWbSib6Fav0Kdpr28pg3zV/Y3+kBvaYPfs6xzrfGMby5PtUz0NYaNMOV7Yk+7
 adtzaOcjrsFTkoPxYoBhGfcyHqqiMKnlz0F1Y4FZaZEGIvA9RQpwVVSBWrUZ3dJ2fRk4
 CVmI3/NCWU2QbpxEixRUICSGjwqsWVCcZdjfWK1y+b63X+MdKfWdzvqU58h9A78zbIZ1
 ztcLWR9i4hDpxTw7Yk9NgPG9RWc9sRoF8UgJRaq1gQU/cREQk1qyf2QXZlQWpHihjX5M
 4rYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710146708; x=1710751508;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YqRWKpf3wPnvG+NAnIxIBlxW5VBhFD7P+Nga7DrY8YA=;
 b=vQWAdVyjE0XXm9yYiCaD8GpgOHKSi6YX/+GKLvyqxgAwkSGvPbe7rXV+icLuMhqwGy
 631L6wTzjkypnDJ3/cbJ1nTt8FXkAA1L918MJ1ZUJ0bhGzu7dF9Dlq3sWAxlN+5b+x6W
 q9zh7bnrqoGUgKw6LZyDuRFn2JKu3XdeikZnxWMfTn3eHnntspvAVVOBmo+QXItG04ut
 mPtDb5uOB92rOAWqKlWc+bPmdkNNO9P0nHA1RIQudpWpiO7g41rEbhJGgrl8cc+87SMY
 wPn/U1V0+Y9024SUg/U9g3nNx+29Lm6pt4yA6Hu/0r9y7c9Uvp65iFew24LAvAEBqiEe
 brVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW85vggD/sgbE1ytgPSIZKbgOcem18sq/7zVqyfQM+RsBA+HHUi75iq3mAEl5/FEMtIhxVxjrqO5tUKDyxNEuRSJXZJ9w82Wg==
X-Gm-Message-State: AOJu0YxCVvkRAhaBJKC6dVP2xkTnvMrwcNgr5ljpTGliWKPsfwK5TyJe
 5Z+eAj/uNBevtckal5dOFMWpbp+htl+4N7POjSqkOkXNsDHOLRUoV7CiB8qGBc8=
X-Google-Smtp-Source: AGHT+IEKs+DjALX4KGl0DGL8Bi8hXjX13yhvp7/JNSoECmL3gRx8OVwSpSJ9oP8aPtTlfw7FiPNkqQ==
X-Received: by 2002:adf:ea45:0:b0:33e:7f5c:a75c with SMTP id
 j5-20020adfea45000000b0033e7f5ca75cmr4088311wrn.47.1710146708114; 
 Mon, 11 Mar 2024 01:45:08 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.167.228])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a5d424c000000b0033e48db23bdsm5831823wrr.100.2024.03.11.01.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 01:45:07 -0700 (PDT)
Message-ID: <ea0d3e8d-1b96-46eb-a33f-0cca1c11a50e@linaro.org>
Date: Mon, 11 Mar 2024 09:45:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/ide/ahci: Rename ahci_internal.h to ahci-internal.h
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, John Snow
 <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org
References: <20240227131310.C24EB4E6005@zero.eik.bme.hu>
 <00a87926-49bf-4945-94fd-99f5c3a73bb0@linaro.org>
 <a1a9cdfd-8c54-dc8c-6512-9c59b63cdcdf@eik.bme.hu>
 <87zfv5uu28.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87zfv5uu28.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 11 Mar 2024 08:45:24 -0000

On 11/3/24 08:05, Markus Armbruster wrote:
> BALATON Zoltan <balaton@eik.bme.hu> writes:
> 
>> On Tue, 27 Feb 2024, Philippe Mathieu-Daudé wrote:
>>> On 27/2/24 14:13, BALATON Zoltan wrote:
>>>> Other headers now use dash instead of underscore. Rename
>>>> ahci_internal.h accordingly for consistency.
>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>> ---
>>>>    hw/ide/{ahci_internal.h => ahci-internal.h} | 0
>>>>    hw/ide/ahci.c                               | 2 +-
>>>>    hw/ide/ich.c                                | 2 +-
>>>>    3 files changed, 2 insertions(+), 2 deletions(-)
>>>>    rename hw/ide/{ahci_internal.h => ahci-internal.h} (100%)
>>>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> Was this also queued somewhere? I haven't seen it merged neither with the trivial nor the misc-hw pull requests.
> 
> I figure John (our IDE odd fixer) wouldn't mind this going via
> qemu-trivial.  Cc'ed!

I'll take it, thanks.


