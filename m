Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aPnWB-0002N5-Io
	for mharc-qemu-trivial@gnu.org; Sun, 31 Jan 2016 03:37:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aPnW8-0002JX-Ex
	for qemu-trivial@nongnu.org; Sun, 31 Jan 2016 03:37:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aPnW5-00022M-7i
	for qemu-trivial@nongnu.org; Sun, 31 Jan 2016 03:37:56 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:34642)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aPnW4-000229-Ry
	for qemu-trivial@nongnu.org; Sun, 31 Jan 2016 03:37:53 -0500
Received: by mail-wm0-x235.google.com with SMTP id 128so32400782wmz.1
	for <qemu-trivial@nongnu.org>; Sun, 31 Jan 2016 00:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-type:content-transfer-encoding;
	bh=D31Z3kRYTqiJMuU93/iitpfL8LOomfOPI+JPfQnK8bQ=;
	b=epTxwuK1Dk++pvXbel+Bvfi2vzK+BRJgRxpFkDHKtZgT75xboqoZUtGFQMlfwP2llA
	jHshfBv03JWWZG60Le9X8DN3hfSYg/NgPHDxL8wFziUAA90BX1NGIOPX2CVqZndJ47Gi
	4YfhrH0ISmSWU0keNYPrnUOOd+SIeqDqcLYMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=D31Z3kRYTqiJMuU93/iitpfL8LOomfOPI+JPfQnK8bQ=;
	b=hP8G2SiMRBvdchzUfsmTjOuKoG9LqiFLLKeCiuJaXFuf6fLbrICwiWhrrW79ydUNzR
	Dfulx+Ihpx/qd37Yy/UcAO39UQ2fqawhELQUENKxh1oFdd+2ZJfypFMfqqiOf9XiNt2+
	wW211A48isFvYAjwlplOSYt7YPV3O+bEzUqElLECfv7PRy8/n9yeMBpzGob/1ncVXpcP
	lf5SMt9QohT/rx8rTDu21c0TR5ZK2T8GcBvBTtCJKxirSNwTtcXzXJBv3fr6x06CgPnV
	7nvzWzMg+iCa8t/XCim8QYZdjrWSAYSX+JMIKMgD0fVhZJja7ZHdFmS6x8qoMXZ43tnQ
	W+qw==
X-Gm-Message-State: AG10YORY+Hs3dt3ZzqYXgKAV27BT2XtyegtAyYZ2KXfVjBuR1Yqt9wJ1SMZ8cpY3Pkns8WYf
X-Received: by 10.28.45.73 with SMTP id t70mr5419445wmt.31.1454229470951;
	Sun, 31 Jan 2016 00:37:50 -0800 (PST)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	u191sm5868101wmd.4.2016.01.31.00.37.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Jan 2016 00:37:49 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 65D5D3E013A;
	Sun, 31 Jan 2016 08:37:49 +0000 (GMT)
References: <1453991009-32736-1-git-send-email-alex.bennee@linaro.org>
	<1453991009-32736-3-git-send-email-alex.bennee@linaro.org>
	<20160130123502.GQ23043@voom.redhat.com>
User-agent: mu4e 0.9.17; emacs 25.0.50.9
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: David Gibson <david@gibson.dropbear.id.au>
In-reply-to: <20160130123502.GQ23043@voom.redhat.com>
Date: Sun, 31 Jan 2016 08:37:49 +0000
Message-ID: <878u36ywiq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::235
Cc: kwolf@redhat.com, pbonzini@redhat.com, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v3 2/3] .travis.yml: run make check for
	all matrix targets
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
X-List-Received-Date: Sun, 31 Jan 2016 08:37:58 -0000


David Gibson <david@gibson.dropbear.id.au> writes:

> On Thu, Jan 28, 2016 at 02:23:28PM +0000, Alex Bennée wrote:
>> We only ran make check once before it used to be an unreliable target.
>> It was only a stop gap measure and we should be able to revert it now.
>> This also stops us needing a large all-MMU build.
>>
>> We disable "make check" for a couple of the extra config targets which
>> are currently broken.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>
> So, in general I like the idea of running make check more widely.
>
> However.. I was wondering - what's the rationale for having separate
> matrix builds for each target (or small group) rather than just doing
> one build with all the targets?

