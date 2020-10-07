Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQALj-0007dz-HP
	for mharc-qemu-trivial@gnu.org; Wed, 07 Oct 2020 10:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kQALf-0007d1-Md
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2020 10:23:19 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:44839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kQALa-0002uB-SX
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2020 10:23:18 -0400
Received: by mail-wr1-x442.google.com with SMTP id t9so2379381wrq.11
 for <qemu-trivial@nongnu.org>; Wed, 07 Oct 2020 07:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=GG8ahCagwkP0u+A/F+/C9FnE8zNUg3WoyzMU3Vvn1FU=;
 b=fw5CInqU5HPfpjwlkZfCTA4pNqM0FIef0eRTgzEEPNqMRn4Fw2aWsyH7DsyvzcSpaw
 5D6TCOyZMr/+6p7CCKxwjbiiwbUBY6XWpBsHVSfUMbqoXpmOOAuV5WKbN8ClzDTQDx5/
 rH2FAztse1rQmF6wpN/hnHWaHnjdFr1vEOqy6LYZbbWdII+304lNBuNmEO9QWQftbSQX
 HRnSnITNji0GE1fJcKL9ioHLZ9dM3VehhjxPGR/UfpkH2wXUHVctuQYNd1NpgGelOOrK
 SIFpDTRYE9f7mCcB1XWHoRcxLx0v57ZaMzYXNPaF9qHAfidPfv9pDFsyyaN13r5sDJHx
 q+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=GG8ahCagwkP0u+A/F+/C9FnE8zNUg3WoyzMU3Vvn1FU=;
 b=ScaH1Wz5gIMHSs/H6n2j1jEi1XS4TxqpE2gwqQLDiPS0KIxncQaPFOXiNKH1cpuEfU
 bQlGr2mqvsDV19ceLLMEd/L9LYrxfoJ/0pCxeKWLL5kE2Jr6C5zg+bLwchKcnIFc3CxA
 pdP5SJFgwXXnfDyzlDCEFlZ5BQhalDP8Tw79t9NGR7RqT+hRjfCipI+6bULvQyJSa4mJ
 Q9k8k/pdGOtWYxMuJhLnY41ZlA8COk8mJR41vsm1XYjL068ApfNxQMKHEmv1IgjtT3Ig
 d/UsWtsyyYF11wKOuybtCz1ORGCxDFi/AIhEFnznaM4EK8uPzXRYgLLkizZgQ3W/e5fo
 jZeg==
X-Gm-Message-State: AOAM531BqNa9IC1yEA3J11mPXSFEL3mK7iroxVn2f2miNUhOf5e3m3gb
 KGI3cb4iHBPFlSzq//OGwyvSGg==
X-Google-Smtp-Source: ABdhPJwPKQg41pdrQe5GlCSV6fkrdsAKXglihp9T68t2EzNg0JLMBc7Ew7TIZPG0XCzlcGJH6yUyeA==
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr4137668wrp.390.1602080593075; 
 Wed, 07 Oct 2020 07:23:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g14sm3142880wrx.22.2020.10.07.07.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 07:23:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 45E231FF7E;
 Wed,  7 Oct 2020 15:23:10 +0100 (BST)
References: <20201007105518.1019-1-luoyonggang@gmail.com>
 <87zh4yyyhw.fsf@linaro.org>
 <CAE2XoE8XP1y-YSyEBM+LY=CGbBihSeZd50bjS49YF74Q9cMu7A@mail.gmail.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: luoyonggang@gmail.com
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth
 <thuth@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-level <qemu-devel@nongnu.org>
Subject: Re: [PATCH v4 0/2] Improve cirrus msys2
In-reply-to: <CAE2XoE8XP1y-YSyEBM+LY=CGbBihSeZd50bjS49YF74Q9cMu7A@mail.gmail.com>
Date: Wed, 07 Oct 2020 15:23:10 +0100
Message-ID: <87r1qayv1t.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Wed, 07 Oct 2020 14:23:19 -0000


=E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo) <luoyonggang@gmail.com> writes:

> On Wed, Oct 7, 2020 at 9:08 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>
>>
>> Yonggang Luo <luoyonggang@gmail.com> writes:
>>
>> > Fixes the broken msys2/mingw ci and speed it up.
>>
>> Queued to testing/next, thanks.
> Hi alex, still have issue, the cirrus cache are rather slow, waiting for =
my
> v5 version

OK, will keep an eye out.

>> <snip>
>>
>>
>> --
>> Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

