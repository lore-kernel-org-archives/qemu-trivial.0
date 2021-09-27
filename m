Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUiTM-0004Jl-2b
	for mharc-qemu-trivial@gnu.org; Mon, 27 Sep 2021 00:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mUgk5-0007pY-Iu
 for qemu-trivial@nongnu.org; Sun, 26 Sep 2021 22:51:45 -0400
Received: from [115.28.160.31] (port=50774 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mUgk3-0004UB-VN
 for qemu-trivial@nongnu.org; Sun, 26 Sep 2021 22:51:45 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id C10B360B51;
 Mon, 27 Sep 2021 10:42:21 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632710541; bh=i0+f0VgiX9N8Cr4ONfOHjjkTdqGbdp3Wgt9dFLFiHjo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CzEUFnrNpQ7h53vSjYqWjnx4Cw9/QfMqj1dLso2YIfhzqYZpmgq7wunPkPWy3pJ7A
 8gOfcNjjWwCcjOvDPj2Z36E2RPQtJ7nZcrJCQ6fjjmBWztX5Ti/b/4haPXN2P7a6x4
 RvfXReIK7ZnuOkY/rJZgl7d/Y0nx22r4gAMW26x0=
Message-ID: <92569fc0-2c0e-fa91-d9c8-d1345741a68b@xen0n.name>
Date: Mon, 27 Sep 2021 10:42:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH 1/2] bsd-user: Only process meson rules on BSD host
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Warner Losh <imp@bsdimp.com>
References: <20210926220103.1721355-1-f4bug@amsat.org>
 <20210926220103.1721355-2-f4bug@amsat.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <20210926220103.1721355-2-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.478,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 27 Sep 2021 00:42:34 -0400
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
X-List-Received-Date: Mon, 27 Sep 2021 02:51:45 -0000

On 9/27/21 06:01, Philippe Mathieu-Daudé wrote:
> Reported-by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   bsd-user/meson.build | 4 ++++
>   1 file changed, 4 insertions(+)

I'm newcomer here, but this is just 4 lines of Meson, and two similar 
usages already exist within QEMU proper so...

Reviewed-by: WANG Xuerui <git@xen0n.name>