Each individual part of the matrix can be run in parallel with the
others so it makes sense to keep the build component small (as each
softmmu target rebuilds a significant chunk of the build).

Having said that there is a fair amount of repetition as we are
repeating all the generic qtests each time just so we can run the extra
${TARGET}-qtest binaries.

Travis does has an option for using ccache so it might be worth
experimenting with that to see if things are improved.

> I can't see any obvious benefit to splitting the build that way, but
> it does increase the total build time significantly - and will do so
> rather more so with make check added.

Elapsed and total are the ones to look at:

https://travis-ci.org/stsquad/qemu/builds/105401126

vs

https://travis-ci.org/qemu/qemu/builds/105711606

However it looks like Travis are having scaling growing pains because
there "old style" VM approach is running a lot faster than it used to.

>
>> ---
>>  .travis.yml | 15 ++++++++-------
>>  1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/.travis.yml b/.travis.yml
>> index 4a0c23a..16be23f 100644
>> --- a/.travis.yml
>> +++ b/.travis.yml
>> @@ -40,7 +40,7 @@ notifications:
>>      on_failure: always
>>  env:
>>    global:
>> -    - TEST_CMD=""
>> +    - TEST_CMD="make check"
>>      - EXTRA_CONFIG=""
>>    matrix:
>>      # Group major targets together with their linux-user counterparts
>> @@ -73,17 +73,14 @@ script:
>>  matrix:
>>    # We manually include a number of additional build for non-standard bits
>>    include:
>> -    # Make check target (we only do this once)
>> -    - env:
>> -        - TARGETS=alpha-softmmu,arm-softmmu,aarch64-softmmu,cris-softmmu,i386-softmmu,x86_64-softmmu,m68k-softmmu,microblaze-softmmu,microblazeel-softmmu,mips-softmmu,mips64-softmmu,mips64el-softmmu,mipsel-softmmu,or32-softmmu,ppc-softmmu,ppc64-softmmu,ppcemb-softmmu,s390x-softmmu,sh4-softmmu,sh4eb-softmmu,sparc-softmmu,sparc64-softmmu,unicore32-softmmu,lm32-softmmu,moxie-softmmu,tricore-softmmu,xtensa-softmmu,xtensaeb-softmmu
>> -          TEST_CMD="make check"
>> -      compiler: gcc
>>      # Debug related options
>>      - env: TARGETS=i386-softmmu,x86_64-softmmu
>>             EXTRA_CONFIG="--enable-debug"
>>        compiler: gcc
>> +    # We currently disable "make check"
>>      - env: TARGETS=i386-softmmu,x86_64-softmmu
>>             EXTRA_CONFIG="--enable-debug --enable-tcg-interpreter"
>> +           TEST_CMD=""
>>        compiler: gcc
>>      # Disable a few of the optional features
>>      - env: TARGETS=i386-softmmu,x86_64-softmmu
>> @@ -104,11 +101,15 @@ matrix:
>>      - env: TARGETS=i386-softmmu,x86_64-softmmu
>>             EXTRA_CONFIG="--enable-trace-backends=simple"
>>        compiler: gcc
>> +    # We currently disable "make check"
>>      - env: TARGETS=i386-softmmu,x86_64-softmmu
>>             EXTRA_CONFIG="--enable-trace-backends=ftrace"
>> +           TEST_CMD=""
>>        compiler: gcc
>> +    # We currently disable "make check"
>>      - env: TARGETS=i386-softmmu,x86_64-softmmu
>> -          EXTRA_CONFIG="--enable-trace-backends=ust"
>> +           EXTRA_CONFIG="--enable-trace-backends=ust"
>> +           TEST_CMD=""
>>        compiler: gcc
>>      - env: TARGETS=i386-softmmu,x86_64-softmmu
>>             EXTRA_CONFIG="--enable-modules"


--
Alex Bennée

