Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1u4H2u-0003fG-Ti
	for mharc-qemu-trivial@gnu.org; Mon, 14 Apr 2025 06:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u4H2b-0003VJ-HU
 for qemu-trivial@nongnu.org; Mon, 14 Apr 2025 06:27:54 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u4H2Z-0004O9-TN
 for qemu-trivial@nongnu.org; Mon, 14 Apr 2025 06:27:49 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3913958ebf2so3702090f8f.3
 for <qemu-trivial@nongnu.org>; Mon, 14 Apr 2025 03:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744626466; x=1745231266; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nw6FxYmwHgRNC4ScC/+LyigaJpiSB50GMw0KegQkYgE=;
 b=iHY0DXcvV03JTD0qvs9JfhTow7j6cfRokGAAHotszuA/DaU+DFSz2Y6vXH1M4E7I8W
 RJXlfz21+2t1hWfCcjfR03ThNKnPZyC6dOMbN27ThrXhhTOt7i96Jm6oM8afkLGtrk3n
 fVTJrF/JvkgJxiF3Qzigs6fNwpx1GW6ip1rBSCUFZ4QgA8KQaqD/Pahz5foOuFupsT5E
 69MPfRofKRhE7Sij2xZ+jd80Y78kP7vJNdfAKBVdZBoo7HXubtALmCALylDM48m0cQWF
 sSWEy3Gn/GSJ8tjwIYJwwJZt7Rhz27lXkH6RFEM9mSiiLeWfBuzpBBtWvVhM0SPTMePg
 xxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744626466; x=1745231266;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nw6FxYmwHgRNC4ScC/+LyigaJpiSB50GMw0KegQkYgE=;
 b=j093QYYRdipHPcT/Yy9+S9dIB7sDEMG0ojgGdStDKXEi5EtsanDrCJW7tLy5NVs+Zx
 BhJjAZAOKu/SBqBo+/EeAcein2nmx3fo4/tGHSQgNuut7fsvM2+uoS+PxwamIjysJTdH
 j6HSBsf/iU1qb+dJrEY7mNEkmT3G2eASXEhMYgE79zF6kOlE5hKqSWu4lAO9AnbTH9Sf
 rTU40M5SSiCd3iWDFwq+4vpkpqqVSnaOort361pNZaEct5ul4CiO/ByhXw4SBpNkMoNm
 oA/WGuBbnQRA3reiJse5xjfkUrmwgNTf8GaTanCIGRV38LvTCxbazggo3XjX8riUaxUZ
 a9cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtujThsk3aZyis2AHUAN+em0Af8NDkObGeAH+uliDFIBLWDj4q4w9e2Wismxa3w/lCNKgA/2NfE5DELiU=@nongnu.org
X-Gm-Message-State: AOJu0YzFkQ/xAJY/j8zGgSS2mHpdybrAC7a0svodwYZ0StMfr8DohXYj
 oUaJFQtp/XhUw2g00PP7euURZd7b8Pcimyk/YZnePSUcZp3XShLefvJJktJdE/U=
X-Gm-Gg: ASbGncv04pS8eEGE/uQUKRgeQM8SpAMUNdWDJF0zoks0sccgr4nCvkaaJ4SFJSYRbyZ
 AxKwPerik4pHm7vzpQ7vk0l6BUkTH6IbHSN/LeVByU4EnX+WXV8KvLHXjZjd1A4rEthtlixkWbC
 zJe0HtoaMxQT87BE8eSUut8AvsN8f72F9Bfvwsr+vN7u99JKEUan8RHU98LHNQs8Dme7EroLPpd
 x81AlkVpHC74bJ5EX+sNgtov2YjbuMHCD0KfeiH48Ce87OGXh4BVataF0XSEaM0jATMJBpLvkTH
 bAqeTwF5qxiL7Y62t/JuJ7iS/NxiUjo7b1zKFRjTnb1Ooi6bi4m0IBT45XlgfrwEnPiAcJf9oZE
 Y01XmDk/EZqNXjGsL/CM=
X-Google-Smtp-Source: AGHT+IE8VUtvhsurQq3hKMpmDBPQJ6fgvtij4XStQQn7oAtKoqMlE93th2b99P625Ngx9nrZoE5V1Q==
X-Received: by 2002:a05:6000:1acf:b0:38d:d0ca:fbad with SMTP id
 ffacd0b85a97d-39ea51f46d0mr9230109f8f.14.1744626466020; 
 Mon, 14 Apr 2025 03:27:46 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2075fc83sm179431915e9.26.2025.04.14.03.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 03:27:45 -0700 (PDT)
Message-ID: <14350aa4-95d0-460a-bab4-ee82dfb2460e@linaro.org>
Date: Mon, 14 Apr 2025 12:27:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.0] docs: Fix some typos (found by codespell and
 typos)
To: Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20250412181147.1046898-1-sw@weilnetz.de>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250412181147.1046898-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-List-Received-Date: Mon, 14 Apr 2025 10:28:02 -0000

On 12/4/25 20:11, Stefan Weil via wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   docs/about/deprecated.rst  | 4 ++--
>   docs/devel/codebase.rst    | 6 +++---
>   docs/devel/qapi-domain.rst | 4 ++--
>   include/exec/memory.h      | 4 ++--
>   qapi/qdev.json             | 2 +-
>   5 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


