Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cBO6D-0005nh-DC
	for mharc-qemu-trivial@gnu.org; Mon, 28 Nov 2016 10:44:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cBO6B-0005m7-A2
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2016 10:44:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cBO67-0003jc-CG
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2016 10:44:07 -0500
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36340)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1cBO61-0003he-1L; Mon, 28 Nov 2016 10:43:57 -0500
Received: by mail-wm0-f68.google.com with SMTP id m203so19618797wma.3;
	Mon, 28 Nov 2016 07:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=11wTKDLJ5C8K5ri0b49tMA2TVPn/EBao8cawhyNtu6M=;
	b=j8zspa/tX8De+il9gvtKUhRXrS+bsQBf4OvGoI42+rSwEaBb4QrjtsdZLn6ZhlAUGM
	drcgRyne02HCBzxoLfgZq1BJSX2kTt4wteAKMjlUCbbK4SddmWB6xypLiBskSyD/gQ8B
	76OzeU/vmdMZVRzIHFLkkxASxeUVWaLMDY+YxFPNp5KYstlMGkRU+1iGztg7GJ5XTADQ
	bLCSNyQQMd4mh6bTpsBnTu6kSVbAJ0RHegXoqtQn0VwF/rBkOLcgeZFOH/XMYX4wr6ue
	8YpHySpyRp5n1ufmSlxhotylYtBrgRT646lADr3xd0LIWmecIaSglM9mGtz/BM4h+aiO
	CG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=11wTKDLJ5C8K5ri0b49tMA2TVPn/EBao8cawhyNtu6M=;
	b=LRfLGcT5Pgnkh1f5L+kHEuD/FyPLrVDS5Vji/ni2jnhrjPf2kZeaKbLLrEpUMVWiwq
	UYofUpoy9p8thFTwxEPJZzPz/D+D6KShkLdqb7vBEz6wyZFT8De+wP1fCXwTU8ImLMzE
	o40X4rhOtm3ON//6zcHK+Zv9XJQRW/PlgIRuahhJW5kThl8Zkory9M2U5WjZEoy+Y4lx
	o3b6kR/7N8Hx2elmN9gIzTpZJW/xY0Pbt2DQQxqqEpv7FU1PzvUuAPV9rlbOUBZgN5NC
	7TBU4sXh5cbr4zFhSk6XURDWS5FQXMxfAmQWBHqy30jPVUMwNzLgb4e1QVGqPf6ymVCh
	IdWw==
X-Gm-Message-State: AKaTC017Kdl4VheuuZNEHcd/b2GDnM18ob9efofOr3t2F95AeLRQD6hEIKmS2UVySvIFLQ==
X-Received: by 10.28.97.139 with SMTP id v133mr19233590wmb.117.1480347775911; 
	Mon, 28 Nov 2016 07:42:55 -0800 (PST)
Received: from [192.168.10.165] (94-39-142-71.adsl-ull.clienti.tiscali.it.
	[94.39.142.71]) by smtp.googlemail.com with ESMTPSA id
	p144sm29654012wme.23.2016.11.28.07.42.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Nov 2016 07:42:55 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Adrian Bunk <bunk@stusta.de>
References: <20161127162817.15144-1-bunk@stusta.de>
	<a6630537-d71e-1b1a-4388-c91ba8cacbb7@redhat.com>
	<20161128152404.sywmey4pdcv7btup@bunk.spdns.de>
	<36ee35dd-49ea-f2e3-fa1e-600483b9d4e7@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <460f994a-fe47-1d1e-0d26-1220d8a05256@redhat.com>
Date: Mon, 28 Nov 2016 16:42:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <36ee35dd-49ea-f2e3-fa1e-600483b9d4e7@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.68
Subject: Re: [Qemu-trivial] [PATCH] rules.mak: Use -r instead of -Wl,
 -r to fix building when PIE is default
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
X-List-Received-Date: Mon, 28 Nov 2016 15:44:08 -0000



On 28/11/2016 16:38, Paolo Bonzini wrote:
> 
> 
> On 28/11/2016 16:24, Adrian Bunk wrote:
>> On Mon, Nov 28, 2016 at 04:05:33PM +0100, Paolo Bonzini wrote:
>>>
>>>
>>> On 27/11/2016 17:28, Adrian Bunk wrote:
>>>> Building qemu fails in distributions where gcc enables PIE
>>>> by default (e.g. Debian unstable) with:
>>>> /usr/bin/ld: -r and -pie may not be used together
>>>>
>>>> -r and -pie cannot be used together in the linker,
>>>> and position independent is already relocatable.
>>>>
>>>> Use -r instead of -Wl,-r to avoid gcc passing -r to the
>>>> linker when PIE is enabled.
>>>>
>>>> Signed-off-by: Adrian Bunk <bunk@stusta.de>
>>>
>>> I think this is a bug in the linker.  If the linker is producing
>>> relocatable objects by default, it has no reason to refuse -r.  Have you
>>> tried asking the binutils folks about it too?
>>
>> The linker knows nothing about this default, gcc is passing -pie
>> to the linker.
> 
> The linker is receiving "-r -pie".  It can satisfy the requirement of
> producing a relocatable object by discarding the "-r", but it doesn't.
> That'd be a linker bug.
> 
> But in fact ELF makes PIE ET_DYN and relocatable ET_REL.  That would
> make the linker error the right thing, but then I don't understand what
> you mean by "position independent is already relocatable".

Aha, I looked at GCC source code and this is incorrect: "Use -r instead
of -Wl,-r to avoid gcc passing -r to the linker when PIE is enabled".
When GCC sees -r (as opposed to -Wl,-r) it does not pass -pie to the linker.

Paolo


