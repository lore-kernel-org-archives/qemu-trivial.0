Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVwAr-0002E2-6T
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:42:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVwAn-0002B9-Qp
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:42:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVwAk-0003ih-PI
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:42:05 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33529)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVwAk-0003iJ-L7; Fri, 14 Jul 2017 04:42:02 -0400
Received: by mail-qt0-x242.google.com with SMTP id c20so9149219qte.0;
	Fri, 14 Jul 2017 01:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=anEzQBMJdAW/c6znmiHry79/DcOV0Cw4doyAkdZnWaY=;
	b=JfnDeY446Ibq6VwmHCiYF0kIocDvgKU4UPL0PgPN0hwRCjA1UFkhucIYt9h3mKLzwE
	RH4x2G4G/9N/5Gr424JXcBcml1oogDWRdlyPj4g4rqgtN6VuZDUljzd1NWdJRnHkswUY
	EUcKr3NJAxOaRgjKFkH2PdvfxmQYJ1y70FyKgf1FMt7OSXI53qqf6oVnz5QURACa1XMu
	OeeaN/0AcB6qV8E8/29jccRP33zMHB2XU2LIwCcQPZdgLDEt0cqEoi0znh1TO27MPdPl
	7Su9aprpL+OeHYxScJIzYn2cL5SPsMkeCu0wPHAcDSuShuTswSD3NuWl1c8tfD/hBrJm
	0DGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=anEzQBMJdAW/c6znmiHry79/DcOV0Cw4doyAkdZnWaY=;
	b=s+b72REGa0r4aUDcewRmryQoZPltLIwVOGZUl+gJnVDLCRxZiNlVYZuenghiNCeoI4
	VgAfXiYBsRnBAkD5ZhzRmZCbjHr8YMF3cWg9Aw8BQCut6lpgualF01wqLt0oocGiGMn+
	1VqOJUxnaDA0ahn8WEMlZpfJX058vYIS+CewaCf3snO9TZJJXcMpJqA+kbS2Vo4dH2d5
	d4+q1YYvkk1tPNcPd1ZdhbG8Zvc0EwZoR0gL0AJIw0kkCIqjCDAc500JHNrQRkaqJrCj
	9rEqmhDbiNwQDFCwb9Alz9mqhV8/8Z/TSp9lsCyvJnR8Y8OfmHOdTWZW+qInJzc1zUh2
	kp4w==
X-Gm-Message-State: AIVw111uAMMcaSUlM8Jbz6cUUEraA78Rzk7YMfDof7n0bgn6w2CovKCx
	OqyDEfVsWXYaNmzScnE=
X-Received: by 10.237.44.133 with SMTP id g5mr9921914qtd.204.1500021722073;
	Fri, 14 Jul 2017 01:42:02 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	b201sm5971250qkg.5.2017.07.14.01.41.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:42:01 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-24-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <af523247-c323-dbc5-c0e7-2da1dd4874cc@twiddle.net>
Date: Thu, 13 Jul 2017 22:41:57 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-24-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 23/29] i386/dump: use
 DIV_ROUND_UP
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
X-List-Received-Date: Fri, 14 Jul 2017 08:42:06 -0000

On 07/13/2017 06:32 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   target/i386/arch_dump.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

