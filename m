Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cYhpS-00047h-Oy
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jan 2017 18:27:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cYhpR-00047A-6H
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2017 18:27:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cYhpN-0001d6-VP
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2017 18:27:13 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:33250)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1cYhpN-0001cv-PX; Tue, 31 Jan 2017 18:27:09 -0500
Received: by mail-qk0-x242.google.com with SMTP id 11so26085346qkl.0;
	Tue, 31 Jan 2017 15:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:subject:to:references:cc:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=I1wzP7hzMN18H4UnDzbA6yCu+tcz8avDS5BK8iRsVuY=;
	b=qr6JaQvVv8d3bveI23AkGo6LrCavJpHTIbcSqiCEcI+xg1HmAqBdnAk1F6JiZWoxCO
	79Zo/JEy2gFLdFY1Pd1Nnd7atlG5h4LTqdEZp7fq6DfQeaKGoUf486y/enyWxlo19v9y
	WfeanWPeid5HQpXyYZ9AhQcroDmR4vGANnMk40k+vYHkMBFpSDi2GoJupDYJGLvWATV6
	I3YJ8Gk147EviFxIDmu0GXrAUqH0WOw8HWTK8tfAC88PKBAqeJWh8g3GYdy26tXg1VZI
	FcPxzy9EpdEQbHgF5++o+l2wVwej4z9vzxGyyTD9nfFxtFJ8W/TpvC+UuXvodsnOrmiG
	XJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:subject:to:references:cc:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=I1wzP7hzMN18H4UnDzbA6yCu+tcz8avDS5BK8iRsVuY=;
	b=cZprJvlpcRbP4vJJ1KZruzdt6oyySsXzsXe4FI7/H8kVZ86VLhO1Jigs18KJIKldKi
	YrNkAteblWiCnbQtMaDZLWl0zCAjrBxkdEn7+gnIf+ZBeAsssUA4AojhnmVy+/4nlKzZ
	uAcvpan8zK77qO6+h8ABSNHTnUoCZWLzCE4g6ub8wbA5MBvl0YDVxCp9XbWFw9JNc/Vt
	2Pl17/sCB30VqeLbisxGnhMzCp9adtbDi76MfQ367/0EnN2ALqBkDFIwLvqCOt8vr8wi
	UZddbQWFOCbSiUDQNBvQqEBX8zPh68AP26sU5qXKghEvSvVQsY15gAByLDI68t87gPAa
	8fQw==
X-Gm-Message-State: AIkVDXLCRn9KES8kHWwMJI+TQY0fp8fg892bvOnItCDj3DYVN6GZiDH+N3nMkkF+mAkbzw==
X-Received: by 10.55.15.231 with SMTP id 100mr29457380qkp.244.1485905229096;
	Tue, 31 Jan 2017 15:27:09 -0800 (PST)
Received: from [100.72.72.200] ([209.117.102.182])
	by smtp.googlemail.com with ESMTPSA id
	u54sm16788125qtu.35.2017.01.31.15.27.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Jan 2017 15:27:07 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P. Berrange" <berrange@redhat.com>
References: <1485879287-12548-1-git-send-email-peter.maydell@linaro.org>
	<20170131165557.GE20303@redhat.com>
	<CAFEAcA9Jbv398L=yjPmq7MfV+bpma4TiBX9LbBBHZ_qo5DvuGg@mail.gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Message-ID: <d7b3be0a-aa29-eb65-aa60-c872fd2b2613@redhat.com>
Date: Tue, 31 Jan 2017 18:27:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Jbv398L=yjPmq7MfV+bpma4TiBX9LbBBHZ_qo5DvuGg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Drop QEMU_GNUC_PREREQ()
 checks for gcc older than 4.1
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
X-List-Received-Date: Tue, 31 Jan 2017 23:27:14 -0000



On 31/01/2017 11:58, Peter Maydell wrote:
> On 31 January 2017 at 16:55, Daniel P. Berrange <berrange@redhat.com> wrote:
>> On Tue, Jan 31, 2017 at 04:14:47PM +0000, Peter Maydell wrote:
>>> We already require gcc 4.1 or newer (for the atomic
>>> support), so the fallback codepaths for older gcc
>>> versions than that are now dead code and we can
>>> just delete them.
>>
>> Do we have any explicit check alreadu for 4.1, or do we
>> just let the build fail on the atomic code ?
>>
>> IOW, is there any use in having..
>>
>> #if !QEMU_GNUC_PREREQ(4, 1)
>> # error "QEMU requires GCC >= 4.1 or CLang"
>> #endif
> 
> I guess we just barf in the atomics. An explicit check might
> not be a bad idea I guess, though it depends a bit on how
> many releases we've been implicitly requiring 4.1 for. I
> suppose it would act as documentation of our current
> minimum req.

We have:

- first occurrence on Linux hosts: 0.13.0 (for vhost)

- first occurrence on non-Linux hosts: 0.15.0 (simpletrace backend),
then backed out in 1.0

- next occurrence on all hosts, but only in tests: 1.4.0

- finally, first occurrence on all hosts with simple ./configure &&
make: 2.0.0

Paolo

