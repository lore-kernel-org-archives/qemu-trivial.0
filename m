Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaOzQ-0004Lw-Tt
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 10:07:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZaOzO-0004Li-Tj
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 10:07:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZaOzK-0005oR-Tf
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 10:07:42 -0400
Received: from mail-wi0-f169.google.com ([209.85.212.169]:33860)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZaOzK-0005oE-NX
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 10:07:38 -0400
Received: by wicfx3 with SMTP id fx3so65633497wic.1
	for <qemu-trivial@nongnu.org>; Fri, 11 Sep 2015 07:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:references:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-type:content-transfer-encoding;
	bh=BKoZSfZNVGLuGqp4w3WW4dA7YDNI/GHsfHR6j6NAsA4=;
	b=D78QdZbZyqZvGhgPIGksC5Ku2rsCidpd4jHggI1QGsKxSspiD+g6BcxHd0x41U+OcU
	3oUyNf6oYG19OTOGZ4E1sIziVOY7+oPrnzbFWls/oLHSVceBVHHYjinoie9qGiSUTzbT
	zZ0aAEqpku5/KJ/6VcbOD58E6dcBrySMBWsfj6UVRFiu+AcBBBM0su0ztPz3tvbxkAr1
	htfgFDAYlTNsItMHNz1eQwV66OJLFcb3TjE4TIeinwHbvGnV0AZ2xpbf8PBs+HrtMotF
	VYgY3y31aOlM5EnW3V1krl9cS4JTqmob1Vtu3FY0V0sfQ0Y369UuBY3neuTP3V74OkBp
	eHyQ==
X-Gm-Message-State: ALoCoQnH3lcToWAaSlvyTrUV9AfgRM/BqAggUXTk5cUz/SD7Dga9ZD4pckqzCIopxTUWbkZi/iEr
X-Received: by 10.194.111.232 with SMTP id il8mr82151516wjb.117.1441980457672; 
	Fri, 11 Sep 2015 07:07:37 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id cm6sm836706wib.22.2015.09.11.07.07.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Sep 2015 07:07:37 -0700 (PDT)
Received: from zen.linaro.local (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 6BADA3E0218;
	Fri, 11 Sep 2015 15:07:36 +0100 (BST)
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<55F2889B.4040109@msgid.tls.msk.ru>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Michael Tokarev <mjt@tls.msk.ru>
In-reply-to: <55F2889B.4040109@msgid.tls.msk.ru>
Date: Fri, 11 Sep 2015 15:07:36 +0100
Message-ID: <87pp1p82xj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.169
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, crosthwaitepeter@gmail.com,
	qemu-devel@nongnu.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v4 00/11] qemu-log,
	perfmap and other logging tweaks
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
X-List-Received-Date: Fri, 11 Sep 2015 14:07:43 -0000


Michael Tokarev <mjt@tls.msk.ru> writes:

> 03.08.2015 12:14, Alex Bennée wrote:
>> Hi,
>> 
>> This is mostly just a re-base to keep current with master. I've added
>> a couple of outstanding s-o-b and r-b tags. There are also two new
>> patches in this series which seemed to be worth keeping together:
>> 
>>  - a simple patch to dump invocation info in the log
>>  - the cputlb logging clean-up posted as an RFC last month
>> 
>> Could folks interested in TCG stuff have a look over the light
>> re-factor and perf map patches please?
>> 
>> It would be nice to get these in the next cycle but I'm unsure who's
>> tree I should be targeting? Most of the top level files touched
>> (cputlb, translate-all, qemu-log) just have the list marked as the
>> maintainer ;-)
>
> With this many review comments and somewhat hot discussion about some
> patches, I think I have a good excuse to not apply this series
> to qemu-tivial tree ;)

Yeah makes sense. I'll do a re-spin and probably drop the perfmap stuff
for now. There is a proposal for better JIT tracking in perf for JAVA so
I suspect we should target that.

It's a handy patch to keep around for your own analysis though ;-)

>
> Keep up the good work please!
>
> /mjt

-- 
Alex Bennée

