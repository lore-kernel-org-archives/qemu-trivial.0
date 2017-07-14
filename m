Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVwEu-0006fC-Eq
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:46:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVwEr-0006cv-O5
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:46:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVwEm-0005fx-Ro
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:46:17 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35254)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVwEm-0005fh-NR; Fri, 14 Jul 2017 04:46:12 -0400
Received: by mail-qk0-x241.google.com with SMTP id c18so1160084qkb.2;
	Fri, 14 Jul 2017 01:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=3OaWGRrxN1vEr80qDW34gRqAbU797WpyH+JgnPFGOWA=;
	b=Q9mlZ0e1waCzT1WGEbN0cPBTFFZcWScb8jmHhV8eP7avJQwQO9+d2VzviqP6yLqSc9
	whFAViYpyLzmRCFCjBZ8OZOh4uWnalW9wnN+w3YOQ2KyOKE3b8rR1TFWTm0pQ5C27wEv
	WGAuicx3vrT/c+fpDcnZSW1kb8gp6nqW7dIKjeJ6ptOeZVD5wsTQNFXwP2BD0cx86XYq
	5Rgm/ZkjLZvJBxs/N3zExfHA+fSwO3vfyUED8+5rUWJjlIs2E0exmZtzMH8gXkK57sGY
	0buukD8L8h3IvNHMdT2EkbyFTDumil+NEuiXg0Eu+ERS+XyWx7prBijZq8SYjegfpVFU
	A8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3OaWGRrxN1vEr80qDW34gRqAbU797WpyH+JgnPFGOWA=;
	b=tsG4gdlB5O3upV67WIjTE+qNt94sB0cihYsK7InFXXKxErFSIh+YJAsnKoNGKAr2sj
	33lALlFoAdB4VUkaMzkQFnyG+Fo0VrHlAf2jW7LLvhdTuBYP4sDikekTiyPELowC7bDL
	YsajNkQeZdkUtTrQZ9B15a9TyI3A2uxJnkx/t+CFjYyZuVb/321QIdf6ijKLVP4k/aCG
	o272GT3wgVZXDAAtpqNliWX/ilBQt7z+OIP868YHn7Il7H/SOgvZyMJYFApbx97Dqwbu
	yYwie9VijY4vhhharrd7HV/mo8NdbgChiTIgDh0VmwUlCK6E9ZCRr6uXrD623Y7Hh9cA
	/gZQ==
X-Gm-Message-State: AIVw110xPGvWRI71CM7aIbf9+IM4hkLO08d4DBLTQgD/pbNLBMzmygFc
	pbtx7ZU+yiNrIg==
X-Received: by 10.55.3.130 with SMTP id 124mr9208068qkd.31.1500021972190;
	Fri, 14 Jul 2017 01:46:12 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	q22sm6373836qte.65.2017.07.14.01.46.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:46:11 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-27-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <c0087985-9692-4e91-1567-8b6d9e792364@twiddle.net>
Date: Thu, 13 Jul 2017 22:46:07 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-27-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 26/29] i386: introduce
 ELF_NOTE_SIZE macro
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Jul 2017 08:46:18 -0000

On 07/13/2017 06:32 AM, Marc-André Lureau wrote:
> Factour out a common pattern to compute the ELF note size.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   target/i386/arch_dump.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

