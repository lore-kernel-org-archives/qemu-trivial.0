Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ifClh-0001oz-BU
	for mharc-qemu-trivial@gnu.org; Wed, 11 Dec 2019 19:55:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41749)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ifCle-0001nU-ML
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 19:55:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ifCld-00070A-Dx
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 19:55:46 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:33067)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ifCld-0006wr-6X
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 19:55:45 -0500
Received: by mail-pj1-x1041.google.com with SMTP id r67so288841pjb.0
 for <qemu-trivial@nongnu.org>; Wed, 11 Dec 2019 16:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Len6tZyHmfGHMmylbxusBCppMCH5HZKLBxqirR/6e3E=;
 b=dXOWwZ3NAX2LER55++YdXd9rP2vtCX1CVWfwE8io5eXwoTISDTUvLy4q6pSDMJuVWG
 qL1vgriRNW3quwyzwzvJm3BKh7kKJIuvep55umWyEIQ4BVRI4kneVEgnV5jlCM4MFFAz
 6h9sCMTwninjJTW13csusQ+DT4Ge5e3v0ZVlU68EbxMMLcbSGvabq3mrphuVAMsSlCTE
 rvcC2WrKAWqVvv3mhJB/iqAnNms6H3RK+mhUZ+R66+in241UWDJy3w1iNnX6rYPi5RaM
 iN0RcwASkmTdOuVtMWvU+6MBBuS1yBwo3saSyYUALdQvA28mP1nzA/sxNxbwI3GWCYB/
 cWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Len6tZyHmfGHMmylbxusBCppMCH5HZKLBxqirR/6e3E=;
 b=nZ2IyWjf33sWQFJdnPNS5jYsJtkOL6XywIVOKW3YB/IMf2qHsVbi5K2RcFIijvE/Ds
 GEyEkZdwbEie0J/KO9nXbuWCubMh0NSl5xfFFhPFbTPaFUsWFVLfKcEGiFxfj0ozAaEm
 JRFgtCHfur1ViWEjqZeNtdyZphY1ZmVKN4CEm6lIAxwaIrQUOjaXmz6Z+keYcV1tggI+
 nZKQWTp8hrfr27tnD5iNGN3v71POA3sRnAk8BSk2VD3IE23ugnZFDY8Kufox+FMfbHEb
 TmBJTIT7ekjtsBt/smnQflBRwgUHK1qeKScR2D8llgOd53v/2xRYrMpYqVs1slKZ/8fV
 93vg==
X-Gm-Message-State: APjAAAX9ktyM9lNaf6/UQeC75UoXqKBtgGDIeD7cDjSsHdTDqjL87F45
 afDOu14lD2d4lerEbJNeQwBefQ==
X-Google-Smtp-Source: APXvYqxTTmiP9OBN5IFQ8R7jLG6RFZoXwKi8AzROi7uxTHB4vByT1Mm2kZKPwN7s2D6TTxye7QUENQ==
X-Received: by 2002:a17:90b:3cc:: with SMTP id
 go12mr6785115pjb.89.1576112140970; 
 Wed, 11 Dec 2019 16:55:40 -0800 (PST)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id z4sm4429843pfn.42.2019.12.11.16.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2019 16:55:40 -0800 (PST)
Subject: Re: [PATCH] migration: fix stringop-truncation warning
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <1576074210-52834-3-git-send-email-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ce08ed58-78f0-83c8-404c-4caa76d38569@linaro.org>
Date: Wed, 11 Dec 2019 16:55:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <1576074210-52834-3-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
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
X-List-Received-Date: Thu, 12 Dec 2019 00:55:47 -0000

On 12/11/19 6:23 AM, Paolo Bonzini wrote:
> @@ -44,8 +44,7 @@ void global_state_store_running(void)
>  {
>      const char *state = RunState_str(RUN_STATE_RUNNING);
>      assert(strlen(state) < sizeof(global_state.runstate));
> -    strncpy((char *)global_state.runstate,
> -           state, sizeof(global_state.runstate));
> +    memcpy(global_state.runstate, state, strlen(state) + 1);

We should assign the strlen result to a local variable rather than compute it
twice.


r~


