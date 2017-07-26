Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daV6q-0003rk-2j
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 18:48:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daV6o-0003m3-0r
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 18:48:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daV6k-0006mv-Uo
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 18:48:50 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:36478)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daV6k-0006mQ-Nr; Wed, 26 Jul 2017 18:48:46 -0400
Received: by mail-pg0-x244.google.com with SMTP id y129so18576389pgy.3;
	Wed, 26 Jul 2017 15:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=KHObEARGRAlXDcQkEjf1TDN5s3njmklKvxu8vVoe+Pk=;
	b=kxbyitEqH1JFR6Gz9haXdmNciI6BRX04wY3asjAfEVJC1HUyG2DzOvGyKOFJ6i6M0F
	SYzECYK8AVl96j/Uqy52RY/7vY9cTbG9eORyzUmcCBroRhSCa+PRsHJK7de1ZPQUCzQm
	mln0WLjeQzoKQtPPZqJW9y/6m6jNFgyFuehec8gnm0FPK4Lg8EgbzoJ4+xfsBj9n2ZKP
	Fhgqu4Ra2YJ/zZVV5y2A4yrWqi+26tY3gKXQ0g3LLIKQ/bPIBTZ6KFS5qSWDE7iqj+Yy
	HuDd/N96R362FOe7IvKT3mU7Nh/3/CbS0uDHg9UB+DV1Uuge7rc6YIgcSX0G+HWJ9u+9
	yRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=KHObEARGRAlXDcQkEjf1TDN5s3njmklKvxu8vVoe+Pk=;
	b=S4GyHJw6iU6jlEF1eW09V71mwIDq6dL56S6ksl3GsXekTrrs9/3VE0WGedsNZ1KJIe
	MsW6VB4bnXMES5qA5uFemUrkWvP7ZBV4NVC5H2oSFfUn2RBCSjESeVE24o8nw5Ep+YTY
	MFWPKQF8nNV+NbAt+iFwmg00X+J1IbyiVjHPfUuNbDEgMRe1eXHx+o4CMJG8TaFTeR0I
	z5D8AzP68oKCh40SgJ7mgobFgRhaxuzCGklkKEI256Xb2y64xq1WzEL8JjahB23qmlbm
	2FNnmGHYYL76gA2S5QxJXVnxE0hbPnejibCRnZQwygsAXGGXCsk/rsl4FoMlzy1EJYg1
	uVqw==
X-Gm-Message-State: AIVw11260Lq7BUtn0wbaWz37RwBmiUy1jB5kEwJYCY2RkIWJQXJUT26s
	Rw9gJvyVTZU4rCNa3AGSSQ==
X-Received: by 10.98.67.147 with SMTP id l19mr2172285pfi.198.1501109325277;
	Wed, 26 Jul 2017 15:48:45 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	q24sm37393053pfg.167.2017.07.26.15.48.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 15:48:43 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-4-f4bug@amsat.org>
	<acb16999-952f-bd1e-254b-befe65a259d3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <06c19484-b285-ccd8-90d1-2557191b6d2e@amsat.org>
Date: Wed, 26 Jul 2017 19:48:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <acb16999-952f-bd1e-254b-befe65a259d3@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: Re: [Qemu-trivial] [PATCH for 2.10 03/35] thunk: check nb_fields is
 valid before continuing
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
X-List-Received-Date: Wed, 26 Jul 2017 22:48:51 -0000

On 07/24/2017 03:37 PM, Eric Blake wrote:
> On 07/24/2017 01:27 PM, Philippe Mathieu-Daudé wrote:
>> thunk.c:91:32: warning: Call to 'malloc' has an allocation size of 0 bytes
>>          se->field_offsets[i] = malloc(nb_fields * sizeof(int));
>>                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> Reported-by: Clang Static Analyzer
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   thunk.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> Better would be fixing the code to use g_new0, and the corresponding free.

Ok, for 2.11 although (not a fix).

Also thunk* alloc'd are never free'd during process lifetime, so will 
keep like that (no g_free).

