Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hY52T-0002v5-B0
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2019 04:43:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hY52R-0002ug-3I
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2019 04:43:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hY52O-0005DC-Bi
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2019 04:43:22 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39679)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hY52D-0004vP-Uy
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2019 04:43:13 -0400
Received: by mail-wm1-f65.google.com with SMTP id z23so13763940wma.4
	for <qemu-trivial@nongnu.org>; Tue, 04 Jun 2019 01:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qPoEKbMGuvU9BnLXJ9hZZI4+cC8xO+pYsGVRctwfA48=;
	b=bWVTwWnbby0UmtqR+kozLvwoIA0JpNrPypM0r+b3/mTN5PHyxngcfP5Zs5Grmz6ipE
	aEmDpwlOW/Mc9/9s3OClRcx+iq1aGsIbh0A3UqvkLQimNWYTK+C19ihfcrOd5GXMvScF
	/xTjq5mxD75A2fF/U3T+37Kr+XCb8ZZvvYEFLHbggY9UINDnmn6IdBMyB7JnXTI4jLni
	heeFWYjI3cchPrho67kDGjMCI875HKIqPdK05RwHh8BqtijvC+vsdrBmHBdjssmlneDP
	KWvtQRkCIoznQIhrGeRokF3lpI0jnMPgAiwPj1HkwHO9Wm6F4fpfaraXpbPZhX7dP5XC
	8FJQ==
X-Gm-Message-State: APjAAAUX9cbJ92kzEgGJ06Cp11AD/ii9UoEg2wSF/b6tImwG7ZvHtxmD
	fRdwgGtEnftZh31DMuTYuAg63p9/5O8=
X-Google-Smtp-Source: APXvYqxsD1upUD2ZAyiNPGJo8hj6T/ciAwUwZAm8OI5qzx3BjzWSAo+yKuuIIpQ8C7CBkh4v4TsjZA==
X-Received: by 2002:a7b:c933:: with SMTP id h19mr17879429wml.52.1559637773256; 
	Tue, 04 Jun 2019 01:42:53 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
	[88.21.202.183])
	by smtp.gmail.com with ESMTPSA id l1sm5952310wmg.13.2019.06.04.01.42.52
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Jun 2019 01:42:52 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster
	<armbru@redhat.com>, qemu-devel@nongnu.org,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20190604080010.23186-1-armbru@redhat.com>
	<ff72b9fc-003f-275a-d382-860f2a483d60@redhat.com>
	<803fdb35-f28e-c033-b5ac-02d230dacf94@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <56d043be-efd0-cfb5-2c68-30855eb42d03@redhat.com>
Date: Tue, 4 Jun 2019 10:42:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <803fdb35-f28e-c033-b5ac-02d230dacf94@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
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
X-List-Received-Date: Tue, 04 Jun 2019 08:43:24 -0000

On 6/4/19 10:28 AM, Paolo Bonzini wrote:
> On 04/06/19 10:09, Philippe Mathieu-Daudé wrote:
>>>  check-report.tap: $(patsubst %,check-report-qtest-%.tap, $(QTEST_TARGETS)) check-report-unit.tap
>>> -	$(call quiet-command,./scripts/tap-merge.py $^ > $@,"GEN","$@")
>>> +	$(call quiet-command, cat $^ | scripts/tap-merge.pl >$@,"GEN","$@")
>> Paolo, did you intend to submit a new tap-merge.py script in commit
>> 9df43317b82?
>>
> 
> No, it's really just y vs l.

OK!

> 
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Cc: qemu-trivial@nongnu.org

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

