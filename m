Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uWrOC-0006TF-DD
	for mharc-qemu-trivial@gnu.org; Wed, 02 Jul 2025 02:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uWrO9-0006SY-Vy
 for qemu-trivial@nongnu.org; Wed, 02 Jul 2025 02:56:14 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uWrO0-0007wb-Dz
 for qemu-trivial@nongnu.org; Wed, 02 Jul 2025 02:56:13 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-453749af004so35055965e9.1
 for <qemu-trivial@nongnu.org>; Tue, 01 Jul 2025 23:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751439359; x=1752044159; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pgu7VqDBRCkgwsJtMNJzkITzgF5YINgQ+CFLRGvMbOM=;
 b=lAIT/6bN2wtnSA2UDB4X6hicosC6DfkgJS3zEJUe1AH4V2hTPHAUFuwlZcPmM8vVMb
 n802jXaNpgS7ZvPZTk/dvFbwJgsu5/0PgpD5tu4AaRswWD3ArTlW6EZzXv3YVeKGXGat
 ojlInl+mhZ3kFTxF1V/uX5hYvAvsf+MtZ/BYtoIVf1rddSbNnwCJoqaQjrZRvfluPzSE
 PQyufAeGHA1c9KRsAADj/i4V/znoTXbQyxMEy/8N8xd7T4gOS3kx6k4Z7mFA3111P1f6
 4R3NUGOqPWFr9Hg8DY+pW5M0Q2brR6+9RzUgs65Ioc+YOe6n/VHjaamzSrzOAReWcP3B
 K+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751439359; x=1752044159;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pgu7VqDBRCkgwsJtMNJzkITzgF5YINgQ+CFLRGvMbOM=;
 b=iKRWyuA5dZS4QVl5CmN1aIl2z2+pRFyTQiqkTHdqYqrdT4A7juiXbdpyyDlETL4gv1
 rugAvzWEzF4u9hdHdKlSjWVpEP5fgT4MJIjWM1SgmKDO2MDIkvUva+8ArcjRNBsm/oWg
 LD7ZgLO6/AdixerYm/NWwhAzmvf0jsKlC0LvYbDn0oEn+lbASHRta4tCKxfbpyjoN8NL
 Ass2NK/Si6kF4SZ9ixSJUGPK5EnqM/09gwlgiOzXLqrYhI7roqtkbtmz7UONc4rfHRHs
 kwHYlzoFipV+vmyeq/b0suNxxgQfAkwGuxYHgY6R+iM4vZvG3A++8eKpHRS2DyorGnht
 6e9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnOdWeAJdj7a5/yliXjFKFGNnI1AYGZP2oBODdfZLY8vudaa42QFObBSRR6NGBXGf49Bv0R9HtvTLN1rY=@nongnu.org
X-Gm-Message-State: AOJu0YxsO72gmLGh2t5njW0EXt9xC3qPSOp1xSlA/sb1fPwpmz1kXq2n
 bchkSiPhf7hUpFGj7O9pHYfy9NB0/8zHg7agV9I8GOPMg72hFGmb36jRHrmEoWaheBk=
X-Gm-Gg: ASbGncuPqxUFYcu2CltM+IgMkJ4vz7QWwqcuI2G8TIh/JEvgA4Nq3v3l67WhUSMtKbt
 L2b4NM/BOkHeLpXztaY4BxE8R3Rm+CljAcBjAYts3jvp4MVho0I40sFpyY5KWui1fGIRV7fcrwx
 XiGP7Mf0vjh0kP9bSuS26adKOw6nse7pD3V6HoZ/DpXgofWSiZFPamtir0tbUp9Ccu3H26zdgO4
 dX0hlH1TUv2Ec1+HQ1OT3bZz4jsPpPdpEg0RRmsOI0u2Ic1TDces4/7njwpxSBXZ1Mg0De0aQ8T
 2JKXZjL05HIa0r+i9j4+bi9wAxfh5d1FTmsmMJa/g1kwrCU1RD6PgMoFsco19JPqzePoQNpAk4g
 I4/SaTjrVtRtKBliLtqdDKgd1wYKkNw==
X-Google-Smtp-Source: AGHT+IGtneCTq5/X1I2atVKDD+cfUWATiSPDzKx6KyMF+bybGxmJ4h86Dg7ULvaeEPLiJq6dMXcJIA==
X-Received: by 2002:a05:600c:8b22:b0:453:8bc7:5cbb with SMTP id
 5b1f17b1804b1-454a3726347mr14856515e9.25.1751439359173; 
 Tue, 01 Jul 2025 23:55:59 -0700 (PDT)
Received: from [192.168.69.166] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7e7814sm14978548f8f.8.2025.07.01.23.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 23:55:58 -0700 (PDT)
Message-ID: <83d7c55b-fa17-413d-8896-171d9538693d@linaro.org>
Date: Wed, 2 Jul 2025 08:55:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/kvm: Adjust the note about the minimum required
 kernel version
To: Zhao Liu <zhao1.liu@intel.com>, Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, qemu-stable@nongnu.org, qemu-trivial@nongnu.org
References: <20250702060319.13091-1-thuth@redhat.com>
 <aGTU2enBBQj7lu3E@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <aGTU2enBBQj7lu3E@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 02 Jul 2025 06:56:14 -0000

On 2/7/25 08:42, Zhao Liu wrote:
> On Wed, Jul 02, 2025 at 08:03:19AM +0200, Thomas Huth wrote:
>> Date: Wed,  2 Jul 2025 08:03:19 +0200
>> From: Thomas Huth <thuth@redhat.com>
>> Subject: [PATCH] accel/kvm: Adjust the note about the minimum required
>>   kernel version
>>
>> From: Thomas Huth <thuth@redhat.com>
>>
>> Since commit 126e7f78036 ("kvm: require KVM_CAP_IOEVENTFD and
>> KVM_CAP_IOEVENTFD_ANY_LENGTH") we require at least kernel 4.4 to
>> be able to use KVM. Adjust the upgrade_note accordingly.
>> While we're at it, remove the text about kvm-kmod and the
>> SourceForge URL since this is not actively maintained anymore.
>>
>> Fixes: 126e7f78036 ("kvm: require KVM_CAP_IOEVENTFD and KVM_CAP_IOEVENTFD_ANY_LENGTH")
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   accel/kvm/kvm-all.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> I just mentioned the kernel version in another patch thread. I found
> x86 doc said it requires v4.5 or newer ("OS requirements" section in
> docs/system/target-i386.rst).
> 
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index d095d1b98f8..e3302b087f4 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -2571,8 +2571,7 @@ static int kvm_init(MachineState *ms)
>>   {
>>       MachineClass *mc = MACHINE_GET_CLASS(ms);
>>       static const char upgrade_note[] =
>> -        "Please upgrade to at least kernel 2.6.29 or recent kvm-kmod\n"
>> -        "(see http://sourceforge.net/projects/kvm).\n";
>> +        "Please upgrade to at least kernel 4.4.\n";

Using 4.4 or 4.5:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>>       const struct {
>>           const char *name;
>>           int num;
>> -- 
>> 2.50.0
>>
>>
> 


