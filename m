Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dauJF-0004Ic-Lo
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 21:43:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dauJD-0004IW-Gt
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 21:43:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dauJA-0006g3-Um
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 21:43:19 -0400
Received: from mail-qk0-x230.google.com ([2607:f8b0:400d:c09::230]:38304)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dauJA-0006fW-Qp; Thu, 27 Jul 2017 21:43:16 -0400
Received: by mail-qk0-x230.google.com with SMTP id x191so45727656qka.5;
	Thu, 27 Jul 2017 18:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=i+prXCm2id/QTmNcF3EmYLt7CtiRQhoeiJ9mTp40qf0=;
	b=MIjsPoYGgTZY28r9mNyLTSKR+Tp0ZUbnPZvSsGmXk35LctUpszcMwq+gXkhZfvxXep
	T6FpauW+O1RIpqnsmouW2N0+oKq+sLI5Qa/M+S+DhM+yYEq2EF4Z9bvDjlbrjsQ90rGn
	VArYevSsDAGNKt3SoX7bKeEiEwD1HIww423KYPT5wdII0eA6uBjJCNKe0ZLg1AEfVrNX
	9VN+sXF5cmR/U322tVHFYaWnePYsFS3FynIEA0FikDeDXupcSTQuOGcOGAWMR4WWLHDh
	HIeat3t6hwUsg7zDAX8awGB8qpMP5rfCGRIXizBVUX9TT8wh8rhhV+eyvWFEraPg1Ttl
	tuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=i+prXCm2id/QTmNcF3EmYLt7CtiRQhoeiJ9mTp40qf0=;
	b=Aly+idVF0A0mv00chXApK5GeOiwUG59K/hxLKoVA/Itt10IMzyqwxw0bj8DphxaVFR
	FToWytZ4pYFcb8yuFsy9JyOrIRn0abTxiePa3iR06l7m1+PgN+iq38HhRFXi41a/Opwa
	phmFpBseU22F6diaifWrDYiOXZgd+L8sAsnevMMtazqUEHKw3weWh9mnwYkNfBTQYKyn
	XFBUs5APqpM1lmMlp3h8G5KQpMv8U/1aEpXv8LgRPhdtVjMu2KZ5uACOaFpI4zMW0+UJ
	h5jXNnMmRVTKwUMUEZYfbgSMgQNsZS60Xk+uOej+MMSzpP7q5jAIaPePEgUPwtUBZFQ0
	GIUg==
X-Gm-Message-State: AIVw110PY3RyJacFcH+AXTtxcKpHkJs2KeCgtqGsWMivmTWtTDn1W0dN
	vlifsLpjxUMgCg==
X-Received: by 10.55.143.134 with SMTP id r128mr7845864qkd.129.1501206196206; 
	Thu, 27 Jul 2017 18:43:16 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l10sm14586447qte.22.2017.07.27.18.43.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 18:43:15 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>
References: <20170728012542.29975-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f284ba3a-980a-30d1-6c01-fe822bab9fd2@amsat.org>
Date: Thu, 27 Jul 2017 22:43:12 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170728012542.29975-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::230
Subject: Re: [Qemu-trivial] [PATCH for 2.10 0/8] docs: fix broken paths
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
X-List-Received-Date: Fri, 28 Jul 2017 01:43:20 -0000

On 07/27/2017 10:25 PM, Philippe Mathieu-Daudé wrote:
> Hi, following Cleber Rosa example I cleaned more invalid references.
> 
> Eric said this can wait 2.11, however these patches don't change any code
> generated, I think the 2.10 users deserve an up-to-date doc :p

Well if someone is looking at that doc he'll rapidly end up cloning the 
repository... so this can wait 2.11 :)

