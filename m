Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hY4oc-0005gL-9B
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2019 04:29:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hY4oa-0005f7-EU
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2019 04:29:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hY4oZ-0005a1-Kd
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2019 04:29:04 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39230)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hY4oZ-0005Xw-Dk
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2019 04:29:03 -0400
Received: by mail-wm1-f68.google.com with SMTP id z23so13716352wma.4
	for <qemu-trivial@nongnu.org>; Tue, 04 Jun 2019 01:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=L5bqbG5HeCipJkmbOGScph3N/xxSyKFrQkKFnfq3AlI=;
	b=DNfH/VpLLrLMSpFQ+RNuGWOpm1nuYDI6eDsbq2VebgOMBXOI+x4Ki1v5fBzve7zle1
	v5+ETfiZbdTtOokfi22TULcT3b2dkSwnH8X40Cnv8U5oVH457lPlEThRxii9SVD2EEBk
	Ak12/1C2zs3YcPXzcY57prlebKqkdHzy590XULD3fAfeQfLihpy+mbGfydCoiGFWXmZP
	VxKBkrfjLCouqPzWE+V6D9oNT62z6KOYbpOqvOxpytYLgQ80ZYJfZGMWhYCYtttPZT3F
	Dc2j0uSCh/Tx+7eFN4kNAquhsmXF8+Nk24t2IGOWlTRdAairdu1aebZjzEAyjPfjCWkN
	WvzA==
X-Gm-Message-State: APjAAAWekWxJ1bDx5tbDlrK3s79Amin1s8TZNRJRONM27XRG5zRJX5Am
	wU/S80yA1wQkjm0cU6ceG1vqEuUXqAI=
X-Google-Smtp-Source: APXvYqw6eOFNQ02/QmPrYOFzUMkfFNexue2mmo1sNA7etUUuz7/GuYpab3ldfhVChSbDmBqh50hoVg==
X-Received: by 2002:a1c:f60d:: with SMTP id w13mr16924671wmc.40.1559636938292; 
	Tue, 04 Jun 2019 01:28:58 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:657f:501:149f:5617?
	([2001:b07:6468:f312:657f:501:149f:5617])
	by smtp.gmail.com with ESMTPSA id
	q15sm12676440wrr.19.2019.06.04.01.28.57
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Jun 2019 01:28:57 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20190604080010.23186-1-armbru@redhat.com>
	<ff72b9fc-003f-275a-d382-860f2a483d60@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <803fdb35-f28e-c033-b5ac-02d230dacf94@redhat.com>
Date: Tue, 4 Jun 2019 10:28:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ff72b9fc-003f-275a-d382-860f2a483d60@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] test: Fix make target
 check-report.tap
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
X-List-Received-Date: Tue, 04 Jun 2019 08:29:05 -0000

On 04/06/19 10:09, Philippe Mathieu-Daudé wrote:
>>  check-report.tap: $(patsubst %,check-report-qtest-%.tap, $(QTEST_TARGETS)) check-report-unit.tap
>> -	$(call quiet-command,./scripts/tap-merge.py $^ > $@,"GEN","$@")
>> +	$(call quiet-command, cat $^ | scripts/tap-merge.pl >$@,"GEN","$@")
> Paolo, did you intend to submit a new tap-merge.py script in commit
> 9df43317b82?
> 

No, it's really just y vs l.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org

Paolo

