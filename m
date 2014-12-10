Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XydxK-0005rW-KP
	for mharc-qemu-trivial@gnu.org; Wed, 10 Dec 2014 04:53:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XydxB-0005fJ-66
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 04:53:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Xydx2-0007dx-65
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 04:53:05 -0500
Received: from mail-wg0-x230.google.com ([2a00:1450:400c:c00::230]:39017)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Xydx2-0007dj-07; Wed, 10 Dec 2014 04:52:56 -0500
Received: by mail-wg0-f48.google.com with SMTP id y19so3101806wgg.7
	for <multiple recipients>; Wed, 10 Dec 2014 01:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:newsgroups:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Xtww6NbB/K70bGmyTCh1orsUGxk6r/vEPHiaFS5zfjo=;
	b=04RLQc/2XyLVxBr05C2xsvhP/pOYyCPmFj+NSWEuJFP6PeFnZUPZ6C9E9IYudIKE6g
	nRzqeSYe1R66+30kOep/VJf1ommvNwq5AFOmR9rq7kpPpiwYFqXsOKvwyfVczqC1G09U
	ulvWV8vtn7WPUPA52moDUzexpT3rLSE32bbRH63ydHLpMdBuD/mzi39yoHmBoPGoeIX0
	TwfnfaYZOhzicHGSuml8bT9GVuB9vFkH1wwD6AnygqMBxVcZRDt2JCTeB2iM1tVmNFPX
	6Zgl0SlwTaLmdlvTl0fENmpzQSqDEYXZCXwgCPu65AOstNZjrB19qv64jIuU4LBzUCKE
	7u5A==
X-Received: by 10.180.73.143 with SMTP id l15mr4846551wiv.24.1418205175290;
	Wed, 10 Dec 2014 01:52:55 -0800 (PST)
Received: from [192.168.10.150] (net-2-35-193-40.cust.vodafonedsl.it.
	[2.35.193.40]) by mx.google.com with ESMTPSA id
	a14sm17206502wib.22.2014.12.10.01.52.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Dec 2014 01:52:54 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <548817F4.4070402@redhat.com>
Date: Wed, 10 Dec 2014 10:52:52 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
Newsgroups: gmane.comp.emulators.qemu
To: Michael Tokarev <mjt@tls.msk.ru>, Antony Pavlov <antonynpavlov@gmail.com>,
	qemu-devel@nongnu.org
References: <1417976445-18860-1-git-send-email-antonynpavlov@gmail.com>
	<54880E36.9080701@msgid.tls.msk.ru>
In-Reply-To: <54880E36.9080701@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::230
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] pflash_cfi02.c: associate "cfi.pflash02"
 to "Storage devices" category
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Dec 2014 09:53:14 -0000



On 10/12/2014 10:11, Michael Tokarev wrote:
> 07.12.2014 21:20, Antony Pavlov wrote:
>> Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
>> ---
>>  hw/block/pflash_cfi02.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
>> index 8513a17..389b4aa 100644
>> --- a/hw/block/pflash_cfi02.c
>> +++ b/hw/block/pflash_cfi02.c
>> @@ -744,6 +744,7 @@ static void pflash_cfi02_class_init(ObjectClass *klass, void *data)
>>  
>>      dc->realize = pflash_cfi02_realize;
>>      dc->props = pflash_cfi02_properties;
>> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>>  }
>>  
>>  static const TypeInfo pflash_cfi02_info = {
> 
> Hm.  While the patch itself is trivial, and it _seems_ it
> fixes a bug, I'm not sure of possible effects of this.
> 
> What prob it has now, does this device work?  If yes,
> why it needs fixing?  Do we care about compatibility
> with previous versions, about migration?

This affects nothing but help messages.

Paolo

