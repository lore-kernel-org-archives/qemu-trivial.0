Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rY2xL-00051d-1k
	for mharc-qemu-trivial@gnu.org; Thu, 08 Feb 2024 06:52:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rY2xH-00050I-FD
 for qemu-trivial@nongnu.org; Thu, 08 Feb 2024 06:52:35 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rY2xF-0000s8-Rv
 for qemu-trivial@nongnu.org; Thu, 08 Feb 2024 06:52:35 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-56002e7118dso2108824a12.0
 for <qemu-trivial@nongnu.org>; Thu, 08 Feb 2024 03:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707393152; x=1707997952; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZhsrJtfj3xZ7oV3SgSEwziBSoCYT1XaZ0wk65rFdG1A=;
 b=GRlt6/SZeMm8OU8yE67V7qUDB9N7bfoBdf1/U5s0Fo9IlnAp7Lb0nixdF8QZGeWbBx
 zuL1pQi+EYv/ifJtW/9VbespMwDccJCrYahnoR2LMAMmhRnqIHbugdz20T4qQKtb6fG/
 5mrsMIAcS2bH95HFcyePFA3eoKpWNDCxeIHpa7yB47pafChtbo0r+Wp/R+UpIBXFVXdA
 H7eDfVfag0ISidZSFG+M57jntXRTLEHQst4DFjNxg0vZUYWgr+PP3I7jqB3tyGZnr7/m
 B4JSM2SHrDjv599w+iyFCsml7C4YFQkKiJIiCT9j/1RFBjkFQD2IWXtC1p/RYX83h7hU
 SO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707393152; x=1707997952;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZhsrJtfj3xZ7oV3SgSEwziBSoCYT1XaZ0wk65rFdG1A=;
 b=mMiiblUe6APIaPmDq2VMv65vN06E735nMkJaYWZfvXdBxAw2m0q+7+crcOt/9hGbpx
 K6eiDggzdkdO9ctbng78cZ5/24ky1OY9ALG5aPnkRbk9P8woWWu/bgsMD6AKupOCIq76
 VlsPynzwKPD0ZrDLg2yKB4b0Bh1tQgmNDd8pSstluZ7aqCNi5x31/EPfCrdbG0zY052c
 XCNxMpam0ZGFGvxiEoElvHBPO+ZT+0GQS1dDIhul8IND7tiLBBQfStbKLLUSsWNj2R76
 +xwTxUVtL5z8+UN57ZlQX+ksVjOtkMJ2oKTwU0nlpsAhRhMAtis71oqLGufWjB+G9wtH
 rdzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX45IztcVKDKyvB9svu2IZ8giuyyrlyCiUWRZWGz3GfurL+bQ9PZNd+97y7D3wY+KvGbh00sLa68rogJoFa/Ke564Xc0oH0Ew==
X-Gm-Message-State: AOJu0Yx89hC+ihSGxANGahFJLQ/kSEsg5/rAYviGnYrmlc51V4vZ+q3I
 eO/9PfXTTDz8WXnY5zbM0US71raoNYmGe+CJGM5Gg3205Rr8GBylqwtw8PlruJe4Y1uxjoMrfa6
 A7m74HSvt3NvwnbzueO2HFFL0DCU3rY+EJ04pbA==
X-Google-Smtp-Source: AGHT+IEnh1zOk74ZIZ0WX5eBmduGVU3UgNfjC3L4C9DAkbM7+CAOR7KMgdY8vxDCYNGHSta2HZ+PAU4F2rj2KR+WDsQ=
X-Received: by 2002:a05:6402:31f3:b0:55f:f2ae:20ed with SMTP id
 dy19-20020a05640231f300b0055ff2ae20edmr5993364edb.16.1707393152207; Thu, 08
 Feb 2024 03:52:32 -0800 (PST)
MIME-Version: 1.0
References: <94cf974b-05ec-41c2-8d0b-43ffbc8bdeac@gmail.com>
 <904ef958-0e3d-48da-a4a7-5c1514c04472@tls.msk.ru>
 <e441b771-0a08-4f2c-b7a7-f6fdd787bc1c@tls.msk.ru>
 <CAFEAcA-C-pGGYY1bfE0ZatZP-imGmq=4-579TEnEZWFLeLxZLQ@mail.gmail.com>
 <CAKjfnjrCu1R6LE46AYf0+SGXs6994APhRvgSNWR8wfp=mnp3Fw@mail.gmail.com>
In-Reply-To: <CAKjfnjrCu1R6LE46AYf0+SGXs6994APhRvgSNWR8wfp=mnp3Fw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Feb 2024 11:52:21 +0000
Message-ID: <CAFEAcA-VKYuPk1c9=E_7W0h1T2uoTc53LeNX_kRQW9rk7zPiXg@mail.gmail.com>
Subject: Re: building qemu on a system with libxkbcommon installed but not
 xkeyboard-config produces an core dump
To: Zhang Wen <zhw2101024@gmail.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com, 
 philmd@linaro.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 08 Feb 2024 11:52:35 -0000

On Tue, 6 Feb 2024 at 06:35, Zhang Wen <zhw2101024@gmail.com> wrote:
> I'm building my own system following the Linux From Scratch package, which is at
> https://www.linuxfromscratch.org.
> I accidently built libxkbcommon package but not xkeyboard-config
> package, and then
> while building qemu I saw this problem.

I found this interesting commit in FreeBSD:
https://svnweb.freebsd.org/ports?view=revision&revision=490981
"Add a run time dependency on x11/xkeyboard-config in x11/libxkbcommon.

 While not strictly necessary, this is recommended upstream, since almost all
 uses of libxkbcommon also needs xkeyboard-config.  This is similar to how it
 is done in other distributions.

 This solves issues when graphics/xpdf4 is installed without a desktop or
 graphical environment, as well as other places."

That suggests that the intention of X11 upstream is that if
a distro provides libxkbcommon then it should also provide
xkeyboard-config, and if the distro doesn't do that then various
things will not work correctly, not just QEMU.

Looking at the Linux From Scratch website I see that their
libxkbcommon page
https://www.linuxfromscratch.org/blfs/view/svn/general/libxkbcommon.html
says:

# Required
# xkeyboard-config-2.41 (runtime)

So LFS agrees that xkeyboard-config is a required dependency.

My inclination is therefore to say that "libxkbcommon is present
but one of its required dependencies is missing" is not really
a situation we need to change QEMU to handle.

thanks
-- PMM

