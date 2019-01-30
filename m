Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gopSC-0000Nc-H9
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 07:58:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1gopS9-0000Kg-QU
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 07:58:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1gopS7-0005nl-Rl
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 07:58:53 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:37920)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1gopS5-0005Ki-QN; Wed, 30 Jan 2019 07:58:51 -0500
Received: by mail-ed1-x541.google.com with SMTP id h50so18899309ede.5;
	Wed, 30 Jan 2019 04:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=loSOqqGq5GtwkCkEGxpyMP7E8BWNGx8AK491OYsPo/Q=;
	b=h/VksGCLM8xdfzkU2gFpwVNGQ87L3yicrYn7IZuNQANIECta3hc5kIoukBup43S4ng
	bGF5tqJXBxArCoJ9mGtTByy2yFbnjZccRks+VxzLoNcBsrQc1pJIl0YnIfqCfBEp8Hq4
	3tJ6QioE5Y41mVYyPOkBxxc7Ei4cfR0YKkjEI/AI7w/8M0n2WEl2D1ktMt6JAROb644O
	7nXC9jwf20X9QcA+5mlcrKhmtTogPhmqcThzuc1G8IjNWxXRtu+6E1n/w0DqAe8v/Kbu
	m6qblPZCQYtmspqiQZ1pJOeR/i6/AAZitgmYvEEuCvPdvqJIc2f1H9FzjegmV224AO3v
	2pYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=loSOqqGq5GtwkCkEGxpyMP7E8BWNGx8AK491OYsPo/Q=;
	b=F9J+8yrd8hyW7kAN42SnNWiqxfScOkdO6kX4wjHnUaOTnFrHNHMzRgd/eRf/odc8C1
	7HE8eL6ELw40UQF4r3jMgHAFzTzyrEklT7OLWy1xsOV25bw28io5iI3bcWFr0R0y9TQw
	B9QTjjWVfEXAJ/4aDl+Cnlhgd5kwTa5oSZA07vkKzKAo0iZLCx4IiYDtI/zBmAlgzhZk
	l6LqMWD9XfV6/0cpH466JlPxw7JZWuUaEZxRRyUAyGCxcvvgU1Acn6aPMBv98m6DDnMc
	Lqw4RrokMsYbnAF8vl8gg7DVFFmft0GI12PIKFYUxgaVlb9xHWUhdnlA1Siqw4ML7GjJ
	KsLQ==
X-Gm-Message-State: AJcUukfSJd+KdukEYeBCJUKhI2yQfChYsjQfo2ttbxnZTMNH/gL/IyC5
	TVF76CXAmqH9JFZEHsdNYVs=
X-Google-Smtp-Source: ALg8bN7Ue1vM4APtl4zKyf1tcf33kmJ6kUxHnSXtpNF0F97HV1YZrtD87x93xR3+eRXVUqjYWpoZ9g==
X-Received: by 2002:a50:ad84:: with SMTP id a4mr29694987edd.253.1548853102178; 
	Wed, 30 Jan 2019 04:58:22 -0800 (PST)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
	ay20sm319294ejb.32.2019.01.30.04.58.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 Jan 2019 04:58:21 -0800 (PST)
Date: Wed, 30 Jan 2019 12:58:20 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
	Wei Yang <richardw.yang@linux.intel.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, imammedo@redhat.com, laurent@vivier.eu,
	mst@redhat.com
Message-ID: <20190130125820.n7py34wx2oojsaex@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20190130000653.16267-1-richardw.yang@linux.intel.com>
	<20190130000653.16267-2-richardw.yang@linux.intel.com>
	<69177d59-02c9-c6cd-be5a-092bf2476af1@redhat.com>
	<0dcf35c6-1b12-9e20-a0f5-b3fe2ea0ae74@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0dcf35c6-1b12-9e20-a0f5-b3fe2ea0ae74@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 1/3] hw/i386/pc.c: remove
 unused function pc_acpi_init()
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
X-List-Received-Date: Wed, 30 Jan 2019 12:58:54 -0000

On Wed, Jan 30, 2019 at 12:07:02PM +0100, Philippe Mathieu-Daudé wrote:
>On 1/30/19 10:50 AM, Thomas Huth wrote:
>> On 2019-01-30 01:06, Wei Yang wrote:
>>> Function pc_acpi_init() is not used anymore.
>>>
>>> Remove the definition and declaration.
>>>
>>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>>> Reviewed-by: Philippe Mathieu-Daud茅 <philmd@redhat.com>
>>> Tested-by: Philippe Mathieu-Daud茅 <philmd@redhat.com>
>> 
>>  Hi,
>> 
>> at least in my e-mail client here, it looks like Philippe's last name
>> got mojibaked here. It should be "Daudé", not "Daud茅", as far as I know.
>> Same thing also happened in patch 2 and 3.
>
>Thanks!
>

Opps, sorry for that.

Not sure which part changes the encoding.

>> 
>> Apart from that:
>> 
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> 

-- 
Wei Yang
Help you, Help me

