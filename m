Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwDaw-0000ii-V4
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 17:10:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1gwDav-0000TE-LK
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 17:10:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1gwDV6-0002vD-BO
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 17:04:32 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:42670)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1gwDUy-0002tg-DS; Tue, 19 Feb 2019 17:04:22 -0500
Received: by mail-ed1-x544.google.com with SMTP id j89so8738375edb.9;
	Tue, 19 Feb 2019 14:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5zNCoLmtbd0RlX8/I0PC0aMRQpSWhn2lAFmZA/SfAl4=;
	b=QzwROhjRzsMu+msa05RXdZ8AZzl40zsosp6I8eXFpR59Vi4kO/MGzQ7BJ+o7ZB1mRz
	dimG/29NOLlUfaQxUblaZQiu4XnZCURa2qtSGQyxjFV7QIV3RjQpXdVrfq5go8lweFev
	mIhXYynaK0W/DUXQKkR2eMnKGjCARsN5Dg3ktZZoF3S94dqP6t9IfQzKxvs++6+8feOS
	6AMSF2Da97eAj9pN9e8U5u2Sl0tHt8xImee+uFQsZ1tcRuyXPDZWwyrW1QRdAgRz4el0
	46Kyy+p+sCX4rFaozupx6IDHFNBtPrs9J81I5/6qhyVVlSniiFhA2GUFu29M2iLeFZsr
	+pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5zNCoLmtbd0RlX8/I0PC0aMRQpSWhn2lAFmZA/SfAl4=;
	b=ntLRsvVDs4gzS036JnmS8f0gj6a7EOlCToECmk7XQ6SegjXQs/MADtkrYWmIPYvU8B
	liek0PNLWyTX6hx5MhIWDJqsURLzG8gVeO30V8yOVvOHpIKtvI6TKssEcoo/6AJYoSQm
	2jtXkW82dRdMRPbhyZaxH4o9qyU2D5LH5vM4MLsoJUbhfgmtTmGprBa98qQn1DxMX6E/
	78n1IZ6HEhKtlilOVk27useC07bbheMu60P3Xi+Vi0RL9v615FL4F2y65TAO/JoEBtbJ
	RmZvKBVkUxu3VH8OCdJIymRoCCgAFzI527rMf4652Tz1OPUDTMLLnCkVKHd/6qhHZ5vS
	BiOg==
X-Gm-Message-State: AHQUAubcpWIbK2I7AcQ+C50Yougx65EhJIODE5KTYv3t/VENAViscMTb
	RT1KQ58CYDHnx6myKOLEACHboHVC
X-Google-Smtp-Source: AHgI3IZv9t7v6xAv9SduTnKXzz2lqmsoOGPcjS3JL39OkNWpB/sk+aO374bxMVMEAMfmH0e33acpmA==
X-Received: by 2002:a50:bb0f:: with SMTP id y15mr6561317ede.107.1550613859210; 
	Tue, 19 Feb 2019 14:04:19 -0800 (PST)
Received: from localhost ([185.92.221.13])
	by smtp.gmail.com with ESMTPSA id z7sm123571edl.59.2019.02.19.14.04.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Feb 2019 14:04:18 -0800 (PST)
Date: Tue, 19 Feb 2019 22:04:18 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, imammedo@redhat.com, mjt@tls.msk.ru
Message-ID: <20190219220418.qle4kfetwcdagr4q@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20190219013106.17538-1-richardw.yang@linux.intel.com>
	<20190219013106.17538-2-richardw.yang@linux.intel.com>
	<baff8fc6-8d22-02c8-6bea-5b1ede1d4bfa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <baff8fc6-8d22-02c8-6bea-5b1ede1d4bfa@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::544
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] CODING_STYLE: specify
 the indent rule for multiline code
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
X-List-Received-Date: Tue, 19 Feb 2019 22:10:30 -0000

On Tue, Feb 19, 2019 at 11:52:29AM -0600, Eric Blake wrote:
>On 2/18/19 7:31 PM, Wei Yang wrote:
>> We didn't specify the indent rule for multiline code here, which may
>> misleading users. And in current code, the code use different rules.
>> 
>> Add this rule in CODING_STYLE to make sure this is clear to every one.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>> ---
>>  CODING_STYLE | 26 ++++++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>> 
>> diff --git a/CODING_STYLE b/CODING_STYLE
>> index ec075dedc4..73f66ca185 100644
>> --- a/CODING_STYLE
>> +++ b/CODING_STYLE
>> @@ -29,6 +29,32 @@ Spaces of course are superior to tabs because:
>>  
>>  Do not leave whitespace dangling off the ends of lines.
>>  
>> +1.1 Multiline Indent
>> +
>> +There are several places where indent is necessary:
>> +
>> + - struct definition
>> + - if/else
>> + - while/for
>> + - function definition & call
>> +
>> +All the above cases apply the same rule: indent with four spaces.
>
>Is this redundant with the earlier statement that "QEMU indents are four
>spaces."?
>
>> +
>> +While the last three case may face another situation: code should spread into
>> +several lines. In this case the rule is align the new line with first
>> +parentheses.
>
>Grammar is awkward - the leading 'while' makes it sound like that you
>have a dependent clause, but then never provide the independent clause.
>Maybe a completely different wording is better:
>
>When breaking up a long line to fit within line widths, align the
>secondary lines just after the opening parenthesis of the first.
>

Sounds better.

>> +
>> +For example:
>> +
>> +    if (a == 1 &&
>> +        b == 2)
>> +
>
>Maybe:
>
>if (a == 1 &&
>    b == 2) {
>
>to match our later recommendations on always using {}.
>

Yep.

>> +    while (a == 1 &&
>> +           b == 2)
>> +
>
>Similar.
>
>> +    do_something(arg1, arg2
>> +                 arg3)
>> +
>
>and here, I'd include the ';' to make it a valid statement.
>

Reasonable.

>>  2. Line width
>>  
>>  Lines should be 80 characters; try not to make them longer.
>> 
>
>-- 
>Eric Blake, Principal Software Engineer
>Red Hat, Inc.           +1-919-301-3226
>Virtualization:  qemu.org | libvirt.org

-- 
Wei Yang
Help you, Help me

